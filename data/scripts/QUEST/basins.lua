local transformationConfig = {
    [40092] = {nextId = 40093, effect = 13}, 
    [40093] = {nextId = 40094, effect = 14},   
    [40094] = {nextId = 40095, effect = 14},   
    [40095] = {nextId = 40092, effect = 15},    
}

local randomItemIds = {40092, 40093, 40094, 40095} 
local revertEffect = CONST_ME_POFF 

local transformAction = Action()

function transformAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local config = transformationConfig[item.itemid]
    if not config then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "This item cannot be transformed.")
        return true
    end


    fromPosition:sendMagicEffect(config.effect)
    item:transform(config.nextId)

    addEvent(function()
        -- Ensure the item still exists
        local tile = Tile(fromPosition)
        local currentItem = tile and tile:getItemById(config.nextId)
        if currentItem then

            local randomNewItemId = randomItemIds[math.random(#randomItemIds)]


            local randomItemConfig = transformationConfig[randomNewItemId]
            if randomItemConfig then
                fromPosition:sendMagicEffect(randomItemConfig.effect)
            end

            currentItem:transform(randomNewItemId)


            addEvent(function()
                local tile = Tile(fromPosition)
                local itemToRevert = tile and tile:getItemById(randomNewItemId)
                if itemToRevert then

                    fromPosition:sendMagicEffect(revertEffect)

                    itemToRevert:transform(item.itemid)
                end
            end, 60 * 1000) 
        end
    end, 60 * 1000) 

    return true
end

for itemId, _ in pairs(transformationConfig) do
    transformAction:id(itemId)
end

transformAction:register()
