fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'OnlyScripts / veryappropriatename & coy_boy'
description 'This script lets you sell your car to other players || You may not re-sell or re-publish without consent!'
version '1.0.0'

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'config.lua',
	'client.lua',
    'locales/at.lua',
    'locales/de.lua',
    'locales/en.lua',
    'locales/es.lua',
    'locales/fr.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua', 
    'config.lua',
    'server.lua',
    'locales/at.lua',
    'locales/de.lua',
    'locales/en.lua',
    'locales/es.lua',
    'locales/fr.lua',
}
