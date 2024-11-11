--custom nokturno upgrade system + oen .

ITEM_UPGRADE_CRYSTAL = 1
ITEM_ENCHANT_CRYSTAL = 2
ITEM_ALTER_CRYSTAL = 3
ITEM_CLEAN_CRYSTAL = 4
ITEM_FORTUNE_CRYSTAL = 5
ITEM_FAITH_CRYSTAL = 6
ITEM_SCROLL_IDENTIFY = 7
ITEM_SCROLL_PORTAL = 8
ITEM_UPGRADE_CRYSTAL_BREAKER = 9
ITEM_BOOK_IDENTIFY = 10

COMMON = 1
RARE = 2
EPIC = 3
LEGENDARY = 4

function removeBob(creatureId)
    local c = Creature(creatureId)
    if not c then return false end

    c:remove()
end
function removeMezmerize(creatureId)
    local c = Creature(creatureId)
    if not c then return false end

    c:remove()
end
function removeLife(teleportPos)
	local teleport = Tile(teleportPos):getItemById(38693)
	if teleport then
		teleport:getPosition():sendMagicEffect(9)
		teleport:remove()
	end
end
function removeMana(teleportPos)
	local teleport = Tile(teleportPos):getItemById(38694)
	if teleport then
		teleport:getPosition():sendMagicEffect(2)
		teleport:remove()
	end
end

US_CONFIG = {
  {
    [ITEM_UPGRADE_CRYSTAL] = 29032, -- Upgrade Crystal item id
    [ITEM_ENCHANT_CRYSTAL] = 29020, -- Enchantment powder
    [ITEM_ALTER_CRYSTAL] = 29033, -- Alteration Crystal item id
    [ITEM_CLEAN_CRYSTAL] = 29035, -- Cleansing Crystal item id
    [ITEM_FORTUNE_CRYSTAL] = 29034, -- Fortune Crystal item id
    [ITEM_FAITH_CRYSTAL] = 29043, -- rainbow
	[ITEM_SCROLL_IDENTIFY] = 29019, -- scroll of identification	
	[ITEM_SCROLL_PORTAL] = 5952, -- Faith Crystal item id
    [ITEM_UPGRADE_CRYSTAL_BREAKER] = 33621 -- Upgrade Crystal item id 10+	
  },

  ITEM_MIND_CRYSTAL = 33384, -- void crystal
  ITEM_LIMITLESS_CRYSTAL = 33385, -- Limitless Crystal item id
  ITEM_MIRRORED_CRYSTAL = 33386, -- Mirrored Crystal item id
  ITEM_VOID_CRYSTAL = 33387, -- Void Crystal item id
  ITEM_SCROLL_IDENTIFY = 29019,
  ITEM_BOOK_IDENTIFY = 12396,  -- Scrol of Identification item id
  ITEM_UPGRADE_CATALYST = 26390, -- Upgrade Catalyst item id
  CRYSTAL_EXTRACTOR = 29080, -- Crystal Extractor item id
  CRYSTAL_FOSSIL = 29080, -- Crystal Fossil item id --not gonna implement that yet
  --
  IDENTIFY_UPGRADE_LEVEL = false, -- if true, roll random upgrade level when identifing an item
  
  UPGRADE_SUCCESS_CHANCE = {[1] = 100, [2] = 85, [3] = 70, [4] = 50, [5] = 35, [6] = 20, [7] = 10, [8] = 8, [9] = 3, [10] = 2, [11] = 2, [12] = 2, [13] = 2, [14] = 2, [15] = 2}, -- % chance for the upgrade at given upgrade level, -1 upgrade level on failure
  UPGRADE_SUCCESS_CHANCE_BREAKER = {[1] = 100, [2] = 85, [3] = 70, [4] = 50, [5] = 35, [6] = 20, [7] = 10, [8] = 30, [9] = 30, [10] = 30, [11] = 30, [12] = 30, [13] = 30, [14] = 25, [15] = 15}, -- % chance for the upgrade at given upgrade level, -1 upgrade level on failure
  
  UPGRADE_LEVEL_DESTROY = 16, -- at which upgrade level should it break if failed, for example if = 7 then upgrading from +6 to +7-9 can destroy item on failure.
  UPGRADE_DESTROY_CHANCE = {[7] = 0, [8] = 0, [9] = 0}, -- chance for the item to break at given upgrade level
  --
  MAX_ITEM_LEVEL = 500, -- max that Item Level can be assigned to item
  MAX_UPGRADE_LEVEL = 15, -- max level that item can be upgraded to,
  UNBREAKED_UPGRADE_LEVEL = 8, -- max level that item can be upgraded to,
  --
  ATTACK_PER_ITEM_LEVEL = 10, -- every X Item Level +ATTACK_FROM_ITEM_LEVEL attack
  ATTACK_FROM_ITEM_LEVEL = 1, -- +X bonus attack for every ATTACK_PER_ITEM_LEVEL
  DEFENSE_PER_ITEM_LEVEL = 10, -- every X Item Level +DEFENSE_FROM_ITEM_LEVEL defense
  DEFENSE_FROM_ITEM_LEVEL = 1, -- +X bonus defense for every DEFENSE_PER_ITEM_LEVEL
  ARMOR_PER_ITEM_LEVEL = 10, -- every X Item Level +ARMOR_FROM_ITEM_LEVEL armor
  ARMOR_FROM_ITEM_LEVEL = 10, -- +X bonus armor for every ARMOR_PER_ITEM_LEVEL
  MAGIC_PER_ITEM_LEVEL = 10, -- every X Item Level +MAGIC_FROM_ITEM_LEVEL MAGIC
  MAGIC_FROM_ITEM_LEVEL = 1, -- +X bonus MAGIC for every MAGIC_PER_ITEM_LEVEL
  HITCHANCE_PER_ITEM_LEVEL = 10, -- every X Item Level +HITCHANCE_FROM_ITEM_LEVEL hit chance
  HITCHANCE_FROM_ITEM_LEVEL = 1, -- +X bonus hit chance for every HITCHANCE_PER_ITEM_LEVEL
  --
  ITEM_LEVEL_PER_ATTACK = 1, -- +1 to Item Level for every X Attack in item
  ITEM_LEVEL_PER_DEFENSE = 1, -- +1 to Item Level for every X Defense in item
  ITEM_LEVEL_PER_ARMOR = 1, -- +1 to Item Level for every X Armor in item
  ITEM_LEVEL_PER_MAGIC = 5, -- +1 to Item Level for every X Armor in item
  ITEM_LEVEL_PER_HITCHANCE = 80, -- +1 to Item Level for every X Hit Chance in item
  ITEM_LEVEL_PER_UPGRADE = 1, -- additional item level per upgrade level
  --
  ATTACK_PER_UPGRADE = 1, -- amount of bonus attack per upgrade level
  DEFENSE_PER_UPGRADE = 1, -- amount of bonus defense per upgrade level
  EXTRADEFENSE_PER_UPGRADE = 1, -- amount of bonus extra defense per upgrade level
  ARMOR_PER_UPGRADE = 1, -- amount of bonus armor per upgrade level
  MAGIC_PER_UPGRADE = 0, -- amount of bonus armor per upgrade level
  HITCHANCE_PER_UPGRADE = 1, -- amount of bonus hit chance per upgrade level
  --
  CRYSTAL_FOSSIL_DROP_CHANCE = 30, -- 1:X chance that Crystal Fossil will drop from monster, X means that approximately every X monster will drop Crystal Fossil
  CRYSTAL_FOSSIL_DROP_LEVEL = 10, -- X monster level needed to drop Crystal Fossil
  UNIDENTIFIED_DROP_CHANCE = 12, --(12W) 1:X chance that item in monster corpse will be unidentified, X means that approximately every X item will be unidentified
  CRYSTAL_BREAK_CHANCE = 5, -- 1:X chance that Crystal will break when extracted from Fossil, X means that approximately every X Crystal will break
  UNIQUE_CHANCE = 30, --(30) 1:X chance that unidentified item will become Unique, X means that approximately every X unidentified item will become unique
  REQUIRE_LEVEL = false, -- block equipping items with higher Item Level than Player Level
  UNIQUE_DROP_CHANCE = 300,
  RARITY = {
    -- Tier 0-3 into common, 4-7 into rare and 8-10 epic, 11-15 legendary
    [COMMON] = {
      name = "[COMMON]",
      maxBonus = 0, -- max amount of bonus attributes
      chance = 1 -- 1:X chance that item will be common (1 = 100%)
    },
    [RARE] = {
      name = "[RARE]",
      maxBonus = 1, -- max amount of bonus attributes
      chance = 25 -- 1:X chance that item will be common (1 = 100%)
    },
    [EPIC] = {
      name = "[EPIC]",
      maxBonus = 2, -- max amount of bonus attributes
      chance = 100 -- 1:X chance that item will be common (1 = 100%)
    },
    [LEGENDARY] = {
      name = "[LEGENDARY]",
      maxBonus = 3, -- max amount of bonus attributes
      chance = 500 -- 1:X chance that item will be common (1 = 100%)
    }
  }
}

US_ITEM_TYPES = {
  ALL = 1,
  WEAPON_MELEE = 2,
  WEAPON_DISTANCE = 4,
  WEAPON_WAND = 8,
  SHIELD = 16,
  HELMET = 32,
  ARMOR = 64,
  LEGS = 128,
  BOOTS = 256,
  RING = 512,
  NECKLACE = 1024,
  AMMO = 2048,
  WEAPON_ANY = 14
}

US_UNIQUES = {
  [1] = {
    name = "[Corrupted]Flame Spirit",
    attributes = {
      1, -- Max HP
      4, -- Melee Skills
      12, -- Life Steal
      30 -- Flame Strike on Attack
    },
    minLevel = 1, -- Required Item Level to become Unique
    chance = 20, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.WEAPON_MELEE -- Can be rolled only for items like Swords, Axes and Clubs
  },
  [2] = {
    name = "[Corrupted]Ice Spirit",
    attributes = {
      2, -- Max MP
      3, -- Magic Level
      32, -- Ice Strike on Attack
      44 -- Regenerate Mana on Kill
    },
    minLevel = 1, -- Required Item Level to become Unique
    chance = 20, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.WEAPON_WAND + US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
  },
  [3] = {
    name = "[Corrupted]Terra Spirit",
    attributes = {
      1, -- Max HP
      2, -- Max MP
      3, -- Magic Level
      34 -- Terra Strike on Attack
    },
    minLevel = 1, -- Required Item Level to become Unique
    chance = 25, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.WEAPON_WAND + US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
  },
   [4] = {
    name = "[Corrupted]Fame Blessing",
    attributes = {
      1, -- Max HP
      13 -- Max MP

    },
    minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.WEAPON_WAND + US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
  },
   [5] = {
    name = "[Corrupted]Terra Spirit",
    attributes = {
      1, -- Max HP
      2, -- Max MP
      3, -- Magic Level
      34 -- Terra Strike on Attack
    },
    minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.WEAPON_WAND + US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
  },
   [6] = {
    name = "[Corrupted]Terra Spirit",
    attributes = {
      1, -- Max HP
      2, -- Max MP
      3, -- Magic Level
      34 -- Terra Strike on Attack
    },
    minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.WEAPON_WAND + US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
  },
   [7] = {
    name = "[Corrupted] Troll Blessing",
    attributes = {
      22, -- physical protection
      2 -- spirit
    },
    minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.NECKLACE -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
  },
    [8] = {
    name = "[Corrupted] Tribe Blessing",
    attributes = {
      15
    },
    minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.NECKLACE -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
  },
     [9] = {
    name = "[Corrupted] Hercules Bless",
    attributes = {
       1, -- max hp
	   4 -- strenght
    },
    minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.NECKLACE -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
  },
    [10] = {
    name = "[Corrupted] Eternal Magic Blessing",
    attributes = {
       15, -- fire damage
	   23 -- fire protection
    },
	 minLevel = 3, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.NECKLACE -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	 [11] = {
    name = "[Corrupted] Moon Blessing",
    attributes = {
       45 -- mana steal

    },
	 minLevel = 10, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	 [12] = {
    name = "[Corrupted] Frostirbe Blessing",
    attributes = {
       22, -- physical prot
	   23  -- ice protection

    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
    [13] = {
    name = "[Corrupted] The Prince Blessing",
    attributes = {
       12,
        1	   -- ice protection
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	 [14] = {
    name = "[Corrupted] Blessing of Ciroel The Forgotten King",
    attributes = {
        3,
		15,
		22,
		52	   -- revive on death
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},	
	
	
	
	
	--RUNES ENCHANTING
	
	
	[15] = {
    name = "[Corrupted] Arcane Knowledge",
    attributes = {
        2,
		15	   -- revive on death
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	[16] = {
    name = "[Corrupted] Magic Pressence",
    attributes = {
        2,
		3	   -- revive on death
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},	
	
	[17] = {
    name = "[Corrupted] Mana Aura",
    attributes = {
        2,
		23	   -- revive on death
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},	
	
	[18] = {
    name = "[Corrupted] Spiritual Alignment",
    attributes = {
        2,
		44	   -- revive on death
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	[19] = {
    name = "[Corrupted] Battle Mage",
    attributes = {
        3,
		22	   -- revive on death
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},	
	
	[20] = {
    name = "[Corrupted] Symphony of Aerials",
    attributes = {
        3,
		40	   -- revive on death
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},	
	
	[21] = {
    name = "[Corrupted] Leaching Vortex",
    attributes = {
        3,
		40,
		45	   -- revive on death
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},	
	
	[22] = {
    name = "[Corrupted] Enchanters Ego",
    attributes = {
        3,
		44,
		15,
		45	   -- revive on death
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	
	
	--green trinkets
	
		[23] = {
    name = "[Corrupted] Wild Manners",
    attributes = {
        1,
		9	   -- revive on death
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
		[24] = {
    name = "[Corrupted] Assassin Thoughts",
    attributes = {
        9,
		50	   -- revive on death
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	[25] = {
    name = "[Corrupted] Backstab Trend",
    attributes = {
        9,
		4	   -- revive on death
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	[26] = {
    name = "[Corrupted] Physical Penetration",
    attributes = {
        9,
		14	   -- physical damage
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	[27] = {
    name = "[Corrupted] Balance Distribution",
    attributes = {
        9,
		2	   -- physical damage
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	[28] = {
    name = "[Corrupted] Mana Absortion",
    attributes = {
        9,
		45	   -- physical damage
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	[29] = {
    name = "[Corrupted] Spiritual Alligment",
    attributes = {
        9,
		2	   -- physical damage
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	[30] = {
    name = "[Corrupted] Soul Reaper",
    attributes = {
        9,
		4,
		44	   -- physical damage
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	
	---YELLOW RUNES
	
	
	[31] = {
    name = "[Corrupted] Holy Crusader",
    attributes = {
        3,
		4
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	[32] = {
    name = "[Corrupted] Light's Protection",
    attributes = {
        3,
		10
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	[33] = {
    name = "[Corrupted] Holy Aura",
    attributes = {
        3,
		15
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	[34] = {
    name = "[Corrupted] Avenger's Aura",
    attributes = {
        4,
		15
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	[35] = {
    name = "[Corrupted] Calling of the Pure",
    attributes = {
        49,
		15
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	[36] = {
    name = "[Corrupted] Blessing of the Saint",
    attributes = {
        2,
		48
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	[37] = {
    name = "[Corrupted] Blessing of the Saint",
    attributes = {
        4,
		10,
		39
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	--PURPLE RUNES
	
	[38] = {
    name = "[Corrupted] Enchanter's Traits",
    attributes = {
        1,
		3
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	[39] = {
    name = "[Corrupted] Chimera's Skin",
    attributes = {
        2,
		22
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	[40] = {
    name = "[Corrupted] Witch's Lament",
    attributes = {
        1,
		15
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	[41] = {
    name = "[Corrupted] Void Recall",
    attributes = {
        15,
		52
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	[42] = {
    name = "[Corrupted] Dark Aura",
    attributes = {
        23,
		36
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	[43] = {
    name = "[Corrupted] Soul Healling",
    attributes = {
        1,
		49
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	[44] = {
    name = "[Corrupted] Werewolf Blood",
    attributes = {
        3,
		15,
		43
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	
	--RED RUNES
	
	[45] = {
    name = "[Corrupted] Fire Aura",
    attributes = {
        1,
		15
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},

	[46] = {
    name = "[Corrupted] Blood Rage",
    attributes = {
        1,
		4
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	[47] = {
    name = "[Corrupted] Monster Pressence",
    attributes = {
        1,
		22
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	[48] = {
    name = "[Corrupted] A True Warrior",
    attributes = {
        10,
		4
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	[49] = {
    name = "[Corrupted] Stone Wall",
    attributes = {
        1,
		10
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	[50] = {
    name = "[Corrupted] One with the Elements",
    attributes = {
        22,
		23
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	[51] = {
    name = "[Corrupted] Conqueror's Aura",
    attributes = {
        42,
		43
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
	
	[52] = {
    name = "[Corrupted] One with the Elements",
    attributes = {
        1,
		12,
		14
    },
	 minLevel = 1, -- Required Item Level to become Unique
    chance = 1, -- % chance to roll this unique
    itemType = US_ITEM_TYPES.ALL -- Can be rolled only for items like Wands, Rods, Rings, Necklaces
	},
    [53] = {
        name = "[Shadow] Nightstalker",
        attributes = {
            9,  -- Distance
            27, -- Treasure Goblin on Kill
            63, -- Execute on Attack
        },
        minLevel = 25,
        chance = 25,
        itemType = US_ITEM_TYPES.WEAPON_DISTANCE + US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE
    },
    [54] = {
        name = "[Titan] Earthshaker",
        attributes = {
            1,  -- Max HP
            22, -- Physical Protection
            75  -- Thor's Might
        },
        minLevel = 28,
        chance = 20,
        itemType = US_ITEM_TYPES.WEAPON_MELEE + US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.ARMOR
    },
    [55] = {
        name = "[Guardian] Aegis",
        attributes = {
            1,  -- Max HP
            10, -- Defence
            28  -- Celestial Physical Protection
        },
        minLevel = 12,
        chance = 60,
        itemType = US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.BOOTS
    },
    [56] = {
        name = "[Noble] Cannon Ball",
        attributes = {
            1,  -- Max HP
            13, -- Experience
            25, -- Celestial Iron Skin
            19  -- Bob Bomb on Kill
        },
        minLevel = 22,
        chance = 35,
        itemType = US_ITEM_TYPES.HELMET + US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.SHIELD
    },
    [57] = {
        name = "[Inferno] Emberfury",
        attributes = {
            2,  -- Max Mana
            15, -- Fire Damage
            30  -- Flame Strike on Attack
        },
        minLevel = 20,
        chance = 25,
        itemType = US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE
    },
    [58] = {
        name = "[Divine] Lightbringer",
        attributes = {
            1,  -- Max HP
            10, -- Defence
            40  -- Moonfire on Attack
        },
        minLevel = 18,
        chance = 25,
        itemType = US_ITEM_TYPES.HELMET + US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.BOOTS + US_ITEM_TYPES.SHIELD
    },
    [59] = {
        name = "[Ancient] Shadow Hunter",
        attributes = {
            3,  -- Magic Level
            9,  -- Distance
            27  -- Treasure Goblin on Kill
        },
        minLevel = 30,
        chance = 30,
        itemType = US_ITEM_TYPES.WEAPON_DISTANCE + US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE
    },
    [60] = {
        name = "[Blessed] Frost Guardian",
        attributes = {
            2,  -- Max Mana
            9,  -- Distance
            68  -- Frost Aura on Kill
        },
        minLevel = 15,
        chance = 50,
        itemType = US_ITEM_TYPES.WEAPON_MELEE + US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.ARMOR
    },
    [61] = {
        name = "[Eternal] Windstrider",
        attributes = {
            2,  -- Max Mana
            8,  -- Melee Celestial
            32  -- Ice Strike on Attack
        },
        minLevel = 12,
        chance = 60,
        itemType = US_ITEM_TYPES.WEAPON_MELEE + US_ITEM_TYPES.BOOTS + US_ITEM_TYPES.RING
    },
    [62] = {
        name = "[Mystic] Arcane Sage",
        attributes = {
            2,  -- Max Mana
            21, -- Magic Damage
            15  -- Ability Damage
        },
        minLevel = 20,
        chance = 40,
        itemType = US_ITEM_TYPES.WEAPON_WAND + US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE
    },
    [63] = {
        name = "[Corrupted] Flame Spirit",
        attributes = {
            1,  -- Max HP
            4,  -- Melee Skills
            12, -- Life Steal
            30  -- Flame Strike on Attack
        },
        minLevel = 1,
        chance = 80,
        itemType = US_ITEM_TYPES.WEAPON_MELEE + US_ITEM_TYPES.SHIELD
    },
    [64] = {
        name = "[Mystical] Spiritwalker",
        attributes = {
            3,  -- Magic Level
            45, -- Mana Steal
            20  -- Critical Damage Buff
        },
        minLevel = 35,
        chance = 10,
        itemType = US_ITEM_TYPES.WEAPON_WAND + US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE
    },
    [65] = {
        name = "[Vigilant] Guardian",
        attributes = {
            1,  -- Max HP
            5,  -- Defence Celestial
            22  -- Physical Protection
        },
        minLevel = 10,
        chance = 70,
        itemType = US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.BOOTS
    },
    [66] = {
        name = "[Swift] Stormchaser",
        attributes = {
            2,  -- Max Mana
            7,  -- Magic Celestial
            67  -- Meteor on Attack
        },
        minLevel = 16,
        chance = 45,
        itemType = US_ITEM_TYPES.WEAPON_MELEE + US_ITEM_TYPES.WEAPON_DISTANCE + US_ITEM_TYPES.BOOTS
    },
    [67] = {
        name = "[Divine] Sunblade",
        attributes = {
            1,  -- Max HP
            16, -- Potion Buff
            30  -- Flame Strike on Attack
        },
        minLevel = 25,
        chance = 20,
        itemType = US_ITEM_TYPES.WEAPON_MELEE + US_ITEM_TYPES.WEAPON_WAND + US_ITEM_TYPES.ARMOR
    },
    [68] = {
        name = "[Frozen] Winter's Bite",
        attributes = {
            2,  -- Max Mana
            33, -- Ice Strike on Hit
            32  -- Ice Strike on Attack
        },
        minLevel = 18,
        chance = 35,
        itemType = US_ITEM_TYPES.WEAPON_MELEE + US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.ARMOR
    },
    [69] = {
        name = "[Arcane] Mysticforce",
        attributes = {
            3,  -- Magic Level
            21, -- Magic Damage
            56  -- Electrocute Strike on Attack [RUNE]
        },
        minLevel = 20,
        chance = 40,
        itemType = US_ITEM_TYPES.WEAPON_WAND + US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE
    },
    [70] = {
        name = "[Celestial] Starforged",
        attributes = {
            1,  -- Max HP
            13, -- Experience
            24  -- Elite on Kill
        },
        minLevel = 22,
        chance = 35,
        itemType = US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.HELMET + US_ITEM_TYPES.LEGS
    },
    [71] = {
        name = "[Vengeful] Deathbringer",
        attributes = {
            3,  -- Magic Level
            14, -- Weapon Damage
            36  -- Death Strike on Attack
        },
        minLevel = 30,
        chance = 20,
        itemType = US_ITEM_TYPES.WEAPON_MELEE + US_ITEM_TYPES.WEAPON_DISTANCE + US_ITEM_TYPES.ARMOR
    },
    [72] = {
        name = "[Infernal] Hellfire",
        attributes = {
            2,  -- Max Mana
            15, -- Fire Damage
            62  -- Physical on Hit [RUNE]
        },
        minLevel = 28,
        chance = 15,
        itemType = US_ITEM_TYPES.WEAPON_MELEE + US_ITEM_TYPES.WEAPON_WAND + US_ITEM_TYPES.ARMOR
    },
    [73] = {
        name = "[Ethereal] Spiritshield",
        attributes = {
            1,  -- Max HP
            60, -- Heal on Hit
            22  -- Physical Protection
        },
        minLevel = 18,
        chance = 30,
        itemType = US_ITEM_TYPES.SHIELD
    },
    [74] = {
        name = "[Guardian] Protector",
        attributes = {
            1,  -- Max HP
            43, -- Health on Kill
            22  -- Physical Protection
        },
        minLevel = 20,
        chance = 25,
        itemType = US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.ARMOR
    },
    [75] = {
        name = "[Mage's] Arcane Will",
        attributes = {
            2,  -- Max Mana
            45, -- Mana Steal
            57  -- Magic Healing on Attack [RUNE]
        },
        minLevel = 15,
        chance = 40,
        itemType = US_ITEM_TYPES.WEAPON_WAND + US_ITEM_TYPES.RING
    },
    [76] = {
        name = "[Hunter's] Precision",
        attributes = {
            9,  -- Distance
            44, -- Mana on Kill
            67  -- Meteor on Attack
        },
        minLevel = 22,
        chance = 35,
        itemType = US_ITEM_TYPES.WEAPON_DISTANCE + US_ITEM_TYPES.AMMO
    },
    [77] = {
        name = "[Warrior's] Battlecry",
        attributes = {
            4,  -- Melee Skills
            12, -- Life Steal
            30  -- Flame Strike on Attack
        },
        minLevel = 18,
        chance = 50,
        itemType = US_ITEM_TYPES.WEAPON_MELEE
    },
    [78] = {
        name = "[Defender] Stalwart",
        attributes = {
            1,  -- Max HP
            60, -- Heal on Hit
            10  -- Defence
        },
        minLevel = 25,
        chance = 20,
        itemType = US_ITEM_TYPES.SHIELD
    },
    [79] = {
        name = "[Sorcerer] Mysticism",
        attributes = {
            2,  -- Max Mana
            55, -- Max MP Buff
            56  -- Electrocute Strike on Attack [RUNE]
        },
        minLevel = 28,
        chance = 30,
        itemType = US_ITEM_TYPES.WEAPON_WAND + US_ITEM_TYPES.RING
    },
    [80] = {
        name = "[Templar] Holy Guardian",
        attributes = {
            1,  -- Max HP
            49, -- Increased Healing
            22  -- Physical Protection
        },
        minLevel = 20,
        chance = 30,
        itemType = US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.ARMOR
    },
     [81] = {
        name = "[Protector] Guardian's Shield",
        attributes = {
            1,  -- Max HP
            22, -- Physical Protection
            60  -- Heal on Hit
        },
        minLevel = 18,
        chance = 30,
        itemType = US_ITEM_TYPES.SHIELD
    },
    [82] = {
        name = "[Archer] Precision Strike",
        attributes = {
            9,  -- Distance
            14, -- Weapon Damage
            67  -- Meteor on Attack
        },
        minLevel = 20,
        chance = 40,
        itemType = US_ITEM_TYPES.WEAPON_DISTANCE
    },
    [83] = {
        name = "[Sorcerer] Arcane Power",
        attributes = {
            2,  -- Max Mana
            15, -- Ability Damage
            56  -- Electrocute Strike on Attack [RUNE]
        },
        minLevel = 25,
        chance = 25,
        itemType = US_ITEM_TYPES.WEAPON_WAND
    },
    [84] = {
        name = "[Warrior] Battle Hardened",
        attributes = {
            4,  -- Melee Skills
            10, -- Defence
            30  -- Flame Strike on Attack
        },
        minLevel = 18,
        chance = 35,
        itemType = US_ITEM_TYPES.WEAPON_MELEE
    },
    [85] = {
        name = "[Defender] Stalwart Protector",
        attributes = {
            1,  -- Max HP
            43, -- Health on Kill
            22  -- Physical Protection
        },
        minLevel = 15,
        chance = 50,
        itemType = US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.ARMOR
    },
    [86] = {
        name = "[Mage] Arcane Mastery",
        attributes = {
            2,  -- Max Mana
            21, -- Magic Damage
            57  -- Magic Healing on Attack [RUNE]
        },
        minLevel = 22,
        chance = 30,
        itemType = US_ITEM_TYPES.WEAPON_WAND
    },
    [87] = {
        name = "[Hunter] Swift Shot",
        attributes = {
            9,  -- Distance
            44, -- Mana on Kill
            32  -- Ice Strike on Attack
        },
        minLevel = 20,
        chance = 45,
        itemType = US_ITEM_TYPES.WEAPON_DISTANCE + US_ITEM_TYPES.AMMO
    },
    [88] = {
        name = "[Berserker] Frenzied Rage",
        attributes = {
            4,  -- Melee Skills
            12, -- Life Steal
            36  -- Death Strike on Attack
        },
        minLevel = 28,
        chance = 20,
        itemType = US_ITEM_TYPES.WEAPON_MELEE
    },
    [89] = {
        name = "[Paladin] Holy Shield",
        attributes = {
            1,  -- Max HP
            60, -- Heal on Hit
            10  -- Defence
        },
        minLevel = 25,
        chance = 25,
        itemType = US_ITEM_TYPES.SHIELD
    },
    [90] = {
        name = "[Elementalist] Stormcaller",
        attributes = {
            2,  -- Max Mana
            21, -- Magic Damage
            67  -- Meteor on Attack
        },
        minLevel = 22,
        chance = 35,
        itemType = US_ITEM_TYPES.WEAPON_WAND
    },
    [91] = {
        name = "[Crusader] Light's Justice",
        attributes = {
            1,  -- Max HP
            49, -- Increased Healing
            22  -- Physical Protection
        },
        minLevel = 18,
        chance = 40,
        itemType = US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.ARMOR
    },
    [92] = {
        name = "[Assassin] Silent Strike",
        attributes = {
            9,  -- Distance
            27, -- Treasure Goblin on Kill
            63  -- Execute on Attack
        },
        minLevel = 30,
        chance = 20,
        itemType = US_ITEM_TYPES.WEAPON_DISTANCE
    },
    [93] = {
        name = "[Sentinel] Guardian's Embrace",
        attributes = {
            1,  -- Max HP
            5,  -- Defence Celestial
            60  -- Heal on Hit
        },
        minLevel = 20,
        chance = 35,
        itemType = US_ITEM_TYPES.SHIELD
    },
    [94] = {
        name = "[Invoker] Arcane Might",
        attributes = {
            2,  -- Max Mana
            45, -- Mana Steal
            57  -- Magic Healing on Attack [RUNE]
        },
        minLevel = 25,
        chance = 30,
        itemType = US_ITEM_TYPES.WEAPON_WAND
    },
    [95] = {
        name = "[Ranger] Eagle Eye",
        attributes = {
            9,  -- Distance
            14, -- Weapon Damage
            67  -- Meteor on Attack
        },
        minLevel = 18,
        chance = 40,
        itemType = US_ITEM_TYPES.WEAPON_DISTANCE + US_ITEM_TYPES.AMMO
    },
    [96] = {
        name = "[Champion] Unyielding",
        attributes = {
            1,  -- Max HP
            43, -- Health on Kill
            22  -- Physical Protection
        },
        minLevel = 20,
        chance = 50,
        itemType = US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.ARMOR
    },
    [97] = {
        name = "[Wizard] Arcane Blast",
        attributes = {
            2,  -- Max Mana
            21, -- Magic Damage
            67  -- Meteor on Attack
        },
        minLevel = 22,
        chance = 25,
        itemType = US_ITEM_TYPES.WEAPON_WAND
    },
    [98] = {
        name = "[Slayer] Relentless",
        attributes = {
            4,  -- Melee Skills
            12, -- Life Steal
            36  -- Death Strike on Attack
        },
        minLevel = 28,
        chance = 30,
        itemType = US_ITEM_TYPES.WEAPON_MELEE
    },
    [99] = {
        name = "[Guardian] Sentinel's Shield",
        attributes = {
            1,  -- Max HP
            5,  -- Defence Celestial
            22  -- Physical Protection
        },
        minLevel = 18,
        chance = 35,
        itemType = US_ITEM_TYPES.SHIELD
    },
    [100] = {
        name = "[Mystic] Arcane Ward",
        attributes = {
            2,  -- Max Mana
            21, -- Magic Damage
            57  -- Magic Healing on Attack [RUNE]
        },
        minLevel = 25,
        chance = 40,
        itemType = US_ITEM_TYPES.WEAPON_WAND
    },
    [101] = {
        name = "[Scout] Sharpshooter",
        attributes = {
            9,  -- Distance
            44, -- Mana on Kill
            67  -- Meteor on Attack
        },
        minLevel = 20,
        chance = 45,
        itemType = US_ITEM_TYPES.WEAPON_DISTANCE + US_ITEM_TYPES.AMMO
    },
    [102] = {
        name = "[Paladin] Holy Guardian",
        attributes = {
            1,  -- Max HP
            49, -- Increased Healing
            22  -- Physical Protection
        },
        minLevel = 18,
        chance = 30,
        itemType = US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.ARMOR
    },
    [103] = {
        name = "[Mage] Elemental Fury",
        attributes = {
            2,  -- Max Mana
            15, -- Fire Damage
            30  -- Flame Strike on Attack
        },
        minLevel = 22,
        chance = 35,
        itemType = US_ITEM_TYPES.WEAPON_WAND
    },
    [104] = {
        name = "[Warden] Iron Wall",
        attributes = {
            1,  -- Max HP
            60, -- Heal on Hit
            10  -- Defence
        },
        minLevel = 25,
        chance = 25,
        itemType = US_ITEM_TYPES.SHIELD
    },
    [105] = {
        name = "[Sorcerer] Arcane Blast",
        attributes = {
            2,  -- Max Mana
            21, -- Magic Damage
            67  -- Meteor on Attack
        },
        minLevel = 22,
        chance = 30,
        itemType = US_ITEM_TYPES.WEAPON_WAND
    },
    [106] = {
        name = "[Hunter] Precision Shot",
        attributes = {
            9,  -- Distance
            14, -- Weapon Damage
            32  -- Ice Strike on Attack
        },
        minLevel = 20,
        chance = 40,
        itemType = US_ITEM_TYPES.WEAPON_DISTANCE + US_ITEM_TYPES.AMMO
    },
    [107] = {
        name = "[Champion] Valor",
        attributes = {
            1,  -- Max HP
            43, -- Health on Kill
            22  -- Physical Protection
        },
        minLevel = 20,
        chance = 50,
        itemType = US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.ARMOR
    },
    [108] = {
        name = "[Wizard] Arcane Power",
        attributes = {
            2,  -- Max Mana
            21, -- Magic Damage
            57  -- Magic Healing on Attack [RUNE]
        },
        minLevel = 22,
        chance = 25,
        itemType = US_ITEM_TYPES.WEAPON_WAND
    },
    [109] = {
        name = "[Assassin] Death's Whisper",
        attributes = {
            9,  -- Distance
            27, -- Treasure Goblin on Kill
            63  -- Execute on Attack
        },
        minLevel = 30,
        chance = 20,
        itemType = US_ITEM_TYPES.WEAPON_DISTANCE
    },
    [110] = {
        name = "[Sentinel] Iron Will",
        attributes = {
            1,  -- Max HP
            5,  -- Defence Celestial
            60  -- Heal on Hit
        },
        minLevel = 20,
        chance = 35,
        itemType = US_ITEM_TYPES.SHIELD
    },
    [111] = {
        name = "[Invoker] Arcane Mastery",
        attributes = {
            2,  -- Max Mana
            45, -- Mana Steal
            57  -- Magic Healing on Attack [RUNE]
        },
        minLevel = 25,
        chance = 30,
        itemType = US_ITEM_TYPES.WEAPON_WAND
    },
    [112] = {
        name = "[Ranger] Eagle Eye",
        attributes = {
            9,  -- Distance
            14, -- Weapon Damage
            67  -- Meteor on Attack
        },
        minLevel = 18,
        chance = 40,
        itemType = US_ITEM_TYPES.WEAPON_DISTANCE + US_ITEM_TYPES.AMMO
    },
    [113] = {
        name = "[Champion] Unyielding",
        attributes = {
            1,  -- Max HP
            43, -- Health on Kill
            22  -- Physical Protection
        },
        minLevel = 20,
        chance = 50,
        itemType = US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.ARMOR
    },
    [114] = {
        name = "[Wizard] Arcane Blast",
        attributes = {
            2,  -- Max Mana
            21, -- Magic Damage
            67  -- Meteor on Attack
        },
        minLevel = 22,
        chance = 25,
        itemType = US_ITEM_TYPES.WEAPON_WAND
    },
    [115] = {
        name = "[Slayer] Relentless",
        attributes = {
            4,  -- Melee Skills
            12, -- Life Steal
            36  -- Death Strike on Attack
        },
        minLevel = 28,
        chance = 30,
        itemType = US_ITEM_TYPES.WEAPON_MELEE
    },
    [116] = {
        name = "[Guardian] Sentinel's Shield",
        attributes = {
            1,  -- Max HP
            5,  -- Defence Celestial
            22  -- Physical Protection
        },
        minLevel = 18,
        chance = 35,
        itemType = US_ITEM_TYPES.SHIELD
    },
    [117] = {
        name = "[Mystic] Arcane Ward",
        attributes = {
            2,  -- Max Mana
            21, -- Magic Damage
            57  -- Magic Healing on Attack [RUNE]
        },
        minLevel = 25,
        chance = 40,
        itemType = US_ITEM_TYPES.WEAPON_WAND
    },
    [118] = {
        name = "[Scout] Sharpshooter",
        attributes = {
            9,  -- Distance
            44, -- Mana on Kill
            67  -- Meteor on Attack
        },
        minLevel = 20,
        chance = 45,
        itemType = US_ITEM_TYPES.WEAPON_DISTANCE + US_ITEM_TYPES.AMMO
    },
    [119] = {
        name = "[Paladin] Holy Guardian",
        attributes = {
            1,  -- Max HP
            49, -- Increased Healing
            22  -- Physical Protection
        },
        minLevel = 18,
        chance = 30,
        itemType = US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.ARMOR
    },
    [120] = {
        name = "[Mage] Elemental Fury",
        attributes = {
            2,  -- Max Mana
            15, -- Fire Damage
            30  -- Flame Strike on Attack
        },
        minLevel = 22,
        chance = 35,
        itemType = US_ITEM_TYPES.WEAPON_WAND
    },
    [121] = {
        name = "[Warden] Iron Wall",
        attributes = {
            1,  -- Max HP
            60, -- Heal on Hit
            10  -- Defence
        },
        minLevel = 25,
        chance = 25,
        itemType = US_ITEM_TYPES.SHIELD
    },
    [122] = {
        name = "[Sorcerer] Arcane Blast",
        attributes = {
            2,  -- Max Mana
            21, -- Magic Damage
            67  -- Meteor on Attack
        },
        minLevel = 22,
        chance = 30,
        itemType = US_ITEM_TYPES.WEAPON_WAND
    },
    [123] = {
        name = "[Hunter] Precision Shot",
        attributes = {
            9,  -- Distance
            14, -- Weapon Damage
            32  -- Ice Strike on Attack
        },
        minLevel = 20,
        chance = 40,
        itemType = US_ITEM_TYPES.WEAPON_DISTANCE + US_ITEM_TYPES.AMMO
    },
    [124] = {
        name = "[Champion] Valor",
        attributes = {
            1,  -- Max HP
            43, -- Health on Kill
            22  -- Physical Protection
        },
        minLevel = 20,
        chance = 50,
        itemType = US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.ARMOR
    },
    [125] = {
        name = "[Wizard] Arcane Power",
        attributes = {
            2,  -- Max Mana
            21, -- Magic Damage
            57  -- Magic Healing on Attack [RUNE]
        },
        minLevel = 22,
        chance = 25,
        itemType = US_ITEM_TYPES.WEAPON_WAND
    },
    [126] = {
        name = "[Assassin] Death's Whisper",
        attributes = {
            9,  -- Distance
            27, -- Treasure Goblin on Kill
            63  -- Execute on Attack
        },
        minLevel = 30,
        chance = 20,
        itemType = US_ITEM_TYPES.WEAPON_DISTANCE
    },
    [127] = {
        name = "[Sentinel] Iron Will",
        attributes = {
            1,  -- Max HP
            5,  -- Defence Celestial
            60  -- Heal on Hit
        },
        minLevel = 20,
        chance = 35,
        itemType = US_ITEM_TYPES.SHIELD
    },
    [128] = {
        name = "[Invoker] Arcane Mastery",
        attributes = {
            2,  -- Max Mana
            45, -- Mana Steal
            57  -- Magic Healing on Attack [RUNE]
        },
        minLevel = 25,
        chance = 30,
        itemType = US_ITEM_TYPES.WEAPON_WAND
    },
    [129] = {
        name = "[Ranger] Eagle Eye",
        attributes = {
            9,  -- Distance
            14, -- Weapon Damage
            67  -- Meteor on Attack
        },
        minLevel = 18,
        chance = 40,
        itemType = US_ITEM_TYPES.WEAPON_DISTANCE + US_ITEM_TYPES.AMMO
    },
    [130] = {
        name = "[Champion] Unyielding",
        attributes = {
            1,  -- Max HP
            43, -- Health on Kill
            22  -- Physical Protection
        },
        minLevel = 20,
        chance = 50,
        itemType = US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.ARMOR
    },
	
}

US_TYPES = {
  CONDITION = 0,
  OFFENSIVE = 1,
  DEFENSIVE = 2,
  TRIGGER = 3
}

US_TRIGGERS = {
  ATTACK = 0,
  HIT = 1,
  KILL = 2
}

--ENCHANTMENTS
US_ENCHANTMENTS = {
  [1] = {
    name = "Max HP",
    combatType = US_TYPES.CONDITION,
    condition = CONDITION_ATTRIBUTES,
    param = CONDITION_PARAM_STAT_MAXHITPOINTS,
    VALUES_PER_LEVEL = 2.0,
    format = function(value)
      return "Max HP +" .. value
    end,
    itemType = US_ITEM_TYPES.HELMET + US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.LEGS + US_ITEM_TYPES.BOOTS + US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.RING + US_ITEM_TYPES.AMMO
  },
  [2] = {
    name = "Max Mana",
    combatType = US_TYPES.CONDITION,
    condition = CONDITION_ATTRIBUTES,
    param = CONDITION_PARAM_STAT_MAXMANAPOINTS,
    VALUES_PER_LEVEL = 1.5,
    format = function(value)
      return "Max Mana +" .. value
    end,
    itemType = US_ITEM_TYPES.HELMET + US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.LEGS + US_ITEM_TYPES.BOOTS + US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.RING + US_ITEM_TYPES.AMMO
  },
  [3] = {
    name = "Magic Level",
    combatType = US_TYPES.CONDITION,
    condition = CONDITION_ATTRIBUTES,
    param = CONDITION_PARAM_STAT_MAGICPOINTS,
    VALUES_PER_LEVEL = 0.06,
    format = function(value)
      return "Magic +" .. value
    end,
    itemType = US_ITEM_TYPES.HELMET + US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.LEGS + US_ITEM_TYPES.BOOTS + US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.WEAPON_ANY ,
  },


  [4] = {
    name = "Melee",
    combatType = US_TYPES.CONDITION,
    condition = CONDITION_ATTRIBUTES,
    param = CONDITION_PARAM_SKILL_SWORD,
    VALUES_PER_LEVEL = 0.1,
    format = function(value)
      return "Melee +" .. value
    end,
    itemType = US_ITEM_TYPES.HELMET + US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.LEGS + US_ITEM_TYPES.BOOTS + US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.WEAPON_ANY
  },
	
	
	 [5] = {
    name = "Defence Celestial",
    combatType = US_TYPES.CONDITION,
    condition = CONDITION_ATTRIBUTES,
    param = CONDITION_PARAM_SKILL_SHIELD,
    VALUES_PER_LEVEL = 0.1,
    format = function(value)
      return "[***] Celestial Defence +" .. value
    end,
     minLevel = 5,
	chance = 0,
    itemType = US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.RING + US_ITEM_TYPES.AMMO,
	},
  [6] = {
    name = "Distance Celestial",
    combatType = US_TYPES.CONDITION,
    condition = CONDITION_ATTRIBUTES,
    param = CONDITION_PARAM_SKILL_DISTANCE,
    VALUES_PER_LEVEL = 0.2,
    format = function(value)
      return "[***] Celestial Distance +" .. value
    end,
    minLevel = 5,
	chance = 0,
    itemType = US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.RING + US_ITEM_TYPES.AMMO,
  },
  [7] = {
    name = "Magic Celestial",
    combatType = US_TYPES.CONDITION,
    condition = CONDITION_ATTRIBUTES,
    param = CONDITION_PARAM_STAT_MAGICPOINTS,
    VALUES_PER_LEVEL = 0.1,
    format = function(value)
      return "[***] Celestial Magic +" .. value
    end,
	minLevel = 5,
	chance = 0,
    itemType = US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.RING + US_ITEM_TYPES.AMMO,
  },


  [8] = {
    name = "Melee Celestial",
    combatType = US_TYPES.CONDITION,
    condition = CONDITION_ATTRIBUTES,
    param = CONDITION_PARAM_SKILL_SWORD,
    VALUES_PER_LEVEL = 0.2,
    format = function(value)
      return "[***] Celestial Melee +" .. value
    end,
	minLevel = 5,
	chance = 0,
    itemType = US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.RING + US_ITEM_TYPES.AMMO,
  },

  [9] = {
   name = "Distance",
    combatType = US_TYPES.CONDITION,
    condition = CONDITION_ATTRIBUTES,
    param = CONDITION_PARAM_SKILL_DISTANCE,
    VALUES_PER_LEVEL = 0.1,
    format = function(value)
      return "Distance +" .. value
    end,
    itemType = US_ITEM_TYPES.HELMET + US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.LEGS + US_ITEM_TYPES.BOOTS + US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.AMMO
  },

  [10] = {
    name = "Defence",
    combatType = US_TYPES.CONDITION,
    condition = CONDITION_ATTRIBUTES,
    param = CONDITION_PARAM_SKILL_SHIELD,
    VALUES_PER_LEVEL = 0.1,
    format = function(value)
      return "Defence +" .. value
    end,
    itemType = US_ITEM_TYPES.HELMET + US_ITEM_TYPES.ARMOR + US_ITEM_TYPES.LEGS + US_ITEM_TYPES.BOOTS + US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.AMMO
  },
  [11] = {
    name = "Mana Shield",
    minLevel = 35,
    combatType = US_TYPES.CONDITION,
    condition = CONDITION_MANASHIELD,
    format = function(value)
      return "Mana Shield"
    end,
    itemType = US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.AMMO
  },
    
  [12] = {
    name = "Life Steal",
    combatType = US_TYPES.OFFENSIVE,
    VALUES_PER_LEVEL = 0.06,
    format = function(value)
      return "[***] Heal for " .. value .. "%% of dealt damage with spells"
    end,
    itemType =  US_ITEM_TYPES.WEAPON_ANY,
    chance = 30,
	minLevel = 20,
  },
  [13] = {
    name = "Experience",
    VALUES_PER_LEVEL = 0.04,
    format = function(value)
      return "Experience gain increased by +" .. value .. "%%"
    end,
    itemType = US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.RING,
    chance = 0,
    minLevel = 25,
  },
  [14] = {
    name = "Weapon Damage",
    combatType = US_TYPES.OFFENSIVE,
    combatDamage = COMBAT_PHYSICALDAMAGE,
    VALUES_PER_LEVEL = 0.2,
    format = function(value)
      return "Weapon Damage +" .. value .. "%%"
    end,
    itemType = US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.RING
  },
  [15] = {
    name = "Ability Damage",
    combatType = US_TYPES.OFFENSIVE,
    combatDamage = COMBAT_ENERGYDAMAGE,
    VALUES_PER_LEVEL = 0.08,
    format = function(value)
      return "Ability Damage +" .. value .. "%%"
    end,
    itemType = US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.RING
  },
  [16] = {
    name = "Potion Buff",
    combatType = US_TYPES.OFFENSIVE,
    combatDamage = COMBAT_EARTHDAMAGE,
    VALUES_PER_LEVEL = 5.2,
    format = function(value)
      return "increase mana and health potion effects by " .. value .. "%%"
    end,
    itemType = US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE,
    chance = 0 
  },
  [17] = {
    name = "Fire Damage",
    combatType = US_TYPES.OFFENSIVE,
    combatDamage = COMBAT_FIREDAMAGE,
    VALUES_PER_LEVEL = 0.2,
    format = function(value)
      return "Fire Damage +" .. value .. "%%"
    end,
    itemType = US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.NECKLACE,
    chance = 0 
  },
  [18] = {
	name = "Mezmerize on Attack",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.ATTACK,
    VALUES_PER_LEVEL = 0.8,
	cooldown = 5,
    execute = function(attacker, target, damage)
	if target:isMonster() and target:getSkull() ~= SKULL_GREEN and target:getSkull() ~= SKULL_WHITE and target:getSkull() ~= SKULL_RED and target:getSkull() ~= SKULL_BLACK and target:getSpeed() > 0 then
      if math.random(100) <= damage then
			local targetPosition = target:getPosition()
			local level = target:getMonsterLevel()
			local mezmerizemob = Game.createMonster(target:getName(), targetPosition, true, true)
			attacker:addSummon(mezmerizemob)
			mezmerizemob:sendProgressbar(45*1000, false)
			addEvent(removeMezmerize, 45*1000, mezmerizemob:getId())
			attacker:getPosition():sendDistanceEffect(target:getPosition(), 133)
			targetPosition:sendMagicEffect(319)
			targetPosition:sendMagicEffect(295)
			Game.sendAnimatedText('Mezmerize!.', target:getPosition(), TEXTCOLOR_ORANGE)
			target:remove()		
			return true
		end
	end
    end,
    format = function(value)
      return "[***] " ..value.. "%% to Mezmerize enemy monsters on Attack for 45 seconds. VPL[0.8*ilvl]"
    end,
    itemType = US_ITEM_TYPES.WEAPON_ANY,
    chance = 0
  },
  [19] = {
       name = "Bob Bomb on Kill",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.KILL,
    VALUES_PER_LEVEL = 0.6,
	
    execute = function(player, value, center, target)
      if math.random(100) <= value then
			local targetPosition = target:getPosition()
			local level = target:getMonsterLevel()
			local bobmonster = Game.createMonster('Bob Bomb', targetPosition, true, true)
			player:addSummon(bobmonster)
			bobmonster:sendProgressbar(25*1000, false)
			addEvent(removeBob, 25*1000, bobmonster:getId())
			
			Game.sendAnimatedText('Bob Bomb!.', target:getPosition(), TEXTCOLOR_ORANGE)
			
			return true
		end
    end,
    format = function(value)
      return "[***] " ..value.. "%% Chance to spawn Bob Bomb!. VPL[0.6*ilvl]"
    end,
    itemType = US_ITEM_TYPES.WEAPON_ANY,
    chance = 0
  },
  [20] = {
    name = "Critical Damage Buff ",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.KILL,
    buff = true,
    VALUES_PER_LEVEL = 1.0,
    execute = function(player, value)
      if math.random(100) <= 10 then
        local pid = player:getId()
        local buffId = 7
        if not US_BUFFS[pid] then
          US_BUFFS[pid] = {}
        end
        if not US_BUFFS[pid][buffId] then
          US_BUFFS[pid][buffId] = {}
          US_BUFFS[pid][buffId].condition = Condition(CONDITION_ATTRIBUTES)
          US_BUFFS[pid][buffId].condition:setParameter(CONDITION_PARAM_SPECIALSKILL_CRITICALHITCHANCE, 100)
		  US_BUFFS[pid][buffId].condition:setParameter(CONDITION_PARAM_SPECIALSKILL_CRITICALHITAMOUNT, 50)
          US_BUFFS[pid][buffId].condition:setParameter(CONDITION_PARAM_TICKS, 12000)
          US_BUFFS[pid][buffId].condition:setParameter(CONDITION_PARAM_SUBID, 3248)
          US_BUFFS[pid][buffId].condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
          player:addCondition(US_BUFFS[pid][buffId].condition)
          player:sendTextMessage(MESSAGE_INFO_DESCR, "Critical Damage Buff applied for 7 seconds!")
          US_BUFFS[pid][buffId].event = addEvent(us_RemoveBuff, 12000, pid, buffId, "Critical Damage Buff")
		  player:sendAddBuffNotification(44, 12, 'Critical Damage Buff for' ..value ..'%', 5, 0)
        else
          stopEvent(US_BUFFS[pid][buffId].event)
          player:sendTextMessage(MESSAGE_INFO_DESCR, "Critical Damage Buff reapplied for 7 seconds!")
          US_BUFFS[pid][buffId].event = addEvent(us_RemoveBuff, 12000, pid, buffId, "Critical Damage Buff")
          player:removeCondition(US_BUFFS[pid][buffId].condition)
          player:addCondition(US_BUFFS[pid][buffId].condition)
		  player:sendAddBuffNotification(44, 12, 'Critical Damage Buff for' ..value ..'%', 5, 0)
        end
      end
    end,
    format = function(value)
      return "10%% on Kill to get " .. value .. "%% Critical Damage buff for 20 sec. VPL[1.0*ilvl]"
    end,
    itemType = US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.RING,
    minLevel = 5,
    chance = 10
  },
  [21] = {
    name = "Magic Damage",
    combatType = US_TYPES.OFFENSIVE,
    combatDamage = COMBAT_ENERGYDAMAGE + COMBAT_EARTHDAMAGE + COMBAT_FIREDAMAGE + COMBAT_ICEDAMAGE + COMBAT_HOLYDAMAGE + COMBAT_DEATHDAMAGE,
    VALUES_PER_LEVEL = 0.1,
    format = function(value)
      return "Ability Damage +" .. value .. "%%"
    end,
    itemType = US_ITEM_TYPES.WEAPON_ANY + US_ITEM_TYPES.HELMET + US_ITEM_TYPES.LEGS + US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE,
    chance = 10
  },
  [22] = {
    name = "Physical Protection",
    combatType = US_TYPES.DEFENSIVE,
    combatDamage = COMBAT_PHYSICALDAMAGE,
    VALUES_PER_LEVEL = 0.1,
    format = function(value)
      return "Physical Protection & Weapon damage protection +" .. value .. "%%"
    end,
    itemType = US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.RING + US_ITEM_TYPES.AMMO,
	minLevel = 10,
  },
  [23] = {
    name = "Magic Protection",
    combatType = US_TYPES.DEFENSIVE,
    combatDamage = COMBAT_ENERGYDAMAGE,
    VALUES_PER_LEVEL = 0.08,
    format = function(value)
      return "Elemental & ability Damage Protection +" .. value .. "%%"
    end,
    itemType = US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.RING + US_ITEM_TYPES.AMMO,
	minLevel = 10,
  },
  [24] = {
    name = "Elite on Kill",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.KILL,
    VALUES_PER_LEVEL = 0.1,
	execute = function(player, value, center, target)
	if math.random(100) <= 5 then
      player:addHealth(player:getMaxHealth() * 0.5)
	 end
    end,
    format = function(value)
      return "[***] " ..value .."%% to find fame monsters on Kill and randomly healing 5% of your max health. VPL[0.1*ilvl]"
    end,
    itemType = US_ITEM_TYPES.NECKLACE +  US_ITEM_TYPES.RING,
	minLevel = 7,
    chance = 0
  },
  [25] = {
    name = "Celestial Iron Skin",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.KILL,
    buff = true,
    VALUES_PER_LEVEL = 6,
    execute = function(player, value)
      if math.random(100) <= 25 then
        local pid = player:getId()
        local buffId = 6
        if not US_BUFFS[pid] then
          US_BUFFS[pid] = {}
        end
        if not US_BUFFS[pid][buffId] then
          US_BUFFS[pid][buffId] = {}
          US_BUFFS[pid][buffId].condition = Condition(CONDITION_ATTRIBUTES)
          US_BUFFS[pid][buffId].condition:setParameter(CONDITION_PARAM_TICKS, 20000)
          US_BUFFS[pid][buffId].condition:setParameter(CONDITION_PARAM_SUBID, 123)
          US_BUFFS[pid][buffId].condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
          player:addCondition(US_BUFFS[pid][buffId].condition)
		  player:setStorageValue(7, value)
          player:sendTextMessage(MESSAGE_INFO_DESCR, "Celestial Iron Skin Buff applied for 20 seconds!")
          US_BUFFS[pid][buffId].event = addEvent(us_RemoveBuff, 20000, pid, buffId, "Celestial Iron Skin")
		  player:sendAddBuffNotification(43, 20, 'Celestial Iron Skin Buff for' ..value ..'%', 5, 0)
        else
          stopEvent(US_BUFFS[pid][buffId].event)
          player:sendTextMessage(MESSAGE_INFO_DESCR, "Celestial Iron Skin Buff reapplied for 20 seconds!")
          US_BUFFS[pid][buffId].event = addEvent(us_RemoveBuff, 20000, pid, buffId, "Celestial Iron Skin")
          player:removeCondition(US_BUFFS[pid][buffId].condition)
		  player:setStorageValue(7, 0)
          player:addCondition(US_BUFFS[pid][buffId].condition)
		  player:setStorageValue(7, value)
		  player:sendAddBuffNotification(43, 20, 'Celestial Iron Skin Buff for' ..value ..'%', 5, 0)
		  
        end
      end
    end,
    format = function(value)
      return "[***] 20%% to get " .. value .. "%% Celestial Iron Skin Buff buff for 20 sec. on Kill VPL[6*ilvl]"
    end,
    itemType = US_ITEM_TYPES.SHIELD,
    minLevel = 20,
    chance = 0
  },
  [26] = {
    name = "Iron Skin Buff",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.KILL,
    buff = true,
    VALUES_PER_LEVEL = 3,
    execute = function(player, value)
      if math.random(100) <= 15 then
        local pid = player:getId()
        local buffId = 5
        if not US_BUFFS[pid] then
          US_BUFFS[pid] = {}
        end
        if not US_BUFFS[pid][buffId] then
          US_BUFFS[pid][buffId] = {}
          US_BUFFS[pid][buffId].condition = Condition(CONDITION_ATTRIBUTES)
          US_BUFFS[pid][buffId].condition:setParameter(CONDITION_PARAM_TICKS, 20000)
          US_BUFFS[pid][buffId].condition:setParameter(CONDITION_PARAM_SUBID, 123)
          US_BUFFS[pid][buffId].condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
          player:addCondition(US_BUFFS[pid][buffId].condition)
		  player:setStorageValue(7, value)
          player:sendTextMessage(MESSAGE_INFO_DESCR, "Iron Skin Buff applied for 20 seconds!")
          US_BUFFS[pid][buffId].event = addEvent(us_RemoveBuff, 20000, pid, buffId, "Iron Skin Buff")
		  player:sendAddBuffNotification(43, 20, 'Iron Skin Buff for' ..value ..'%', 5, 0)
        else
          stopEvent(US_BUFFS[pid][buffId].event)
          player:sendTextMessage(MESSAGE_INFO_DESCR, "Iron Skin Buff reapplied for 20 seconds!")
          US_BUFFS[pid][buffId].event = addEvent(us_RemoveBuff, 20000, pid, buffId, "Iron Skin Buff")
          player:removeCondition(US_BUFFS[pid][buffId].condition)
		  player:setStorageValue(7, 0)
          player:addCondition(US_BUFFS[pid][buffId].condition)
		  player:setStorageValue(7, value)
		  player:sendAddBuffNotification(43, 20, 'Iron Skin Buff for' ..value ..'%', 5, 0)
		  
        end
      end
    end,
    format = function(value)
      return "[***] 20%% to get " .. value .. "%% Deflect Buff buff for 20 sec. on Kill VPL[3*ilvl]"
    end,
    itemType = US_ITEM_TYPES.SHIELD,
    minLevel = 5,
    chance = 0
  },
  [27] = {
    name = "Treasure Goblin on Kill",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.KILL,
    VALUES_PER_LEVEL = 0.2,
    execute = function(player, value, center, target)
      if math.random(300) <= value then
			local targetPosition = target:getPosition()
			local level = target:getMonsterLevel()
			local createmonster = Game.createMonster('Treasure Goblin', targetPosition, true, true)
			createmonster:setSkull(SKULL_GREEN)
			local healthAmount = player:getLevel()
			local halfhp = healthAmount * 100
			createmonster:setMaxHealth(halfhp)
			createmonster:setHealth(halfhp)
			
			Game.sendAnimatedText('A Treasure Goblin has spawned.', target:getPosition(), TEXTCOLOR_ORANGE)
			
			return true
		end
    end,
    format = function(value)
      return "[***] " ..value.. " in 300 Chance to find Treasure Goblins on Kill. VPL[0.5*ilvl]"
    end,
    itemType = US_ITEM_TYPES.NECKLACE +  US_ITEM_TYPES.RING,
	minLevel = 20,
    chance = 0
  },
  [28] = {
    name = "Celestial Physical Protection",
    combatType = US_TYPES.DEFENSIVE,
    combatDamage = COMBAT_PHYSICALDAMAGE,
    VALUES_PER_LEVEL = 0.8,
    format = function(value)
      return "[***] Celestial Physical & Weapon Damage Protection +" .. value .. "%%. VPL[0.8*ilvl]"
    end,
    itemType = US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.RING + US_ITEM_TYPES.AMMO,
    chance = 0
  },
  [29] = {
    name = "Celestial Magic Protection",
    combatType = US_TYPES.DEFENSIVE,
    combatDamage = COMBAT_ENERGYDAMAGE,
    VALUES_PER_LEVEL = 0.7,
    format = function(value)
      return "[***] Celestial Magic & Ability Damage Protection +" .. value .. "%%. VPL[0.7*ilvl]"
    end,
    itemType = US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.RING + US_ITEM_TYPES.AMMO,
    chance = 0
  },
  [30] = {
    name = "Flame Strike on Attack",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.ATTACK,
	cooldown = 0.75,
    VALUES_PER_LEVEL = 2.5,
    execute = function(attacker, target, damage)
      if math.random(100) < 10 then
        attacker:getPosition():sendDistanceEffect(target:getPosition(), CONST_ANI_FIRE)
        doTargetCombatHealth(attacker:getId(), target, COMBAT_ENERGYDAMAGE, damage, damage, CONST_ME_FIREATTACK, ORIGIN_CONDITION)
      end
    end,
    format = function(value)
      return "[***] 10%% to cast Flame Strike on Attack dealing " .. value .. " damage. VPL[2.5*ilvl]"
    end,
    itemType = US_ITEM_TYPES.WEAPON_ANY,
    minLevel = 10,
    chance = 0
  },
  [31] = {
    name = "Flame Strike on Hit",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.HIT,
    cooldown = 0.50,
    VALUES_PER_LEVEL = 1.0,
    execute = function(attacker, target, damage)

        attacker:getPosition():sendDistanceEffect(target:getPosition(), CONST_ANI_FIRE)
        doTargetCombatHealth(attacker:getId(), target, COMBAT_ENERGYDAMAGE, damage, damage, CONST_ME_FIREATTACK, ORIGIN_CONDITION)

    end,
    format = function(value)
      return "cast Flame Strike on Hit dealing " .. value .. " damage. VPL[1.0*ilvl]"
    end,
    itemType = US_ITEM_TYPES.SHIELD
  },
  [32] = {
    name = "Ice Strike on Attack",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.ATTACK,
    VALUES_PER_LEVEL = 1.5,
	cooldown = 0.75,
    execute = function(attacker, target, damage)
      if math.random(100) <= 10 then
        attacker:getPosition():sendDistanceEffect(target:getPosition(), CONST_ANI_SMALLICE)
        doTargetCombatHealth(attacker:getId(), target, COMBAT_ENERGYDAMAGE, damage, damage, CONST_ME_ICEATTACK, ORIGIN_CONDITION)

        -- Apply slow effect
        local slowCondition = Condition(CONDITION_PARALYZE)
        slowCondition:setParameter(CONDITION_PARAM_TICKS, 3000)  -- Duration in milliseconds (10 seconds)
        slowCondition:setFormula(-0.7, 0, -0.7, 0)  -- Slow the target by 70%

        target:addCondition(slowCondition)

      end
    end,
    format = function(value)
      return "10%% to cast Ice Strike on Attack dealing " .. value .. " damage and slowing the target for 3 seconds. VPL[1.5*ilvl]"
    end,
    itemType = US_ITEM_TYPES.WEAPON_ANY
  },
  [33] = {
    name = "Ice Strike on Hit",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.HIT,
    VALUES_PER_LEVEL = 0.7,
    cooldown = 0.75,
    execute = function(attacker, target, damage)
      if math.random(100) < 20 then
        attacker:getPosition():sendDistanceEffect(target:getPosition(), CONST_ANI_SMALLICE)
        doTargetCombatHealth(attacker:getId(), target, COMBAT_ENERGYDAMAGE, damage, damage, CONST_ME_ICEATTACK, ORIGIN_CONDITION)
		
		 -- Apply slow effect
        local slowCondition = Condition(CONDITION_PARALYZE)
        slowCondition:setParameter(CONDITION_PARAM_TICKS, 3000)  -- Duration in milliseconds (10 seconds)
        slowCondition:setFormula(-0.7, 0, -0.7, 0)  -- Slow the target by 70%

        target:addCondition(slowCondition)
      end
    end,
    format = function(value)
      return "20%% to cast Ice Strike on Hit dealing " .. value .. " damage and slowing the target for 3 seconds. VPL[0.7*ilvl]"
    end,
    itemType = US_ITEM_TYPES.SHIELD
  },
  [34] = {
    name = "Terra Strike on Attack",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.ATTACK,
    VALUES_PER_LEVEL = 1.3,
	cooldown = 0.75,
    execute = function(attacker, target, damage)
      if math.random(100) < 20 then
        attacker:getPosition():sendDistanceEffect(target:getPosition(), CONST_ANI_SMALLEARTH)
        -- Apply poison effect
		
        target:addDamageCondition(target, CONDITION_POISON, DAMAGELIST_VARYING_PERIOD, damage, {1, 2}, 5)
      end
    end,
    format = function(value)
      return "20%% to cast Terra Strike on Attack Poisoning the target dealing " .. value .. " damage every 2 seconds. VPL[1.3*ilvl]"
    end,
    itemType = US_ITEM_TYPES.WEAPON_ANY
  },
  [35] = {
    name = "Terra Strike on Hit",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.HIT,
    VALUES_PER_LEVEL = 0.45,
    execute = function(attacker, target, damage)
      if math.random(100) < 10 then
        attacker:getPosition():sendDistanceEffect(target:getPosition(), CONST_ANI_SMALLEARTH)
        -- Apply poison effect
		
        target:addDamageCondition(target, CONDITION_POISON, DAMAGELIST_VARYING_PERIOD, damage, {1, 2}, 5)
      end
    end,
    format = function(value)
      return "50%% to cast Terra Strike on Hit poisoning the attaker and dealing " .. value .. " damage every 2 seconds. VPL[0.45*ilvl]"
    end,
    itemType = US_ITEM_TYPES.SHIELD
  },
  [36] = {
    name = "Death Strike on Attack",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.ATTACK,
    VALUES_PER_LEVEL = 10,
	cooldown = 0.75,
    execute = function(attacker, target, damage)
      if math.random(100) < 2 then
        attacker:getPosition():sendDistanceEffect(target:getPosition(), CONST_ANI_DEATH)
        doTargetCombatHealth(attacker:getId(), target, COMBAT_ENERGYDAMAGE, damage, damage, CONST_ME_MORTAREA, ORIGIN_CONDITION)
      end
    end,
    format = function(value)
      return "2%% to cast Death Strike on Attack dealing " .. value .. " damage. VPL[10*ilvl]"
    end,
    itemType = US_ITEM_TYPES.WEAPON_ANY
  },
  [37] = {
    name = "Death Strike on Hit",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.HIT,
    VALUES_PER_LEVEL = 5,
	cooldown = 0.75,
    execute = function(attacker, target, damage)
      if math.random(100) < 10 then
        attacker:getPosition():sendDistanceEffect(target:getPosition(), CONST_ANI_DEATH)
        doTargetCombatHealth(attacker:getId(), target, COMBAT_ENERGYDAMAGE, damage, damage, CONST_ME_MORTAREA, ORIGIN_CONDITION)
      end
    end,
    format = function(value)
      return "1%% to cast Death Strike on Hit dealing " .. value .. " damage. VPL[5*ilvl]"
    end,
    itemType = US_ITEM_TYPES.SHIELD
  },
  [38] = {
    name = "Celestial Burn on Attack",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.ATTACK,
    VALUES_PER_LEVEL = 1.4,
	cooldown = 0.75,
	
    execute = function(attacker, target, damage)

        target:getPosition():sendMagicEffect(48)
        --doTargetCombatHealth(attacker:getId(), target, COMBAT_ENERGYDAMAGE, damage, damage, CONST_ME_HOLYDAMAGE, ORIGIN_CONDITION)
		local magicdamage = attacker:getMagicLevel() * 0.35
		local burn = math.floor(damage + magicdamage)
         attacker:addDamageCondition(target, CONDITION_FIRE, DAMAGELIST_CONSTANT_PERIOD, burn, 2, 4)	
	     doTargetCombatHealth(attacker:getId(), target, COMBAT_ENERGYDAMAGE, 1, magicdamage, 48, ORIGIN_CONDITION)

    end,
    format = function(value)
      return "[***] cast Celestial Burn on Attack dealing " .. value .. " burn damage + 35% your magic level every 2 seconds for 8 seconds. VPL[1.4*ilvl]"
    end,
    itemType = US_ITEM_TYPES.WEAPON_ANY,
	chance = 0
  },
  [39] = {
    name = "Celestial Burn on Hit",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.HIT,
    VALUES_PER_LEVEL = 1.2,
	cooldown = 0.75,
    execute = function(attacker, target, damage)
       
        target:getPosition():sendMagicEffect(48)
        --doTargetCombatHealth(attacker:getId(), target, COMBAT_ENERGYDAMAGE, damage, damage, CONST_ME_HOLYDAMAGE, ORIGIN_CONDITION)
		local burn = math.floor((attacker:getMaxHealth() * 0.02) + damage)
		attacker:addDamageCondition(target, CONDITION_FIRE, DAMAGELIST_CONSTANT_PERIOD, burn, 2, 4)		
	   doTargetCombatHealth(attacker:getId(), target, COMBAT_ENERGYDAMAGE, damage, damage, 48, ORIGIN_CONDITION)
    end,
    format = function(value)
      return "[***] cast Celestial Burn on hit dealing " .. value .. "burn damage + 2% of your max health. VPL[1.2*ilvl]"
    end,
    itemType = US_ITEM_TYPES.SHIELD,
	chance = 0
  },
  [40] = {
    name = "Moonfire on Attack",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.ATTACK,
    VALUES_PER_LEVEL = 1.5,
	cooldown = 1.75,
    execute = function(attacker, target, damage)
      if math.random(100) < 10 then
        attacker:getPosition():sendMagicEffect(379)
		local explo = target:getPosition()
        explo.x = explo.x + 1
        explo.y = explo.y + 0
		explo:sendMagicEffect(382)
		attacker:addMana(damage * 1)
        doTargetCombatHealth(attacker:getId(), target, COMBAT_ENERGYDAMAGE, damage, damage, CONST_ME_ENERGYAREA, ORIGIN_CONDITION)
      end
    end,
    format = function(value)
      return "[***] 10%% to cast Moonfire on Attack dealing " .. value .. " damage and recover " .. value * 1 .." mana. VPL[1.5*ilvl]"
    end,
    itemType = US_ITEM_TYPES.WEAPON_ANY,
	chance = 0
  },
  [41] = {
    name = "Thunder on Hit",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.HIT,
    VALUES_PER_LEVEL = 2.1,
	cooldown = 0.75,
    execute = function(attacker, target, damage)
      if math.random(100) <= 10 then
      --exoriEffect(center, CONST_ME_FIREAREA)
      local specs = Game.getSpectators(attacker:getPosition(), false, false, 2, 2, 2, 2)
      if #specs > 0 then
        for i = 1, #specs do
          if specs[i]:isMonster() then
		  
		  local explo = specs[i]:getPosition()
			explo.x = explo.x + 1
			explo.y = explo.y + 0
			explo:sendMagicEffect(345)

			doTargetCombatHealth(attacker:getId(), specs[i], COMBAT_ENERGYDAMAGE, damage, damage, 40, ORIGIN_CONDITION)
          end
        end
      end
	  end
    end,
    format = function(value)
      return "[***] 10%% to strike with lightning on Hit all nearby enemies dealing " .. value .. "%% target Max Health damage VPL[2.1*ilvl]"
    end,
    itemType = US_ITEM_TYPES.SHIELD,
	chance = 0
  },
  [42] = {
    name = "Poison Explosion on Kill",
    minLevel = 20,
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.KILL,
    VALUES_PER_LEVEL = 5.3,
    execute = function(player, value, center, target)
	if math.random(100) <= 30 then
  
      --exoriEffect(center, CONST_ME_FIREAREA)
	  target:getPosition():sendMagicEffect(303)
      local specs = Game.getSpectators(center, false, false, 1, 1, 1, 1)
      if #specs > 0 then
        for i = 1, #specs do
          if specs[i]:isMonster() then
			specs[i]:getPosition():sendMagicEffect(306)

			local magicdamage = player:getMagicLevel() * 2.5
			player:addDamageCondition(specs[i], CONDITION_POISON, DAMAGELIST_CONSTANT_PERIOD, magicdamage, 1, 4)
			doTargetCombatHealth(player:getId(), specs[i], COMBAT_ENERGYDAMAGE, 1, value, 35, ORIGIN_CONDITION)
          end
        end
      end
	  end
    end,
    format = function(value)
      return  "[***] 30%% to create a Poison Area on Kill dealing " .. value .. " damage + 250% of your magic level as poison damage every second for 4 seconds. VPL[5.3*ilvl]"
    end,
    itemType = US_ITEM_TYPES.WEAPON_ANY,
	chance = 0
  },
  [43] = {
    name = "Health on Kill",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.KILL,
    VALUES_PER_LEVEL = 1.3,
    execute = function(player, value, center, target)
      player:addHealth(value)
    end,
    format = function(value)
      return "Regenerate " .. value .. " Health on Kill. VPL[1.3*ilvl]"
    end,
    itemType = US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE+ US_ITEM_TYPES.AMMO,
    chance = 25
  },
  [44] = {
    name = "Mana on Kill",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.KILL,
    VALUES_PER_LEVEL = 1.3,
    execute = function(player, value, center, target)
      player:addMana(value)
    end,
    format = function(value)
      return "Regenerate " .. value .. " Mana on Kill. VPL[1.3*ilvl]"
    end,
    itemType = US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.RING + US_ITEM_TYPES.NECKLACE  + US_ITEM_TYPES.AMMO,
    chance = 25
  },
  [45] = {
    name = "Mana Steal",
    combatType = US_TYPES.OFFENSIVE,
    VALUES_PER_LEVEL = 0.03,
    format = function(value)
      return "[***] Regenerate Mana for " .. value .. "%% of dealt damage with spells. VPL[0.03*ilvl]"
    end,
    itemType = US_ITEM_TYPES.WEAPON_ANY,
	minLevel = 40,
    chance = 5
  },
  [46] = {
    name = "Full HP on Kill",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.KILL,
    VALUES_PER_LEVEL = 0.3,
    execute = function(player, value, center, target)
      if math.random(100) < value then
        player:addHealth(player:getMaxHealth())
      end
    end,
    format = function(value)
      return value .. "%% to regenerate full HP on Kill.  VPL[0.03*ilvl]"
    end,
    itemType = US_ITEM_TYPES.RING,
    minLevel = 4,
    chance = 5
  },
  [47] = {
    name = "Full MP on Kill",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.KILL,
    VALUES_PER_LEVEL = 0.3,
    execute = function(player, value, center, target)
      if math.random(100) < value then
        player:addMana(player:getMaxMana())
      end
    end,
    format = function(value)
      return value .. "%% to regenerate full MP on Kill.  VPL[0.03*ilvl]"
    end,
    itemType = US_ITEM_TYPES.RING,
    minLevel = 4,
    chance = 5
  },
  [48] = {
    name = "Mass Healing on Attack",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.ATTACK,
    VALUES_PER_LEVEL = 0.2,
	cooldown = 0.75,
    execute = function(attacker, target, damage)
      if math.random(100) < damage then
        local min = (attacker:getLevel() / 5) + (attacker:getMagicLevel() * 4.6) + 30
		  exoriEffect(target:getPosition(), 15)
      local specs = Game.getSpectators(target:getPosition(), false, false, 1, 1, 1, 1)
      if #specs > 0 then
        for i = 1, #specs do
          if specs[i]:isPlayer() then
            specs[i]:addHealth(min)
			specs[i]:getPosition():sendMagicEffect(336)	--336
          end
        end
      end
      end
    end,
    format = function(value)
      return "[***] " ..value .. "%% to cast Mass Healing on Attack. VPL[0.2*ilvl]"
    end,
    itemType = US_ITEM_TYPES.WEAPON_ANY,
    minLevel = 10,
    chance = 0
  },
  [49] = {
    name = "Increased Healing",
    VALUES_PER_LEVEL = 0.35,
    format = function(value)
      return "[***] " ..value .. "%% more healing from all sources. VPL[0.35*ilvl]"
    end,
    itemType = US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.RING,
    minLevel = 5,
    chance = 20
  },
  [50] = {
    name = "Additonal Gold",
    VALUES_PER_LEVEL = 0.5,
    format = function(value)
      return value .. "%% more gold from loot"
    end,
    itemType = US_ITEM_TYPES.BOOTS + US_ITEM_TYPES.RING + US_ITEM_TYPES.AMMO,
    minLevel = 10,
    chance = 0
  },
  [51] = {
    name = "Double Damage",
    combatType = US_TYPES.OFFENSIVE,
    combatDamage = COMBAT_ENERGYDAMAGE + COMBAT_EARTHDAMAGE + COMBAT_FIREDAMAGE + COMBAT_ICEDAMAGE + COMBAT_HOLYDAMAGE + COMBAT_DEATHDAMAGE +
      COMBAT_PHYSICALDAMAGE,
    VALUES_PER_LEVEL = 0.08,
    format = function(value)
      return "[***] " ..value .. "%% to deal double damage. VPL[0.08*ilvl]"
    end,
    itemType = US_ITEM_TYPES.WEAPON_ANY,
    minLevel = 20,
    chance = 0
  },
  [52] = {
    name = "Revive on death",
    VALUES_PER_LEVEL = 0.7,
    format = function(value)
      return "[***] " ..value .. "%% to be revived. VPL[0.7*ilvl]"
    end,
    itemType = US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.RING,
    minLevel = 2,
    chance = 0
  },
  [53] = {
    name = "Damage Buff",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.KILL,
    VALUES_PER_LEVEL = 0.7,
    execute = function(player, value)
      if math.random(100) < 20 then
        local pid = player:getId()
        local buffId = 1
        if not US_BUFFS[pid] then
          US_BUFFS[pid] = {}
        end
        if not US_BUFFS[pid][buffId] then
          US_BUFFS[pid][buffId] = {}
          US_BUFFS[pid][buffId].value = value
          player:sendTextMessage(MESSAGE_INFO_DESCR, "Damage Buff applied for 8 seconds!")
          US_BUFFS[pid][buffId].event = addEvent(us_RemoveBuff, 8000, pid, buffId, "Damage Buff")
        else
          stopEvent(US_BUFFS[pid][buffId].event)
          US_BUFFS[pid][buffId].value = value
          player:sendTextMessage(MESSAGE_INFO_DESCR, "Damage Buff reapplied for 8 seconds!")
          US_BUFFS[pid][buffId].event = addEvent(us_RemoveBuff, 8000, pid, buffId, "Damage Buff")
        end
      end
    end,
    format = function(value)
      return "[***] 20%% to get " .. value .. "%% damage buff for 8 sec. on Kill VPL[0.7*ilvl]"
    end,
    itemType = US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.RING,
    minLevel = 7,
    chance = 0
  },
  [54] = {
    name = "Max HP Buff",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.KILL,
    buff = true,
    VALUES_PER_LEVEL = 0.5,
    execute = function(player, value)
      if math.random(100) < 20 then
        local pid = player:getId()
        local buffId = 2
        if not US_BUFFS[pid] then
          US_BUFFS[pid] = {}
        end
        if not US_BUFFS[pid][buffId] then
          US_BUFFS[pid][buffId] = {}
          US_BUFFS[pid][buffId].condition = Condition(CONDITION_ATTRIBUTES)
          US_BUFFS[pid][buffId].condition:setParameter(CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, 100 + value)
          US_BUFFS[pid][buffId].condition:setParameter(CONDITION_PARAM_TICKS, 20000)
          US_BUFFS[pid][buffId].condition:setParameter(CONDITION_PARAM_SUBID, 3245)
          US_BUFFS[pid][buffId].condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
          player:addCondition(US_BUFFS[pid][buffId].condition)
          player:sendTextMessage(MESSAGE_INFO_DESCR, "Max HP Buff applied for 20 seconds!")
          US_BUFFS[pid][buffId].event = addEvent(us_RemoveBuff, 20000, pid, buffId, "Max HP Buff")
        else
          stopEvent(US_BUFFS[pid][buffId].event)
          player:sendTextMessage(MESSAGE_INFO_DESCR, "Max HP Buff reapplied for 20 seconds!")
          US_BUFFS[pid][buffId].event = addEvent(us_RemoveBuff, 20000, pid, buffId, "Max HP Buff")
          player:removeCondition(US_BUFFS[pid][buffId].condition)
          player:addCondition(US_BUFFS[pid][buffId].condition)
        end
      end
    end,
    format = function(value)
      return "20%% to get " .. value .. "%% Max HP buff for 20 sec. on Kill. VPL[0.5*ilvl]"
    end,
    itemType = US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.RING,
    minLevel = 7,
    chance = 10
  },
  [55] = {
    name = "Max MP Buff",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.KILL,
    buff = true,
    VALUES_PER_LEVEL = 0.5,
    execute = function(player, value)
      if math.random(100) < 20 then
        local pid = player:getId()
        local buffId = 3
        if not US_BUFFS[pid] then
          US_BUFFS[pid] = {}
        end
        if not US_BUFFS[pid][buffId] then
          US_BUFFS[pid][buffId] = {}
          US_BUFFS[pid][buffId].condition = Condition(CONDITION_ATTRIBUTES)
          US_BUFFS[pid][buffId].condition:setParameter(CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT, 100 + value)
          US_BUFFS[pid][buffId].condition:setParameter(CONDITION_PARAM_TICKS, 20000)
          US_BUFFS[pid][buffId].condition:setParameter(CONDITION_PARAM_SUBID, 3246)
          US_BUFFS[pid][buffId].condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
          player:addCondition(US_BUFFS[pid][buffId].condition)
          player:sendTextMessage(MESSAGE_INFO_DESCR, "Max MP Buff applied for 20 seconds!")
          US_BUFFS[pid][buffId].event = addEvent(us_RemoveBuff, 20000, pid, buffId, "Max MP Buff")
        else
          stopEvent(US_BUFFS[pid][buffId].event)
          player:sendTextMessage(MESSAGE_INFO_DESCR, "Max MP Buff reapplied for 8 seconds!")
          US_BUFFS[pid][buffId].event = addEvent(us_RemoveBuff, 20000, pid, buffId, "Max MP Buff")
          player:removeCondition(US_BUFFS[pid][buffId].condition)
          player:addCondition(US_BUFFS[pid][buffId].condition)
        end
      end
    end,
    format = function(value)
      return "20%% to get " .. value .. "%% Max MP buff for 20 sec. on Kill. VPL[0.05*ilvl]"
    end,
    itemType = US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.RING,
    minLevel = 7,
    chance = 10
  },
  
  --power runes
  [56] = {
    name = "Electrocute Strike on Attack [RUNE]",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.ATTACK,
    VALUES_PER_LEVEL = 2.0,
	cooldown = 1.5,
    execute = function(attacker, target, damage)
      if math.random(100) < 20 then
	  
		 local specs = Game.getSpectators(target:getPosition(), false, false, 3, 3, 3, 3)
      if #specs > 0 then
        for i = 1, #specs do
          if specs[i]:isMonster() then
			 target:getPosition():sendDistanceEffect(specs[i]:getPosition(), 86)
			 specs[i]:getPosition():sendMagicEffect(419)
            doTargetCombatHealth(attacker:getId(), specs[i]:getId(), COMBAT_ENERGYDAMAGE, damage, damage, CONST_ME_NONE, ORIGIN_CONDITION)
          end
        end
      end
	  
        attacker:getPosition():sendDistanceEffect(target:getPosition(), 86)
        doTargetCombatHealth(attacker:getId(), target, COMBAT_ENERGYDAMAGE, damage, damage, CONST_ME_ICEATTACK, ORIGIN_CONDITION)
      end
    end,
    format = function(value)
      return "[***] 20%% to cast a Chain of lightning on Attack dealing " .. value .. " damage to the target and all nearby enemies around the target. VPL[2.0*ilvl]"
    end,
    itemType = US_ITEM_TYPES.WEAPON_ANY,
    minLevel = 10,
    chance = 0
  },
  [57] = {
    name = "Magic Healing on Attack [RUNE]",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.ATTACK,
    VALUES_PER_LEVEL = 0.2,
	cooldown = 0.75,
    execute = function(attacker, target, damage)
      if math.random(100) < damage then
        local min = (attacker:getLevel() / 5) + (attacker:getMagicLevel() * 2.0) + 50
        attacker:addHealth(min)
		attacker:getPosition():sendMagicEffect(336)
		attacker:say("Healing on Attack!", TALKTYPE_MONSTER_SAY, false, attacker, attacker:getPosition())
      end
    end,
    format = function(value)
      return value .. "%% to cast Magic Healing on Attack. VPL[0.2*ilvl]"
    end,
    itemType = US_ITEM_TYPES.WEAPON_ANY ,
    minLevel = 5,
    chance = 0
  },
  [58] = {
    name = "Flame Blast on Attack [RUNE]",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.ATTACK,
    VALUES_PER_LEVEL = 2.5,
	cooldown = 0.75,
	
    execute = function(attacker, target, damage) 
      if math.random(100) < 5 then
		local targetPos = target:getPosition()
        attacker:getPosition():sendDistanceEffect(target:getPosition(), 76)
		doTargetCombatHealth(attacker:getId(), target, COMBAT_ENERGYDAMAGE, damage, damage, 198, ORIGIN_CONDITION)
		--(cid, COMBAT_MANADRAIN, pos, area, min, max, effect)
		--doAreaCombatHealth(player, COMBAT_FIREDAMAGE, target:getPosition(), area, min, max, CONST_ME_NONE)
      end
    end,
    format = function(value)
      return "[***] 5%% to cast Flame Blast on Attack dealing " .. value .. " damage. VPL[30*ilvl]"
    end,
    itemType = US_ITEM_TYPES.WEAPON_ANY,
    minLevel = 10,
    chance = 0
  },
  
  [59] = {
    name = "Flame Explosion on Hit [RUNE]",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.HIT,
    VALUES_PER_LEVEL = 1.0,
	cooldown = 0.75,
    execute = function(attacker, target, damage)
      if math.random(100) < 20 then
        attacker:getPosition():sendDistanceEffect(target:getPosition(), CONST_ANI_FIRE)
        doTargetCombatHealth(attacker:getId(), target, COMBAT_ENERGYDAMAGE, damage, damage, CONST_ME_FIREATTACK, ORIGIN_CONDITION)
      end
    end,
    format = function(value)
      return "20%% to cast Flame Explosion on Hit dealing " .. value .. " damage. VPL[1.0*ilvl]"
    end,
    itemType = US_ITEM_TYPES.SHIELD,
    minLevel = 10,
    chance = 0
  },
   [60] = {
    name = "Heal on Hit",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.HIT,
    VALUES_PER_LEVEL = 0.3,
	cooldown = 0.75,
    execute = function(player, value, center, target)
      player:addHealth(value)
    end,
    format = function(value)
      return "[***] Restore " .. value .. " Health on Hit. VPL[0.3*ilvl]"
    end,
    itemType = US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.RING + US_ITEM_TYPES.AMMO,
    minLevel = 5,
    chance = 0
  },
    [61] = {
    name = "Mana on Hit",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.HIT,
    VALUES_PER_LEVEL = 0.3,
	cooldown = 0.75,
    execute = function(player, value, center, target)
      player:addMana(value)
    end,
    format = function(value)
      return "[***] Restore " .. value .. " Mana on Hit. VPL[0.3*ilvl]"
    end,
    itemType = US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.RING + US_ITEM_TYPES.AMMO,
    minLevel = 5,
    chance = 0
  },
    [62] = {
    name = "Physical on Hit [RUNE]",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.HIT,
    VALUES_PER_LEVEL = 2.2,
	cooldown = 0.75,
    execute = function(attacker, target, damage)
      if math.random(100) < 50 then
        doTargetCombatHealth(attacker:getId(), target, COMBAT_PHYSICALDAMAGE, damage, damage, CONST_ME_NONE, ORIGIN_CONDITION)
      end
    end,
    format = function(value)
      return "[***] 50%% to deflect physical damage on Hit dealing " .. value .. " damage. VPL[2.2*ilvl]"
    end,
    itemType = US_ITEM_TYPES.SHIELD,
    minLevel = 10,
    chance = 0
  },
    [63] = {
    name = "Execute on Attack [RUNE]",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.ATTACK,
    VALUES_PER_LEVEL = 0.1,
	cooldown = 1.5,
    execute = function(attacker, target, damage)
	if target:isMonster() and target:getSkull() ~= SKULL_GREEN and target:getSkull() ~= SKULL_WHITE and target:getSkull() ~= SKULL_RED and target:getSkull() ~= SKULL_BLACK and target:getSpeed() > 0 then
      if math.random(100) < damage then
	  
		if ((target:getHealth() / target:getMaxHealth()) * 100) <= 25 then
		Game.sendAnimatedText('Executed!', target:getPosition(), TEXTCOLOR_DARKRED)
        doTargetCombatHealth(attacker:getId(), target, COMBAT_PHYSICALDAMAGE, target:getMaxHealth(), target:getMaxHealth(), 516, ORIGIN_CONDITION)
		
		end
      end
	 end
    end,
    format = function(value)
      return "[***] " .. value .. "%% to execute targets below 25% health on Attack. VPL[0.1*ilvl]"
    end,
    itemType = US_ITEM_TYPES.WEAPON_ANY,
    minLevel = 10,
    chance = 0
  },
  [64] = {
    name = "Razor Leaf on Attack [RUNE]",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.ATTACK,
	cooldown = 0.75,
    VALUES_PER_LEVEL = 0.1,
    execute = function(attacker, target, damage)
      if math.random(100) < damage then
        local min = (attacker:getLevel() * 1.5) * 5
        local max = (attacker:getLevel() * 1.5) * 5
		
		 local explo = target:getPosition()
			explo.x = explo.x + 1
			explo.y = explo.y + 1
			explo:sendMagicEffect(357)
			
			local explo2 = target:getPosition()
			explo2.x = explo2.x + 1
			explo2.y = explo2.y + 1
			explo2:sendMagicEffect(453)
			
		 attacker:getPosition():sendDistanceEffect(target:getPosition(), 145)
		doTargetCombatHealth(attacker:getId(), target, COMBAT_PHYSICALDAMAGE, min, max, 1, ORIGIN_CONDITION)
      end
    end,
    format = function(value)
      return "[***] " .. value .. "%% to cast Razor Leaf on Attack dealing massive physical damage. VPL[0.1*ilvl]"
    end,
    itemType = US_ITEM_TYPES.WEAPON_ANY,
    minLevel = 10,
    chance = 0
  },
  [65] = {--38147
    name = "Speed on Attack",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.ATTACK,
    buff = true,
    VALUES_PER_LEVEL = 1.2,
	cooldown = 0.75,
    execute = function(attacker, target, damage)
      if math.random(100) < damage then
        local pid = attacker:getId()
        local buffId = 4
        if not US_BUFFS[pid] then
          US_BUFFS[pid] = {}
        end
        if not US_BUFFS[pid][buffId] then
          US_BUFFS[pid][buffId] = {}
          US_BUFFS[pid][buffId].condition = Condition(CONDITION_HASTE)
          US_BUFFS[pid][buffId].condition:setParameter(CONDITION_PARAM_TICKS, 6000)
          US_BUFFS[pid][buffId].condition:setParameter(CONDITION_PARAM_SUBID, 3247)
		  US_BUFFS[pid][buffId].condition:setFormula(2.0, -70, 2, -70)
          US_BUFFS[pid][buffId].condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
          attacker:addCondition(US_BUFFS[pid][buffId].condition)
          attacker:sendTextMessage(MESSAGE_INFO_DESCR, "Haste!")
		  attacker:sendAddBuffNotification(85, 6, 'Haste', 3, 0)
          US_BUFFS[pid][buffId].event = addEvent(us_RemoveBuff, 20000, pid, buffId, "Speed on Attack")
        else
          stopEvent(US_BUFFS[pid][buffId].event)
          attacker:sendTextMessage(MESSAGE_INFO_DESCR, "Speed on Attack reapplied for 6 seconds!")
		  attacker:sendAddBuffNotification(85, 6, 'Haste', 3, 0)
          US_BUFFS[pid][buffId].event = addEvent(us_RemoveBuff, 20000, pid, buffId, "Speed on Attack")
          attacker:removeCondition(US_BUFFS[pid][buffId].condition)
          attacker:addCondition(US_BUFFS[pid][buffId].condition)
        end
      end
    end,
    format = function(value)
      return "[***] " .. value .. "%% to obtain Movement speed for 6 sec. on Attack."
    end,
    itemType = US_ITEM_TYPES.WEAPON_ANY,
    minLevel = 1,
    chance = 0
  },
  [66] = {--38147
    name = "Speed on Hit",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.HIT,
    buff = true,
    VALUES_PER_LEVEL = 0.2,
	cooldown = 0.75,
    execute = function(attacker, target, damage)
      if math.random(100) < damage then
        local pid = player:getId()
        local buffId = 8
        if not US_BUFFS[pid] then
          US_BUFFS[pid] = {}
        end
        if not US_BUFFS[pid][buffId] then
          US_BUFFS[pid][buffId] = {}
          US_BUFFS[pid][buffId].condition = Condition(CONDITION_HASTE)
          US_BUFFS[pid][buffId].condition:setParameter(CONDITION_PARAM_TICKS, 6000)
          US_BUFFS[pid][buffId].condition:setParameter(CONDITION_PARAM_SUBID, 3247)
		  US_BUFFS[pid][buffId].condition:setFormula(2.0, -70, 2, -70)
          US_BUFFS[pid][buffId].condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
          player:addCondition(US_BUFFS[pid][buffId].condition)
          player:sendTextMessage(MESSAGE_INFO_DESCR, "Haste!")
          US_BUFFS[pid][buffId].event = addEvent(us_RemoveBuff, 20000, pid, buffId, "Speed on Attack")
        else
          stopEvent(US_BUFFS[pid][buffId].event)
          player:sendTextMessage(MESSAGE_INFO_DESCR, "Speed on Attack reapplied for 6 seconds!")
          US_BUFFS[pid][buffId].event = addEvent(us_RemoveBuff, 20000, pid, buffId, "Speed on Attack")
          player:removeCondition(US_BUFFS[pid][buffId].condition)
          player:addCondition(US_BUFFS[pid][buffId].condition)
        end
      end
    end,
    format = function(value)
      return "[***] " .. value .. "%% to obtain Movement speed for 6 sec. on Hit."
    end,
    itemType = US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.RING,
    minLevel = 5,
    chance = 0
  },
    [67] = {
    name = "Meteor on Attack [RUNE]",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.ATTACK,
    VALUES_PER_LEVEL = 5.0,
	cooldown = 0.75,
    execute = function(attacker, target, damage)
      if math.random(100) < 5 then
        target:getPosition():sendMagicEffect(467)
        doTargetCombatHealth(attacker:getId(), target, COMBAT_ENERGYDAMAGE, damage, damage, CONST_ME_FIREATTACK, ORIGIN_CONDITION)
		attacker:sendTextMessage(MESSAGE_INFO_DESCR, "Meteor!")
      end
    end,
    format = function(value)
      return "[***] 5%% to cast Meteor on Attack dealing " .. value .. " damage. VPL[5.0*ilvl]"
    end,
    itemType = US_ITEM_TYPES.WEAPON_ANY,
    minLevel = 10,
    chance = 0
  },
   [68] = {
    name = "Frost Aura on Kill",
    minLevel = 20,
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.KILL,
    VALUES_PER_LEVEL = 2.2,
    execute = function(player, value, center, target)
      
      exoriEffect(player:getPosition(), 232)
      local specs = Game.getSpectators(player:getPosition(), false, false, 1, 1, 1, 1)
      if #specs > 0 then
        for i = 1, #specs do
          if specs[i]:isMonster() then
            doTargetCombatHealth(player:getId(), specs[i]:getId(), COMBAT_ENERGYDAMAGE, value, value, CONST_ME_NONE, ORIGIN_CONDITION)
          end
        end
      end
    end,
    format = function(value)
      return "[***] cast Frost Aura on Kill dealing " .. value .. " Ability Damage. VPL[2.2*ilvl]"
    end,
    itemType = US_ITEM_TYPES.WEAPON_ANY,
	chance = 0
  },
    [69] = {
    name = "Emperor Gift Rune",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.KILL,
    VALUES_PER_LEVEL = 0.35,
    execute = function(player, value, center, target)
	if math.random(100) <= 4 then
	  Game.sendAnimatedText('Emperor Gift!', player:getPosition(), TEXTCOLOR_YELLOW)
	  Game.sendAnimatedText('+' .. value ..' Fame & Gold!', target:getPosition(), TEXTCOLOR_YELLOW)
      FameSystem:addPoints(player, value)
	  player:addItem(2148, value)
	 end
    end,
    format = function(value)
      return "[***] 4%% to get " .. value .. " fame and " .. value .. " gold points on Kill. VPL[0.35*ilvl]"
    end,
    itemType = US_ITEM_TYPES.NECKLACE,
    chance = 0
  },
  [70] = {
    name = "Frost Storm on Attack",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.ATTACK,
    VALUES_PER_LEVEL = 2.5,
	cooldown = 0.75,
    execute = function(attacker, target, damage)
	if math.random(100) <= 5 then
      exoriEffect(target:getPosition(), 232)
      local specs = Game.getSpectators(target:getPosition(), false, false, 1, 1, 1, 1)
      if #specs > 0 then
        for i = 1, #specs do
          if specs[i]:isMonster() then
            doTargetCombatHealth(attacker:getId(), specs[i]:getId(), COMBAT_ENERGYDAMAGE, damage, damage, CONST_ME_NONE, ORIGIN_CONDITION)
          end
        end
      end
	 end
    end,
    format = function(value)
      return "[***] 5%% to cast frost Storm on Attack dealing " .. value .. " damage. VPL[2.5*ilvl]"
    end,
    itemType = US_ITEM_TYPES.WEAPON_ANY,
    minLevel = 10,
    chance = 0
  },
  [71] = {
    name = "Freeze on hit",
   combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.HIT,
    buff = false,
    VALUES_PER_LEVEL = 0.18,
    execute = function(attacker, target, damage)
      if math.random(100) <= damage then
         local stun = Condition(CONDITION_STUNED)
          stun:setParameter(CONDITION_PARAM_TICKS, damage*1000)
		  
		  local condition = Condition(CONDITION_OUTFIT)
          condition:setParameter(CONDITION_PARAM_TICKS, damage*1000)
		  condition:setOutfit({lookTypeEx = 33861})
         
		  target:getPosition():sendMagicEffect(239)	
		  target:addCondition(stun)    
          target:addCondition(condition)    
		  attacker:sendAddBuffNotification(85, 6, 'stun', 3, 0)				
      end
    end,
    format = function(value)
      return value .."[***] %% to freeze attackers for 2 seconds buff for 20 sec. VPL[0.18*ilvl]"
    end,
    itemType = US_ITEM_TYPES.SHIELD,
    minLevel = 10,
    chance = 0
  },
   [72] = {
    name = "Celestial Physical Protection",
    combatType = US_TYPES.DEFENSIVE,
    combatDamage = COMBAT_PHYSICALDAMAGE,
    VALUES_PER_LEVEL = 0.2,
    format = function(value)
      return "[***] Celestial Physical & Weapon Damage Protection +" .. value .. "%% . VPL[0.8*ilvl]"
    end,
     minLevel = 5,
	chance = 0,
    itemType = US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.RING + US_ITEM_TYPES.AMMO,
	
  },
  [73] = {
    name = "Celestial Magic Protection",
    combatType = US_TYPES.DEFENSIVE,
    combatDamage = COMBAT_ENERGYDAMAGE,
    VALUES_PER_LEVEL = 0.15,
    format = function(value)
      return "[***] Celestial Magic & Ability Damage Protection +" .. value .. "%% . VPL[0.7*ilvl]"
    end,
    minLevel = 5,
	chance = 0,
    itemType = US_ITEM_TYPES.NECKLACE + US_ITEM_TYPES.RING + US_ITEM_TYPES.AMMO,
  },
   [74] = {
    name = "Lava Aura Buff",
    combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.KILL,
    buff = true,
    VALUES_PER_LEVEL = 6,
    execute = function(player, value)
      if math.random(100) <= 25 then
        local pid = player:getId()
        local buffId = 9
        if not US_BUFFS[pid] then
          US_BUFFS[pid] = {}
        end
        if not US_BUFFS[pid][buffId] then
          US_BUFFS[pid][buffId] = {}
          US_BUFFS[pid][buffId].condition = Condition(CONDITION_ATTRIBUTES)
          US_BUFFS[pid][buffId].condition:setParameter(CONDITION_PARAM_TICKS, 20000)
          US_BUFFS[pid][buffId].condition:setParameter(CONDITION_PARAM_SUBID, 123)
          US_BUFFS[pid][buffId].condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
          player:addCondition(US_BUFFS[pid][buffId].condition)
		  player:setStorageValue(10, value)
          player:sendTextMessage(MESSAGE_INFO_DESCR, "Celestial Lava Aura Buff applied for 20 seconds!")
          US_BUFFS[pid][buffId].event = addEvent(us_RemoveBuff, 20000, pid, buffId, "Celestial Iron Skin")
		  player:sendAddBuffNotification(66, 20, 'Celestial Lava Aura Buff for' ..value ..'%', 5, 0)
        else
          stopEvent(US_BUFFS[pid][buffId].event)
          player:sendTextMessage(MESSAGE_INFO_DESCR, "Celestial Lava Aura Buff reapplied for 20 seconds!")
          US_BUFFS[pid][buffId].event = addEvent(us_RemoveBuff, 20000, pid, buffId, "Celestial Iron Skin")
          player:removeCondition(US_BUFFS[pid][buffId].condition)
		  player:setStorageValue(10, 0)
          player:addCondition(US_BUFFS[pid][buffId].condition)
		  player:setStorageValue(10, value)
		  player:sendAddBuffNotification(66, 20, 'Celestial Lava Aura Buff for' ..value ..'%', 5, 0)
		  
        end
      end
    end,
    format = function(value)
      return "[***] 20%% to get " .. value .. "%% Celestial Lava Aura Buff buff for 20 sec. on Kill"
    end,
    itemType = US_ITEM_TYPES.SHIELD,
    minLevel = 20,
    chance = 0
  },
    [75] = {
    name = "Thor's Might",
   combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.HIT,
    buff = false,
    VALUES_PER_LEVEL = 5.0,
    execute = function(attacker, target, damage)
	if math.random(100) <= 5 then
	local DescendPosition = target:getPosition()	
	local explo = target:getPosition()
		attacker:getPosition():sendMagicEffect(321)
		attacker:getPosition():sendDistanceEffect(target:getPosition(), 31)		
        explo.x = explo.x + 1
        explo.y = explo.y + 0
		explo:sendMagicEffect(345)
		attacker:teleportTo(DescendPosition)
		local specs = Game.getSpectators(target:getPosition(), false, false, 1, 1, 1, 1)
		if #specs > 0 then
			for i = 1, #specs do
				  if specs[i]:isMonster() then		
					 specs[i]:getPosition():sendMagicEffect(419)
					doTargetCombatHealth(attacker:getId(), specs[i]:getId(), COMBAT_ENERGYDAMAGE, damage, damage, CONST_ME_NONE, ORIGIN_CONDITION)
			    end
			end
		end
	  end
    end,
    format = function(value)
      return "[***] 5%% to descend into the attacker dealing " .. value .." Aoe damage. VPL[22*ilvl]"
    end,
    itemType = US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.WEAPON_ANY,
    minLevel = 5,
    chance = 0
  },
      [76] = {
    name = "Life Essence",
   combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.HIT,
    buff = false,
    VALUES_PER_LEVEL = 0.15,
    execute = function(attacker, target, damage)
		if math.random(100) <= damage then
	
			local itemID = 38693 -- Replace with the ID of the item you want to create
   
		if attacker and attacker:getPosition() then
	   local pos = attacker:getPosition()
			-- Calculate a random 1x1 position around the corpse
			local x = pos.x + math.random(-2, 2)
			local y = pos.y + math.random(-2, 2)
			local z = pos.z

			-- Create the item at the random position
			local newItem = Game.createItem(itemID, 1, {x = x, y = y, z = z})

			-- Send a magic effect from the corpse to the new item
			pos:sendDistanceEffect({x = x, y = y, z = z}, 156)
			addEvent(removeLife, 10 * 1000, {x = x, y = y, z = z})       

	end
	
	
	
	    end
    end,
    format = function(value)
      return "[***] " .. value .."%% to create a life essence near the player for 10 seconds wich heal 15% max health. VPL[0.15*ilvl]"
    end,
    itemType = US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.NECKLACE,
    minLevel = 5,
    chance = 0
  },
     [77] = {
    name = "Mana Essence",
   combatType = US_TYPES.TRIGGER,
    triggerType = US_TRIGGERS.HIT,
    buff = false,
    VALUES_PER_LEVEL = 0.15,
    execute = function(attacker, target, damage)
		if math.random(100) <= damage then
	
			local itemID = 38694 -- Replace with the ID of the item you want to create
   
		if attacker and attacker:getPosition() then
	   local pos = attacker:getPosition()
			-- Calculate a random 1x1 position around the corpse
			local x = pos.x + math.random(-2, 2)
			local y = pos.y + math.random(-2, 2)
			local z = pos.z

			-- Create the item at the random position
			local newItem = Game.createItem(itemID, 1, {x = x, y = y, z = z})

			-- Send a magic effect from the corpse to the new item
			pos:sendDistanceEffect({x = x, y = y, z = z}, 156)
			addEvent(removeMana, 10 * 1000, {x = x, y = y, z = z})       

	end
	
	
	
	    end
    end,
    format = function(value)
      return "[***] " .. value .."%% to create a life essence near the player for 10 seconds wich heal 15% max mana. VPL[0.15*ilvl]"
    end,
    itemType = US_ITEM_TYPES.SHIELD + US_ITEM_TYPES.NECKLACE,
    minLevel = 5,
    chance = 0
  },
  
}



function exoriEffect(center, effect)
  for i = -1, 1 do
    local top = Position(center.x + i, center.y - 1, center.z)
    local middle = Position(center.x + i, center.y, center.z)
    local bottom = Position(center.x + i, center.y + 1, center.z)
    top:sendMagicEffect(effect)
    middle:sendMagicEffect(effect)
    bottom:sendMagicEffect(effect)
  end
end



