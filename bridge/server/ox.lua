if GetResourceState('ox_core') ~= 'started' then return end
local Ox = require '@ox_core/lib/init'

AddEventHandler('ox_inventory:usedItem', function(playerId, name, slotId, metadata)
    
    if name == Config.Items.note then
        if Config.Debug then print('Using Item', name) end
        local hasNotepad = hasNotepadItem(playerId)
        TriggerClientEvent("cw-notes:client:openNote", playerId, metadata, hasNotepad)
    elseif name == Config.Items.notepad then
        if Config.Debug then print('Using Item', name) end
        TriggerClientEvent("cw-notes:client:openInteraction", playerId)
    end
end)

function hasNotepadItem(src)
    local amount = exports.ox_inventory:GetItemCount(src, Config.Items.notepad)
    if Config.Debug then print('Has notepad: ', amount > 0) end
    return amount > 0
end

function addNote(src, metadata)
    
    local pped = GetPlayerPed(src)
    local coords = GetEntityCoords(pped)

    if exports.ox_inventory:CanCarryItem(src, Config.Items.note, 1) then
        return exports.ox_inventory:AddItem(src, Config.Items.note, 1, metadata)
    else
        local item = { name = Config.Items.note, amount = 1, metadata =  metadata }
        exports.ox_inventory:CustomDrop("cw-craft", { item }, coords)
    end
end