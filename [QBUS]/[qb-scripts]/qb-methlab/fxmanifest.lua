fx_version 'cerulean'
game 'gta5'

description 'QB-Methlab'
version '1.0.0'

ui_page "html/index.html"

client_scripts {
    'config.lua',
    'client/main.lua',
}

server_scripts {
    'config.lua',
    'server/main.lua',
}

server_exports {
    'GenerateRandomLab'
}

files {
    'html/*'
}