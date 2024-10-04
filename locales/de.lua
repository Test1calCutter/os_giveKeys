Locales = Locales or {}

Locales ['de'] = {
    -- Allgemeine Übersetzung
    ['missingPassenger']    =	'Es wurde kein Beifahrer erkannt',        									-- No passenger
    ['vehicleNotOwned']	    =	'Dir gehört dieses Fahrzeug nicht',       									-- Vehicle not owned
    ['notDriver']		    =	'Du musst auf dem Fahrersitz sein',       									-- Not on driver seat
    ['notInsideVehicle']    =	'Du bist in keinem Fahrzeug',             									-- Not in vehicle
    ['keysReceived']        =	'Du hast die Schlüssel für das Auto erhalten',  							-- Keys received
    ['keysGiven']           =	'Du hast die Schlüssel übergeben an ID %s',    								-- Keys transferred
    ['failed']              =	'Etwas ist schiefgelaufen',               									-- Something went wrong
    ['noContract']          =   'Du hast keinen Verkaufsvertrag',                                           -- No contractor item

    -- Alarm-Dialog (Autokäufer)
    ['confirmTransfer'] 	=	"Übertragung bestätigen",													-- Title of Alert Dialog
    ['aboutToBuy']			=	"Du bist dabei, das Auto für $%d zu kaufen. Möchtest du fortfahren?",		-- Confirmation text of Alert Dialog
    ['transferCancelled']	=	"Übertragung abgebrochen",													-- User pressed ESC or Decline

    -- Eingabe-Dialog (Auto-Verkäufer)
    ['title']				=	"Autotasten übertragen",													-- Title of Input Dialog
    ['label']				=	"Preis eingeben",															-- Label of number input
    ['labelDescription']	=	"Preis des Autos",															-- Description of number input
    ['invalidInput']		=	"Ungültige Eingabe",														-- Invalid number input
    ['invalidPrice']		= 	"Du hast nicht genug Geld bei dir",											-- Invalid price

    -- Discord Webhook-Logging
    ['WebhookName']         =   'Name',                                                                     -- Discord Webhook Name
    ['EmbedTitle']          =   'Autoverkauf',                                                              -- Title of log
    ['Footer']              =   'Footer',                                                                   -- Footer of log

    ['logFailedTransfer']	= 	'Spieler %s (ID %i) hat gerade versucht, Autoschlüssel zu übertragen, aber es war kein Beifahrer vorhanden.', -- No passenger
    ['logCarTransfer']		= 	'Spieler %s (ID %i) hat gerade die Autoschlüssel an Spieler %s (ID %i) für $%i übertragen.',                  -- Transfered to .. for .$
    ['logCarNotOwned']		= 	'Spieler %s (ID %i) hat gerade versucht, Autoschlüssel zu übertragen, aber das Fahrzeug gehörte ihm nicht.',  -- Vehicle not owned
    ['logNotDriver']		= 	'Spieler %s (ID %i) hat gerade versucht, Autoschlüssel zu übertragen, aber er saß nicht auf dem Fahrersitz.', -- Not on driver side
    ['logNotEnoughMoney']	=	'Spieler %s (ID %i) hat gerade versucht, Autoschlüssel zu erhalten, aber er hatte nicht genug Geld.'          -- Not enough money to buy
}