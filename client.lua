ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


function _U(text)
    local locale = Config.Locale
    return Locales[locale] and Locales[locale][text] or text
end

RegisterNetEvent('os_giveKeys:showConfirmation')
AddEventHandler('os_giveKeys:showConfirmation', function(price, plate, sellerId)
    local alert = lib.alertDialog({
        header = _U('confirmTransfer'),
        content = string.format(_U('aboutToBuy'), price),
        centered = true,
        cancel = true,
        confirm = true
    })

    Citizen.Wait(100)

    if alert and alert == "confirm" then
        TriggerServerEvent('os_giveKeys:confirmTransaction', sellerId, plate, price)
    else
        ESX.ShowNotification(_U("transferCancelled"))
    end
end)



RegisterCommand("wagenVerkauf", function(source, args, rawCommand)
    local playerPed = GetPlayerPed(-1) 
    local playerIngameID = GetPlayerServerId(PlayerId())
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    local seat = -1
    local count = exports.ox_inventory:Search('count', Config.Item)

    if vehicle ~= 0 then
        if GetPedInVehicleSeat(vehicle, seat) == playerPed then
            local plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))

            ESX.TriggerServerCallback('os_giveKeys:requestPlayerCars', function(isOwned)
                if isOwned then
                    local passengerPed = GetPedInVehicleSeat(vehicle, 0)
                    if passengerPed ~= 0 then
                        local passengerServerId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(passengerPed))
                        
                        if Config.useItem and count > 0 then
                            local input = lib.inputDialog(_U('title'), {
                                {type = 'number', label = _U('label'), description = _U('labelDescription'), icon = 'hashtag', required = true}
                            })
                            if input and input[1] then
                                local price = tonumber(input[1])
                                TriggerServerEvent('os_giveKeys:requestConfirmation', passengerServerId, price, plate, playerIngameID)
                            else
                                ESX.ShowNotification(_U("invalidInput"))
                            end
                        elseif not Config.useItem then
                            local input = lib.inputDialog(_U('title'), {
                                {type = 'number', label = _U('label'), description = _U('labelDescription'), icon = 'hashtag', required = true}
                            })
                            if input and input[1] then
                                local price = tonumber(input[1])
                                TriggerServerEvent('os_giveKeys:requestConfirmation', passengerServerId, price, plate, playerIngameID)
                            else
                                ESX.ShowNotification(_U("invalidInput"))
                            end
                        else
                            ESX.ShowNotification(_U("noContract"))
                        end
                    else
                        TriggerServerEvent('os_giveKeys:logFailedTransfer')
                        ESX.ShowNotification(_U("missingPassenger"))
                    end
                else
                    TriggerServerEvent('os_giveKeys:logCarNotOwned')
                    ESX.ShowNotification(_U("vehicleNotOwned"))
                end
            end, plate)
        else
            TriggerServerEvent('os_giveKeys:logNotDriver')
            ESX.ShowNotification(_U("notDriver"))
        end
    else
        ESX.ShowNotification(_U("notInsideVehicle"))
        TriggerServerEvent('os_giveKeys:logCarNotOwned')
    end
end)



