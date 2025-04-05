fx_version 'cerulean'
lua54 'yes'

game 'gta5'
ui_page 'ui/index.html'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

client_scripts{
    'client/*.lua',
	'bridge/client/*.lua'
}

server_scripts{
	'server/*.lua',
	'bridge/server/*.lua'
}

files {
	'ui/index.html',
	'ui/style.css',
	'ui/app.js',
}
