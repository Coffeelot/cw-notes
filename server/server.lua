local QBCore = exports['qb-core']:GetCoreObject()

local function addItem(source, item, amount, info)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Config.Inventory == 'ox' then
        exports.ox_inventory:AddItem(src, item, amount, info)
    else
		Player.Functions.AddItem(item, amount, nil, info)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add")
    end
end

local function createNote(source, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local info = {}
    info.title = data.title
    info.text = data.text

    addItem(src, Config.Items.note, 1, info)
end

RegisterNetEvent("cw-notes:server:createNote", function(data)
    if Config.Debug then
       print('Creating note', data.title, data.text)
    end
    createNote(source, data)
end)


QBCore.Functions.CreateUseableItem(Config.Items.note, function(source, Item)
    TriggerClientEvent("cw-notes:client:openNote", source, Item)
end)

QBCore.Functions.CreateUseableItem(Config.Items.notepad, function(source, Item)
    TriggerClientEvent("cw-notes:client:openInteraction", source)
end)

QBCore.Commands.Add('makepres', 'make a note (admin only)',{}, true, function(source, args)
    local data = { title = args[1], text = args[2] }
    createNote(source, data)
end, "admin")
