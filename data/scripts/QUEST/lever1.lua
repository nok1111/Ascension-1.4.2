local leverConfigs = {
    [1001] = {
       skipItemsCheck = false, -- Require items validation
        itemsToCheck = {
            { position = Position(548, 765, 8), itemId = 40092 }, 
            { position = Position(548, 771, 8), itemId = 40093 }, 
            { position = Position(559, 782, 8), itemId = 40094 }  
        },
        wallPositions = {
            Position(562, 774, 8),
            Position(562, 775, 8),
            Position(562, 776, 8)
        },
        wallItemId = 3361,
        resetTime = 30 * 60 * 1000,
        message = "The seals are in the correct order and 3 walls collapse revealing a hidden path.",
        storage_reward = { id = Mainquest.threeseals, value = 3 } -- Storage to be given as a reward
    },
    [1002] = {
        skipItemsCheck = true, -- Bypass itemsToCheck validation
        wallPositions = {
            Position(557, 756, 9),
            Position(557, 757, 9)
        },
        wallItemId = 22578,
       -- transformId = 1254, -- Transform this wall ID
        resetTime = 10 * 60 * 1000,
        message = "a hidden path has been discovered."
    },
    [1003] = {
        skipItemsCheck = true, -- Bypass itemsToCheck validation
        wallPositions = {
            Position(14229, 10962, 6),
            Position(14229, 10963, 6),
            Position(14229, 10964, 6)
        },
        wallItemId = 22578,
        resetTime = 30 * 60 * 1000,
        message = "xxxxx"
    },
    [1004] = { -- New lever type that skips items check
        skipItemsCheck = true, -- Bypass itemsToCheck validation
        wallPositions = {
            Position(153, 243, 7)
        },
        wallItemId = 1742,
        transformId = 7525, -- Transform this wall ID
        resetTime = 10 * 60 * 1000,
        message = "xxxxx"
    },
    [1005] = { -- New lever type that skips items check
        skipItemsCheck = true, -- Bypass itemsToCheck validation
        wallPositions = {
            Position(929, 791, 9),
            Position(929, 792, 9),
            Position(929, 793, 9)
        },
        wallItemId = 1546,
        resetTime = 10 * 60 * 1000,
        message = "xxxxx"
    },
    [1006] = { -- eldenmere walls
        skipItemsCheck = true, -- Bypass itemsToCheck validation
        wallPositions = {
            Position(766, 858, 7),
            Position(767, 858, 7)
        },
        wallItemId = 1544,
        resetTime = 2 * 60 * 1000,
        message = "xxxxx"
    },
}

local leverAction = Action()

function leverAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local leverConfig = leverConfigs[item.actionid]
    if not leverConfig then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "This lever is not configured.")
        return true
    end

    -- Check the lever state
    if item.itemid == 1946 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The mechanism is already running.")
        return true
    end

    -- Check if items validation is skipped
    if not leverConfig.skipItemsCheck then
        -- Check if all required items are in their respective positions
        for _, entry in ipairs(leverConfig.itemsToCheck) do
            local tile = Tile(entry.position)
            if not tile or not tile:getItemById(entry.itemId) then
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The lever won't budge; some elements are missing in order to continue.")
                return true
            end
        end
    end

    -- Transform or remove the walls
    for _, wallPosition in ipairs(leverConfig.wallPositions) do
        local wallTile = Tile(wallPosition)
        local wallItem = wallTile and wallTile:getItemById(leverConfig.wallItemId)
        if wallItem then
            if leverConfig.transformId then
                wallItem:transform(leverConfig.transformId)
            else
                wallItem:remove()
            end
        end
    end

    if leverConfig.storage_reward then
        if player:getStorageValue(leverConfig.storage_reward.id) ~= leverConfig.storage_reward.value then
           player:setStorageValue(leverConfig.storage_reward.id, leverConfig.storage_reward.value)
        end       
    end

    if leverConfig.message then
        player:sendExtendedOpcode(76, leverConfig.message)
    else
         player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "As you pull the lever, something happens.")
   
    end
    
    -- Change lever state to 1946
    item:transform(1946)

    -- Schedule reset
    addEvent(function()
        -- Restore the walls
        for _, wallPosition in ipairs(leverConfig.wallPositions) do
            local wallTile = Tile(wallPosition)
            if leverConfig.transformId then
                local wallItem = wallTile and wallTile:getItemById(leverConfig.transformId)
                if wallItem then
                    wallItem:transform(leverConfig.wallItemId)
                end
            else
                Game.createItem(leverConfig.wallItemId, 1, wallPosition)
            end
        end

        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The ancient mechanisms rumble once more as the walls slide back into place, sealing the passage.")

        -- Reset lever state to 1945
        local leverTile = Tile(item:getPosition())
        local lever = leverTile and leverTile:getItemById(1946)
        if lever then
            lever:transform(1945)
        end
    end, leverConfig.resetTime)

    return true
end

for actionId, _ in pairs(leverConfigs) do
    leverAction:aid(actionId)
end

leverAction:register()
