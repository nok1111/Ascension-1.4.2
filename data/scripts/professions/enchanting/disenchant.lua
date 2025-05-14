
local disenchant = Action()

function disenchant.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Reward table: itemId, name, base drop chance (in percent)
    local disenchantRewards = {
        {itemId = 13197, name = "Mystic Powder", baseChance = 10, minAmount = 1, maxAmount = 2},
        {itemId = 33201, name = "Blue Crystal", baseChance = 10, minAmount = 1, maxAmount = 1},
        {itemId = 33203, name = "Green Crystal", baseChance = 8, minAmount = 1, maxAmount = 1},
        {itemId = 35789, name = "Yellow Crystal", baseChance = 6, minAmount = 1, maxAmount = 1},
        {itemId = 33202, name = "Purple Crystal", baseChance = 4, minAmount = 1, maxAmount = 1},
        {itemId = 35788, name = "Red Crystal", baseChance = 2, minAmount = 1, maxAmount = 1},
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

    -- Pick multiplier
    local multiplier = rarityMultipliers[rarityLevel] or (isUnique and rarityMultipliers.unique) or 1.0

    local rewardsGiven = {}
    for _, reward in ipairs(disenchantRewards) do
        local finalChance = reward.baseChance * multiplier
        local minAmount = reward.minAmount or 1
        local maxAmount = reward.maxAmount or minAmount
        if math.random(100) <= finalChance then
            local amount = math.random(minAmount, maxAmount)
            player:addItem(reward.itemId, amount)
            if amount > 1 then
                table.insert(rewardsGiven, reward.name .. " x" .. amount)
            else
                table.insert(rewardsGiven, reward.name)
            end
        end
    end

    if #rewardsGiven > 0 then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You received: " .. table.concat(rewardsGiven, ", "))
        ProfessionSystem:addPoints(player, SKILL_ENCHANTING, amount)
        target:remove(1)
    else
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "No rewards this time. Better luck next disenchant!")
    end
    return true
end
disenchant:id(10944)
disenchant:register()