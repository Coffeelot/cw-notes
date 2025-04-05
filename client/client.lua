local noteIsOpen = false
local useDebug = Config.Debug

RegisterNetEvent("cw-notes:client:openNote", function(metadata, hasNotepad)
    if not noteIsOpen then
        notify("Press [ESC] to close")
        if useDebug then
            print(json.encode(metadata, {indent=true}))
        end
        SetNuiFocus(true,true)
        SendNUIMessage({nui = 'cwnotes', information = metadata, hasNotepad = hasNotepad})
        noteIsOpen = true
    end
end)

RegisterNetEvent("cw-notes:client:openInteraction", function(data)
    if not noteIsOpen then
        notify("Press [ESC] to close")
	    TriggerEvent('animations:client:EmoteCommandStart', {'notepad'})
        SetNuiFocus(true,true)
        SendNUIMessage({nui = 'cwnoteswrite', information = data})
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
    if useDebug then
       print('title', note.title)
       print('text', note.text)
    end
    TriggerServerEvent('cw-notes:server:createNote', note)
    cb("ok")
end)

RegisterNUICallback('createCopy', function(data, cb)
    if useDebug then
        print('Creating copy')
        print('title', data.title)
        print('text', data.text)
     end
    local note = {
        title = data.title,
        text = data.text,
    }
    TriggerEvent('cw-notes:client:openInteraction', note)
    cb("ok")
end)