local eventConfigs = {
    [0000] = { -- Sample with all functions
        required_storage = 5000, -- Storage required to activate
        storage_reward = { id = 5001, value = 1 }, -- Storage to be given as a reward
        message = "A surge of energy flows through you, granting you new power!",
        teleportTo = Position(100, 100, 7), -- Optional teleport destination
        magiceffect = CONST_ME_ENERGYHIT, -- Effect on the item position
        transform_item = { from = 2160, to = 2152, time = 5000 }, -- Transform an item (Crystal Coin to Platinum Coin for 5 sec)
    },
    [2001] = { -- Another event example
        required_storage = 40015,
        storage_reward = { id = Mainquest.dwarvenrelic, value = 1 },
        message = "A surge of energy flows through you, granting you new power!",
        magiceffect = CONST_ME_MAGIC_BLUE
    }
}

local function restoreItem(position, itemId)
    local tile = Tile(position)
    if tile then
        local item = tile:getItemById(itemId)
        if not item then
            Game.createItem(itemId, 1, position)
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

    if eventConfig.required_storage and player:getStorageValue(eventConfig.required_storage) ~= 1 then
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
                item:transform(eventConfig.transform_item.to)
                addEvent(restoreItem, eventConfig.transform_item.time, fromPosition, eventConfig.transform_item.from)
            end
        end
    end

    return true
end


for actionId, _ in pairs(eventConfigs) do
    eventAction:aid(actionId)
end
eventAction:register()
