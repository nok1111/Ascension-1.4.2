

function onCastSpell(creature, var)
    local master = creature:getMaster()
    local pet = master:getPet()
    local owner = creature:getMaster()

    creature:say("papa, poo poo!", TALKTYPE_SAY)
    local level = owner:getPetLevel()
    
    -- Table of items with their IDs and chances based on owner level
    local itemsByLevel = {
        [1] = {{itemId = 8571, chance = 50}, {itemId = 7442, chance = 30}, {itemId = 7445, chance = 20}},
        [2] = {{itemId = 8571, chance = 50}, {itemId = 7442, chance = 30}, {itemId = 7445, chance = 20}},
        [3] = {{itemId = 8571, chance = 65}, {itemId = 7444, chance = 30}, {itemId = 7375, chance = 5}},
        [4] = {{itemId = 8571, chance = 65}, {itemId = 7444, chance = 30}, {itemId = 7375, chance = 5}},
        [5] = {{itemId = 8571, chance = 65}, {itemId = 7444, chance = 30}, {itemId = 7375, chance = 5}},
        [6] = {{itemId = 8571, chance = 65}, {itemId = 7445, chance = 30}, {itemId = 7376, chance = 5}},
        [7] = {{itemId = 8571, chance = 65}, {itemId = 7445, chance = 30}, {itemId = 7376, chance = 5}},
        [8] = {{itemId = 8571, chance = 65}, {itemId = 7445, chance = 30}, {itemId = 7376, chance = 5}},
        [9] = {{itemId = 8571, chance = 65}, {itemId = 7445, chance = 30}, {itemId = 7376, chance = 5}},
        [10] = {{itemId = 8571, chance = 65}, {itemId = 7446, chance = 30}, {itemId = 7377, chance = 5}},
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
