Locales = Locales or {}

Locales ['en'] = {
    -- General Translation
    ['missingPassenger']    =	'No passenger detected',        											-- No passenger
    ['vehicleNotOwned']	    =	'This vehicle does not belong to you',       								-- Vehicle not owned
    ['notDriver']		    =	'You must be in the driver seat',       									-- Not on driver seat
    ['notInsideVehicle']    =	'You are not inside a vehicle',             								-- Not in vehicle
    ['keysReceived']        =	'You have received the car keys',  											-- Keys received
    ['keysGiven']           =	'You have given the keys to ID %s',    										-- Keys transferred
    ['failed']              =	'Something went wrong',               										-- Something went wrong
    ['noContract']          =   'You don\'t have a sales contract',                                         -- No contractor item

    -- Alert Dialog (Car Buyer)
    ['confirmTransfer'] 	=	"Confirm transfer",															-- Title of Alert Dialog
    ['aboutToBuy']			=	"You are about to buy the car for $%d. Do you want to proceed?",			-- Confirmation text of Alert Dialog
    ['transferCancelled']	=	"Transfer cancelled",														-- User pressed ESC or Decline

    -- Input Dialog (Car Seller)
    ['title']				=	"Transfer car keys",														-- Title of Input Dialog
    ['label']				=	"Enter price",																-- Label of number input
    ['labelDescription']	=	"Car price",																-- Description of number input
    ['invalidInput']		=	"Invalid input",															-- Invalid number input
    ['invalidPrice']		= 	"You don\'t have enough money",												-- Invalid price

    -- Discord Webhook-Logging
    ['WebhookName']         =   'Name',                                                                     -- Discord Webhook Name
    ['EmbedTitle']          =   'Car Sale',                                                                 -- Title of log
    ['Footer']              =   'Footer',                                                                   -- Footer of log

    ['logFailedTransfer']	= 	'Player %s (ID %i) just tried to transfer car keys but no passenger was detected.',                       -- No passenger
    ['logCarTransfer']		= 	'Player %s (ID %i) just transferred car keys to player %s (ID %i) for $%i.',                              -- Transfered to .. for .$
    ['logCarNotOwned']		= 	'Player %s (ID %i) just tried to transfer car keys but the vehicle didn\'t belong to them.',              -- Vehicle not owned
    ['logNotDriver']		= 	'Player %s (ID %i) just tried to transfer car keys but they weren\'t in the driver\'s seat.',             -- Not on driver side
    ['logNotEnoughMoney']	=	'Player %s (ID %i) just tried to receive car keys but they didn\'t have enough money.'                    -- Not enough money to buy
}