local noteIsOpen = false
local useDebug = Config.Debug
local attachedNotepad = nil
local attachedPen = nil

local function clearProp()
    if useDebug then
        print('REMOVING PROP', attachedNotepad)
    end
    if attachedNotepad and DoesEntityExist(attachedNotepad) then
        DeleteEntity(attachedNotepad)
        attachedNotepad = 0
    end
    if attachedPen and DoesEntityExist(attachedPen) then
        DeleteEntity(attachedPen)
        attachedPen = 0
    end
end

local function attachNotepad()
    local model = 'prop_notepad_01'
    local boneNumber = 18905
    SetCurrentPedWeapon(cache.ped, 0xA2719263, false)
    local bone = GetPedBoneIndex(GetPlayerPed(-1), boneNumber)

    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(100)
    end
    attachedNotepad = CreateObject(model, 1.0, 1.0, 1.0, 1, 1, 0)
    local x, y, z = 0.1, 0.02, 0.05
    local xR, yR, zR = -10.0, 0.0, 0.0
    AttachEntityToEntity(attachedNotepad, GetPlayerPed(-1), bone, x, y, z, xR, yR, zR, 0, true, false, true, 2, true)
end

local function attachNote()
    local model = 'prop_amanda_note_01'
    local boneNumber = 58866
    SetCurrentPedWeapon(cache.ped, 0xA2719263, false)
    local bone = GetPedBoneIndex(GetPlayerPed(-1), boneNumber)

    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(100)
    end
    attachedNotepad = CreateObject(model, 1.0, 1.0, 1.0, 1, 1, 0)
    local x, y, z = 0.16, -0.08, 0.0
    local xR, yR, zR = -180.0, 20.0, 90.0
    AttachEntityToEntity(attachedNotepad, GetPlayerPed(-1), bone, x, y, z, xR, yR, zR, 0, true, false, true, 2, true)
end

local function attachPen()
    local model = 'prop_pencil_01'
    local boneNumber = 58866
    SetCurrentPedWeapon(cache.ped, 0xA2719263, false)
    local bone = GetPedBoneIndex(GetPlayerPed(-1), boneNumber)

    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(100)
    end
    attachedPen = CreateObject(model, 1.0, 1.0, 1.0, 1, 1, 0)
    local x, y, z = 0.11, -0.02, 0.001
    local xR, yR, zR = -120.0, 0.0, 0.0
    AttachEntityToEntity(attachedPen, GetPlayerPed(-1), bone, x, y, z, xR, yR, zR, 0, true, false, true, 2, true)
end

local function handleNotepadAnimation()
    clearProp()
    local animDict = 'missheistdockssetup1clipboard@base'
    local animation = 'base'
    if not DoesAnimDictExist(animDict) then
        print('animation dict does not exist')
        return false
    end
    RequestAnimDict(animDict)
    while (not HasAnimDictLoaded(animDict)) do Wait(10) end
    TaskPlayAnim(PlayerPedId(), animDict, animation, 5.0, 5.0, -1, 51, 0, false, false, false)
    attachNotepad()
    attachPen()
end

local function handleNoteAnimation()
    clearProp()
    local animDict = 'cellphone@'
    local animation = 'cellphone_text_read_base'
    if not DoesAnimDictExist(animDict) then
        print('animation dict does not exist')
        return false
    end
    RequestAnimDict(animDict)
    while (not HasAnimDictLoaded(animDict)) do Wait(10) end
    TaskPlayAnim(PlayerPedId(), animDict, animation, 5.0, 5.0, -1, 51, 0, false, false, false)
    attachNote()
end

local function stopAnimation()
    if useDebug then print('Stopping emote') end
    IsEmoting = false
    clearProp()
    ClearPedTasks(PlayerPedId())
end

RegisterNetEvent("cw-notes:client:openNote", function(metadata, hasNotepad)
    if not noteIsOpen then
        notify("Press [ESC] to close")
        if useDebug then
            print(json.encode(metadata, {indent=true}))
        end
        SetNuiFocus(true,true)
        SendNUIMessage({nui = 'cwnotes', information = metadata, hasNotepad = hasNotepad})
        noteIsOpen = true
        if hasNotepad then
            handleNotepadAnimation()
        else
            handleNoteAnimation()
        end
    end
end)

RegisterNetEvent("cw-notes:client:openInteraction", function(data)
    if not noteIsOpen then
        notify("Press [ESC] to close")
	    handleNotepadAnimation()
        SetNuiFocus(true,true)
        SendNUIMessage({nui = 'cwnoteswrite', information = data})
        noteIsOpen = true
    end
end)

RegisterNUICallback("escape", function()
    stopAnimation()
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
