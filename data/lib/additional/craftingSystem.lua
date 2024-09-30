--dofile("data/upgrade_system_const.lua")
--dofile("data/upgrade_system_core.lua")

if not Crafting then
	Crafting = {}
end

SERVER_CRAFT_RESULT = 1
SERVER_CRAFTING_WINDOW = 2

Crafting.recipes = {
	[1] = { -- all recipes for blacksmith
		{
			craftedItemId = 32702, -- server id of item that you gonna get from that recipe
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 0, -- used for description
			fame = 0, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = "Smelt copper ores into Copper Bar. required for crafting a variety of equipment.",
			craftPoints = 2, -- points for crafting that recipe		
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 35481, required = 2},
			},
		},
		{
			craftedItemId = 32766,
			craftedCount = 1, --
			tier = 0, 
			fame = 2, -- used for description
			requiredSkill = 0,
			desc = "Armor +5 rarity chance of get a higher quality item is determined by players crafting level.",
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 5,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 32702, required = 5},
			},
		},
		{
			craftedItemId = 32763,
			craftedCount = 1,
			tier = 0,
			fame = 2, -- used for description
			requiredSkill = 0,
			desc = "Armor +5 rarity chance of get a higher quality item is determined by players crafting level.",
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 5,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 32702, required = 4},
			},
		},
		{
			craftedItemId = 32764,
			craftedCount = 1,
			tier = 0,
			fame = 2, -- used for description
			requiredSkill = 0,
			desc = "Armor +8 rarity chance of get a higher quality item is determined by players crafting level.",
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 4,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 32702, required = 4},
			},
		},
		{
			craftedItemId = 32765,
			craftedCount = 1,
			tier = 0,
			fame = 2, -- used for description
			requiredSkill = 1,
			desc = "Armor +2 rarity chance of get a higher quality item is determined by players crafting level.",
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 2,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 32702, required = 3},
			},
		},
		{
			craftedItemId = 32767,
			craftedCount = 1,
			tier = 0,
			fame = 2, -- used for description
			requiredSkill = 1,
			desc = "Armor +1 rarity chance of get a higher quality item is determined by players crafting level.",
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 2,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 32702, required = 3},
			},
		},
		{
			craftedItemId = 2186,
			craftedCount = 1,
			tier = 0,
			fame = 2, -- used for description
			requiredSkill = 0,
			desc = "Armor +8 rarity chance of get a higher quality item is determined by players crafting level.",
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 4,
			cost = 2, -- points for crafting that recipe
			recipestorage = 701,
			ingredients = {
				{id = 32702, required = 6},
				{id = 29020, required = 8},
			},
		},
		{
			craftedItemId = 32789,
			craftedCount = 1,
			tier = 0,
			fame = 2, -- used for description
			requiredSkill = 1,
			desc = "one handed weapon Attk +40, Def +20, STR +1 rarity chance of get a higher quality item is determined by players crafting level.",
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 7,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 32702, required = 7},
			},
		},
		{
			craftedItemId = 32788,
			craftedCount = 1,
			tier = 0,
			fame = 2, -- used for description
			requiredSkill = 1,
			desc = "Second Recipe.",
			desc = "Two handed weapon Attk +36, Def +26 rarity chance of get a higher quality item is determined by players crafting level.",
			itemlvl = 10,
			craftPoints = 8,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 32702, required = 8},
			},
		},

		{
			craftedItemId = 30759,
			craftedCount = 1,
			tier = 0,
			fame = 2, -- used for description
			requiredSkill = 1,
			desc = "Two handed weapon Attk +37, Def +25, rarity chance of get a higher quality item is determined by players crafting level.",
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 13,
			cost = 2, -- points for crafting that recipe
			
			recipestorage = 0,
			ingredients = {
				{id = 32702, required = 25},
			},
		},
		{
			craftedItemId = 32058,
			craftedCount = 1,
			tier = 0,
			fame = 2, -- used for description
			requiredSkill = 1,
			desc = "Two handed weapon Attk +33, Def +14, Range +7 rarity chance of get a higher quality item is determined by players crafting level.",
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 8,
			cost = 2, -- points for crafting that recipe
			recipestorage = 702,
			ingredients = {
				{id = 32702, required = 8},
			},
		},
		{
			craftedItemId = 36357,
			craftedCount = 1,
			tier = 0,
			fame = 2, -- used for description
			requiredSkill = 0,
			desc = "Armor +8 rarity chance of get a higher quality item is determined by players crafting level.",
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 4,
			cost = 2, -- points for crafting that recipe
			recipestorage = 700,
			ingredients = {
				{id = 32702, required = 4},
			},
		},
		{
			craftedItemId = 32703,
			craftedCount = 1,
			tier = 1,
			fame = 2, -- used for description
			requiredSkill = 2,
			desc = "Smelt copper ores and tin ores into Bronce Bars. required for crafting a variety of equipment.",
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 5,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 35481, required = 2},
				{id = 35484, required = 1},
			},
		},
		{
			craftedItemId = 32739,
			craftedCount = 1,
			tier = 1,
			fame = 2, -- used for description
			requiredSkill = 2,
			desc = "Armor +7, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 15,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 32703, required = 8},
				{id = 29020, required = 1},
			},
		},
		{
			craftedItemId = 32740,
			craftedCount = 1,
			tier = 1,
			fame = 2, -- used for description
			requiredSkill = 2,
			desc = "Armor +12, rarity chance [RARE+].",
			rollrarity = 3, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 14,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 32703, required = 7},
				{id = 29020, required = 1},
			},
		},
		{
			craftedItemId = 32744,
			craftedCount = 1,
			tier = 1,
			fame = 2, -- used for description
			requiredSkill = 2,
			desc = "Armor +7, rarity chance [RARE+].",
			rollrarity = 3, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 15,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 32703, required = 8},
				{id = 29020, required = 1},
			},
		},
		{
			craftedItemId = 32745,
			craftedCount = 1,
			tier = 1,
			fame = 2, -- used for description
			requiredSkill = 3,
			desc = "Armor +2, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 12,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 32703, required = 7},
				{id = 29020, required = 1},
			},
		},
		{
			craftedItemId = 2191,
			craftedCount = 1,
			tier = 1,
			fame = 2, -- used for description
			requiredSkill = 3,
			desc = "1 handed weapon Attk +39, Def +19 rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 12,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 32703, required = 4},
				{id = 29020, required = 4},
				{id = 21401, required = 4},
			},
		},
		{
			craftedItemId = 36359,
			craftedCount = 1,
			tier = 1,
			fame = 2, -- used for description
			requiredSkill = 3,
			desc = "1 handed weapon Attk +39, Def +19 rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 12,
			cost = 2, -- points for crafting that recipe
			recipestorage = 703,
			ingredients = {
				{id = 32703, required = 9},
				{id = 29020, required = 4},
			},
		},
		{
			craftedItemId = 32741,
			craftedCount = 1,
			tier = 1,
			fame = 2, -- used for description
			requiredSkill = 3,
			desc = "1 handed weapon Attk +39, Def +19 rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 12,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 32703, required = 9},
				{id = 29020, required = 1},
			},
		},
		{
			craftedItemId = 2385,
			craftedCount = 1,
			tier = 1,
			fame = 2, -- used for description
			requiredSkill = 3,
			desc = "1 handed weapon Attk +39, Def +19 rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 12,
			cost = 2, -- points for crafting that recipe
			recipestorage = 705,
			ingredients = {
				{id = 32703, required = 10},
				{id = 29020, required = 4},
			},
		},
		{
			craftedItemId = 32743,
			craftedCount = 1,
			tier = 1,
			fame = 2, -- used for description
			requiredSkill = 3,
			desc = "1 handed weapon Attk +37, Def +21, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 15,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 32703, required = 8},
				{id = 29020, required = 1},
			},
		},
		{
			craftedItemId = 32742,
			craftedCount = 1,
			tier = 1,
			fame = 2, -- used for description
			requiredSkill = 3,
			desc = "Def +25, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 16,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 32703, required = 10},
				{id = 29020, required = 1},
			},
		},
		{
			craftedItemId = 31802,
			craftedCount = 1,
			tier = 1,
			fame = 2, -- used for description
			requiredSkill = 3,
			desc = "1 handed weapon Attk +39, Def +19 rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 12,
			cost = 2, -- points for crafting that recipe
			recipestorage = 704,
			ingredients = {
				{id = 32703, required = 4},
				{id = 29020, required = 4},
				{id = 21401, required = 4},
			},
		},
		{
			craftedItemId = 2185,
			craftedCount = 1,
			tier = 1,
			fame = 2, -- used for description
			requiredSkill = 3,
			desc = "1 handed weapon Attk +39, Def +19 rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 12,
			cost = 2, -- points for crafting that recipe
			recipestorage = 704,
			ingredients = {
				{id = 32703, required = 4},
				{id = 29020, required = 7},
			},
		},
		{
			craftedItemId = 32704,
			craftedCount = 1,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 3,
			desc = "Smelt Arcanium ores into Arcanium Bar. required for crafting a variety of equipment..",
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 8,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 35480, required = 2},
			},
		},
		{
			craftedItemId = 3982,
			craftedCount = 1,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 4,
			desc = "Armor +2, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 17,
			cost = 2, -- points for crafting that recipe
			recipestorage = 712,
			ingredients = {
				{id = 32704, required = 10},
				{id = 29020, required = 4},
				{id = 39134, required = 4},
				
			},
		},
		{
			craftedItemId = 36228,
			craftedCount = 1,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 4,
			desc = "Def +63, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 17,
			cost = 2, -- points for crafting that recipe
			recipestorage = 706,
			ingredients = {
				{id = 32704, required = 10},
				{id = 29020, required = 2},
				{id = 33203, required = 2},
			},
		},
		{
			craftedItemId = 32746,
			craftedCount = 1,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 4,
			desc = "Armor +8, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 17,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 32704, required = 10},
				{id = 29020, required = 1},
			},
		},
		{
			craftedItemId = 31886,
			craftedCount = 1,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 4,
			desc = "Attk +38, Elemental Damage +5, Def +22, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 17,
			cost = 2, -- points for crafting that recipe
			recipestorage = 707,
			ingredients = {
				{id = 32704, required = 10},
				{id = 29020, required = 2},
				{id = 33202, required = 1},
			},
		},
		{
			craftedItemId = 32747,
			craftedCount = 1,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 4,
			desc = "Armor +14, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 18,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 32704, required = 11},
				{id = 29020, required = 1},
			},
		},
		{
			craftedItemId = 32439,
			craftedCount = 1,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 4,
			desc = "Armor +17, +3 magic level, -3 physical resistance. rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 17,
			cost = 2, -- points for crafting that recipe
			recipestorage = 708,
			ingredients = {
				{id = 32704, required = 10},
				{id = 29020, required = 1},
				{id = 12470, required = 4},
			},
		},
		{
			craftedItemId = 36322,
			craftedCount = 1,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 4,
			desc = "[2h] Attk +66, Def +33, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 17,
			cost = 2, -- points for crafting that recipe
			recipestorage = 709,
			ingredients = {
				{id = 32704, required = 10},
				{id = 29020, required = 4},
				
			},
		},
		{
			craftedItemId = 32748,
			craftedCount = 1,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 4,
			desc = "Def +27, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 17,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 32704, required = 10},
				{id = 29020, required = 1},
			},
		},
	
		{
			craftedItemId = 32749,
			craftedCount = 1,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 4,
			desc = "Armor +8, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 15,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 32704, required = 9},
				{id = 29020, required = 1},
			},
		},
		{
			craftedItemId = 32750,
			craftedCount = 1,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 4,
			desc = "Armor +3, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 15,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 32704, required = 8},
				{id = 29020, required = 1},
			},
		},
		{
			craftedItemId = 32751,
			craftedCount = 1,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 4,
			desc = "Attk +46, Def +22, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 18,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 32704, required = 12},
				{id = 29020, required = 1},
			},			
		},
			{
			craftedItemId = 30607,
			craftedCount = 1,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 4,
			desc = "[2h] Attk +65, Def +34, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 17,
			cost = 2, -- points for crafting that recipe
			recipestorage = 710,
			ingredients = {
				{id = 32704, required = 10},
				{id = 29020, required = 4},
				{id = 36164, required = 4},
				
			},
		},
		{
			craftedItemId = 36274,
			craftedCount = 1,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 4,
			desc = "[2h] Attk +63, Def +36, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 17,
			cost = 2, -- points for crafting that recipe
			recipestorage = 711,
			ingredients = {
				{id = 32704, required = 10},
				{id = 29020, required = 4},
				{id = 39146, required = 4},
				
			},
		},
		{
			craftedItemId = 21382,--Eggsplosive Robo-Chicken Blueprint
			craftedCount = 1,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 4,
			desc = "This feathery automaton marches into battle, clucking and flapping its way to mischief. But when triggered, it's no yolk – watch as it detonates with eggsplosive force, leaving chaos in its wake!",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 17,
			cost = 150, -- points for crafting that recipe
			recipestorage = 711,
			ingredients = {
				{id = 32704, required = 50},
				{id = 29020, required = 8},
				{id = 5890, required = 15},
				
			},
		},
		
		{
			craftedItemId = 37135,
			craftedCount = 1,
			tier = 3,
			fame = 2, -- used for description
			requiredSkill = 4,
			desc = "Smelt Iron ores into Iron Bars. required for crafting a variety of equipment..",
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 10,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 36837, required = 2},
			},
		},
		
		{
			craftedItemId = 12318,
			craftedCount = 1,
			tier = 3,
			fame = 10, -- used for description
			requiredSkill = 5,
			desc = "[2h] Attk +74, Def +45, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 22,
			cost = 2, -- points for crafting that recipe
			recipestorage = 713,
			ingredients = {
				{id = 37135, required = 8},
				{id = 29020, required = 2},
				{id = 33203, required = 2},
			},
		},
		{
			craftedItemId = 31858,
			craftedCount = 1,
			tier = 3,
			fame = 10, -- used for description
			requiredSkill = 5,
			desc = "[1h] Attk +74, Def +45, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 22,
			cost = 2, -- points for crafting that recipe
			recipestorage = 714,
			ingredients = {
				{id = 37135, required = 8},
				{id = 29020, required = 2},
				{id = 39147, required = 1},
			},
		},
			{
			craftedItemId = 9777,
			craftedCount = 1,
			tier = 3,
			fame = 10, -- used for description
			requiredSkill = 5,
			desc = "[2h] Armor +8, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 22,
			cost = 2, -- points for crafting that recipe
			recipestorage = 717,
			ingredients = {
				{id = 37135, required = 8},
				{id = 29020, required = 2},
			},
		},
		{
			craftedItemId = 12646,
			craftedCount = 1,
			tier = 3,
			fame = 10, -- used for description
			requiredSkill = 5,
			desc = "[2h] Armor +3, speed +30, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 22,
			cost = 2, -- points for crafting that recipe
			recipestorage = 718,
			ingredients = {
				{id = 37135, required = 8},
				{id = 29020, required = 2},
			},
		},
		{
			craftedItemId = 37146,
			craftedCount = 1,
			tier = 3,
			fame = 10, -- used for description
			requiredSkill = 5,
			desc = "Armor +4, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 22,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 37135, required = 8},
				{id = 29020, required = 2},
			},
		},
		{
			craftedItemId = 37143,
			craftedCount = 1,
			tier = 3,
			fame = 10, -- used for description
			requiredSkill = 5,
			desc = "Armor +8, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 26,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 37135, required = 12},
				{id = 29020, required = 2},
			},
		},
		{
			craftedItemId = 37145,
			craftedCount = 1,
			tier = 3,
			fame = 10, -- used for description
			requiredSkill = 5,
			desc = "Armor +9, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 19,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 37135, required = 12},
				{id = 29020, required = 2},
			},
		},
			{
			craftedItemId = 31891,
			craftedCount = 1,
			tier = 3,
			fame = 10, -- used for description
			requiredSkill = 5,
			desc = "Def +77, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 26,
			cost = 2, -- points for crafting that recipe
			recipestorage = 715,
			ingredients = {
				{id = 37135, required = 12},
				{id = 29020, required = 2},
				{id = 21401, required = 1},
			},
		},
		{
			craftedItemId = 37144,
			craftedCount = 1,
			tier = 3,
			fame = 10, -- used for description
			requiredSkill = 5,
			desc = "Armor +15, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 32,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 37135, required = 16},
				{id = 29020, required = 2},
			},
		},
		{
			craftedItemId = 37147,
			craftedCount = 1,
			tier = 3,
			fame = 10, -- used for description
			requiredSkill = 5,
			desc = "Def +34, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 28,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 37135, required = 14},
				{id = 29020, required = 2},
			},
		},
			{
			craftedItemId = 32475,
			craftedCount = 1,
			tier = 3,
			fame = 10, -- used for description
			requiredSkill = 5,
			desc = "[2h] Attk +79, Def +46, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 22,
			cost = 2, -- points for crafting that recipe
			recipestorage = 716,
			ingredients = {
				{id = 37135, required = 8},
				{id = 29020, required = 2},
				{id = 33202, required = 3},
			},
		},
		{
			craftedItemId = 37136,
			craftedCount = 1,
			tier = 4,
			fame = 2, -- used for description
			requiredSkill = 4,
			desc = "Smelt Crystal ores into Crystal Bars. required for crafting a variety of equipment.",
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 12,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 37134, required = 2},
			},
		},
		{
			craftedItemId = 37138,
			craftedCount = 1,
			tier = 4,
			fame = 15, -- used for description
			requiredSkill = 5,
			desc = "armor +9, chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 34,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 37136, required = 10},
				{id = 29020, required = 4},
			},
		},
		{
			craftedItemId = 31961,
			craftedCount = 1,
			tier = 4,
			fame = 15, -- used for description
			requiredSkill = 5,
			desc = " Armor +11, HP regen +17 (every 6 seconds) rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 30,
			cost = 2, -- cost in gold coins
			recipestorage = 724,
			ingredients = {
				{id = 37136, required = 10},
				{id = 29020, required = 7},
				{id = 39130, required = 3},
			},
		},
			{
			craftedItemId = 37139,
			craftedCount = 1,
			tier = 4,
			fame = 15, -- used for description
			requiredSkill = 5,
			desc = "armor +19, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 37,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 37136, required = 14},
				{id = 29020, required = 4},
			},
		},
			{
			craftedItemId = 37141,
			craftedCount = 6,
			tier = 4,
			fame = 15, -- used for description
			requiredSkill = 5,
			desc = "armor +19, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 35,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 37136, required = 12},
				{id = 29020, required = 6},
			},
		},
			{
			craftedItemId = 37140,
			craftedCount = 1,
			tier = 4,
			fame = 15, -- used for description
			requiredSkill = 5,
			desc = "armor +26, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 38,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 37136, required = 16},
				{id = 29020, required = 6},
			},
		},
		{
			craftedItemId = 36197,
			craftedCount = 1,
			tier = 4,
			fame = 15, -- used for description
			requiredSkill = 5,
			desc = "[2h] Attk +86, Def +55, ElementalDamage + 3, Elemental Resistance + 2%, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 30,
			cost = 2, -- cost in gold coins
			recipestorage = 723,
			ingredients = {
				{id = 37136, required = 10},
				{id = 29020, required = 13},
				{id = 33201, required = 2},
			},
		},
			{
			craftedItemId = 32467,
			craftedCount = 1,
			tier = 4,
			fame = 15, -- used for description
			requiredSkill = 5,
			desc = "Attk +66, Def +34. 1 Handed, Elemental Resistance + 2%, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 30,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 37136, required = 10},
				{id = 29020, required = 7},
			},
		},
		
		{
			craftedItemId = 36153,
			craftedCount = 1,
			tier = 4,
			fame = 15, -- used for description
			requiredSkill = 5,
			desc = "[1h] Attk +69, Def +35, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 30,
			cost = 2, -- cost in gold coins
			recipestorage = 720,
			ingredients = {
				{id = 37136, required = 10},
				{id = 29020, required = 17},
				{id = 33201, required = 1},
			},
		},
			{
			craftedItemId = 8907,
			craftedCount = 1,
			tier = 4,
			fame = 15, -- used for description
			requiredSkill = 5,
			desc = "Def +38, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 28,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 37136, required = 9},
				{id = 29020, required = 5},
			},
		},
		{
			craftedItemId = 36390,
			craftedCount = 1,
			tier = 4,
			fame = 15, -- used for description
			requiredSkill = 5,
			desc = "Def +85, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 28,
			cost = 2, -- cost in gold coins
			recipestorage = 721,
			ingredients = {
				{id = 37136, required = 9},
				{id = 29020, required = 5},
				{id = 39185, required = 3},
			},
		},
			{
			craftedItemId = 34026,
			craftedCount = 1,
			tier = 4,
			fame = 15, -- used for description
			requiredSkill = 5,
			desc = "Attk +43, Def +21, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 39,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 37136, required = 16},
				{id = 29020, required = 6},
			},
		},
			{
			craftedItemId = 32506,
			craftedCount = 1,
			tier = 4,
			fame = 15, -- used for description
			requiredSkill = 5,
			desc = "Attk +32, Def +34, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 38,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 37136, required = 15},
				{id = 29020, required = 7},
			},
		},
		{
			craftedItemId = 34080,
			craftedCount = 1,
			tier = 4,
			fame = 15, -- used for description
			requiredSkill = 5,
			desc = "[2h] Attk +87, Def +54, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 30,
			cost = 2, -- cost in gold coins
			recipestorage = 722,
			ingredients = {
				{id = 37136, required = 10},
				{id = 29020, required = 13},
				{id = 33201, required = 2},
			},
		},
		{
			craftedItemId = 36249,
			craftedCount = 1,
			tier = 4,
			fame = 15, -- used for description
			requiredSkill = 5,
			desc = "[2h] Attk +89, Def +56, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 30,
			cost = 2, -- cost in gold coins
			recipestorage = 719,
			ingredients = {
				{id = 37136, required = 10},
				{id = 29020, required = 7},
				{id = 33202, required = 2},
			},
		},
		{
			craftedItemId = 39195, --T5 ORES
			craftedCount = 1,
			tier = 5,
			fame = 2, -- blacksteel ore
			requiredSkill = 5,
			desc = "Smelt blacksteel ores into blacksteel Bars. required for crafting a variety of equipment.",
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 12,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35483, required = 5},
			},
		},
		{
			craftedItemId = 38168,
			craftedCount = 1,
			tier = 5,
			fame = 15, -- used for description
			requiredSkill = 6,
			desc = "Transmute Celestial Lava Enchantment.",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 38,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 38174, required = 6},
				{id = 29020, required = 15},
			},
		},



		{
			craftedItemId = 34072, --T5 HELM
			craftedCount = 1,
			tier = 5,
			fame = 18, -- used for description
			requiredSkill = 6,
			desc = " Armor +32, Elemental Resistance + 2%, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 80,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 39195, required = 20},
				{id = 29020, required = 7},
				{id = 39189, required = 5},
				{id = 39188, required = 2},
				{id = 39188, required = 2},
			},
		},
			{
			craftedItemId = 34071, --T5 armor
			craftedCount = 1,
			tier = 5,
			fame = 18, -- used for description
			requiredSkill = 6,
			desc = " Armor +36, Elemental Resistance + 2%, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 80,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 39195, required = 30},
				{id = 29020, required = 10},
				{id = 39189, required = 8},
				{id = 39188, required = 4},
				{id = 39188, required = 2},
			},
		},
		{
			craftedItemId = 34070, --T5 legs
			craftedCount = 1,
			tier = 5,
			fame = 18, -- used for description
			requiredSkill = 6,
			desc = " Armor +32, Elemental Resistance + 2%, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 80,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 39195, required = 22},
				{id = 29020, required = 10},
				{id = 39189, required = 6},
				{id = 39188, required = 3},
				{id = 39188, required = 2},
			},
		},
		{
			craftedItemId = 34069, --T5 boots
			craftedCount = 1,
			tier = 5,
			fame = 18, -- used for description
			requiredSkill = 6,
			desc = " Armor +20, Elemental Resistance + 1%, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 40,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 39195, required = 12},
				{id = 29020, required = 7},
				{id = 39189, required = 4},
				{id = 39188, required = 1},
				{id = 39188, required = 2},
			},
		},


		{
			craftedItemId = 34032, --T5 bow
			craftedCount = 1,
			tier = 5,
			fame = 18, -- used for description
			requiredSkill = 7,
			desc = "Attack +145, Def +72, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 40,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 39195, required = 50},
				{id = 29020, required = 20},
				{id = 39189, required = 10},
				{id = 39188, required = 3},
				{id = 39188, required = 2},
			},
		},

		{
			craftedItemId = 34062, --T5 wand
			craftedCount = 1,
			tier = 5,
			fame = 18, -- used for description
			requiredSkill = 7,
			desc = "Attack +145, Def +72, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 40,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 39195, required = 50},
				{id = 29020, required = 20},
				{id = 39189, required = 10},
				{id = 39188, required = 3},
				{id = 39188, required = 2},
			},
		},

		{
			craftedItemId = 34065, --T5 1h sword
			craftedCount = 1,
			tier = 5,
			fame = 18, -- used for description
			requiredSkill = 7,
			desc = "1H Attack +80, Def +70, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 40,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 39195, required = 30},
				{id = 29020, required = 10},
				{id = 39189, required = 10},
				{id = 39188, required = 1},
				{id = 39188, required = 1},
			},
		},
		{
			craftedItemId = 34064, --T5 1h AXE
			craftedCount = 1,
			tier = 5,
			fame = 18, -- used for description
			requiredSkill = 7,
			desc = "1H Attack +88, Def +60, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 40,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 39195, required = 30},
				{id = 29020, required = 10},
				{id = 39189, required = 10},
				{id = 39188, required = 1},
				{id = 39188, required = 1},
			},
		},

		{
			craftedItemId = 37582, --T5 SHIELD
			craftedCount = 1,
			tier = 5,
			fame = 18, -- used for description
			requiredSkill = 7,
			desc = "Def +140, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 40,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 39195, required = 30},
				{id = 29020, required = 10},
				{id = 39189, required = 10},
				{id = 39188, required = 1},
				{id = 39188, required = 1},
			},
		},

		{
			craftedItemId = 34063, --T5 2H HAMMER
			craftedCount = 1,
			tier = 5,
			fame = 18, -- used for description
			requiredSkill = 7,
			desc = "Attack +145, Def +72, rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 40,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 39195, required = 50},
				{id = 29020, required = 20},
				{id = 39189, required = 10},
				{id = 39188, required = 3},
				{id = 39188, required = 2},
			},
		},

		{
			craftedItemId = 34066, --T5 RING
			craftedCount = 1,
			tier = 5,
			fame = 18, -- used for description
			requiredSkill = 7,
			desc = "Armor +6, elemental resistance +2%, physical resistance +2% rarity chance [RARE+].",
			rollrarity = 2, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 40,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 39195, required = 30},
				{id = 29020, required = 20},
				{id = 39189, required = 10},
				{id = 39188, required = 3},
				{id = 39188, required = 2},
			},
		},



	},
	

		[2] = { -- all recipes for alchemy
		{
			craftedItemId = 35768,
			craftedCount = 15,
			tier = 1,
			fame = 2, -- used for description
			requiredSkill = 0,
			desc = "Teaches you how to create a small health potion, drinking this potion will restore a small amount of health.",
			craftPoints = 3,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35440, required = 2},
				{id = 2245, required = 1},
			},
		},
		{
			craftedItemId = 35765,
			craftedCount = 15,
			tier = 1,
			fame = 2, -- used for description
			requiredSkill = 0,
			desc = "Teaches you how to create a small mana potion, drinking this potion will restore a small amount of mana.",
			craftPoints = 3,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35439, required = 2},
				{id = 2245, required = 1},
			},
		},
		{
			craftedItemId = 35764,
			craftedCount = 15,
			tier = 1,
			fame = 2, -- used for description
			requiredSkill = 0,
			desc = "Teaches you how to create a small spirit potion, drinking this potion will restore a small amount of mana and health.",
			craftPoints = 4,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35440, required = 2},
				{id = 35439, required = 2},
			},
		},
		{
			craftedItemId = 35775, -- server id of item that you gonna get from that recipe
			craftedCount = 5, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 2, -- if your profession level is lower you cant craft that recipe
			desc = "Teaches you how to create a minor haste vial, drinking this vial will grant the user a small amount of speed for 5 minutes.",
			craftPoints = 3, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35440, required = 2},
				{id = 2245, required = 1},
			},
		},
		{
			craftedItemId = 35773,
			craftedCount = 5,
			tier = 1,
			fame = 2, -- used for description
			requiredSkill = 2,
			desc = "Teaches you how to create a minor agility vial, drinking this vial will grant 3 Distance points for 10 minutes.",
			craftPoints = 5,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35440, required = 3},
			},
		},
		{
			craftedItemId = 35772,
			craftedCount = 5,
			tier = 1,
			fame = 2, -- used for description
			requiredSkill = 2,
			desc = "Teaches you how to create a minor mindflow vial, drinking this vial will grant 80 max mana points for 10 minutes.",
			craftPoints = 5,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35440, required = 3},
				
			},
		},
		
		
		{
			craftedItemId = 35771,
			craftedCount = 5,
			tier = 1,
			fame = 2, -- used for description
			requiredSkill = 2,
			desc = "Teaches you how to create a minor vial of fortitude, drinking this vial will grant 80 max helth points for 10 minutes.",
			craftPoints = 7,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35440, required = 3},
				
			},
		},
		{
			craftedItemId = 35769,
			craftedCount = 20,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 3,
			desc = "Teaches you how to create a medium health potion, drinking this potion will restore a medium amount of health.",
			craftPoints = 11,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35442, required = 3},
				{id = 2245, required = 2},
			},
		},
		{
			craftedItemId = 35766,
			craftedCount = 20,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 3,
			desc = "Teaches you how to create a medium mana potion, drinking this potion will restore a medium amount of mana.",
			craftPoints = 11,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35442, required = 3},
				{id = 2245, required = 2},
				
			},
		},
		{
			craftedItemId = 35763,
			craftedCount = 20,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 3,
			desc = "Teaches you how to create a medium spirit potion, drinking this potion will restore a  medium of mana and health.",
			craftPoints = 9,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {

				{id = 35442, required = 3},
				{id = 35439, required = 1},
			},
		},
		{
			craftedItemId = 35770,
			craftedCount = 3,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 3,
			desc = "Teaches you how to create a minor vial of awakening, drinking this vial will grant 1 magic points for 10 minutes.",
			craftPoints = 11,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35443, required = 3},
				{id = 2245, required = 2},
			},
		},

				{
			craftedItemId = 35449,
			craftedCount = 1,
			tier = 2,
			fame = 2, -- stonegrasp potion
			requiredSkill = 3,
			desc = "Teaches you how to create a stonegrasp potion, drinking this vial will turn the target into stone and protect him from all damage.",
			craftPoints = 40,
			cost = 20, -- cost in gold coins
			recipestorage = 750,
			ingredients = {
				{id = 35443, required = 10},
				{id = 2245, required = 8},
				{id = 39128, required = 5},
			},
		},


		
		{
			craftedItemId = 33073,
			craftedCount = 1,
			tier = 2,
			fame = 2, -- stonegrasp potion
			requiredSkill = 3,
			desc = "Teaches you how to create a proficiency skill vial. this vial grants a 20% boost to a skill of your choosing for 30 minutes. Choose wisely!.",
			craftPoints = 40,
			cost = 20, -- cost in gold coins
			recipestorage = 755,
			ingredients = {
				{id = 35443, required = 7},
				{id = 2245, required = 2},
				{id = 29020, required = 4},
			},
		},


		{
			craftedItemId = 35774,
			craftedCount = 3,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 3,
			desc = "Teaches you how to create a minor vial of the lion, drinking this vial will grant 3 Melee points for 10 minutes.",
			craftPoints = 11,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35443, required = 3},
				{id = 2245, required = 2},
			},
		},
		{
			craftedItemId = 35777,
			craftedCount = 3,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 3,
			desc = "Teaches you how to create a minor elixir of magic resistance, drinking this elixir will grant 3% elemental resistance for 5 minutes.",
			craftPoints = 11,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35443, required = 3},
				{id = 2245, required = 2},
			},
		},
		
		
		
			{
			craftedItemId = 21401,
			craftedCount = 3,
			tier = 3,
			fame = 7, -- used for description
			requiredSkill = 4,
			desc = "Teaches you how to transmute a fire essense.",
			craftPoints = 15,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35779, required = 1},
				{id = 29020, required = 1},
			},
		},
		
		{
			craftedItemId = 35782,
			craftedCount = 20,
			tier = 3,
			fame = 7, -- used for description
			requiredSkill = 4,
			desc = "Teaches you how to create a big health potion, drinking this potion will restore a big amount of health.",
			craftPoints = 15,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 36839, required = 3},
				{id = 2245, required = 2},
			},
		},
		{
			craftedItemId = 35767,
			craftedCount = 20,
			tier = 3,
			fame = 7, -- used for description
			requiredSkill = 4,
			desc = "Teaches you how to create a big mana potion, drinking this potion will restore a big amount of mana.",
			craftPoints = 15,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 36839, required = 3},
				{id = 2245, required = 2},
			},
		},
		
		{
			craftedItemId = 35762,
			craftedCount = 20,
			tier = 3,
			fame = 7, -- used for description
			requiredSkill = 4,
			desc = "Teaches you how to create a big spirit potion, drinking this potion will restore a big amount of mana & health.",
			craftPoints = 15,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 36839, required = 3},
				{id = 2245, required = 2},
			},
		},

				{
			craftedItemId = 24184,
			craftedCount = 1,
			tier = 3,
			fame = 0, -- used for description
			requiredSkill = 4,
			desc = "This core pulses with unstable energy. Has a 5% chance to be stabilized.",
			craftPoints = 5,
			cost = 5, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 9971, required = 1},
				{id = 29020, required = 2},
			},
		},
		
		{
			craftedItemId = 31819,
			craftedCount = 20,
			tier = 3,
			fame = 7, -- used for description
			requiredSkill = 4,
			desc = "Teaches you how to create a Oil Bomb, deals aoe damage based on users alchemy level.",
			craftPoints = 20,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 21401, required = 2},
			},
		},
		
		{
			craftedItemId = 21402,
			craftedCount = 5,
			tier = 3,
			fame = 7, -- used for description
			requiredSkill = 4,
			desc = "Teaches you how to create a worm milk, increases your defence by 10 points and can be also used in other cooking recepies.",
			craftPoints = 16,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 36839, required = 4},
				{id = 3976, required = 5},
			},
		},

		{
			craftedItemId = 33504,
			craftedCount = 1,
			tier = 3,
			fame = 7, -- elixir of sacrifice
			requiredSkill = 4,
			desc = "Teaches you how to create a elixir of sacrifice, dinking this will allow you to sacrificehalf your mana to refill all your health at once.",
			craftPoints = 30,
			cost = 40, -- cost in gold coins
			recipestorage = 751,
			ingredients = {
				{id = 36839, required = 14},
				{id = 29020, required = 8},
				{id = 39066, required = 5},
			},
		},
		--TIER 4 
		
		{
			craftedItemId = 6536,
			craftedCount = 5,
			tier = 4,
			fame = 2, -- used for description
			requiredSkill = 4,
			desc = "Teaches you how to create a Frozen Tear required for high level crafting recepies.",
			craftPoints = 7,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 37127, required = 15},
				{id = 4848, required = 1},
				
			},
		},
		
		{
			craftedItemId = 37284,
			craftedCount = 5,
			tier = 4,
			fame = 7, -- used for description
			requiredSkill = 4,
			desc = "Teaches you how to create a enchanted big health potion, drinking this potion will restore a big amount of health.",
			craftPoints = 30,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 6536, required = 1}, --frozen tear
				{id = 29020, required = 1},--enchanting powder
				{id = 35782, required = 2},--big spirit potion
			},
		},
		{
			craftedItemId = 37283,
			craftedCount = 5,
			tier = 4,
			fame = 7, -- used for description
			requiredSkill = 4,
			desc = "Teaches you how to create a enchanted big mana potion, drinking this potion will restore a big amount of mana.",
			craftPoints = 30,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 6536, required = 1}, --frozen tear
				{id = 29020, required = 1},--enchanting powder
				{id = 35767, required = 2},--big mana potion
			},
		},
		
		{
			craftedItemId = 37282,
			craftedCount = 5,
			tier = 4,
			fame = 7, -- used for description
			requiredSkill = 4,
			desc = "Teaches you how to create a enchanted big spirit potion, drinking this potion will restore a big amount of mana & health.",
			craftPoints = 30,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 6536, required = 1}, --frozen tear
				{id = 29020, required = 1},--enchanting powder
				{id = 35762, required = 2},--big health potion
			},
		},

		{
			craftedItemId = 29212,
			craftedCount = 1,
			tier = 4,
			fame = 7, -- chrono potion
			requiredSkill = 4,
			desc = "Teaches you how to create a chrono potion, drinking this potion will store your current health & mana in time and restore it again in 10 seconds.",
			craftPoints = 30,
			cost = 2, -- cost in gold coins
			recipestorage = 752,
			ingredients = {
				{id = 38701, required = 1}, --time essence
				{id = 29020, required = 8},--enchanting powder
				
			},
		},
		
		--TIER 5 ALCHEMY
		
		{
			craftedItemId = 35446,
			craftedCount = 1,
			tier = 5,
			fame = 7, -- used for description
			requiredSkill = 5,
			desc = "Teaches you how to create a elemental surge flask, contains a unknown surge of energy, will probably will not work as expected when attacking.",
			craftPoints = 30,
			cost = 2, -- elemental surge potion
			recipestorage = 753,
			ingredients = {
				{id = 37431, required = 10}, --t5 herb
				{id = 4848, required = 2},--enchanting powder
				{id = 29020, required = 8},--enchanting powder
			},
		},

		{
			craftedItemId = 38196,
			craftedCount = 1,
			tier = 5,
			fame = 7, -- used for description
			requiredSkill = 5,
			desc = "Celestial Transmutation Distance boost Effect.",
			craftPoints = 30,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 38195, required = 10}, --frozen tear
				{id = 29020, required = 25},--enchanting powder
				{id = 37431, required = 10}, --t5 herb
			},
		},
		{
			craftedItemId = 38179,
			craftedCount = 1,
			tier = 5,
			fame = 7, -- used for description
			requiredSkill = 5,
			desc = "Celestial Transmutation melee boost Effect.",
			craftPoints = 60,
			cost = 60, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 38148, required = 10}, --firewind leaf
				{id = 29020, required = 25},--enchanting powder
				{id = 37431, required = 10}, --t5 herb

			},
		},
		{
			craftedItemId = 38198,
			craftedCount = 1,
			tier = 5,
			fame = 7, -- used for description
			requiredSkill = 5,
			desc = "Celestial Transmutation defence boost Effect.",
			craftPoints = 30,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 38197, required = 10}, --frozen tear
				{id = 29020, required = 25},--enchanting powder
				{id = 37431, required = 10}, --t5 herb
			},
		},
		{
			craftedItemId = 38200,
			craftedCount = 1,
			tier = 5,
			fame = 7, -- used for description
			requiredSkill = 5,
			desc = "Celestial Transmutation defence boost Effect.",
			craftPoints = 30,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 38199, required = 10}, --frozen tear
				{id = 29020, required = 25},--enchanting powder
				{id = 37431, required = 10}, --t5 herb
			},
		},
		{
			craftedItemId = 38202,
			craftedCount = 1,
			tier = 5,
			fame = 7, -- used for description
			requiredSkill = 5,
			cost = 2, -- cost in gold coins
			desc = "Celestial Transmutation physical protection Effect.",
			craftPoints = 30,
			recipestorage = 0,
			ingredients = {
				{id = 38201, required = 10}, --frozen tear
				{id = 29020, required = 25},--enchanting powder
				{id = 37431, required = 10}, --t5 herb
			},
		},
		{
			craftedItemId = 38204,
			craftedCount = 1,
			tier = 5,
			fame = 7, -- used for description
			requiredSkill = 5,
			desc = "Celestial Transmutation magic protection Effect.",
			craftPoints = 30,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 38203, required = 10}, --frozen tear
				{id = 29020, required = 25},--enchanting powder
				{id = 37431, required = 10}, --t5 herb
			},
		},
		
	},
	
		[3] = { -- all recipes for cooking
		{
			craftedItemId = 35342, -- server id of item that you gonna get from that recipe
			craftedCount = 2, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = "2 slice of cheese: This item can be eated or used on future recepies.",
			craftPoints = 3, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35343, required = 2},
			},
		},
		{
			craftedItemId = 35338,
			craftedCount = 1,
			tier = 1,
			fame = 2, -- used for description
			requiredSkill = 0,
			desc = "Big round cheese: This item can be eated, eating big round cheese will grant full your belly with one bite.",
			craftPoints = 5,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35342, required = 5},
			},
		},
		{
			craftedItemId = 2689,
			craftedCount = 15,
			tier = 1,
			fame = 2, -- used for description
			requiredSkill = 0,
			desc = "15 pieces of simple bread: This item can be eated or used on future recepies.",
			craftPoints = 2,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 2692, required = 1},
				{id = 2695, required = 1},
			},
		},
		{
			craftedItemId = 2691,
			craftedCount = 10,
			tier = 1,
			fame = 2, -- used for description
			requiredSkill = 0,
			desc = "10 brown breads: This item can be eated or used on future recepies.",
			craftPoints = 5,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 2692, required = 1},
				{id = 2695, required = 1},
			},
		},
		{
			craftedItemId = 38033,
			craftedCount = 1,
			tier = 1,
			fame = 2, -- used for description
			requiredSkill = 0,
			desc = "Baked bass: Eating this will increase your Mana regeneration by 6 points every 2 seconds and last for 30 minutes. (this effect can not stack with other mana regen dishes).",
			craftPoints = 5,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35427, required = 2},
				
			},
		},
		{
			craftedItemId = 35365,
			craftedCount = 1,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 2,
			desc = "eating this will grant you a minor elemental protection buff.",
			craftPoints = 5,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35422, required = 2},
				{id = 35358, required = 1},
				
			},
		},
		{
			craftedItemId = 35359,
			craftedCount = 1,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 1,
			desc = "bread with ham. Eting this will increase your Hp regeneration by 5 points every 2 seconds for 30 minutes. (this effect can not stack with other health regen dishes)",
			craftPoints = 7,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 2691, required = 2}, -- bread
				{id = 2671, required = 2}, --ham
				{id = 35358, required = 1}, --bowl
				
				
			},
		},
		{
			craftedItemId = 35361,
			craftedCount = 1,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 1,
			desc = "eating this will grant you a minor physical potection buff.",
			craftPoints = 8,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 8838, required = 2},
				{id = 35339, required = 2},
				{id = 35358, required = 1}, --bowl
				
				
			},
		},
		{
			craftedItemId = 35367,
			craftedCount = 1,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 2,
			desc = "eating this will grant you a minor weapon damage buff.",
			craftPoints = 8,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {				
				{id = 35422, required = 1}, --bass
				{id = 35427, required = 1}, --big mouth bass (green)
				{id = 35358, required = 1}, --bowl								
			},
		},
		{
			craftedItemId = 35362,
			craftedCount = 1,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 2,
			desc = "eating this will grant you a minor elemental damage buff.",
			craftPoints = 8,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {		
				{id = 35421, required = 2}, --Largemouth Yellowfish
				{id = 35358, required = 1}, --bowl								
			},
		},

		{
			craftedItemId = 18397,
			craftedCount = 1,
			tier = 3,
			fame = 2, -- used for description
			requiredSkill = 3,
			desc = "eating this will grant you a weapon damage buff.",
			craftPoints = 8,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {		
                {id = 2792, required = 5}, --mushroom
                {id = 2692, required = 1},	--harina
                {id = 6125, required = 3},	--egg			
			},
		},
		{
			craftedItemId = 35783,
			craftedCount = 1,
			tier = 3,
			fame = 2, -- used for description
			requiredSkill = 3,
			desc = "Eating this will grant you a elemental damage boost.",
			craftPoints = 8,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {		
                {id = 35423, required = 2}, --t3 fish
                {id = 13213, required = 1},	--especias
                {id = 35358, required = 1},	--bowl			
			},
		},
		{
			craftedItemId = 35784,
			craftedCount = 1,
			tier = 3,
			fame = 2, -- used for description
			requiredSkill = 3,
			desc = "Eating this will grant you an enhanced mana regen buff for 30 minutes.",
			craftPoints = 8,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {		
                {id = 35428, required = 2}, --t3 fish
                {id = 13213, required = 1},	--especias
                {id = 35358, required = 1},	--bowl			
			},
		},
		{
			craftedItemId = 35785,
			craftedCount = 1,
			tier = 3,
			fame = 2, -- used for description
			requiredSkill = 3,
			desc = "Eating this will grant you a elemental Protection Boost.",
			craftPoints = 8,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {		
                {id = 2672, required = 3}, --dragon ham
                {id = 35339, required = 1},	--red meat
                {id = 35358, required = 1},	--bowl			
			},
		},
		{
			craftedItemId = 35369,
			craftedCount = 1,
			tier = 3,
			fame = 2, -- used for description
			requiredSkill = 3,
			desc = "Eating this will grant you a physical Protection Boost.",
			craftPoints = 8,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {		
                {id = 2672, required = 5}, --dragon ham
                {id = 35358, required = 1},	--bowl			
			},
		},
		--------------
		{
			craftedItemId = 35357,
			craftedCount = 1,
			tier = 4,
			fame = 2, -- used for description
			requiredSkill = 4,
			desc = "Eating this will grant you a great elemental Damage Boost.",
			craftPoints = 8,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {		
                {id = 35426, required = 3}, --fish
				{id = 13213, required = 2},	--especias
                {id = 35358, required = 1},	--bowl			
			},
		},
		{
			craftedItemId = 35371,
			craftedCount = 1,
			tier = 4,
			fame = 2, -- used for description
			requiredSkill = 4,
			desc = "Eating this will grant you a great weapon Damage Boost.",
			craftPoints = 8,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {		
                {id = 35420, required = 3}, --fish
				{id = 19737, required = 1},	--especias
                {id = 35358, required = 1},	--bowl			
			},
		},
		{
			craftedItemId = 35363,
			craftedCount = 1,
			tier = 4,
			fame = 2, -- used for description
			requiredSkill = 4,
			desc = "Eating this will increse your spirit regeneation (hp and mana) for 30 minutes.",
			craftPoints = 8,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {		
                {id = 11429, required = 3}, --hydra ham
				{id = 13213, required = 2},	--especias
                {id = 35358, required = 1},	--bowl			
			},
		},
		{
			craftedItemId = 35356,
			craftedCount = 1,
			tier = 4,
			fame = 2, -- used for description
			requiredSkill = 4,
			desc = "Eating this will grant you a great physical protection Boost.",
			craftPoints = 8,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {		
                {id = 35337, required = 2}, --bones
				{id = 2685, required = 2},	--tomatoes
                {id = 35358, required = 1},	--bowl			
			},
		},
		{
			craftedItemId = 35370,
			craftedCount = 1,
			tier = 4,
			fame = 2, -- used for description
			requiredSkill = 4,
			desc = "Eating this will grant you a great elemental protection Boost.",
			craftPoints = 8,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {		
                {id = 11429, required = 2}, --hydra ham
				{id = 2672, required = 2},	--dragon ham
                {id = 35358, required = 1},	--bowl			
			},
		},


		{
			craftedItemId = 35351,
			craftedCount = 1,
			tier = 5,
			fame = 2, -- used for description
			requiredSkill = 5,
			desc = "A mystical drink that enhances your spirit, increasing health and mana regeneration for 30 minutes.",
			craftPoints = 8,
			cost = 10, -- cost in gold coins
			recipestorage = 0,
			ingredients = {		
                {id = 29020, required = 5}, --enchanted powder
				{id = 21402, required = 1}, --milk
				{id = 35358, required = 1}, --bowl

			},
		},
		{
			craftedItemId = 35353,
			craftedCount = 1,
			tier = 5,
			fame = 2, -- used for description
			requiredSkill = 5,
			desc = "An arcane elixir that boosts your elemental damage, making your spells hit harder for a limited time.",
			craftPoints = 8,
			cost = 10, -- cost in gold coins
			recipestorage = 0,
			ingredients = {		
                {id = 29020, required = 5}, --enchanted powder
				{id = 21402, required = 1}, --milk
				{id = 35358, required = 1}, --bowl

			},
		},
		{
			craftedItemId = 35350,
			craftedCount = 1,
			tier = 5,
			fame = 2, -- used for description
			requiredSkill = 5,
			desc = "A hearty brew that fortifies your defenses, converting a portion of physical damage into mana for 30 minutes.",
			craftPoints = 8,
			cost = 10, -- cost in gold coins
			recipestorage = 0,
			ingredients = {		
                {id = 29020, required = 5}, --enchanted powder
				{id = 21402, required = 1}, --milk
				{id = 35358, required = 1}, --bowl

			},
		},
		--------------------------
		{
			craftedItemId = 12542,
			craftedCount = 1,
			tier = 5,
			fame = 2, -- used for description
			requiredSkill = 5,
			desc = "not implemented yet",
			craftPoints = 8,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {		
                {id = 35337, required = 5}, --bones
				{id = 2679, required = 2},	--cherry
                {id = 35358, required = 1},	--bowl			
			},
		},
		{
			craftedItemId = 11135,
			craftedCount = 1,
			tier = 5,
			fame = 2, -- used for description
			requiredSkill = 5,
			desc = "not implemented yet",
			craftPoints = 8,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {		
                {id = 35429, required = 5}, --fish
				{id = 5920, required = 2},	--green dragon scale		
			},
		},
		{
			craftedItemId = 35362,
			craftedCount = 1,
			tier = 5,
			fame = 2, -- used for description
			requiredSkill = 5,
			desc = "not implemented yet",
			craftPoints = 8,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {		
                {id = 35425, required = 6}, --fish
                {id = 35358, required = 1},	--bowl			
			},
		},
		{
			craftedItemId = 35354,
			craftedCount = 1,
			tier = 5,
			fame = 2, -- used for description
			requiredSkill = 5,
			desc = "not implemented yet",
			craftPoints = 8,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {		
                {id = 5943, required = 6}, --demon hearth
                {id = 35358, required = 1},	--bowl			
			},
		},
		







		{
			craftedItemId = 36131,
			craftedCount = 1,
			tier = 5,
			fame = 2, -- used for description
			requiredSkill = 5,
			desc = "not implemented yet",
			craftPoints = 8,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {		
                {id = 2685, required = 3}, --demon hearth
				{id = 2684, required = 3}, --demon hearth
				{id = 2673, required = 3}, --demon hearth
				{id = 8842, required = 3}, --demon hearth	
				{id = 1989, required = 1}, --demon hearth
			},
		},
		
		
	},
		[4] = { -- all recipes for enchanting
		--TIER 1 runes
		{
			craftedItemId = 2287, -- server id of item that you gonna get from that recipe
			craftedCount = 15, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = "Makes 15 Light Magic Missile Runes. Shoots a weak attack that causes Energy Damage. Req: lvl 10",
			itemlvl = 10,
			craftPoints = 2, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35372, required = 1},
			},
		},
		{
			craftedItemId = 2311, -- server id of item that you gonna get from that recipe
			craftedCount = 15, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = "Makes 15 Heavy Light Magic Missile Runes. Shoots a weak attack that causes Energy Damage. Req: lvl 15 ML: 3",
			itemlvl = 10,
			craftPoints = 5, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35372, required = 1},
				{id = 29020, required = 1},
			},
		},
		{
			craftedItemId = 2271, -- server id of item that you gonna get from that recipe
			craftedCount = 10, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = "Makes 10 Icicle Runes. Shoots an Ice attack. Req: lvl 18 ML: 5",
			itemlvl = 10,
			craftPoints = 5, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35372, required = 1},
				{id = 29020, required = 2},
			},
		},
			{
			craftedItemId = 2292, -- server id of item that you gonna get from that recipe
			craftedCount = 10, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = "Makes 10 Stalagmite Runes. Shoots an Earth attack. Req: lvl 18 ML: 5",
			itemlvl = 10,
			craftPoints = 5, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35372, required = 1},
				{id = 29020, required = 2},
			},
		},
			{
			craftedItemId = 2301, -- server id of item that you gonna get from that recipe
			craftedCount = 5, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = "Makes 5 Fire Field Runes. Creates a Fire Field. Req: lvl 20 ML: 1",
			itemlvl = 10,
			craftPoints = 5, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35372, required = 1},
				{id = 29020, required = 2},
			},
		},
		
		
		--TIER 2
		
		   {
			craftedItemId = 35379, -- server id of item that you gonna get from that recipe
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 2, -- used for description
			fame = 2, -- used for description
			requiredSkill = 2, -- if your profession level is lower you cant craft that recipe
			desc = "enchanted with Max Mana and Ability Damage.",
			itemlvl = 10,
			craftPoints = 7, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35372, required = 1},
				{id = 33201, required = 1},
			},
		},
		{
			craftedItemId = 35387,
			craftedCount = 1,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 2,
			desc = "enchanted with Max HP and Distance.",
			itemlvl = 10,
			craftPoints = 7,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35372, required = 1},
				{id = 33203, required = 1},
			},
		},
		{
			craftedItemId = 35395,
			craftedCount = 1,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 2,
			desc = "enchanted with Magic Level and Melee.",
			itemlvl = 10,
			craftPoints = 7,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35372, required = 1},
				{id = 35789, required = 1},
			},
		},
		{
			craftedItemId = 35404,
			craftedCount = 1,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 2,
			desc = "enchanted with max mana and Physical Protection.",
			itemlvl = 10,
			craftPoints = 7,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35372, required = 1},
				{id = 33202, required = 1},
			},
		},
		{
			craftedItemId = 35412,
			craftedCount = 1,
			tier = 2,
			fame = 2, -- used for description
			requiredSkill = 2,
			desc = "enchanted with Max Hp and Ability Damage Increased.",
			itemlvl = 10,
			craftPoints = 7,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35372, required = 1},
				{id = 35788, required = 1},
			},
		},
		
	
		
		--TIER 3
		
		{
			craftedItemId = 38195, -- server id of item that you gonna get from that recipe
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 3, -- used for description
			fame = 2, -- used for description
			requiredSkill = 4, -- if your profession level is lower you cant craft that recipe
			desc = "used to enchant gear pieces with a defined attibute. Distance + .. Value [ALL SLOTS]",
			itemlvl = 10,
			craftPoints = 8, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 33203, required = 2},

			},
		},
		{
			craftedItemId = 38148, -- server id of item that you gonna get from that recipe
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 3, -- used for description
			fame = 2, -- used for description
			requiredSkill = 4, -- if your profession level is lower you cant craft that recipe
			desc = "used to enchant gear pieces with a defined attibute. Melee + .. Value [ALL SLOTS]",
			itemlvl = 10,
			craftPoints = 8, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35788, required = 2},

			},
		},
		{
			craftedItemId = 38197, -- server id of item that you gonna get from that recipe
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 3, -- used for description
			fame = 2, -- used for description
			requiredSkill = 4, -- if your profession level is lower you cant craft that recipe
			desc = "used to enchant gear pieces with a defined attibute. Defence + .. Value [ALL SLOTS]",
			itemlvl = 10,
			craftPoints = 8, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35789, required = 1},
				{id = 33201, required = 1},

			},
		},
		{
			craftedItemId = 38199, -- server id of item that you gonna get from that recipe
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 3, -- used for description
			fame = 2, -- used for description
			requiredSkill = 4, -- if your profession level is lower you cant craft that recipe
			desc = "used to enchant gear pieces with a defined attibute. Magic + .. Value [ALL SLOTS]",
			itemlvl = 10,
			craftPoints = 8, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 33202, required = 2},

			},
		},
		
		
		{
			craftedItemId = 35378, -- server id of item that you gonna get from that recipe
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 3, -- used for description
			fame = 2, -- used for description
			requiredSkill = 4, -- if your profession level is lower you cant craft that recipe
			desc = "Rune transmitation",
			itemlvl = 10,
			craftPoints = 8, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35372, required = 3},

			},
		},
		
		{
			craftedItemId = 35381, -- server id of item that you gonna get from that recipe
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 3, -- used for description
			fame = 2, -- used for description
			requiredSkill = 4, -- if your profession level is lower you cant craft that recipe
			desc = "enchanted with Max Mana and elemental Protection.",
			itemlvl = 10,
			craftPoints = 8, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35378, required = 1},
				{id = 33201, required = 1},
			},
		},
		{
			craftedItemId = 35388,
			craftedCount = 1,
			tier = 3,
			fame = 2, -- used for description
			requiredSkill = 4,
			desc = "enchanted with Distance and Aditional Gold Drop.",
			itemlvl = 10,
			craftPoints = 8,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35378, required = 1},
				{id = 33203, required = 1},
			},
		},
		{
			craftedItemId = 35399,
			craftedCount = 1,
			tier = 3,
			fame = 2, -- used for description
			requiredSkill = 4,
			desc = "enchanted with Ability damage Increased and Healling Increased.",
			itemlvl = 10,
			craftPoints = 8,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35378, required = 1},
				{id = 35789, required = 1},
			},
		},
		{
			craftedItemId = 35403,
			craftedCount = 1,
			tier = 3,
			fame = 2, -- used for description
			requiredSkill = 4,
			desc = "enchanted with Max Hp and Magic Level.",
			itemlvl = 10,
			craftPoints = 8,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35378, required = 1},
				{id = 33202, required = 1},
			},
		},
		{
			craftedItemId = 35413,
			craftedCount = 1,
			tier = 3,
			fame = 2, -- used for description
			requiredSkill = 4,
			desc = "enchanted with Max Hp and Melee.",
			itemlvl = 10,
			craftPoints = 8,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35378, required = 1},
				{id = 35788, required = 1},
			},
		},
		
		
		
		--TIER 4
		
		{
			craftedItemId = 35377, -- server id of item that you gonna get from that recipe
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 4, -- used for description
			fame = 2, -- used for description
			requiredSkill = 4, -- if your profession level is lower you cant craft that recipe
			desc = "Rune transmitation",
			itemlvl = 10,
			craftPoints = 7, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35378, required = 2},

			},
		},
		
		{
			craftedItemId = 35380, -- server id of item that you gonna get from that recipe
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 4, -- used for description
			fame = 2, -- used for description
			requiredSkill = 5, -- if your profession level is lower you cant craft that recipe
			desc = "enchanted with Max Mana and Magic Level.",
			itemlvl = 10,
			craftPoints = 10, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35377, required = 1},
				{id = 33201, required = 2},
			},
		},
		
		
		{
			craftedItemId = 35389,
			craftedCount = 1,
			tier = 4,
			fame = 2, -- used for description
			requiredSkill = 5,
			desc = "enchanted with a Distance and Melee.",
			itemlvl = 10,
			craftPoints = 10,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35377, required = 1},
				{id = 33203, required = 2},
			},
		},
		
		
		{
			craftedItemId = 35396,
			craftedCount = 1,
			tier = 4,
			fame = 2, -- used for description
			requiredSkill = 5,
			desc = "enchanted with Magic Level and Defence.",
			itemlvl = 10,
			craftPoints = 10,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35377, required = 1},
				{id = 35789, required = 2},
			},
		},
		
		
		{
			craftedItemId = 35405,
			craftedCount = 1,
			tier = 4,
			fame = 2, -- used for description
			requiredSkill = 5,
			desc = "enchanted with Max Hp and elemental Damage increased.",
			itemlvl = 10,
			craftPoints = 10,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35377, required = 1},
				{id = 33202, required = 2},
			},
		},
		
		{
			craftedItemId = 38164,
			craftedCount = 1,
			tier = 4,
			fame = 2, -- used for description
			requiredSkill = 5,
			desc = "value .. %% to deal double damage [weapons]",
			itemlvl = 10,
			craftPoints = 10,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35377, required = 10},
			},
		},
		
		
		{
			craftedItemId = 35414,
			craftedCount = 1,
			tier = 4,
			fame = 2, -- used for description
			requiredSkill = 5,
			desc = "enchanted with Max Hp and Physical Protection.",
			itemlvl = 10,
			craftPoints = 10,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35377, required = 1},
				{id = 35788, required = 2},
			},
		},
		
		
		--TIER 5
		{
			craftedItemId = 35376, -- server id of item that you gonna get from that recipe
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 5, -- used for description
			fame = 2, -- used for description
			requiredSkill = 4, -- if your profession level is lower you cant craft that recipe
			desc = "Rune transmitation",
			itemlvl = 10,
			craftPoints = 10, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35377, required = 2},

			},
		},
			{
			craftedItemId = 35375, -- server id of item that you gonna get from that recipe
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 5, -- used for description
			fame = 2, -- used for description
			requiredSkill = 4, -- if your profession level is lower you cant craft that recipe
			desc = "Rune transmitation",
			itemlvl = 10,
			craftPoints = 10, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35377, required = 2},

			},
		},
		{
			craftedItemId = 38201, -- server id of item that you gonna get from that recipe
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 5, -- used for description
			fame = 2, -- used for description
			requiredSkill = 4, -- if your profession level is lower you cant craft that recipe
			desc = "physical protection attribute.",
			itemlvl = 10,
			craftPoints = 10, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35376, required = 6},
				{id = 28020, required = 15},

			},
		},
		{
			craftedItemId = 38203, -- server id of item that you gonna get from that recipe
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 5, -- used for description
			fame = 2, -- used for description
			requiredSkill = 4, -- if your profession level is lower you cant craft that recipe
			desc = "elemental protection attribute.",
			itemlvl = 10,
			craftPoints = 10, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 35376, required = 6},
				{id = 28020, required = 15},

			},
		},
		
	
		
		{
			craftedItemId = 35382,
			craftedCount = 1,
			tier = 5,
			fame = 7, -- used for description
			requiredSkill = 7,
			desc = "enchanted with Max Mana and Mana on Kill.",
			itemlvl = 10,
			craftPoints = 20,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35376, required = 1},
				{id = 33201, required = 4},
			},
		},
		{
			craftedItemId = 35390,
			craftedCount = 1,
			tier = 5,
			fame = 7, -- used for description
			requiredSkill = 7,
			desc = "enchanted with Distance and Physical Damage.",
			itemlvl = 10,
			craftPoints = 20,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35376, required = 1},
				{id = 33203, required = 4},
			},
		},
		{
			craftedItemId = 35397,
			craftedCount = 1,
			tier = 5,
			fame = 7, -- used for description
			requiredSkill = 7,
			desc = "enchanted with Magic and Ability damage increased.",
			itemlvl = 10,
			craftPoints = 20,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35376, required = 1},
				{id = 35789, required = 4},
			},
		},
		{
			craftedItemId = 35406,
			craftedCount = 1,
			tier = 5,
			fame = 7, -- used for description
			requiredSkill = 7,
			desc = "enchanted with Ability Damage increased and Revive on Death chance.",
			itemlvl = 10,
			craftPoints = 20,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35376, required = 1},
				{id = 33202, required = 4},
			},
		},
		{
			craftedItemId = 35415,
			craftedCount = 1,
			tier = 5,
			fame = 7, -- used for description
			requiredSkill = 7,
			desc = "enchanted with Defence and Melee.",
			itemlvl = 10,
			craftPoints = 20,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35376, required = 1},
				{id = 35788, required = 4},
			},
		},
		
		
		{
			craftedItemId = 35383,
			craftedCount = 1,
			tier = 5,
			fame = 7, -- used for description
			requiredSkill = 7,
			desc = "enchanted with Magic Level and Physical Protection.",
			itemlvl = 10,
			craftPoints = 20,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35375, required = 1},
				{id = 33201, required = 4},
			},
		},
		{
			craftedItemId = 35391,
			craftedCount = 1,
			tier = 5,
			fame = 7, -- used for description
			requiredSkill = 7,
			desc = "enchanted with Max Mana and Distance.",
			itemlvl = 10,
			craftPoints = 20,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35375, required = 1},
				{id = 33203, required = 4},
			},
		},
		{
			craftedItemId = 35398,
			craftedCount = 1,
			tier = 5,
			fame = 7, -- used for description
			requiredSkill = 7,
			desc = "enchanted with Melee and Ability Damage increased.",
			itemlvl = 10,
			craftPoints = 20,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35375, required = 1},
				{id = 35789, required = 4},
			},
		},
		{
			craftedItemId = 35407,
			craftedCount = 1,
			tier = 5,
			fame = 7, -- used for description
			requiredSkill = 7,
			desc = "enchanted with elemental Protection and Death Strike on Attack.",
			itemlvl = 10,
			craftPoints = 20,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35375, required = 1},
				{id = 33202, required = 4},
			},
		},
		{
			craftedItemId = 35416,
			craftedCount = 1,
			tier = 5,
			fame = 7, -- used for description
			requiredSkill = 7,
			desc = "enchanted with Max Hp and Defence.",
			itemlvl = 10,
			craftPoints = 20,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35375, required = 1},
				{id = 35788, required = 4},
			},
		},
		
		--tier 6
		
		{
			craftedItemId = 35374, -- server id of item that you gonna get from that recipe
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 6, -- used for description
			fame = 2, -- used for description
			requiredSkill = 7, -- if your profession level is lower you cant craft that recipe
			desc = "Rune transmitation",
			itemlvl = 10,
			craftPoints = 15, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35375, required = 2},
				{id = 35376, required = 2},
				

			},
		},
		
			{
			craftedItemId = 35384,
			craftedCount = 1,
			tier = 6,
			fame = 10, -- used for description
			requiredSkill = 7,
			desc = "enchanted with Magic Level and Energy Strike on Attack.",
			itemlvl = 10,
			craftPoints = 30,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35374, required = 1},
				{id = 33201, required = 8},
			},
		},
			{
			craftedItemId = 35392,
			craftedCount = 1,
			tier = 6,
			fame = 10, -- used for description
			requiredSkill = 7,
			desc = "enchanted with Distance and Max Mana.",
			itemlvl = 10,
			craftPoints = 30,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35374, required = 1},
				{id = 33203, required = 8},
			},
		},
			{
			craftedItemId = 35400,
			craftedCount = 1,
			tier = 6,
			fame = 10, -- used for description
			requiredSkill = 7,
			desc = "enchanted with Max Mana and Mass Healling spell on Attack.",
			itemlvl = 10,
			craftPoints = 30,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35374, required = 1},
				{id = 35789, required = 8},
			},
		},
			{
			craftedItemId = 35408,
			craftedCount = 1,
			tier = 6,
			fame = 10, -- used for description
			requiredSkill = 7,
			desc = "enchanted with Max Hp and Healling Incresed from all sources.",
			itemlvl = 10,
			craftPoints = 30,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35374, required = 1},
				{id = 33202, required = 8},
			},
		},
		{
			craftedItemId = 35417,
			craftedCount = 1,
			tier = 6,
			fame = 10, -- used for description
			requiredSkill = 7,
			desc = "enchanted with Physical Protection and Elemental Protection.",
			itemlvl = 10,
			craftPoints = 30,
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 35374, required = 1},
				{id = 35788, required = 8},
			},
		},
	--END	ENCHANTING
	},
	[9] = { -- all recipes for enchanting
		--TIER 1 runes
		{
			craftedItemId = 38985, -- server id of item that you gonna get from that recipe
			craftedCount = 15, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = "Rune of xxxx, xxxxxx, this rune can be further upgraded wich will increase its effects.",
			itemlvl = 0,
			craftPoints = 0, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 38701, required = 25}, --TIME ESSENCE
				{id = 35372, required = 1}, --ETERNITY HOURGLASS
			},
		},
		{
		craftedItemId = 38984, -- server id of item that you gonna get from that recipe
			craftedCount = 15, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = "Rune of xxxx, xxxxxx, this rune can be further upgraded wich will increase its effects.",
			itemlvl = 0,
			craftPoints = 0, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 38701, required = 25}, --TIME ESSENCE
				{id = 35372, required = 1}, --ETERNITY HOURGLASS
			},
		},
		{
		craftedItemId = 38978, -- server id of item that you gonna get from that recipe
			craftedCount = 15, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = "Rune of xxxx, xxxxxx, this rune can be further upgraded wich will increase its effects.",
			itemlvl = 0,
			craftPoints = 0, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 38701, required = 25}, --TIME ESSENCE
				{id = 35372, required = 1}, --ETERNITY HOURGLASS
			},
		},
		{
		craftedItemId = 38972, -- server id of item that you gonna get from that recipe
			craftedCount = 15, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = "Rune of xxxx, xxxxxx, this rune can be further upgraded wich will increase its effects.",
			itemlvl = 0,
			craftPoints = 0, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 38701, required = 25}, --TIME ESSENCE
				{id = 35372, required = 1}, --ETERNITY HOURGLASS
			},
		},
		{
		craftedItemId = 38966, -- server id of item that you gonna get from that recipe
			craftedCount = 15, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = "Rune of xxxx, xxxxxx, this rune can be further upgraded wich will increase its effects.",
			itemlvl = 0,
			craftPoints = 0, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 38701, required = 25}, --TIME ESSENCE
				{id = 35372, required = 1}, --ETERNITY HOURGLASS
			},
		},
		{
		craftedItemId = 38955, -- server id of item that you gonna get from that recipe
			craftedCount = 15, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = "Rune of xxxx, xxxxxx, this rune can be further upgraded wich will increase its effects.",
			itemlvl = 0,
			craftPoints = 0, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 38701, required = 25}, --TIME ESSENCE
				{id = 35372, required = 1}, --ETERNITY HOURGLASS
			},
		},
		{
		craftedItemId = 38949, -- server id of item that you gonna get from that recipe
			craftedCount = 15, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = "Rune of xxxx, xxxxxx, this rune can be further upgraded wich will increase its effects.",
			itemlvl = 0,
			craftPoints = 0, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 38701, required = 25}, --TIME ESSENCE
				{id = 35372, required = 1}, --ETERNITY HOURGLASS
			},
		},
		{
		craftedItemId = 38943, -- server id of item that you gonna get from that recipe
			craftedCount = 15, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = "Rune of xxxx, xxxxxx, this rune can be further upgraded wich will increase its effects.",
			itemlvl = 0,
			craftPoints = 0, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 38701, required = 25}, --TIME ESSENCE
				{id = 35372, required = 1}, --ETERNITY HOURGLASS
			},
		},
	
	},
}


function Crafting:parseCraftRecipe(player, msg)
	local recipeId = msg:getU32()
	local amount = msg:getU16()
	local profId = msg:getByte() -- profession
	local success, err = self:craftRecipe(player, recipeId, amount, profId)
	local setItemLevel = {}
	local setRarity = {}
	
	self:sendCraftingResult(player, success, err)
	self:sendOpenCraftingWindow(player, profId)
end





function Crafting:updateItem(player, itemnew, recipe, profId, amount)


local profession_level = ProfessionSystem:getSkillLevel(player, SKILL_BLACKSMITH)
local enchanting_level = ProfessionSystem:getSkillLevel(player, SKILL_ENCHANTING)
local itemlevel_bigequipment = math.floor(3 + (profession_level * 1.8))
local itemlevel_smallequipment = math.floor(1 + (profession_level * 0.5))
local itemlevel_runes1 = math.floor(30 + (enchanting_level * 2.0))
local itemlevel_runes2 = math.floor(58 + (enchanting_level * 2.5))
local itemlevel_runes3 = math.floor(60 + (enchanting_level * 3.0))
local itemlevel_runes4 = math.floor(75 + (enchanting_level * 3.5))
local itemlevel_runes5 = math.floor(90 + (enchanting_level * 4.5))

local function createRarity_craft()
  local rarity = COMMON
  local roll = math.random(1, 100) + profession_level
  
  if roll > 98 then
    rarity = LEGENDARY
  elseif roll > 95 then
    rarity = EPIC
  elseif roll > 70 then
    rarity = RARE
  end
  
  return rarity
end

--print(createRarity_craft())





if recipe.craftedItemId == 32763 then
        itemnew:setItemLevel(itemlevel_bigequipment, true)
        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)


--enchanting mats

elseif recipe.craftedItemId == 2287 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)
elseif recipe.craftedItemId == 2311 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId == 2271 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId == 2292 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId == 2301 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId == 35378 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId == 35377 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId == 35376 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId == 35374 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)


--blacksmith
elseif recipe.craftedItemId == 35768 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId == 35765 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId == 35764 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId == 35775 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)
elseif recipe.craftedItemId == 35773 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId == 35772 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId == 35771 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId == 35769 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId == 35769 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId == 35766 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId == 35763 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId == 35770 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId == 35774 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId == 35779 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId == 21401 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)


elseif recipe.craftedItemId == 35782 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)


elseif recipe.craftedItemId == 35767 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)


elseif recipe.craftedItemId == 35762 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)


elseif recipe.craftedItemId == 31819 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)


elseif recipe.craftedItemId == 21402 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId == 6536 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId == 35780 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)
elseif recipe.craftedItemId == 37284 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId == 37283 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)


elseif recipe.craftedItemId == 37282 then
                        --removed
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)


elseif recipe.craftedItemId == 32764 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	32765 then
                        itemnew:setItemLevel(itemlevel_smallequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId == 32766 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId == 32767 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)


elseif recipe.craftedItemId == 32788 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)


elseif recipe.craftedItemId == 32789 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)


elseif recipe.craftedItemId ==	2377 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	30759 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)


elseif recipe.craftedItemId ==	32058 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)




elseif recipe.craftedItemId == 32739  then	--COMMON EQUIPMENT
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))

                        FameSystem:addPoints(player, recipe.fame)
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)

            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)



        elseif recipe.craftedItemId ==	32740 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)


        elseif recipe.craftedItemId ==	32741 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)
		
		 elseif recipe.craftedItemId ==	36357 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

		 elseif recipe.craftedItemId ==	31802 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)
			
		 elseif recipe.craftedItemId ==	2186 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

		 elseif recipe.craftedItemId ==	36359 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

		 elseif recipe.craftedItemId ==	2385 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)
			
		 elseif recipe.craftedItemId ==	2191 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

		
		
		
		
		
        elseif recipe.craftedItemId ==	32742 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)


        elseif recipe.craftedItemId ==	32743 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)


        elseif recipe.craftedItemId ==	32744 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)


        elseif recipe.craftedItemId ==	32745 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)





elseif recipe.craftedItemId == 32746 then	--roll rarity on equipment

                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)



elseif recipe.craftedItemId ==	32747 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	32748 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	32749 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	32750 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)


elseif recipe.craftedItemId ==	32751 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	37138 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	37139 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	37140 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	32467 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)


elseif recipe.craftedItemId ==	36197 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	8907 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	34026 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	32506 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	37141 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	37143 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	37144 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	37145 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	37146 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	37147 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)
			
			
			
elseif recipe.craftedItemId ==	36228 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)			
			
			
elseif recipe.craftedItemId ==	31886 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)			
			
elseif recipe.craftedItemId ==	32439 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)			
			
			
elseif recipe.craftedItemId ==	36332 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)			
			
elseif recipe.craftedItemId ==	30607 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)			
			
elseif recipe.craftedItemId ==	36274 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)			

elseif recipe.craftedItemId ==	3982 then
                        itemnew:setItemLevel(itemlevel_smallequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)			
			
elseif recipe.craftedItemId ==	12318 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)			

elseif recipe.craftedItemId ==	31858 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	31891 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	32475 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	9777 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)


elseif recipe.craftedItemId ==	12646 then
                        itemnew:setItemLevel(itemlevel_smallequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	36249 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	36153 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	36390 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)


elseif recipe.craftedItemId ==	34080 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	31961 then
                        itemnew:setItemLevel(itemlevel_smallequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	34005 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	30496 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	36374 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	32769 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	31731 then
                        itemnew:setItemLevel(itemlevel_bigequipment, true)
                        itemnew:setRarity(createRarity_craft())
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)











elseif recipe.craftedItemId == 32702 then --copper bars
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)
                        ----removed

elseif recipe.craftedItemId == 32703 then --bronce bars
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)
                        ----removed

elseif recipe.craftedItemId == 32704 then --arcanium bars
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)
                        ----removed

elseif recipe.craftedItemId == 37135 then --iron bars
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)
                        ----removed

elseif recipe.craftedItemId == 37136 then --crystal bars
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)
                        ----removed

--enchant missing


                --BLUE RUNES

elseif recipe.craftedItemId ==	35379 then
                        itemnew:setItemLevel(itemlevel_runes1, true)
                        itemnew:setUnique(15)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35380 then
                        itemnew:setItemLevel(itemlevel_runes3, true)
                        itemnew:setUnique(16)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35381 then
                        itemnew:setItemLevel(itemlevel_runes1, true)
                        itemnew:setUnique(17)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35382 then
                        itemnew:setItemLevel(itemlevel_runes4, true)
                        itemnew:setUnique(18)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35383 then
                        itemnew:setItemLevel(itemlevel_runes2, true)
                        itemnew:setUnique(19)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35384 then
                        itemnew:setItemLevel(itemlevel_runes5, true)
                        itemnew:setUnique(20)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35385 then
                        itemnew:setItemLevel(itemlevel_runes5, true)
                        itemnew:setUnique(21)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35386 then
                        itemnew:setItemLevel(itemlevel_runes5, true)
                        itemnew:setUnique(22)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)




--GRENN RUNES
elseif recipe.craftedItemId ==	35387 then
                        itemnew:setItemLevel(itemlevel_runes1, true)
                        itemnew:setUnique(23)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35388 then
                        itemnew:setItemLevel(itemlevel_runes1, true)
                        itemnew:setUnique(24)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35389 then
                        itemnew:setItemLevel(itemlevel_runes3, true)
                        itemnew:setUnique(25)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35390 then
                        itemnew:setItemLevel(itemlevel_runes4, true)
                        itemnew:setUnique(26)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35391 then
                        itemnew:setItemLevel(itemlevel_runes2, true)
                        itemnew:setUnique(27)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)


elseif recipe.craftedItemId ==	35392 then
                        itemnew:setItemLevel(itemlevel_runes5, true)
                        itemnew:setUnique(28)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35393 then
                        itemnew:setItemLevel(itemlevel_runes1, true)
                        itemnew:setUnique(29)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35394 then
                        itemnew:setItemLevel(itemlevel_runes1, true)
                        itemnew:setUnique(30)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)


--yellow runes

elseif recipe.craftedItemId ==	35395 then
                        itemnew:setItemLevel(itemlevel_runes1, true)
                        itemnew:setUnique(31)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35396 then
                        itemnew:setItemLevel(itemlevel_runes3, true)
                        itemnew:setUnique(32)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35397 then
                        itemnew:setItemLevel(itemlevel_runes4, true)
                        itemnew:setUnique(33)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35398 then
                        itemnew:setItemLevel(itemlevel_runes2, true)
                        itemnew:setUnique(34)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35399 then
                        itemnew:setItemLevel(itemlevel_runes1, true)
                        itemnew:setUnique(35)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35400 then
                        itemnew:setItemLevel(itemlevel_runes5, true)
                        itemnew:setUnique(36)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35401 then
                        itemnew:setItemLevel(itemlevel_runes1, true)
                        itemnew:setUnique(37)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35402 then
                        itemnew:setItemLevel(itemlevel_runes1, true)
                        --
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)




--PURPLE RUNES

elseif recipe.craftedItemId ==	35403 then
                        itemnew:setItemLevel(itemlevel_runes1, true)
                        itemnew:setUnique(38)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35404 then
                        itemnew:setItemLevel(itemlevel_runes1, true)
                        itemnew:setUnique(39)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35405 then
                        itemnew:setItemLevel(itemlevel_runes3, true)
                        itemnew:setUnique(40)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35406 then
                        itemnew:setItemLevel(itemlevel_runes4, true)
                        itemnew:setUnique(41)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35407 then
                        itemnew:setItemLevel(itemlevel_runes2, true)
                        itemnew:setUnique(42)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35408 then
                        itemnew:setItemLevel(itemlevel_runes5, true)
                        itemnew:setUnique(43)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35409 then
                        itemnew:setItemLevel(itemlevel_runes1, true)
                        itemnew:setUnique(44)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)


elseif recipe.craftedItemId ==	35410 then
                        itemnew:setItemLevel(itemlevel_runes1, true)
                        --
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)




                --RED RUNES

elseif recipe.craftedItemId ==	35411 then
                        --
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35412 then
                        itemnew:setItemLevel(itemlevel_runes1, true)
                        itemnew:setUnique(45)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35413 then
                        itemnew:setItemLevel(itemlevel_runes1, true)
                        itemnew:setUnique(46)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35414 then
                        itemnew:setItemLevel(itemlevel_runes3, true)
                        itemnew:setUnique(47)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35415 then
                        itemnew:setItemLevel(itemlevel_runes4, true)
                        itemnew:setUnique(48)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35416 then
                        itemnew:setItemLevel(itemlevel_runes2, true)
                        itemnew:setUnique(49)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35417 then
                        itemnew:setItemLevel(itemlevel_runes5, true)
                        itemnew:setUnique(50)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35418 then
                        itemnew:setItemLevel(itemlevel_runes1, true)
                        itemnew:setUnique(51)
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

elseif recipe.craftedItemId ==	35419 then
                        itemnew:setItemLevel(itemlevel_runes1, true)
                        --
                        itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
                        local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)

else
                        FameSystem:addPoints(player, recipe.fame)
                        Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
            player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)
                        --removed
                end
end

function Crafting:craftRecipe(player, recipeId, amount, profId, item)

	
	

	local recipe = self.recipes[profId][recipeId]
	

	
	if not recipe then
		return false, "Unknown recipe, please try again."
	end

	if recipe.requiredSkill and ProfessionSystem:getSkillLevel(player, profId) < recipe.requiredSkill then
		return false, "Your profession level is too low."
	end

	for _, ingredient in ipairs(recipe.ingredients) do
		if player:getItemCount(ingredient.id)  < ingredient.required * amount then
			return false, "Not enough ingredients"
		end
	end
	
	-- double check money and fame points
	if player:getTotalMoney() < (recipe.cost * amount) then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have enough money.")
		return false
	end
	
	

	-- remove money
	player:removeTotalMoney(recipe.cost * amount)
	
	
	for _, ingredient in ipairs(recipe.ingredients) do
		player:removeItem(ingredient.id, ingredient.required * amount)
	end
	
	local itemnew = player:addItem(recipe.craftedItemId, recipe.craftedCount * amount)
	local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
	local playername = player:getName()
	local desc = 'Crafted by ' .. playername .. '.'
	
	local enchant = math.random(100) <= 15 and "EPIC" or "RARE"

        if itemnew == nill then
                return false
	end

        if(type(itemnew) == 'table') then
            for i = 1, #itemnew do
                self:updateItem(player, itemnew[i], recipe, profId, amount)
            end
        else
            self:updateItem(player, itemnew, recipe, profId, amount)
        end

        if recipe.craftPoints and recipe.craftPoints > 0 then
		ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
	end
	return true
end

-- protocol
function Crafting:sendOpenCraftingWindow(player, professionId)
	local msg = NetworkMessage()
	msg:addByte(0x36) -- 54
	msg:addByte(SERVER_CRAFTING_WINDOW) -- action

	-- send profession details
	local level, points = ProfessionSystem:getSkillValues(player, professionId)
	msg:addU16(level)

	local profId = ProfessionSystem:getProfessionId(player)

	local pointsForNextLevel = ProfessionSystem.config[profId] and ProfessionSystem.config[profId].levels[level + 1] or 0 or 0
	msg:addByte(math.floor(points / math.max(1, pointsForNextLevel or 0) * 100))
	msg:addByte(professionId)

	msg:addByte(#self.recipes[professionId])
	for _, recipe in ipairs(self.recipes[professionId]) do
		local it = ItemType(recipe.craftedItemId)
		-- Adapt storage value handling: if storage is -1, replace it with 0 (or another valid default)
		local storageValue = player:getStorageValue(recipe.recipestorage)
		if storageValue == -1 then
			storageValue = 0
		end
		msg:addU16(it:getClientId())
		msg:addU16(recipe.craftedCount)
		msg:addString(it:getName())
		msg:addByte(recipe.tier)
		msg:addString(recipe.desc)
		msg:addU16(recipe.cost)
		msg:addU16(recipe.recipestorage)	
		msg:addU16(storageValue)
		msg:addU16(recipe.requiredSkill or 0)
		--print(player:getStorageValue(recipe.recipestorage))

		msg:addByte(#recipe.ingredients) -- ingredients size
		for _, ingredient in ipairs(recipe.ingredients) do
			local itt = ItemType(ingredient.id)
			msg:addString(itt:getName())
			msg:addU16(itt:getClientId())
			msg:addU32(ingredient.required)
			msg:addU32(player:getItemCount(ingredient.id))
		end
		
	end
	msg:addU32(player:getTotalMoney()) -- goldcoins
	
	msg:sendToPlayer(player)
	msg:delete()
end

function Crafting:sendCraftingResult(player, isSuccess, err)
	local msg = NetworkMessage()
	msg:addByte(0x36) -- 54
	msg:addByte(SERVER_CRAFT_RESULT) -- action
	msg:addByte(isSuccess and 1 or 0)
	if not isSuccess then
		msg:addString(err)
	end

	msg:sendToPlayer(player)
	msg:delete()
end

function Crafting:getTableSize(t)
	local count = 0
	for _ in pairs(t) do
		count = count + 1
	end
	return count
end
