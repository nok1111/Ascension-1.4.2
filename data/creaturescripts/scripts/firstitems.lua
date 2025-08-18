
local config = {
	[1] = {--caster
			--equipment spellbook, wand of vortex, magician's robe,leather boots, scarf
			items = {{32723, 1}, {2163, 1}, {2508, 1}, {2643, 1}, {2661, 1}},
			--container rope, shovel, mana potion
			container = {{35768, 5}, {35765, 5}, {35343, 15}}
	},
	[2] = { --melee
			--equipment shield, sword, magician's robe,leather boots, scarf
			items = {{2377, 1}, {2512, 1}, {2376, 1}, {2508, 1}, {2643, 1}, {2661, 1}},
			--container jagged sword, daramian mace, rope, shovel, health potion
			container = {{35768, 5}, {35765, 5}, {35343, 15}}
	},
	[3] = { --melee
			--equipment shield, sword, magician's robe,leather boots, scarf
			items = {{2512, 1}, {2512, 1}, {2376, 1}, {2508, 1}, {2643, 1}, {2661, 1}},
			--container jagged sword, daramian mace, rope, shovel, health potion
			container = {{35768, 5}, {35765, 5}, {35343, 15}}
	},
	[4] = { --melee
			--equipment shield, sword, magician's robe,leather boots, scarf
			items = {{2377, 1},{2512, 1}, {2376, 1}, {2508, 1}, {2643, 1}, {2661, 1}},
			--container jagged sword, daramian mace, rope, shovel, health potion
			container = {{35768, 5}, {35765, 5}, {35343, 15}}
	},
	[5] = { --caster
			--equipment spellbook, wand of vortex, magician's robe,leather boots, scarf
			items = {{32723, 1}, {2163, 1}, {2508, 1}, {2643, 1}, {2661, 1}},
			--container rope, shovel, mana potion
			container = {{35768, 5}, {35765, 5}, {35343, 15}}
	},
	[6] = { --caster
			--equipment spellbook, wand of vortex, magician's robe,leather boots, scarf
			items = {{32723, 1}, {2163, 1}, {2508, 1}, {2643, 1}, {2661, 1}},
			--container rope, shovel, mana potion
			container = {{35768, 5}, {35765, 5}, {35343, 15}}
	},
	[7] = { --melee
			--equipment shield, sword, magician's robe,leather boots, scarf
			items = {{2377, 1},{2512, 1}, {2376, 1}, {2508, 1}, {2643, 1}, {2661, 1}},
			--container jagged sword, daramian mace, rope, shovel, health potion
			container = {{35768, 5}, {35765, 5}, {35343, 15}}
	},
	[8] = { --caster
			--equipment spellbook, wand of vortex, magician's robe,leather boots, scarf
			items = {{32723, 1}, {2163, 1}, {2508, 1}, {2643, 1}, {2661, 1}},
			--container rope, shovel, mana potion
			container = {{35768, 5}, {35765, 5}, {35343, 15}}
	},
	[9] = { --melee
			--equipment shield, sword, magician's robe,leather boots, scarf
			items = {{2512, 1}, {2512, 1}, {2376, 1}, {2508, 1}, {2643, 1}, {2661, 1}},
			--container jagged sword, daramian mace, rope, shovel, health potion
			container = {{35768, 5}, {35765, 5}, {35343, 15}}
	},
	[10] = { --distance
			--equipment shield, sword, magician's robe,leather boots, scarf
			items = {{5947, 1}, {2508, 1}, {2643, 1}, {2661, 1}},
			--container jagged sword, daramian mace, rope, shovel, health potion
			container = {{35768, 5}, {35765, 5}, {35343, 15}}
	}

}

function onLogin(cid)
local player = Player(cid)
local targetVocation = config[player:getVocation():getId()]
if not targetVocation then
	return true
end

if player:getLastLoginSaved() ~= 0 then
	return true
end

for i = 1, #targetVocation.items do
	local items_gear = player:addItem(targetVocation.items[i][1], targetVocation.items[i][2])
	items_gear:setItemLevel(1, true)
end

local backpack = player:addItem(1988)
if not backpack then
	return true
end

for i = 1, #targetVocation.container do
	backpack:addItem(targetVocation.container[i][1], targetVocation.container[i][2])
end
return true
end




	