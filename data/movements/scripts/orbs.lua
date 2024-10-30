local purple_orb = 38572
local green_orb = 38693
local blue_orb = 38694
local yellow_orb = 39941
local orange_orb = 39940

function onStepIn(creature, item, position, fromPosition, zoneid)
	if not creature:isPlayer() or creature:isInGhostMode() then
		return true
	end

    local ownerId = item:getCustomAttribute("ownerId")
    local monsterLevel = item:getCustomAttribute("monsterLevel")
	
	print("owner: " .. ownerId)
	print("monster level: " .. monsterLevel)


    
    -- Check if player is owner or in the party
    if creature:getId() ~= ownerId then
	print("wrong owner")
        creature:sendTextMessage(MESSAGE_INFO_DESCR, "This reward belongs to someone else.")
        return true
    end
    
    -- Reward logic based on the item type
    
    if item:getId() == yellow_orb then
	print("gold")
        local rewardAmount = monsterLevel * 10  -- Example formula
        creature:addMoney(rewardAmount)
        creature:sendTextMessage(MESSAGE_INFO_DESCR, "You received " .. rewardAmount .. " gold.")
    elseif item:getId() == blue_orb then
	print("loot")
        local lootTable = {
            {itemId = 2160, minLevel = 1, maxLevel = 10},
            {itemId = 2161, minLevel = 11, maxLevel = 20},
            {itemId = 2162, minLevel = 21, maxLevel = 30},
			{itemId = 2162, minLevel = 31, maxLevel = 9999},
            -- Add more tiers as needed
        }
        -- Logic to select loot based on monster level
        for _, loot in ipairs(lootTable) do
            if monsterLevel >= loot.minLevel and monsterLevel <= loot.maxLevel then
                creature:addItem(loot.itemId, 1)
                creature:sendTextMessage(MESSAGE_INFO_DESCR, "You received a loot item.")
                break
            end
        end
    elseif item:getId() == green_orb then
	print("experience")
        local expAmount = monsterLevel * 100  -- Example formula
        creature:addExperience(expAmount)
        creature:sendTextMessage(MESSAGE_INFO_DESCR, "You received " .. expAmount .. " experience.")
    elseif item:getId() == purple_orb then
	print("death")
			local monsterName = item:getCustomAttribute("MonsterName") 
			-- Choose a random variation
			local variation = nameVariations[math.random(#nameVariations)]
			local bossName = monsterName .. " " .. variation
			local boss = Game.createMonster(monsterName, position)
			boss:setMaxHealth(boss:getMaxHealth() * 2) -- Double the HP
			boss:rename(bossName)  -- Rename the boss with the new name
			boss:registerEvent("hpdamageorbs")
			boss:registerEvent("manadamageorbs")
        creature:sendTextMessage(MESSAGE_INFO_DESCR, "A death orb has summoned a stronger boss!")
	else
	print("no reward type found")
	return true
    end

    -- Cleanup the orb item after collecting the reward
    item:remove()
	return true
end
