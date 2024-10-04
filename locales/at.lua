Locales = Locales or {}

Locales ['de'] = {
    -- Allgemeine Übersetzung
    ['missingPassenger']    =	'Es wüa ka Beifahra erkannt',        										-- No passenger
    ['vehicleNotOwned']	    =	'Des Auto ghead da ned',       												-- Vehicle not owned
    ['notDriver']		    =	'Du muasst am Fahrersitz sein',       										-- Not on driver seat
    ['notInsideVehicle']    =	'Du bist in kane Auto',             										-- Not in vehicle
    ['keysReceived']        =	'Du host die Schlüssl fürn Auto kriagt',  									-- Keys received
    ['keysGiven']           =	'Du host de Schlüssl weitergem vo ID %s',    								-- Keys transferred
    ['failed']              =	'Iwas is in d\'Hosn ganga',               									-- Something went wrong
    ['noContract']          =   'Du host kana Verkaufsvertrag',                                             -- No contractor item

    -- Alarm-Dialog (Autokäufer)
    ['confirmTransfer'] 	=	"Übertragung bestäatigen",													-- Title of Alert Dialog
    ['aboutToBuy']			=	"Du stehst kurz davor, des Auto für $%d z’kaufen. Wüast weidamacha?",		-- Confirmation text of Alert Dialog
    ['transferCancelled']	=	"Übertragung o´brochn",														-- User pressed ESC or Decline

    -- Eingabe-Dialog (Auto-Verkäufer)
    ['title']				=	"Autoschlüssl weitagebn",													-- Title of Input Dialog
    ['label']				=	"Preis eigebn",															    -- Label of number input
    ['labelDescription']	=	"Preis für des Auto",														-- Description of number input
    ['invalidInput']		=	"Ungültige Eingabe",														-- Invalid number input
    ['invalidPrice']		= 	"Du host ned gnua Geld bei dir",											-- Invalid price

    -- Discord Webhook-Logging
    ['WebhookName']         =   'Name',                                                                     -- Discord Webhook Name
    ['EmbedTitle']          =   'Autoverkauf',                                                              -- Title of log
    ['Footer']              =   'Footer',                                                                   -- Footer of log

    ['logFailedTransfer']	= 	'Spüla %s (ID %i) hot grod versuacht, Autoschlüssl weita z´gebn, oba es woa kan Beifahra do.',              -- No passenger
    ['logCarTransfer']		= 	'Spüla %s (ID %i) hot grod Autoschlüssl an Spüla %s (ID %i) für $%i weita g´gebn.',                         -- Transfered to .. for .$
    ['logCarNotOwned']		= 	'Spüla %s (ID %i) hot grod versuacht, Autoschlüssl weita z´gebn, oba des Auto woa ned seins.',              -- Vehicle not owned
    ['logNotDriver']		= 	'Spüla %s (ID %i) hot grod versuacht, Autoschlüssl weita z´gebn, oba er woa ned am Fahrersitz.',            -- Not on driver side
    ['logNotEnoughMoney']	=	'Spüla %s (ID %i) hot grod versuacht, Autoschlüssl z´kriegn, oba er hot ned gnua Geld.'                     -- Not enough money to buy
}