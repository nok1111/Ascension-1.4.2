--TASK_FREE = 0
--TASK_START = 1
--TASK_COMPLETED = 2
--TASK_REWARD_RECEIVED = 3

local doorConfigs = {
    -- [actionId] = {requiredStorage = {id = storageId, value = minValue}, message = "Custom message", transformTo = itemId, effect = CONST_ME_}
    [3500] = {
        requiredStorage = {id = 40037, value = TASK_REWARD_RECEIVED}, -- Requires storage 1000 to be at least 1
        message = "The door is locked by ancient magic.",
        transformTo = 5104, -- Closed door ID (change to your door IDs)
        effect = CONST_ME_MAGIC_BLUE
    },
    [3501] = {
        requiredStorage = {id = 40129, value = TASK_START}, -- Requires storage 1001 to be at least 3
        message = "The door is locked by ancient magic.",
        transformTo = 5104,
        effect = CONST_ME_ENERGYHIT
    },
    [3502] = {
        requiredStorage = {id = 1002, value = 1},
        message = "Only those who have proven their worth may pass.",
        transformTo = 5104,
        effect = CONST_ME_HOLYAREA
    }
}

local magicDoor = Action()

function magicDoor.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local config = doorConfigs[item.actionid]
    if not config then
        return true -- Allow use if no config exists for this actionId
    end

    -- Check if player meets storage requirement
    if player:getStorageValue(config.requiredStorage.id) < config.requiredStorage.value then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.message)
        if config.effect then
            fromPosition:sendMagicEffect(config.effect)
        end
        return false
    end

    -- If we get here, player has the required storage
    if config.transformTo then
        item:transform(config.transformTo)
        addEvent(function(pos, itemId)
            local tile = Tile(pos)
            if tile then
                local door = tile:getItemById(itemId)
                if door then
                    door:transform(itemId - 1) -- Assuming open door is always closed door ID - 1
                end
            end
        end, 5 * 1000, fromPosition, config.transformTo) -- Auto-close after 5 seconds
    end

    return true
end

-- Register all configured doors
for actionId, _ in pairs(doorConfigs) do
    magicDoor:aid(actionId)
end

magicDoor:register()