if GetResourceState('qbx_core') ~= 'started' then return end

if Config.Debug then print('Using QBOX bridge') end


RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    exports.ox_inventory:displayMetadata('title', 'Title')
end)

function notify(text, type)
    lib.notify({
        title = text,
        type = type,
    })
end