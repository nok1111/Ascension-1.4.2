local rewards = {
    [1] = {{id = 2148, count = 100}, {id = 2152, count = 1}}, -- Gold & platinum coins
    [2] = {{id = 2160, count = 1}}, -- Crystal coin
    [3] = {{id = 6300, count = 1}}, -- Death ring
    [4] = {{id = 6300, count = 1}, {id = 2160, count = 1}} -- Death ring + crystal coin
}

local function getRandomReward()
    local tier = math.random(1, #rewards)
    return rewards[tier]
end

local luckDrops = CreatureEvent("LuckDrops")

function luckDrops.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
    if not creature:isMonster() then return true end
    
    local player = killer
    if not player or not player:isPlayer() then
        player = mostDamageKiller
        if not player or not player:isPlayer() then
            return true
        end
    end
    
    local luckValue = getStatValue(player, "luck")
    if math.random(1000) <= (luckValue * 2.5) then
        local rewardItems = getRandomReward()
        for _, item in ipairs(rewardItems) do
            local itemType = ItemType(item.id)
            if itemType then
                corpse:addItem(item.id, item.count)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your luck has granted you extra loot on the corpse!")
            end
        end
    end
    return true
end

luckDrops:register()
