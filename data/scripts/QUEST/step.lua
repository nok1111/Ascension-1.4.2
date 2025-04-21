local MONSTER_DESPAWN_TIME = 5 * 60 * 1000

local stepInConfigs = {
    [3001] = {
        required_storage = 5000,
        storage_reward = { id = 5001, value = 1 },
        message = "A surge of energy flows through you, granting you new power!",
        teleportTo = Position(100, 100, 7),
        magiceffect = CONST_ME_ENERGYHIT,
        transform_item = { from = 2160, to = 2152, time = 5000 },
        give_items = { {id = 2160, count = 10} },
        give_stat_points = 5,
        summon_monsters = {
            {name = "Angry Grave Guardian", position = Position(1052, 1342, 7), count = 1}
        },
        is_teleport = true, -- Mark this as a teleport event
        sumstorage = { id = 5002 } -- NEW: Will increment storage 5002 by 1
    },
    [3002] = {
        required_storage = 40077,
        teleportTo = Position(843, 858, 9),
        magiceffect = CONST_ME_MAGIC_BLUE,
        is_teleport = true -- Mark this as a teleport event
    },
    [3003] = {
        teleportTo = Position(814, 868, 9),
        magiceffect = CONST_ME_MAGIC_BLUE,
        is_teleport = true -- Mark this as a teleport event
    },
    [3004] = {
        required_storage = 40081,
        storage_reward = { id = Mainquest.investigateroot, value = 1 },
        message = "A surge of energy flows through you, granting you new power!",
        magiceffect = 205,
        sumstorage = { id = 40082 } -- NEW: Will increment storage 40082 by 1
    },
    [3005] = {
        required_storage = 40095,
        storage_reward = { id = Mainquest.traveledthroughthegate, value = 1 },
        message = "A surge of energy flows through you, granting you new power!",
        teleportTo = Position(871, 625, 9),
        magiceffect = CONST_ME_ENERGYHIT,
        is_teleport = true, -- Mark this as a teleport event
        sumstorage = { id = 40096 } -- NEW: Will increment storage 40096 by 1
    },
    [3006] = {
        magiceffect = CONST_ME_ENERGYHIT,
        sumstorage = { id = Mainquest.unlockdesertboss } -- NEW: Will increment storage 40096 by 1
        sumstorage_message = { -- NEW: Will send message when storage reaches certain values
            [1] = "A faint blue shimmer dances at your feet and vanishes... was that real? (1/5)",
            [2] = "The air crackles with unseen energy. Something is definitely here. (2/5)",
            [3] = "Ghostly symbols flicker beneath your boots! (3/5)",
            [4] = "The energy seems to be vanishing from underneath... (4/5)",
            [5] = "The ancient glyphs ignite! You sense a powerful presence watching... (5/5)",
        }
    },
    [3007] = {
        magiceffect = CONST_ME_ENERGYHIT,
        sumstorage = { id = Mainquest.unlockdesertboss } -- NEW: Will increment storage 40096 by 1
        sumstorage_message = { -- NEW: Will send message when storage reaches certain values
            [1] = "A faint blue shimmer dances at your feet and vanishes... was that real? (1/5)",
            [2] = "The air crackles with unseen energy. Something is definitely here. (2/5)",
            [3] = "Ghostly symbols flicker beneath your boots! (3/5)",
            [4] = "The energy seems to be vanishing from underneath... (4/5)",
            [5] = "The ancient glyphs ignite! You sense a powerful presence watching... (5/5)",
        }
    },
    [3008] = {
        magiceffect = CONST_ME_ENERGYHIT,
        sumstorage = { id = Mainquest.unlockdesertboss } -- NEW: Will increment storage 40096 by 1
        sumstorage_message = { -- NEW: Will send message when storage reaches certain values
            [1] = "A faint blue shimmer dances at your feet and vanishes... was that real? (1/5)",
            [2] = "The air crackles with unseen energy. Something is definitely here. (2/5)",
            [3] = "Ghostly symbols flicker beneath your boots! (3/5)",
            [4] = "The energy seems to be vanishing from underneath... (4/5)",
            [5] = "The ancient glyphs ignite! You sense a powerful presence watching... (5/5)",
        }
    },
    [3009] = {
        magiceffect = CONST_ME_ENERGYHIT,
        sumstorage = { id = Mainquest.unlockdesertboss } -- NEW: Will increment storage 40096 by 1
        sumstorage_message = { -- NEW: Will send message when storage reaches certain values
            [1] = "A faint blue shimmer dances at your feet and vanishes... was that real? (1/5)",
            [2] = "The air crackles with unseen energy. Something is definitely here. (2/5)",
            [3] = "Ghostly symbols flicker beneath your boots! (3/5)",
            [4] = "The energy seems to be vanishing from underneath... (4/5)",
            [5] = "The ancient glyphs ignite! You sense a powerful presence watching... (5/5)",
        }
    },
    [3010] = {
        magiceffect = CONST_ME_ENERGYHIT,
        sumstorage = { id = Mainquest.unlockdesertboss } -- NEW: Will increment storage 40096 by 1
        sumstorage_message = { -- NEW: Will send message when storage reaches certain values
            [1] = "A faint blue shimmer dances at your feet and vanishes... was that real? (1/5)",
            [2] = "The air crackles with unseen energy. Something is definitely here. (2/5)",
            [3] = "Ghostly symbols flicker beneath your boots! (3/5)",
            [4] = "The energy seems to be vanishing from underneath... (4/5)",
            [5] = "The ancient glyphs ignite! You sense a powerful presence watching... (5/5)",
        }
    },
     [3011] = {
        magiceffect = CONST_ME_MAGIC_BLUE,
        is_teleport = true, -- Mark this as a teleport event
        message = "You feel a strange tingling as you cross this area... ",
        minimum_storage = { id = Mainquest.unlockdesertboss, value = 5 }, -- Must have storage 40000 >= 1 to step here
    },
}

-- ... (rest of your existing helper functions remain the same) ...

local stepInEvent = MoveEvent()

function stepInEvent.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then return true end

    local config = stepInConfigs[item.actionid]
    if not config then return true end

    local storagefix = player:getStorageValue(item.actionid)
    if storagefix == -1 or storagefix == nil then
        storagefix = 0
    end

    if config.minimum_storage and player:getStorageValue(config.minimum_storage.id) < config.minimum_storage.value then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A mysterious force prevents you from entering this path.")
        player:teleportTo(fromPosition, true) -- Push back
        fromPosition:sendMagicEffect(CONST_ME_ENERGYAREA)
        return false
    end
    
    if not config.is_teleport and player:getStorageValue(item.actionid) >= 1 then
        return true
    end

    if config.required_storage and player:getStorageValue(config.required_storage) < 1 then
        return true
    end

       -- Handle sumstorage increment and messages
    if config.sumstorage then
        local storageId = config.sumstorage.id
        local currentValue = player:getStorageValue(storageId)
        if currentValue == -1 then currentValue = 0 end
        
        local newValue = currentValue + 1
        player:setStorageValue(storageId, newValue)

        -- NEW: Check for sumstorage messages
        if config.sumstorage_message and config.sumstorage_message[newValue] then
            player:sendExtendedOpcode(76, config.sumstorage_message[newValue])
        end
    end

     if config.storage_reward then
        if player:getStorageValue(config.storage_reward.id) ~= config.storage_reward.value then
            player:setStorageValue(config.storage_reward.id, config.storage_reward.value)
        end
    end

    if config.message then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.message)
    end

    if config.teleportTo then
        player:teleportTo(config.teleportTo)
    end

    if config.magiceffect then
        position:sendMagicEffect(config.magiceffect)
    end

    if config.transform_item then
        local tile = Tile(position)
        if tile then
            local itemToTransform = tile:getItemById(config.transform_item.from)
            if itemToTransform then
                local oldAid = itemToTransform:getActionId()
                itemToTransform:transform(config.transform_item.to)
                itemToTransform:setActionId(0)
                addEvent(restoreItem, config.transform_item.time, position, config.transform_item.from, oldAid)
            end
        end
    end

    if config.give_items then
        for _, entry in ipairs(config.give_items) do
            player:addItem(entry.id, entry.count)
        end
    end

    if config.give_stat_points then
        player:addStatsPoints(config.give_stat_points)
        player:attachEffectById(9, false)
    end

    if config.summon_monsters then
        summonMonsters(config)
    end

    if not config.is_teleport then
        player:setStorageValue(item.actionid, 1)
    end

    return true
end

for aid, _ in pairs(stepInConfigs) do
    stepInEvent:aid(aid)
end

stepInEvent:register()