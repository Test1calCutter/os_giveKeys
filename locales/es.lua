Locales = Locales or {}

Locales ['es'] = {
    -- Traducción General
    ['missingPassenger']    =	'No se detectó ningún pasajero',        									-- No passenger
    ['vehicleNotOwned']	    =	'Este vehículo no te pertenece',       										-- Vehicle not owned
    ['notDriver']		    =	'Debes estar en el asiento del conductor',       							-- Not on driver seat
    ['notInsideVehicle']    =	'No estás dentro de un vehículo',             								-- Not in vehicle
    ['keysReceived']        =	'Has recibido las llaves del coche',  										-- Keys received
    ['keysGiven']           =	'Has dado las llaves al jugador con ID %s',    								-- Keys transferred
    ['failed']              =	'Algo salió mal',               											-- Something went wrong
    ['noContract']          =   'No tienes un contrato de venta',                                           -- No contractor item

    -- Diálogo de Alerta (Comprador)
    ['confirmTransfer'] 	=	"Confirmar transferencia",													-- Title of Alert Dialog
    ['aboutToBuy']			=	"Estás a punto de comprar el coche por $%d. ¿Deseas continuar?",			-- Confirmation text of Alert Dialog
    ['transferCancelled']	=	"Transferencia cancelada",													-- User pressed ESC or Decline

    -- Diálogo de Entrada (Vendedor)
    ['title']				=	"Transferir llaves",														-- Title of Input Dialog
    ['label']				=	"Introducir precio",														-- Label of number input
    ['labelDescription']	=	"Precio del coche",															-- Description of number input
    ['invalidInput']		=	"Entrada inválida",															-- Invalid number input
    ['invalidPrice']		= 	"No tienes suficiente dinero",												-- Invalid price

    -- Discord Webhook-Logging
    ['WebhookName']         =   'Name',                                                                     -- Discord Webhook Name
    ['EmbedTitle']          =   'Venta de coche',                                                           -- Title of log
    ['Footer']              =   'Footer',                                                                   -- Footer of log

    ['logFailedTransfer']	= 	'El jugador %s (ID %i) intentó transferir las llaves, pero no había ningún pasajero presente.',            -- No passenger
    ['logCarTransfer']		= 	'El jugador %s (ID %i) transfirió las llaves al jugador %s (ID %i) por $%i.',                              -- Transfered to .. for .$
    ['logCarNotOwned']		= 	'El jugador %s (ID %i) intentó transferir las llaves, pero el vehículo no era suyo.',                      -- Vehicle not owned
    ['logNotDriver']		= 	'El jugador %s (ID %i) intentó transferir las llaves, pero no estaba en el asiento del conductor.',        -- Not on driver side
    ['logNotEnoughMoney']	=	'El jugador %s (ID %i) intentó recibir las llaves, pero no tenía suficiente dinero.'                       -- Not enough money to buy
}
