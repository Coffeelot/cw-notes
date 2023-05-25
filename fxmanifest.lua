fx_version 'cerulean'

game 'gta5'
ui_page 'ui/index.html'

shared_scripts {
    'config.lua',
}

client_scripts{
    'client/*.lua',
}

server_scripts{
    'server/*.lua',
}

files {
	'ui/index.html',
	'ui/style.css',
	'ui/app.js',
	'ui/assets/img/*.png'
}
