local rewardTypes = {
    {type = "Gold", itemId = 2148, chance = 70},
    {type = "Loot", itemId = 2152, chance = 20},
    {type = "Experience", itemId = 2160, chance = 10},
    {type = "Death", itemId = 9999, chance = 5}  -- Example ID for the death orb
}

local BossDamageModifier = 3.5
local nameVariations = {"[Shadow]", "[Aqua]", "[Volcanic]", "[Sacred]", "[Mighty]", "[Terra]"}

function spawnBoss(creature)
    local monsterId = creature:getId()
    local monsterName = creature:getName()
    
    -- Choose a random variation
    local variation = nameVariations[math.random(#nameVariations)]
    local bossName = monsterName .. " " .. variation
    local boss = Game.createMonster(monsterId, creature:getPosition())
    boss:rename(bossName)  -- Rename the boss with the new name

    if boss then
        boss:setMaxHealth(boss:getMaxHealth() * 2) -- Double the HP
        return boss
    end
    return nil
end

function healthChange.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if creature:isMonster() and (creature:getName():find("%[Shadow%]") or
                                  creature:getName():find("%[Aqua%]") or
                                  creature:getName():find("%[Volcanic%]") or
                                  creature:getName():find("%[Sacred%]") or
                                  creature:getName():find("%[Mighty%]") or
                                  creature:getName():find("%[Terra%]")) then
        local currentDamage = creature:getBaseDamage()
        creature:setBaseDamage(currentDamage * BossDamageModifier)
    end
    return true
end

function manaChange.onManaChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if creature:isMonster() and (creature:getName():find("%[Shadow%]") or
                                  creature:getName():find("%[Aqua%]") or
                                  creature:getName():find("%[Volcanic%]") or
                                  creature:getName():find("%[Sacred%]") or
                                  creature:getName():find("%[Mighty%]") or
                                  creature:getName():find("%[Terra%]")) then
        -- Adjust mana-related behaviors if needed
    end
    return true
end

local collectRewardAction = Action()

function collectRewardAction.onStepIn(player, item, fromPosition, toPosition)
    local ownerId = item:getCustomAttribute("ownerId")
    local monsterLevel = item:getCustomAttribute("monsterLevel")
    
    -- Check if player is owner or in the party
    if player:getId() ~= ownerId and not player:isInParty(ownerId) then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "This reward belongs to someone else.")
        return true
    end
    
    -- Reward logic based on the item type
    local rewardType = item:getCustomAttribute("rewardType")
    if rewardType == "Gold" then
        local rewardAmount = getMonsterLevel() * 10  -- Example formula
        player:addMoney(rewardAmount)
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You received " .. rewardAmount .. " gold.")
    elseif rewardType == "Loot" then
        local lootTable = {
            {itemId = 2160, minLevel = 1, maxLevel = 10},
            {itemId = 2161, minLevel = 11, maxLevel = 20},
            {itemId = 2162, minLevel = 21, maxLevel = 30},
            -- Add more tiers as needed
        }
        -- Logic to select loot based on monster level
        for _, loot in ipairs(lootTable) do
            if monsterLevel >= loot.minLevel and monsterLevel <= loot.maxLevel then
                player:addItem(loot.itemId, 1)
                player:sendTextMessage(MESSAGE_INFO_DESCR, "You received a loot item.")
                break
            end
        end
    elseif rewardType == "Experience" then
        local expAmount = getMonsterLevel() * 100  -- Example formula
        player:addExperience(expAmount)
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You received " .. expAmount .. " experience.")
    elseif rewardType == "Death" then
        local boss = spawnBoss(item)  -- Spawn the stronger version of the creature
        player:sendTextMessage(MESSAGE_INFO_DESCR, "A death orb has summoned a stronger boss!")
    end

    -- Cleanup the orb item after collecting the reward
    item:remove()
    return true
end

collectRewardAction:id(12345)  -- ID of the orb item
collectRewardAction:register()

-- Register creature events
local bossScript = CreatureEvent("BossDamage")
bossScript:onHealthChange(healthChange.onHealthChange)
bossScript:onManaChange(manaChange.onManaChange)
bossScript:register()
