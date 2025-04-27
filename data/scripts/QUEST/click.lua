local MONSTER_DESPAWN_TIME = 5 * 60 * 1000 -- 5 minutes in milliseconds

local eventConfigs = {
    [0000] = { -- Sample with all functions
        required_storage = 5000, -- Storage required to activate
        storage_reward = { id = 5001, value = 1 }, -- Storage to be given as a reward
        message = "A surge of energy flows through you, granting you new power!",
        teleportTo = Position(100, 100, 7), -- Optional teleport destination
        magiceffect = CONST_ME_ENERGYHIT, -- Effect on the item position
        transform_item = { from = 2160, to = 2152, time = 5000 }, -- Transform an item (Crystal Coin to Platinum Coin for 5 sec)
        give_items = { {id = 2160, count = 10} }, -- Grants 10 Crystal Coins
        give_stat_points = 5, -- Grants 5 stat points
        summon_monsters = {
            {name = "Angry Grave Guardian", position = Position(1052, 1342, 7), count = 1} -- Adjust position accordingly
        },
        sumstorage = 6000 -- Will increment storage 6000 by 1
    },
    [2001] = { -- Another event example
        required_storage = 40015,
        storage_reward = { id = Mainquest.dwarvenrelic, value = 1 },
        message = "A surge of energy flows through you, granting you new power!",
        give_stat_points = 1, 
        magiceffect = CONST_ME_MAGIC_BLUE
    },
    [2002] = { -- Another event example
        required_storage = 40027,
        teleportTo = Position(1386, 384, 8), -- Optional teleport destination
        message = "A hidden passage has been discovered.",
        magiceffect = CONST_ME_MAGIC_BLUE,
        is_teleport = true -- Mark this as a teleport event
    },
    [2003] = { -- Another event example
        message = "A surge of energy flows through you, granting you new power!",
        give_stat_points = 1, 
        magiceffect = CONST_ME_MAGIC_BLUE
    },
    [2004] = { -- Another event example
        --required_storage = 40027,
        teleportTo = Position(923, 762, 9), -- Optional teleport destination
        message = "A hidden passage has been discovered.",
        magiceffect = CONST_ME_MORTAREA,
        is_teleport = true -- Mark this as a teleport event
    },
    [2005] = { -- Another event example
       -- required_storage = 40027,
        teleportTo = Position(927, 758, 8), -- Optional teleport destination
        message = "A hidden passage has been discovered.",
        magiceffect = CONST_ME_MORTAREA,
        is_teleport = true -- Mark this as a teleport event
    },
    [2006] = { -- Another event example
       -- required_storage = 40027,
        teleportTo = Position(955, 784, 8), -- Optional teleport destination
        message = "A hidden passage has been discovered.",
        magiceffect = CONST_ME_MORTAREA,
        is_teleport = true -- Mark this as a teleport event
    },
    [2007] = { -- Another event example
       -- required_storage = 40027,
        teleportTo = Position(978, 789, 9), -- Optional teleport destination
        message = "A hidden passage has been discovered.",
        magiceffect = CONST_ME_MORTAREA,
        is_teleport = true -- Mark this as a teleport event
    },
    [2008] = { -- Another event example
       -- required_storage = 40027,
        teleportTo = Position(953, 811, 9), -- Optional teleport destination
        message = "A hidden passage has been discovered.",
        magiceffect = CONST_ME_MORTAREA,
        is_teleport = true -- Mark this as a teleport event
    },
    [2009] = { -- Another event example
       -- required_storage = 40027,
        teleportTo = Position(955, 784, 8), -- Optional teleport destination
        message = "A hidden passage has been discovered.",
        magiceffect = CONST_ME_MORTAREA,
        is_teleport = true -- Mark this as a teleport event
    },
    [2010] = { -- Sample with all functions
        required_storage = 40043, -- Storage required to activate
        message = "you have found Lily\'s ribbon",      
        magiceffect = CONST_ME_MORTAREA, -- Effect on the item position      
        give_items = { {id = 18449, count = 1} }, -- ribbon
    },
    [2011] = { -- Sample with all functions
        required_storage = 40045, -- Storage required to activate
        message = "you have found Lily\'s Secret Faded Letter",      
        magiceffect = CONST_ME_MORTAREA, -- Effect on the item position      
        give_items = { {id = 14326, count = 1} }, -- ribbon
    },
    [2012] = { -- Sample with all functions
        required_storage = 40047, -- Storage required to activate
        message = "you have found Lily\'s Shattered Mirror",      
        magiceffect = CONST_ME_MORTAREA, -- Effect on the item position      
        give_items = { {id = 40096, count = 1} }, -- ribbon
    },
     [2013] = { -- Grave-Robbing Event
        required_storage = 40053, -- Must have started the quest
        storage_reward = { id = Mainquest.graverobber, value = 1 }, -- Mark quest as completed
        message = "As you dig, the ground trembles... something awakens!",
        magiceffect = CONST_ME_MORTAREA, -- Dark magic effect
         summon_monsters = {
            {name = "Mr. Ludrich", position = Position(460, 633, 8), count = 1} -- Adjust position accordingly
        }
    },
     [2014] = { -- Grave-Robbing Event
        required_storage = 40055, -- Must have started the quest
        storage_reward = { id = Mainquest.wronggrave, value = 1 }, -- Mark quest as completed
        message = "As you dig, the ground trembles... something awakens!",
        magiceffect = CONST_ME_MORTAREA, -- Dark magic effect
         summon_monsters = {
            {name = "skeleton", position = Position(442, 667, 9), count = 1}, -- Adjust position accordingly
            {name = "skeleton", position = Position(443, 664, 9), count = 1}, -- Adjust position accordingly
            {name = "skeleton", position = Position(446, 664, 9), count = 1}, -- Adjust position accordingly
            {name = "skeleton", position = Position(447, 665, 9), count = 1}, -- Adjust position accordingly
            {name = "skeleton", position = Position(448, 665, 9), count = 1}, -- Adjust position accordingly
        }
    },
     [2015] = { -- Cleansing the Spirit at The Ember Shrine
        required_storage = 40057, -- Must have started the quest
        storage_reward = { id = Mainquest.hauntingspirit, value = 1 }, -- Mark quest as completed
        message = "The Ember Shrine flares up, consuming the dark energy around you!",
        magiceffect = 170, -- Fire effect
        transform_item = { from = 9948, to = 9949, time = 45000 }, -- Transform an item (Crystal Coin to Platinum Coin for 5 sec)
    },


    --2016 used
    --2017 used
    --2018 used

    --2019 used
    --2020 used
    --2021 used
    --2022 used
    --2023 used
    --2024 used
    --2025 used

    [2026] = { -- Cleansing the Spirit at The Ember Shrine
        required_storage = 40083, -- Must have started the quest
        storage_reward = { id = Mainquest.investigatemachine, value = 1 }, -- Mark quest as completed
        message = "The Ember Shrine flares up, consuming the dark energy around you!",
        magiceffect = 205, -- Fire effect
    },
    [2027] = { -- Another event example
        required_storage = 40105,
        storage_reward = { id = Mainquest.foundpartner, value = 1 },
        message = "You have found what it seems Lucy\'s dwarf Partner.!",
        magiceffect = 205
    },

    [2028] = { -- telescope
        required_storage = 40113,
        storage_reward = { id = Mainquest.strangesymbols, value = 1 },
        message = "You look far to the east it seems like a fortress of some kind.",
        magiceffect = 205
    },

    [2029] = { -- library
        message = "You found stories related to an alchemist traveling between dunes.",
        magiceffect = 400
    },
    [2030] = { -- library
        message = "You found stories of a boy chasing omens across the desert in search of treasure.",
        magiceffect = 400
    },
    [2031] = {
        message = "You found tales about a cursed king who turned everything he touched into gold.",
        magiceffect = 400
    },
    [2032] = {
        message = "You read of a prince who met a fox and learned the true meaning of love.",
        magiceffect = 400
    },
    [2033] = {
        message = "You skim a dusty scroll about a giant worm that ruled the sands of a faraway planet.",
        magiceffect = 400
    },
    [2034] = {
        message = "You uncover a legend of a woman born from sea foam who charmed the gods.",
        magiceffect = 400
    },
    [2035] = {
        message = "You found myths about a phoenix that rises from ashes once every age.",
        magiceffect = 400
    },
    [2036] = {
        message = "You read about a knight cursed to wander forever beneath a blood-red moon.",
        magiceffect = 400
    },
    [2037] = {
        message = "You glimpse fragments of a tale where a city vanished under endless sands.",
        magiceffect = 400
    },
    [2038] = {
        message = "You found an entry on a clever thief who stole fire from the gods.",
        magiceffect = 400
    },
    [2039] = {
        message = "You discovered information about trolls language, traditions and politics.",
        storage_reward = { id = Mainquest.studytrolls, value = 1 },
        magiceffect = 205
    },
    [2040] = {
        message = "You found a tale of a forgotten queen who ruled with wisdom and wrath.",
        magiceffect = 400
    },
    [2041] = {
        message = "You read about a lonely tower that holds a mirror showing one’s true soul.",
        magiceffect = 400
    },
    [2042] = {
        message = "You found fragments of a story about a warrior who slayed a sea serpent.",
        magiceffect = 400
    },
    [2043] = {
        message = "You discovered myths of a trickster god who caused both chaos and laughter.",
        magiceffect = 400
    },
    [2044] = {
        message = "You read tales of a ghost ship that only appears during full moons.",
        magiceffect = 400
    },
    [2045] = {
        message = "You uncover words about an eternal library where every book already exists.",
        magiceffect = 400
    },
    [2046] = {
        message = "You found a love story carved into stone by a blind sculptor.",
        magiceffect = 400
    },
    [2047] = {
        message = "You read legends of a hero who leapt into the underworld to save a soul.",
        magiceffect = 400
    },
    [2048] = {
        message = "You found writings of a storm god who carved mountains with his rage.",
        magiceffect = 400
    },
    [2049] = {
        message = "You read the tale of a sword that weeps for every life it takes.",
        magiceffect = 400
    },
    [2050] = {
        message = "You found an ancient riddle left behind by a civilization swallowed by the sea.",
        magiceffect = 400
},
    [2051] = {
        message = "You read of a mirror that reflects not faces, but memories long forgotten.",
        magiceffect = 400
    },
    [2052] = {
        message = "You found a legend of a maiden turned to stone for loving a god.",
        magiceffect = 400
    },
    [2053] = {
        message = "You uncover verses about a bard who sang the stars into the sky.",
        magiceffect = 400
    },
    [2054] = {
        message = "You read of a beast that guards a maze no one returns from.",
        magiceffect = 400
    },
    [2055] = {
        message = "You found notes on a monk who counted every grain of sand seeking truth.",
        magiceffect = 400
    },
    [2056] = {
        message = "You stumbled upon a tale of twins who switched fates under a blood moon.",
        magiceffect = 400
    },
    [2057] = {
        message = "You read about a forest that sleeps for a hundred years between each breath.",
        magiceffect = 400
    },
    [2058] = {
        message = "You found scribbles about a candle that burns with memories instead of wax.",
        magiceffect = 400
    },
    [2059] = {
        message = "You read of a desert flower that only blooms when someone forgives.",
        magiceffect = 400
    },
    [2060] = {
        message = "You read a poem about a man who searched for immortality and lost himself.",
        magiceffect = 400
    },

    [2061] = {
        required_storage = 40127,
        message = "You have destroy one of Gor'mhaz's totems.",
        magiceffect = 400,
        sumstorage = Mainquest.relicsbroken
    },
    [2062] = {
        required_storage = 40127,
        message = "You have destroy one of Gor'mhaz's totems.",
        magiceffect = 400,
        sumstorage = Mainquest.relicsbroken
    },
    [2063] = {
        required_storage = 40127,
        message = "You have destroy one of Gor'mhaz's totems.",
        magiceffect = 400,
        sumstorage = Mainquest.relicsbroken
    },


    -- 2070 till 2099 will be used for locked doors








    [2100] = { -- Cleansing the Spirit at The Ember Shrine
        required_storage = 40093, -- Must have started the quest
        storage_reward = { id = Mainquest.sporegateactivated, value = 1 }, -- Mark quest as completed
        message = "You align the final conduit. The ancient machine hums to life, pulsing with bioluminescent energy—the Sporegate is now active.",
        magiceffect = 501, -- Fire effect
    },
    [2101] = { -- Another event example
       -- required_storage = 40027,
        teleportTo = Position(699, 925, 10), -- Optional teleport destination
        message = "A hidden passage has been discovered.",
        magiceffect = CONST_ME_MORTAREA,
        is_teleport = true -- Mark this as a teleport event
    },
    [2102] = { -- Another event example
       -- required_storage = 40027,
        teleportTo = Position(663, 912, 10), -- Optional teleport destination
        message = "A hidden passage has been discovered.",
        magiceffect = CONST_ME_MORTAREA,
        is_teleport = true -- Mark this as a teleport event
    },

    [2103] = { --residual magic
        required_storage = 40131,
        message = "You have investigated traces of Rukk´s residual magic.",
        magiceffect = 400,
        sumstorage = Mainquest.residualmagic
    },
    [2104] = { --residual magic
        required_storage = 40131,
        message = "You have investigated traces of Rukk´s residual magic.",
        magiceffect = 400,
        sumstorage = Mainquest.residualmagic
    },
    [2105] = { --residual magic
        required_storage = 40131,
        message = "You have investigated traces of Rukk´s residual magic.",
        magiceffect = 400,
        sumstorage = Mainquest.residualmagic
    },
    [2106] = { --residual magic
        required_storage = 40131,
        message = "You have investigated traces of Rukk´s residual magic.",
        magiceffect = 400,
        sumstorage = Mainquest.residualmagic
    },
    [2107] = { -- Sample with all functions
        required_storage = 40147, -- Storage required to activate
        message = "You have found a sealed bone crate!",
        magiceffect = CONST_ME_MORTAREA, -- Effect on the item position
        give_items = { {id = 34370, count = 1} }, -- Grants 10 Crystal Coins
    },
    [2108] = {
        required_storage = 40155,
        message = "You have safely recovered the rests of a fallen soldier.",
        magiceffect = 400,
        sumstorage = Mainquest.soldierremains,
        transform_item = { from = 37718, to = 37717, time = 45000 }, 
    },
    [2109] = { --bomb marks
        required_storage = 40157,
        message = "You uncover sabotage: hidden bomb found!.",
        magiceffect = 400,
        sumstorage = Mainquest.trapsfound,
    },
    [2110] = { --bomb marks
        required_storage = 40157,
        message = "You uncover sabotage: hidden bomb found!.",
        magiceffect = 400,
        sumstorage = Mainquest.trapsfound,
    },
    [2111] = { --bomb marks
        required_storage = 40157,
        message = "You uncover sabotage: hidden bomb found!.",
        magiceffect = 400,
        sumstorage = Mainquest.trapsfound,
    },
    [2112] = { --bomb marks
        required_storage = 40157,
        message = "You uncover sabotage: hidden bomb found!.",
        magiceffect = 400,
        sumstorage = Mainquest.trapsfound,
    },
    [2113] = { --bomb marks
        required_storage = 40157,
        message = "You uncover sabotage: hidden bomb found!.",
        magiceffect = 400,
        sumstorage = Mainquest.trapsfound,
    },
    [2114] = { --bomb marks
        required_storage = 40157,
        message = "You uncover sabotage: hidden bomb found!.",
        magiceffect = 400,
        sumstorage = Mainquest.trapsfound,
    },

    --2115 used for trash cleanup deadfin reputation


}

local function restoreItem(position, itemId, actionId)
    local tile = Tile(position)
    if tile then
        local item = tile:getItemById(itemId)
        if not item then
            local restoredItem = Game.createItem(itemId, 1, position)
            if restoredItem and actionId then
                restoredItem:setActionId(actionId)
            end
        end
    end
end

local function removeMonster(monsterId)
    local monster = Monster(monsterId)
    if monster then
        monster:say("The spirit fades back into the abyss...", TALKTYPE_MONSTER_YELL)
        monster:getPosition():sendMagicEffect(CONST_ME_POFF)
        monster:remove()
    end
end

local function summonMonsters(config)
    for _, monsterData in ipairs(config.summon_monsters) do
        for i = 1, monsterData.count do
            local monster = Game.createMonster(monsterData.name, monsterData.position)
            if monster then
                addEvent(removeMonster, MONSTER_DESPAWN_TIME, monster:getId())
            end
        end
    end
end

local eventAction = Action()

function eventAction.onUse(player, item, fromPosition, target, toPosition)
    local eventConfig = eventConfigs[item.actionid]
    if not eventConfig then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Nothing happens.")
        return true
    end

    local eventConfigStorage = item.actionid -- Use actionId as unique storage key


    local storagefix = player:getStorageValue(item.actionid)
        if storagefix == -1 or storagefix == nil then
            storagefix = 0
        end

     -- Prevent re-claiming the event (except for teleports)
    if not eventConfig.is_teleport and player:getStorageValue(item.actionid) >= 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already claimed this.")
        return true
    end

    if eventConfig.required_storage and player:getStorageValue(eventConfig.required_storage) < 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not ready for this yet.")
        return true
    end

    if eventConfig.storage_reward then
        if player:getStorageValue(eventConfig.storage_reward.id) == eventConfig.storage_reward.value then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already claimed this.")
            return true
        end
        player:setStorageValue(eventConfig.storage_reward.id, eventConfig.storage_reward.value)
    end

    if eventConfig.message then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, eventConfig.message)
    end

    if eventConfig.teleportTo then
        player:teleportTo(eventConfig.teleportTo)
    end

    if eventConfig.magiceffect then
        fromPosition:sendMagicEffect(eventConfig.magiceffect)
    end

    if eventConfig.transform_item then
        local tile = Tile(fromPosition)
        if tile then
            local item = tile:getItemById(eventConfig.transform_item.from)
            if item then
                local oldActionId = item:getActionId()
                item:transform(eventConfig.transform_item.to)
                item:setActionId(0)
                addEvent(restoreItem, eventConfig.transform_item.time, fromPosition, eventConfig.transform_item.from, oldActionId)
            end
        end
    end

    if eventConfig.give_items then
        for _, itemData in ipairs(eventConfig.give_items) do
            player:addItem(itemData.id, itemData.count)
        end
    end

    if eventConfig.give_stat_points then
        player:addStatsPoints(eventConfig.give_stat_points)
        player:attachEffectById(9, false)
    end

    if eventConfig.summon_monsters then
        summonMonsters(eventConfig)
    end

      -- Increment sumstorage if defined
    if eventConfig.sumstorage then
        local current = player:getStorageValue(eventConfig.sumstorage)
        if current == -1 then current = 0 end
        player:setStorageValue(eventConfig.sumstorage, current + 1)
    end
    
    -- Mark event as claimed (except for teleport events)
    if not eventConfig.is_teleport then
        player:setStorageValue(item.actionid, 1)
    end

    return true
end

for actionId, _ in pairs(eventConfigs) do
    eventAction:aid(actionId)
end
eventAction:register()
