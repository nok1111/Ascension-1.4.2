

function onCastSpell(creature, var)
    local master = creature:getMaster()
    local pet = master:getPet()
    local owner = creature:getMaster()

    creature:say("cluck cluck!!", TALKTYPE_SAY)
    local level = owner:getPetLevel()
    
    -- Table of items with their IDs and chances based on owner level
    local itemsByLevel = {
        [1] = {{itemId = 2695, chance = 65}, {itemId = 5890, chance = 35}},
        [2] = {{itemId = 2695, chance = 65}, {itemId = 5890, chance = 35}},
        [3] = {{itemId = 2695, chance = 65}, {itemId = 5890, chance = 35}},
        [4] = {{itemId = 2695, chance = 65}, {itemId = 5890, chance = 35}},
        [5] = {{itemId = 2695, chance = 65}, {itemId = 5890, chance = 35}},
        [6] = {{itemId = 2695, chance = 65}, {itemId = 5890, chance = 35}},
        [7] = {{itemId = 2695, chance = 65}, {itemId = 5890, chance = 35}},
        [8] = {{itemId = 2695, chance = 65}, {itemId = 5890, chance = 35}},
        [9] = {{itemId = 2695, chance = 65}, {itemId = 5890, chance = 35}},
        [10] = {{itemId = 2695, chance = 65}, {itemId = 5890, chance = 34}, {itemId = 37908, chance = 1}},
    }
    
    -- Get items based on owner level
    local items = itemsByLevel[level] or {}
    
    -- Randomly select an item based on chances
    local totalChance = 0
    for _, itemInfo in ipairs(items) do
        totalChance = totalChance + itemInfo.chance
    end
    
    local randomNum = math.random(totalChance)
    local selectedItem = nil
    local cumulativeChance = 0
    for _, itemInfo in ipairs(items) do
        cumulativeChance = cumulativeChance + itemInfo.chance
        if randomNum <= cumulativeChance then
            selectedItem = itemInfo.itemId
            break
        end
    end
    
    -- Create the selected item at the creature's position
    if selectedItem then
        Game.createItem(selectedItem, 1, creature:getPosition())
    end
    
    return true
end
