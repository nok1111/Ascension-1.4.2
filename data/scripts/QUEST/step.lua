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
        is_teleport = true -- Mark this as a teleport event
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
    },
    [3005] = {
        required_storage = 40095,
        storage_reward = { id = Mainquest.traveledthroughthegate, value = 1 },
        message = "A surge of energy flows through you, granting you new power!",
        teleportTo = Position(871, 625, 9),
        magiceffect = CONST_ME_ENERGYHIT,
        teleport = true -- Mark this as a teleport event
    },
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

    if not config.is_teleport and player:getStorageValue(item.actionid) >= 1 then
        return true
    end

    if config.required_storage and player:getStorageValue(config.required_storage) < 1 then
        return true
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
