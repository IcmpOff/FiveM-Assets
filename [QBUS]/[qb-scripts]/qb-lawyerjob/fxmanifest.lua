fx_version 'cerulean'
game 'gta5'

description 'QB-Justice'
version '1.0.0'

client_scripts {
	'config.lua',
	'client/main.lua',
}

server_scripts {
    'server/main.lua',
	'config.lua',
}

exports {
	'GetVehicleStatusList',
	'GetVehicleStatus',
	'SetVehicleStatus',
}
