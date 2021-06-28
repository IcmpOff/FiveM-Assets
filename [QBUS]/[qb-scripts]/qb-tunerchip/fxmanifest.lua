fx_version 'cerulean'
game 'gta5'

description 'QB-TunerChip'
version '1.0.0'

ui_page "html/index.html"

client_scripts {
    'client/main.lua',
    'client/nos.lua',
    'config.lua',
}

server_scripts {
    'server/main.lua',
    'config.lua'
}

files {
    'html/*',
}