local QBCore = exports['qb-core']:GetCoreObject()
local noteIsOpen = false
local useDebug = Config.Debug

if Config.Inventory == 'ox' then
    AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
        exports.ox_inventory:displayMetadata('title', 'Title')
    end)
end

RegisterNetEvent("cw-notes:client:openNote", function(data, nui)
    if not noteIsOpen then
        QBCore.Functions.Notify("Press ESC to close")
        local info
        if Config.Inventory == 'ox' then
            info = data.metadata
        else
            info = data.info
        end
        if useDebug then
            print(QBCore.Debug(data))
        end
        SetNuiFocus(true,true)
        SendNUIMessage({nui = 'cwnotes', information = info})
        noteIsOpen = true
    end
end)

RegisterNetEvent("cw-notes:client:openInteraction", function(data, nui)
    if not noteIsOpen then
        QBCore.Functions.Notify("Press ESC to close")
	    TriggerEvent('animations:client:EmoteCommandStart', {'notepad'})
        if useDebug then
            print(QBCore.Debug(data))
        end
        SetNuiFocus(true,true)
        SendNUIMessage({nui = 'cwnoteswrite'})
        noteIsOpen = true
    end
end)

RegisterNUICallback("escape", function()
    TriggerEvent('animations:client:EmoteCommandStart', {'c'})
    SetNuiFocus(false)
    noteIsOpen = false
end)

RegisterNUICallback('confirm', function(data, cb)
    if useDebug then
        print('title', data.title)
        print('text', data.text)
     end
    local note = {
        title = data.title,
        text = data.text,
    }
    exports['sundown-utils']:hasBadWords(note.title, 'notes')
    exports['sundown-utils']:hasBadWords(note.text, 'notes')
    if useDebug then
       print('title', note.title)
       print('text', note.text)
    end
    TriggerServerEvent('cw-notes:server:createNote', note)
    cb("ok")
end)