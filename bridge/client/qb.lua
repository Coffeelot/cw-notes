if GetResourceState('qb-core') ~= 'started' or GetResourceState('qbx_core') == 'started' then return end
if Config.Debug then print('Using QB bridge') end

local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    if Config.Inventory == 'ox' then
        exports.ox_inventory:displayMetadata('title', 'Title')
    end
end)

function notify(text, type)
    if Config.OxLibNotify then
        lib.notify({
            title = text,
            type = type,
        })
    else
        QBCore.Functions.Notify(text, type)
    end
end
