Locales = Locales or {}

Locales ['fr'] = {
    -- Traduction Générale
    ['missingPassenger']    =	"Aucun passager détecté",       												-- No passenger
    ['vehicleNotOwned']	    =	"Ce véhicule ne t'appartient pas",       									    -- Vehicle not owned
    ['notDriver']		    =	"Tu dois être au siège conducteur",       									    -- Not on driver seat
    ['notInsideVehicle']    =	"Tu n'es pas dans un véhicule",             									-- Not in vehicle
    ['keysReceived']        =	"Tu as reçu les clés de la voiture",  										    -- Keys received
    ['keysGiven']           =	"Tu as donné les clés au joueur avec l'ID %s",    							    -- Keys transferred
    ['failed']              =	"Quelque chose a mal tourné",               									-- Something went wrong
    ['noContract']          =   "Tu n'as pas de contrat de vente",                                              -- No contractor item

    -- Dialogues d'Alerte (Acheteur)
    ['confirmTransfer'] 	=	"Confirmer le transfert",													    -- Title of Alert Dialog
    ['aboutToBuy']			=	"Tu es sur le point d'acheter cette voiture pour $%d. Voulez-vous continuer?",	-- Confirmation text of Alert Dialog
    ['transferCancelled']	=	"Transfert annulé",															    -- User pressed ESC or Decline

    -- Dialogues d'Entrée (Vendeur)
    ['title']				=	"Transfert de clés",														    -- Title of Input Dialog
    ['label']				=	"Entrez le prix",															    -- Label of number input
    ['labelDescription']	=	"Prix de la voiture",														    -- Description of number input
    ['invalidInput']		=	"Entrée invalide",															    -- Invalid number input
    ['invalidPrice']		= 	"Vous n'avez pas assez d'argent",											    -- Invalid price

    -- Discord Webhook Logging
    ['WebhookName']         =   'Name',                                                                         -- Discord Webhook Name
    ['EmbedTitle']          =   'Vente de voiture',                                                             -- Title of log
    ['Footer']              =   'Footer',                                                                       -- Footer of log

    ['logFailedTransfer']	= 	"Le joueur %s (ID %i) a essayé de transférer des clés mais aucun passager n'a été détecté.",                 -- No passenger
    ['logCarTransfer']		= 	"Le joueur %s (ID %i) a transféré les clés au joueur %s (ID %i) pour $%i.",                                  -- Transfered to .. for .$
    ['logCarNotOwned']		= 	"Le joueur %s (ID %i) a essayé de transférer des clés mais le véhicule ne lui appartenait pas.",             -- Vehicle not owned
    ['logNotDriver']		= 	"Le joueur %s (ID %i) a essayé de transférer des clés mais il n'était pas au siège conducteur.",             -- Not on driver side
    ['logNotEnoughMoney']	=	"Le joueur %s (ID %i) a essayé de recevoir des clés mais il n'avait pas assez d'argent."                     -- Not enough money to buy
}