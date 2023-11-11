-- Resource Metadata
fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'trickgodness && Jaareet'
description 'Auto Revive When Players Die in Tunnel'
version '1.0.0'
lua54 'on'

-- What to run
client_scripts {
	'./client/*.l*a',
}

shared_script '@es_extended/imports.lua'

dependency 'es_extended'
