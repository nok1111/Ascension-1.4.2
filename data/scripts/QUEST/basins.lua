local transformationConfig = {
    [30091] = {nextId = 30092, effect = 13}, 
    [30092] = {nextId = 30093, effect = 14},   
    [30093] = {nextId = 30094, effect = 14},   
    [30094] = {nextId = 30091, effect = 15},    
}

local randomItemIds = {30091, 30092, 30093, 30094} 
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
            end, 15 * 1000) 
        end
    end, 15 * 1000) 

    return true
end

for itemId, _ in pairs(transformationConfig) do
    transformAction:id(itemId)
end

transformAction:register()
