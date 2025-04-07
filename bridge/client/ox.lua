if GetResourceState('ox_core') ~= 'started' then return end
local Ox = require '@ox_core.lib.init'

if Config.Debug then print('Using OX Core bridge') end

RegisterNetEvent('ox:playerLoaded', function()
    exports.ox_inventory:displayMetadata('title', 'Title')
end)

function notify(text, type)
    lib.notify({
        title = text,
        type = type,
    })
end
