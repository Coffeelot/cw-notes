if GetResourceState('qb-core') ~= 'started' or GetResourceState('qbx_core') == 'started' then return end

QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem(Config.Items.note, function(source, item)
    local hasNotepad = hasNotepadItem(source)
    local metadata = item.metadata or item.info
    TriggerClientEvent("cw-notes:client:openNote", source, metadata, hasNotepad)
end)

QBCore.Functions.CreateUseableItem(Config.Items.notepad, function(source, item)
    TriggerClientEvent("cw-notes:client:openInteraction", source)
end)

function hasNotepadItem(src)
    if Config.Inventory == 'ox' then
        local amount = exports.ox_inventory:GetItemCount(src, Config.Items.notepad)
        if Config.Debug then print('Has notepad: ', amount > 0) end
        return amount > 0
    else
        local Player = QBCore.Functions.GetPlayer(src)
        if not Player then return false end
    
        local item = Player.Functions.GetItemByName(Config.Items.notepad)
        if item and item.amount >= 1 then
            return true
        end
    
        return false
    end
end

function addNote(src, metadata)
    
    if Config.oxInv then
        local pped = GetPlayerPed(src)
        local coords = GetEntityCoords(pped)
    
        if exports.ox_inventory:CanCarryItem(src, Config.Items.note, 1) then
            return exports.ox_inventory:AddItem(src, Config.Items.note, 1, metadata)
        else
            local item = { name = Config.Items.note, amount = 1, metadata =  metadata }
            exports.ox_inventory:CustomDrop("cw-craft", { item }, coords)
        end
    else
        exports['qb-inventory']:AddItem(src, Config.Items.note, 1, false, metadata)
    end

end