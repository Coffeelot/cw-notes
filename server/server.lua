local function createNote(source, data)
    local src = source

    addNote(src, data)
end

RegisterNetEvent("cw-notes:server:createNote", function(data)
    if Config.Debug then
       print('Creating note', data.title, data.text)
    end
    createNote(source, data)
end)
