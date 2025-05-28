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
			craftedItemId = 2377,
			craftedCount = 1, --
			tier = 0, 
			fame = 2, -- used for description
			requiredSkill = 0,
			desc = false,
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
			craftedItemId = 2376,
			craftedCount = 1, --
			tier = 0, 
			fame = 2, -- used for description
			requiredSkill = 0,
			desc = false,
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
			craftedItemId = 5947,
			craftedCount = 1, --
			tier = 0, 
			fame = 2, -- used for description
			requiredSkill = 0,
			desc = false,
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
			craftedItemId = 2163,
			craftedCount = 1, --
			tier = 0, 
			fame = 2, -- used for description
			requiredSkill = 0,
			desc = false,
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
			craftedItemId = 2512,
			craftedCount = 1, --
			tier = 0, 
			fame = 2, -- used for description
			requiredSkill = 0,
			desc = false,
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
			craftedItemId = 36373,
			craftedCount = 1, --
			tier = 0, 
			fame = 2, -- used for description
			requiredSkill = 0,
			desc = false,
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 5,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			upgraded = "true",
			ingredients = {
				{id = 32702, required = 5},
			},
		},

		
		{
			craftedItemId = 36370,
			craftedCount = 1, --
			tier = 0, 
			fame = 2, -- used for description
			requiredSkill = 0,
			desc = false,
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 5,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			upgraded = "true",
			ingredients = {
				{id = 32702, required = 5},
			},
		},

		
		{
			craftedItemId = 31919,
			craftedCount = 1, --
			tier = 0, 
			fame = 2, -- used for description
			requiredSkill = 0,
			desc = false,
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 5,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			upgraded = "true",
			ingredients = {
				{id = 32702, required = 5},
			},
		},

		{
			craftedItemId = 36396,
			craftedCount = 1, --
			tier = 0, 
			fame = 2, -- used for description
			requiredSkill = 0,
			desc = false,
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 5,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			upgraded = "true",
			ingredients = {
				{id = 32702, required = 5},
			},
		},
		



		{
			craftedItemId = 2385,
			craftedCount = 1, --
			tier = 0, 
			fame = 2, -- used for description
			requiredSkill = 0,
			desc = false,
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 5,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			upgraded = "true",
			ingredients = {
				{id = 32702, required = 5},
			},
		},
		
		
		{
			craftedItemId = 2395,
			craftedCount = 1, --
			tier = 0, 
			fame = 2, -- used for description
			desc = false,
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 5,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			upgraded = "true",
			ingredients = {
				{id = 32702, required = 5},
			},
		},

		
		{
			craftedItemId = 32058,
			craftedCount = 1, --
			tier = 0, 
			fame = 2, -- used for description
			desc = false,
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 5,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			upgraded = "true",
			ingredients = {
				{id = 32702, required = 5},
			},
		},

		
		
		{
			craftedItemId = 36389,
			craftedCount = 1, --
			tier = 0, 
			fame = 2, -- used for description
			desc = false,
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 5,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			upgraded = "true",
			ingredients = {
				{id = 32702, required = 5},
			},
		},


		
		{
			craftedItemId = 36366,
			craftedCount = 1, --
			tier = 0, 
			fame = 2, -- used for description
			requiredSkill = 0,
			desc = false,
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 5,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			upgraded = "true",
			ingredients = {
				{id = 32702, required = 5},
			},
		},


		{
			craftedItemId = 2392,
			craftedCount = 1, --
			tier = 0, 
			fame = 2, -- used for description
			desc = false,
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 5,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			upgraded = "true",
			ingredients = {
				{id = 32702, required = 5},
			},
		},
		
		{
			craftedItemId = 31802,
			craftedCount = 1, --
			tier = 0, 
			fame = 2, -- used for description
			desc = false,
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 5,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			upgraded = "true",
			ingredients = {
				{id = 32702, required = 5},
			},
		},	


		{
			craftedItemId = 36388,
			craftedCount = 1, --
			tier = 0, 
			fame = 2, -- used for description
			desc = false,
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 5,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			upgraded = "true",
			ingredients = {
				{id = 32702, required = 5},
			},
		},
		
		{
			craftedItemId = 36210,
			craftedCount = 1, --
			tier = 0, 
			fame = 2, -- used for description
			requiredSkill = 0,
			desc = false,
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 5,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			upgraded = "true",
			ingredients = {
				{id = 32702, required = 5},
			},
		},

		{
			craftedItemId = 36359,
			craftedCount = 1, --
			tier = 0, 
			fame = 2, -- used for description
			desc = false,
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 5,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			upgraded = "true",
			ingredients = {
				{id = 32702, required = 5},
			},
		},

		{
			craftedItemId = 36242,
			craftedCount = 1, --
			tier = 0, 
			fame = 2, -- used for description
			desc = false,
			rollrarity = 1, --1 COMMON, 2 RARE, 3 EPIC
			itemlvl = 10,
			craftPoints = 5,
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			upgraded = "true",
			ingredients = {
				{id = 32702, required = 5},
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
		--TIER 1 runes
		{
			craftedItemId = 39962, -- server id of item that you gonna get from that recipe
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = "Refine sturdy oak logs into versatile oak planks, essential for crafting a variety of wooden items.",
			itemlvl = 0,
			craftPoints = 0, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 39961, required = 5}, --TIME ESSENCE
			},
		},
		{
			craftedItemId = 39966, -- Greenheart Plank
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = "Refine sturdy greenheart logs into versatile greenheart planks, essential for crafting a variety of wooden items.",
			itemlvl = 0,
			craftPoints = 0, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 39965, required = 5}, --TIME ESSENCE
			},
		},
		{
			craftedItemId = 39968, -- Bloodwood Plank
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = "Refine sturdy bloodwood logs into versatile bloodwood planks, essential for crafting a variety of wooden items.",
			itemlvl = 0,
			craftPoints = 0, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 39967, required = 5}, --TIME ESSENCE
			},
		},
		{
			craftedItemId = 39972, -- Pine Plank
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = "Refine sturdy pine logs into versatile pine planks, essential for crafting a variety of wooden items.",
			itemlvl = 0,
			craftPoints = 0, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 39971, required = 5}, --TIME ESSENCE
			},
		},
		{
			craftedItemId = 39974, -- Maple Plank
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = "Refine sturdy maple logs into versatile maple planks, essential for crafting a variety of wooden items.",
			itemlvl = 0,
			craftPoints = 0, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 39973, required = 5}, --TIME ESSENCE
			},
		},
		{
			craftedItemId = 32703, -- Copper Bar
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 0, -- used for description
			fame = 0, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = "Smelt copper ores into Copper Bar. required for crafting a variety of equipment.",
			craftPoints = 2, -- points for crafting that recipe		
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 40034, required = 5},
				{id = 40035, required = 2}, --coal
			},
		},
		{
			craftedItemId = 32704, -- silver bar
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 0, -- used for description
			fame = 0, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = "Smelt silver ores into Silver Bar. required for crafting a variety of equipment.",
			craftPoints = 2, -- points for crafting that recipe		
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 40035, required = 5},
				{id = 40036, required = 2}, --coal
			},
		},

		
	},
		[4] = { -- all recipes for enchanting
		--TIER 1 runes
		{
			craftedItemId = 7735, -- prismatic cube
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = "Useful tool necessary for disenchanting items.",
			itemlvl = 10,
			craftPoints = 2, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 39962, required = 5},
			},
		},
		{
			craftedItemId = 26170, -- prismatic cube
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = "Prismatic cubes can be disenchanted to create runes and other materials.",
			itemlvl = 10,
			craftPoints = 2, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 13197, required = 1},
			},
		},
		{
			craftedItemId = 26169, -- prismatic cube 2
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 3, -- if your profession level is lower you cant craft that recipe
			desc = "Prismatic cubes can be disenchanted to create runes and other materials.",
			itemlvl = 10,
			craftPoints = 2, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 13197, required = 1},
			},
		},
		{
			craftedItemId = 26171, -- prismatic cube 3
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 6, -- if your profession level is lower you cant craft that recipe
			desc = "Prismatic cubes can be disenchanted to create runes and other materials.",
			itemlvl = 10,
			craftPoints = 2, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 13197, required = 1},
			},
		},
		

		{
			craftedItemId = 2187, -- wand of inferno
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = false,
			itemlvl = 10,
			craftPoints = 2, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			upgraded = "true",
			ingredients = {
				{id = 13197, required = 1},
			},
		},
		{
			craftedItemId = 2184, -- crystal wand
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = false,
			itemlvl = 10,
			craftPoints = 2, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			upgraded = "true",
			ingredients = {
				{id = 13197, required = 1},
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
	[9] = { -- all recipes for Refinery
		--TIER 1 runes
		{
			craftedItemId = 39962, -- server id of item that you gonna get from that recipe
			craftedCount = 15, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = false,
			itemlvl = 0,
			craftPoints = 0, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 39961, required = 5}, --TIME ESSENCE
			},
		},
		{
			craftedItemId = 39966, -- server id of item that you gonna get from that recipe
			craftedCount = 15, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = false,
			itemlvl = 0,
			craftPoints = 0, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 39965, required = 5}, --TIME ESSENCE
			},
		},
		{
			craftedItemId = 39968, -- server id of item that you gonna get from that recipe
			craftedCount = 15, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = false,
			itemlvl = 0,
			craftPoints = 0, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 39967, required = 5}, --TIME ESSENCE
			},
		},
		{
			craftedItemId = 39972, -- server id of item that you gonna get from that recipe
			craftedCount = 15, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = false,
			itemlvl = 0,
			craftPoints = 0, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 39971, required = 5}, --TIME ESSENCE
			},
		},
		{
			craftedItemId = 39974, -- server id of item that you gonna get from that recipe
			craftedCount = 15, -- amount of items that you gonnna get from that recipe
			tier = 1, -- used for description
			fame = 2, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = false,
			itemlvl = 0,
			craftPoints = 0, -- points for crafting that recipe
			cost = 2, -- cost in gold coins
			recipestorage = 0,
			ingredients = {
				{id = 39973, required = 5}, --TIME ESSENCE
			},
		},
		{
			craftedItemId = 32703, -- server id of item that you gonna get from that recipe
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 0, -- used for description
			fame = 0, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = "Smelt copper ores into Copper Bar. required for crafting a variety of equipment.",
			craftPoints = 2, -- points for crafting that recipe		
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 35481, required = 5},
				{id = 40035, required = 1}, --coal
			},
		},
		{
			craftedItemId = 32704, -- server id of item that you gonna get from that recipe
			craftedCount = 1, -- amount of items that you gonnna get from that recipe
			tier = 0, -- used for description
			fame = 0, -- used for description
			requiredSkill = 0, -- if your profession level is lower you cant craft that recipe
			desc = "Smelt tin ores into Tin Bar. required for crafting a variety of equipment.",
			craftPoints = 2, -- points for crafting that recipe		
			cost = 2, -- points for crafting that recipe
			recipestorage = 0,
			ingredients = {
				{id = 40035, required = 5},
				{id = 40036, required = 1}, --coal
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
if not itemnew or not player or not recipe or not profId or not amount then
	print("Crafting:updateItem: missing parameters")
	return
end

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
    rarity = RARE
  end
  
  return rarity
end

--print(createRarity_craft())





-- Special crafted items with item level and rarity logic
local specialCraftItems = {
    [32763] = itemlevel_bigequipment, [32764] = itemlevel_bigequipment, [32765] = itemlevel_smallequipment,
    [32766] = itemlevel_bigequipment, [32767] = itemlevel_bigequipment, [32788] = itemlevel_bigequipment,
    [32789] = itemlevel_bigequipment, [2377] = itemlevel_bigequipment, [30759] = itemlevel_bigequipment,
    [2186] = itemlevel_bigequipment, [36357] = itemlevel_bigequipment, [31802] = itemlevel_bigequipment,
    [36359] = itemlevel_bigequipment, [2385] = itemlevel_bigequipment, [2191] = itemlevel_bigequipment -- add more as needed
}

-- Special unique items (e.g., runes) with itemlevel and unique values
local specialUniqueItems = {
    -- BLUE RUNES
    [35379] = {itemlevel = 50, unique = 15},
    [35380] = {itemlevel = itemlevel_runes3, unique = 16},
    [35381] = {itemlevel = itemlevel_runes1, unique = 17},
    [35382] = {itemlevel = itemlevel_runes4, unique = 18},
    [35383] = {itemlevel = itemlevel_runes2, unique = 19},
    [35384] = {itemlevel = itemlevel_runes5, unique = 20},
    [35385] = {itemlevel = itemlevel_runes5, unique = 21},
    [35386] = {itemlevel = itemlevel_runes5, unique = 22},
    -- GREEN RUNES
    [35387] = {itemlevel = itemlevel_runes1, unique = 23},
    [35388] = {itemlevel = itemlevel_runes1, unique = 24},
    [35389] = {itemlevel = itemlevel_runes3, unique = 25},
    [35390] = {itemlevel = itemlevel_runes4, unique = 26},
    [35391] = {itemlevel = itemlevel_runes2, unique = 27},
    [35392] = {itemlevel = itemlevel_runes5, unique = 28},
    [35393] = {itemlevel = itemlevel_runes1, unique = 29},
    [35394] = {itemlevel = itemlevel_runes1, unique = 30},
    -- YELLOW RUNES
    [35396] = {itemlevel = itemlevel_runes3, unique = 32},
    [35397] = {itemlevel = itemlevel_runes4, unique = 33},
    [35398] = {itemlevel = itemlevel_runes2, unique = 34},
    [35399] = {itemlevel = itemlevel_runes1, unique = 35},
    [35400] = {itemlevel = itemlevel_runes5, unique = 36},
    [35401] = {itemlevel = itemlevel_runes1, unique = 37},
    [35402] = {itemlevel = itemlevel_runes1, unique = nil}, -- no unique value set in original
    -- PURPLE RUNES
    [35403] = {itemlevel = itemlevel_runes1, unique = 38},
    [35404] = {itemlevel = itemlevel_runes1, unique = 39},
    [35405] = {itemlevel = itemlevel_runes3, unique = 40},
    [35406] = {itemlevel = itemlevel_runes4, unique = 41},
    [35407] = {itemlevel = itemlevel_runes2, unique = 42},
    [35408] = {itemlevel = itemlevel_runes5, unique = 43},
    [35409] = {itemlevel = itemlevel_runes1, unique = 44},
    [35410] = {itemlevel = itemlevel_runes1, unique = nil}, -- no unique value set in original
    -- RED RUNES
    [35412] = {itemlevel = itemlevel_runes1, unique = 45},
    [35413] = {itemlevel = itemlevel_runes1, unique = 46},
    [35414] = {itemlevel = itemlevel_runes3, unique = 47},
    [35415] = {itemlevel = itemlevel_runes4, unique = 48},
    [35416] = {itemlevel = itemlevel_runes2, unique = 49},
    [35417] = {itemlevel = itemlevel_runes5, unique = 50},
    [35418] = {itemlevel = itemlevel_runes1, unique = 51},
    [35419] = {itemlevel = itemlevel_runes1, unique = nil}, -- no unique value set in original
}



if recipe.fame and recipe.fame > 0 then
    FameSystem:addPoints(player, recipe.fame)
    Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
    player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)
end
if specialCraftItems[itemnew:getId()] then
    itemnew:setItemLevel(specialCraftItems[itemnew:getId()], true)
    itemnew:setRarity(createRarity_craft())
    itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
    local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
    FameSystem:addPoints(player, recipe.fame)
    Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
    player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)
end

if specialUniqueItems[itemnew:getId()] then
	local uniqueInfo = specialUniqueItems[itemnew:getId()]
    itemnew:setItemLevel(uniqueInfo.itemlevel, true)
    if uniqueInfo and uniqueInfo.unique then
        itemnew:setUnique(uniqueInfo.unique, true)
    end
    itemnew:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This item was created by %s"):format(itemnew:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
    local addcraftexp = ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
    FameSystem:addPoints(player, recipe.fame)
    Game.sendAnimatedText('+ fame points!', player:getPosition(), TEXTCOLOR_ORANGE)
    player:getPosition():sendMagicEffect(CONST_ME_SHINNYSPARK)
end

    -- If recipe has upgraded = "true" and item is upgradable, set rarity to RARE
    local itemType = itemnew:getType()
if itemType and itemType.isUpgradable and itemType:isUpgradable() and recipe.upgraded == "true" then
        itemnew:setRarity(RARE)
end

if recipe.craftPoints and recipe.craftPoints > 0 then
	ProfessionSystem:addPoints(player, profId, recipe.craftPoints * amount)
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
function generateCustomDescription(itemType)
    local itemName = itemType:getName()
    local baseDescription = itemType:getDescription()

    local typeInfo = ""
    -- 1. Weapon/armor/shield/boots/helmet/legs type info first
    if itemType:isWeapon() then
        local attack = itemType:getAttack()
        local defense = itemType:getDefense()
        local handedness = itemType:isTwoHanded() and "a two-handed" or "a one-handed"
        if itemType:isBow() then
            typeInfo = string.format("This crafted %s distance weapon boasts an attack value of %d, ideal for long-range combat.", handedness, attack)
        else
            local weaponTypeDescription = "weapon"
            typeInfo = string.format("This finely crafted %s %s features an attack value of %d and a defense value of %d, making it a reliable choice for combat.", handedness, weaponTypeDescription, attack, defense)
        end
    elseif itemType:isArmor() then
        local armor = itemType:getArmor()
        typeInfo = string.format("This piece of armor provides an impressive armor rating of %d, offering superior protection.", armor)
    elseif itemType:isHelmet() then
        local armor = itemType:getArmor()
        typeInfo = string.format("This helmet is crafted to provide an armor rating of %d, ensuring protection for your head.", armor)
    elseif itemType:isLegs() then
        local armor = itemType:getArmor()
        typeInfo = string.format("These well-crafted leg guards provide an armor rating of %d, offering sturdy defense.", armor)
    elseif itemType:isBoots() then
        local armor = itemType:getArmor()
        typeInfo = string.format("These boots are designed to offer an armor rating of %d, protecting your feet with durable materials.", armor)
    elseif itemType:isShield() then
        local defense = itemType:getDefense()
        local extraDefense = itemType:getExtraDefense() or 0
        typeInfo = string.format("This shield offers a defense value of %d, perfect for blocking incoming attacks", defense)
        if extraDefense > 0 then
            typeInfo = typeInfo .. string.format(" and provides extra defense of %d.", extraDefense)
        else
            typeInfo = typeInfo .. "."
        end
    end

    -- 2. Attribute info (each on a new line)
    local secondaryDescription = ""
    if itemType.getStat and itemType:getStat(STAT_MAGICPOINTS) > 0 then
        secondaryDescription = secondaryDescription .. string.format("Magic Level: +%d.\n", itemType:getStat(STAT_MAGICPOINTS))
    end
    if itemType.getStat and itemType:getStat(STAT_MAXHITPOINTS) > 0 then
        secondaryDescription = secondaryDescription .. string.format("Max HP: +%d.\n", itemType:getStat(STAT_MAXHITPOINTS))
    end
    if itemType.getStat and itemType:getStat(STAT_MAXMANAPOINTS) > 0 then
        secondaryDescription = secondaryDescription .. string.format("Max MP: +%d.\n", itemType:getStat(STAT_MAXMANAPOINTS))
    end
    if itemType.getSpecialSkill and itemType:getSpecialSkill(SPECIALSKILL_CRITICALHITCHANCE) > 0 then
        secondaryDescription = secondaryDescription .. string.format("Crit Chance: +%d%%.\n", itemType:getSpecialSkill(SPECIALSKILL_CRITICALHITCHANCE))
    end
    if itemType.getSpecialSkill and itemType:getSpecialSkill(SPECIALSKILL_LIFLEECHCHANCE) > 0 then
        secondaryDescription = secondaryDescription .. string.format("Life Leech Chance: +%d%%.\n", itemType:getSpecialSkill(SPECIALSKILL_LIFLEECHCHANCE))
    end
    if itemType.getSpecialSkill and itemType:getSpecialSkill(SPECIALSKILL_LIFLEECHAMOUNT) > 0 then
        secondaryDescription = secondaryDescription .. string.format("Life Leech Amount: +%d.\n", itemType:getSpecialSkill(SPECIALSKILL_LIFLEECHAMOUNT))
    end
    if itemType.getSpecialSkill and itemType:getSpecialSkill(SPECIALSKILL_MANALEECHCHANCE) > 0 then
        secondaryDescription = secondaryDescription .. string.format("Mana Leech Chance: +%d%%.\n", itemType:getSpecialSkill(SPECIALSKILL_MANALEECHCHANCE))
    end
    if itemType.getSpecialSkill and itemType:getSpecialSkill(SPECIALSKILL_MANALEECHAMOUNT) > 0 then
        secondaryDescription = secondaryDescription .. string.format("Mana Leech Amount: +%d.\n", itemType:getSpecialSkill(SPECIALSKILL_MANALEECHAMOUNT))
    end
    if itemType.getSpecialSkill and itemType:getSpecialSkill(SPECIALSKILL_ATTACKSPEED) > 0 then
        secondaryDescription = secondaryDescription .. string.format("Attack Speed: +%d.\n", itemType:getSpecialSkill(SPECIALSKILL_ATTACKSPEED))
    end
    if itemType.getSkill and itemType:getSkill(SKILL_CLUB) > 0 then
        secondaryDescription = secondaryDescription .. string.format("Club Skill: +%d.\n", itemType:getSkill(SKILL_CLUB))
    end
    if itemType.getSkill and itemType:getSkill(SKILL_SWORD) > 0 then
        secondaryDescription = secondaryDescription .. string.format("Sword Skill: +%d.\n", itemType:getSkill(SKILL_SWORD))
    end
    if itemType.getSkill and itemType:getSkill(SKILL_AXE) > 0 then
        secondaryDescription = secondaryDescription .. string.format("Axe Skill: +%d.\n", itemType:getSkill(SKILL_AXE))
    end
    if itemType.getSkill and itemType:getSkill(SKILL_DISTANCE) > 0 then
        secondaryDescription = secondaryDescription .. string.format("Distance Skill: +%d.\n", itemType:getSkill(SKILL_DISTANCE))
    end
    if itemType.getSkill and itemType:getSkill(SKILL_SHIELD) > 0 then
        secondaryDescription = secondaryDescription .. string.format("Shielding: +%d.\n", itemType:getSkill(SKILL_SHIELD))
    end
    if itemType.getHealthGain and itemType:getHealthGain() > 0 then
        secondaryDescription = secondaryDescription .. string.format("Health Regen: +%d.\n", itemType:getHealthGain())
    end
    if itemType.getManaGain and itemType:getManaGain() > 0 then
        secondaryDescription = secondaryDescription .. string.format("Mana Regen: +%d.\n", itemType:getManaGain())
    end

    -- 3. Compose the final description
    local description = itemName
    if typeInfo ~= "" then
        description = description .. "\n" .. typeInfo
    end
    if secondaryDescription ~= "" then
        description = description .. "\n" .. secondaryDescription
    end
    if baseDescription and baseDescription ~= "" then
        description = description .. "\n" .. baseDescription
    end
    return description
end

-- protocol
function Crafting:sendOpenCraftingWindow(player, professionId)
	local msg = NetworkMessage()
	msg:addByte(0x39) -- 57
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

		local customDescription
		if recipe.desc then
		    customDescription = recipe.desc
		else
		    customDescription = generateCustomDescription(it)
		end

		if not recipe.upgraded then
			recipe.upgraded = "false"
		end
		msg:addU16(it:getClientId())
		msg:addU16(recipe.craftedCount)
		msg:addString(it:getName())
		msg:addByte(recipe.tier)
		msg:addString(customDescription)
		msg:addU16(recipe.cost)
		msg:addU16(recipe.recipestorage)
		msg:addString(recipe.upgraded)	
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
	msg:addByte(0x39) -- 57
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
