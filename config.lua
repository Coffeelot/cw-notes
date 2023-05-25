Config = {}
Config.Inventory = 'ox'
Config.Debug = false

Config.Items = {
    notepad = 'cwnotepad',
    note = 'cwnote'
}

Config.Inputs = {
    {
        label = "Title", -- text you want to be displayed as a place holder
        description = "Title on the note", -- name of the input should be unique otherwise it might override
        type = "text", -- type of the input
        required = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
    },
    {
        label = "Text", -- text you want to be displayed as a place holder
        description = "Text", -- name of the input should be unique otherwise it might override
        type = "textarea", -- type of the input
        required = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
    },
}