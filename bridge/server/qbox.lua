if GetResourceState('qbx_core') ~= 'started' then return end

exports.qbx_core:CreateUseableItem(Config.Items.note, function(source, item)
    local hasNotepad = hasNotepadItem(source)
    TriggerClientEvent("cw-notes:client:openNote", source, item.metadata, hasNotepad)
end)

exports.qbx_core:CreateUseableItem(Config.Items.notepad, function(source)
	TriggerClientEvent("cw-notes:client:openInteraction", source)
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
