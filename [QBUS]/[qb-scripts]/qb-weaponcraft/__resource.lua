resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page "html/ui.html"

description 'QB Occasions'

client_script {
    'client/client.lua',
    'Config.lua',
	
}

server_script {
    'server/server.lua',
    'Config.lua',
}

files {
	'html/reset.css',
	
	'html/craftcatalogo.png',
	'html/ui.css',
	'html/ui.html',
	'html/ui.js',
}