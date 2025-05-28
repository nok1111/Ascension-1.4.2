local disenchant = Action()

function disenchant.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Default reward table: itemId, name, base drop chance (in percent)
    print("target", target.itemid)
    local disenchantRewards = {
        
        {itemId = 13215, name = "Arcane Powder", baseChance = 10, minAmount = 1, maxAmount = 3},
        {itemId = 13197, name = "Mystic Powder", baseChance = 9, minAmount = 1, maxAmount = 2},
        {itemId = 33201, name = "Blue Crystal", baseChance = 8, minAmount = 1, maxAmount = 1},
        {itemId = 33203, name = "Green Crystal", baseChance = 7, minAmount = 1, maxAmount = 1},
        {itemId = 35789, name = "Yellow Crystal", baseChance = 6, minAmount = 1, maxAmount = 1},
        {itemId = 33202, name = "Purple Crystal", baseChance = 5, minAmount = 1, maxAmount = 1},
        {itemId = 35788, name = "Red Crystal", baseChance = 4, minAmount = 1, maxAmount = 1},
    }
    -- Individual loot tables for special items
    local specialLootTables = {
        [26170] = {
            {itemId = 35372, name = "Empty Enchanting Rune of Pelagos", baseChance = 50, minAmount = 1, maxAmount = 2},
            {itemId = 35378, name = "Empty Enchanting Rune of Magellan", baseChance = 50, minAmount = 1, maxAmount = 1},
            },
        [26169] = {
            {itemId = 35377, name = "Empty Enchanting Rune of Elysium", baseChance = 70, minAmount = 2, maxAmount = 2},
            {itemId = 35375, name = "Empty Enchanting Rune of Eldric", baseChance = 30, minAmount = 1, maxAmount = 1},
        },
        [26171] = {
            {itemId = 35374, name = "Empty Enchanting Rune of Solstice", baseChance = 75, minAmount = 1, maxAmount = 2},
            {itemId = 35373, name = "Empty Enchanting Rune of Euphoria", baseChance = 25, minAmount = 1, maxAmount = 1},
        }
    }
    -- Rarity multipliers: higher rarity = better drop chances
    local rarityMultipliers = {
        [2] = 1.0,   -- rare
        [3] = 2.0,   -- epic
        unique = 3.0 -- unique
    }

    local rarityLevel = target:getRarityId() or 0
    local isUnique = target.isUnique and target:isUnique() or false

    -- Only allow disenchanting for rarity 2, 3, or unique
    if rarityLevel ~= 2 and rarityLevel ~= 3 and not isUnique then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Only rare, epic, or unique items can be disenchanted!")
        return true
    end

    -- Determine which loot table to use
    local lootTable = disenchantRewards
    local specialTable = specialLootTables[target:getId()]
    if specialTable then
        lootTable = specialTable
    end

    -- Pick multiplier (only for default table)
    local multiplier = rarityMultipliers[rarityLevel] or (isUnique and rarityMultipliers.unique) or 1.0

    local rewardsGiven = {}
    local totalExp = 0
    for _, reward in ipairs(lootTable) do
        -- Only apply rarity multiplier to default table
        local finalChance = reward.baseChance * ((lootTable == disenchantRewards) and multiplier or 1)
        local minAmount = reward.minAmount or 1
        local maxAmount = reward.maxAmount or minAmount
        if math.random(100) <= finalChance then
            local amount = math.random(minAmount, maxAmount)
            player:addItem(reward.itemId, amount)
            -- Calculate profession exp for this loot
            local expGain = math.floor(amount * ((lootTable == disenchantRewards) and multiplier or 1))
            totalExp = totalExp + expGain
            if amount > 1 then
                table.insert(rewardsGiven, reward.name .. " x" .. amount)
            else
                table.insert(rewardsGiven, reward.name)
            end
        end
    end

    if #rewardsGiven > 0 then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You received: " .. table.concat(rewardsGiven, ", "))
        if totalExp > 0 then
            ProfessionSystem:addPoints(player, SKILL_ENCHANTING, totalExp)
        end
    else
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "No rewards this time. Better luck next disenchant!")
    end
    target:remove(1)
    return true
end
disenchant:id(7735)
disenchant:register()