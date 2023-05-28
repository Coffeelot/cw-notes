# cw-notes 📓
A lil tiny script that has two items in it: A notepad and notes.
The script is pretty simple, you use the notepad and you can type some notes. The text and title are saved in the item metadata, which means you don't need to save into the database etc. 

The script has support for QB inventory and OX inventory, you can toggle this in the config.

### **See the script in action on [Sundown RP](https://discord.gg/CZNh8kcSGK) 🌆**
# Preview 
## Video 📽
[![YOUTUBE VIDEO](http://img.youtube.com/vi/hqhn61qv5uE/0.jpg)](https://youtu.be/hqhn61qv5uE)

# Developed by Coffeelot and Wuggie
[More scripts by us](https://github.com/stars/Coffeelot/lists/cw-scripts)  👈\
[Support, updates and script previews](https://discord.gg/FJY4mtjaKr) 👈

**Support, updates and script previews**:

[![Join The discord!](https://cdn.discordapp.com/attachments/977876510620909579/1013102122985857064/discordJoin.png)](https://discord.gg/FJY4mtjaKr )


**All our scripts are and will remain free**. If you want to support what we do, you can buy us a coffee here:

[![Buy Us a Coffee](https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg)](https://www.buymeacoffee.com/cwscriptbois )
# Config 🔧

# QB INV ❗📦
Items to add to qb-core>shared>items.lua 
```
	["cwnotepad"] =          {["name"] = "cwnotepad",         ["label"] = "Note Pad",                  ["weight"] = 300, ["type"] = "item", ["image"] = "cwnotepad.png", ["unique"] = false, ["useable"] = true, ['shouldClose'] = false, ["combinable"] = nil, ["description"] = "Use this to write notes"},
    ["cwnote"] =          {["name"] = "cwnote",         ["label"] = "Note",                  ["weight"] = 35, ["type"] = "item", ["image"] = "cwnote.png", ["unique"] = false, ["useable"] = true, ['shouldClose'] = false, ["combinable"] = nil, ["description"] = "A note"},

```

# OX INV ❗📦
This one has a degrade of about 2 weeks. So users will need to buy new ones

```
	["cwnotepad"] = {
		label = "Note Pad",
		weight = 300,
		stack = true,
		close = true,
		allowArmed = true,
		description = "Use this to write notes",
	},
	["cwnote"] = {
		label = "Note",
		weight = 350,
		stack = true,
		close = true,
		allowArmed = true,
		description = "A note",
	},
```