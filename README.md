### ⭐ Check out our [Tebex store](https://cw-scripts.tebex.io/category/2523396) for some cheap scripts ⭐

# cw-notes 📓

> Supports QB core, Ox Core and QBox core

A lil tiny script that has two items in it: A notepad and notes.
The script is pretty simple, you use the notepad and you can type some notes. The text and title are saved in the item metadata, which means you don't need to save into the database etc. 

The script has support for QB inventory and OX inventory, you can toggle this in the config.

# Preview 
## Video 📽
[![YOUTUBE VIDEO](http://img.youtube.com/vi/hqhn61qv5uE/0.jpg)](https://youtu.be/hqhn61qv5uE)

# Links
### ⭐ Check out our [Tebex store](https://cw-scripts.tebex.io/category/2523396) for some cheap scripts ⭐


### [More free scripts](https://github.com/stars/Coffeelot/lists/cw-scripts)  👈

### Support, updates and script previews:

<a href="https://discord.gg/FJY4mtjaKr"> <img src="https://media.discordapp.net/attachments/1202695794537537568/1285652389080334337/discord.png?ex=66eb0c97&is=66e9bb17&hm=b1b2c17715f169f57cf646bb9785b0bf833b2e4037ef47609100ec8e902371df&=&format=webp" width="200"></a>


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