
function _U(text)
    local locale = Config.Locale
    return Locales[locale] and Locales[locale][text] or text
end


RegisterNetEvent('os_giveKeys:requestConfirmation')
AddEventHandler('os_giveKeys:requestConfirmation', function(passengerServerId, price, plate, sellerId)
    TriggerClientEvent('os_giveKeys:showConfirmation', passengerServerId, price, plate, sellerId)
end)


-- Checking if car is owned by driver
ESX.RegisterServerCallback('os_giveKeys:requestPlayerCars', function(source, cb, plate)
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE owner = @owner AND plate = @plate', {
        ['@owner'] = xPlayer.identifier,
        ['@plate'] = plate
    }, function(result)
        if result[1] then
            cb(true) -- Setting callback to true (If found in default garage)
        else
            if Config.JobsCreator then
                MySQL.Async.fetchAll('SELECT 1 FROM jobs_garages WHERE identifier = @identifier AND plate = @plate', {
                    ['@identifier'] = xPlayer.identifier,
                    ['@plate'] = plate
                }, function(result2)
                    if result2[1] then
                        cb(true) -- Setting callback to true (If found in jobs creator garage)
                    else
                        cb(false) -- Setting callback to false if no car found
                    end
                end)
            else
                cb(false)
            end
        end
    end)
end)

-- Transfering car
RegisterNetEvent('os_giveKeys:transferCarOwnership')
AddEventHandler('os_giveKeys:transferCarOwnership', function(passengerServerId, plate, price)
    local seller = ESX.GetPlayerFromId(source)
    local buyer = ESX.GetPlayerFromId(passengerServerId)

    if not price or type(price) ~= 'number' or price <= 0 then
        TriggerClientEvent('esx:showNotification', source, _U("invalidPrice"))
        return
    end

    TriggerClientEvent('os_giveKeys:showConfirmation', passengerServerId, price, plate, seller.source)
end)


RegisterNetEvent('os_giveKeys:confirmTransaction')
AddEventHandler('os_giveKeys:confirmTransaction', function(sellerId, plate, price)
    local buyer = ESX.GetPlayerFromId(source)
    local seller = ESX.GetPlayerFromId(sellerId)
    if not price or type(price) ~= 'number' or price <= 0 then
        TriggerClientEvent('esx:showNotification', source, _U("invalidPrice"))
        return
    end

    if buyer and seller then
        local passengerName = sellerId
        local _source = source

        MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE plate = @plate', {
            ['@plate'] = plate
        }, function(result)
            if result[1] then
                if buyer.getAccount('money').money >= price then
                    buyer.removeAccountMoney('money', price)
                    seller.addAccountMoney('money', price)

                    MySQL.Async.execute('UPDATE owned_vehicles SET owner = @newOwner WHERE plate = @plate', {
                        ['@newOwner'] = buyer.identifier,
                        ['@plate'] = plate
                    }, function(rowsChanged)
                        if rowsChanged > 0 then
                            TriggerClientEvent('esx:showNotification', _source, _U("keysReceived"))
                            if Config.useItem then
                                exports.ox_inventory:RemoveItem(seller.source, Config.Item, 1)
                            end
                            TriggerClientEvent('esx:showNotification', seller.source, string.format(_U("keysGiven"), passengerName))
                            TriggerEvent('os_giveKeys:logCarTransfer', sellerId, price)
                        else
                            TriggerClientEvent('esx:showNotification', _source, _U("failed"))
                        end
                    end)
                else
                    TriggerClientEvent('esx:showNotification', _source, _U("notEnoughMoney"))
                end
            else
                if Config.JobsCreator then
                    MySQL.Async.fetchAll('SELECT identifier FROM jobs_garages WHERE plate = @plate', {
                        ['@plate'] = plate
                    }, function(result2)
                        if result2[1] then
                            MySQL.Async.execute('UPDATE jobs_garages SET identifier = @newIdentifier WHERE plate = @plate', {
                                ['@newIdentifier'] = buyer.identifier,
                                ['@plate'] = plate
                            }, function(rowsChanged)
                                if rowsChanged > 0 then
                                    TriggerClientEvent('esx:showNotification', _source, _U("keysReceived"))
                                    if Config.useItem then
                                        exports.ox_inventory:RemoveItem(seller.source, Config.Item, 1)
                                    end
                                    TriggerClientEvent('esx:showNotification', seller.source, string.format(_U("keysGiven"), passengerName))
                                    TriggerEvent('os_giveKeys:logCarTransfer', sellerId, price)
                                else
                                    TriggerClientEvent('esx:showNotification', _source, _U("failed"))
                                end
                            end)
                        else
                            TriggerClientEvent('esx:showNotification', _source, _U("vehicleNotOwned"))
                        end
                    end)
                else
                    TriggerClientEvent('esx:showNotification', _source, _U("vehicleNotOwned"))
                end
            end
        end)
    end
end)



function logging(webhookURL, message, color)
    if not Config.DiscordLogging then return end
    
    local embed = {
        {
            ["color"] = color,
            ["title"] = _U("EmbedTitle") or "Something went wrong!",
            ["description"] = message or "It seems like the config wasnt set up correctly.",
            ["footer"] = {
                ["text"] = _U('Footer') or "Please check again.",
            },
        }
    }

    PerformHttpRequest(webhookURL, function(err, text, headers)
        --> Debugging
        
        --if err then
        --    print("Error sending message to Discord Webhook: " .. tostring(err))
        --    print("Response text: " .. tostring(text))
        --    print("Headers: " .. tostring(headers))
        --else
        --    --print("Message sent to Discord Webhook successfully.")
        --    --print("Response text: " .. tostring(text))
        --end
    end, 'POST', json.encode({username = _U('WebhookName') or "Error", embeds = embed}), { ['Content-Type'] = 'application/json' })
end

RegisterNetEvent('os_giveKeys:logCarTransfer')
AddEventHandler('os_giveKeys:logCarTransfer', function(passengerServerId, price)
    if not Config.DiscordLogging then return end

    local passengerName = GetPlayerName(passengerServerId)
    local ownId = tonumber(source)
    local passengerId = tonumber(passengerServerId) and math.floor(tonumber(passengerServerId)) or passengerServerId
    
    local ownName = GetPlayerName(source)
    local message = string.format(_U('logCarTransfer'), ownName, ownId, passengerName, passengerId, price)
    logging(Config.WebHook, message, 3447003) 
end)


RegisterNetEvent('os_giveKeys:logFailedTransfer')
AddEventHandler('os_giveKeys:logFailedTransfer', function()
    if not Config.DiscordLogging then return end

    local ownId = source
    local ownName = GetPlayerName(source)
    local message = string.format(_U('logFailedTransfer'),ownName, ownId)
    logging(Config.WebHook, message, 15158332)
end)


RegisterNetEvent('os_giveKeys:logCarNotOwned')
AddEventHandler('os_giveKeys:logCarNotOwned', function()
    if not Config.DiscordLogging then return end

    local ownId = source
    local ownName = GetPlayerName(source)
    local message = string.format(_U('logCarNotOwned'),ownName, ownId)
    logging(Config.WebHook, message, 15158332)
end)

RegisterNetEvent('os_giveKeys:logNotDriver')
AddEventHandler('os_giveKeys:logNotDriver', function()
    if not Config.DiscordLogging then return end

    local ownId = source
    local ownName = GetPlayerName(source)
    local message = string.format(_U('logNotDriver'),ownName, ownId)
    logging(Config.WebHook, message, 15158332)
end)


RegisterNetEvent('os_giveKeys:logNotEnoughMoney')
AddEventHandler('os_giveKeys:logNotEnoughMoney', function(passengerServerId, price)
    if not Config.DiscordLogging then return end

    local ownId = source
    local ownName = GetPlayerName(source)
    local passengerName = GetPlayerName(passengerServerId)
    local message = string.format(_U('logNotEnoughMoney'),ownName, ownId, passengerName, passengerId, price)
    logging(Config.WebHook, message, 15158332)
end)



