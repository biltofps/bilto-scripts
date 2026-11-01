fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

game 'rdr3'
lua54 'yes'

author 'bitinho'
description 'Painel administrativo completo'
version '2.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    'locale.lua'
}

client_scripts {
    'client/main.lua',
    'client/tracking.lua',
    'client/noclip.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/core.lua',
    'server/permissions.lua',
    'server/panel.lua',
    'server/actions.lua',
    'server/main.lua'
}

ui_page 'ui/index.html'

files {
    'ui/index.html',
    'ui/style.css',
    'ui/script.js'
}

dependencies {
    'ox_lib',
    'oxmysql',
    'rsg-core',
    'rsg-medic',
    'rsg-inventory',
    'rsg-multijob'
}

escrow_ignore {
    'config.lua',
    'locale.lua'
}
