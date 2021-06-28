fx_version 'cerulean'
game 'gta5'

description 'QB-Houses'
version '1.0.0'

ui_page "html/index.html"

client_scripts {
	'client/main.lua',
	'client/gui.lua',
	'client/decorate.lua',
	'config.lua'
}

server_scripts {
	'server/main.lua',
	'config.lua'
}

files {
	'html/index.html',
	'html/reset.css',
	'html/style.css',
	'html/script.js',
	'html/img/dynasty8-logo.png'
}

server_export {
	'hasKey'
}

dependencies {
	'qb-core',
	'qb-interior',
	'qb-clothing',
	'qb-weathersync'
}