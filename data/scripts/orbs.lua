local purple_orb = 38572
local green_orb = 38693
local blue_orb = 38694
local yellow_orb = 39941
local orange_orb = 39940


--38572,38693,38694,39940,39941

local directions = {
    {x = 1, y = 0, z = 0},   -- East
    {x = -1, y = 0, z = 0},  -- West
    {x = 0, y = -1, z = 0},  -- North
    {x = 0, y = 1, z = 0}    -- South
}

function getAdjacentPosition(pos)
    local dir = directions[math.random(#directions)]
    return Position(pos.x + dir.x, pos.y + dir.y, pos.z)
end

local function orbeffectLoop(position, text, color)
    local bagIds = {purple_orb, green_orb, blue_orb, yellow_orb, orange_orb}
    local active = false
    for _, bag in ipairs(bagIds) do
        local lootBag = Tile(position):getItemById(bag)
        if lootBag then
            active = true
            break
        end
    end
    if active then
		Game.sendAnimatedText(text .. " Orb", position, color)
        addEvent(orbeffectLoop, 1000, position, text, color)
    end
end

local rewardTypes = {
    {type = "Gold", itemId = yellow_orb, chance = 70, textcolor = TEXTCOLOR_YELLOW},
    {type = "Loot", itemId = blue_orb, chance = 70, textcolor = TEXTCOLOR_BLUE},
    {type = "Experience", itemId = green_orb, chance = 70, textcolor = TEXTCOLOR_LIGHTGREEN},
    {type = "Death", itemId = purple_orb, chance = 70, textcolor = TEXTCOLOR_PURPLE}  -- Example ID for the death orb
}

local BossDamageModifier = 3.5
local nameVariations = {"[Shadow]", "[Aqua]", "[Volcanic]", "[Sacred]", "[Mighty]", "[Terra]"}


local Monster_orb = CreatureEvent("monsterorb")

function Monster_orb.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
print("death start")
    if math.random(100) <= rewardTypes[#rewardTypes].chance then
        local rewardType = rewardTypes[math.random(#rewardTypes)]
       local orbPosition = getAdjacentPosition(creature:getPosition())
		local rewardOrb = Game.createItem(rewardType.itemId, 1, orbPosition)
        rewardOrb:setCustomAttribute("ownerId", killer:getId())
        rewardOrb:setCustomAttribute("monsterLevel", creature:getMonsterLevel())
        rewardOrb:setCustomAttribute("rewardType", rewardType.type)
print("death of monster")
        if rewardType.type == "Death" then
           
		  rewardOrb:setCustomAttribute("MonsterName", creature:getName()) 
		   
        end
		orbeffectLoop(orbPosition, rewardType.type, rewardType.textcolor)
        --Game.createAnimatedText(rewardOrb:getPosition(), rewardType.type .. " Orb", TEXTCOLOR_YELLOW)
		
    end
    return true
end

Monster_orb:register()

local healthChange = CreatureEvent("hpdamageorbs")

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

local manaChange = CreatureEvent("manadamageorbs")
function manaChange.onManaChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if creature:isMonster() and (creature:getName():find("%[Shadow%]") or
                                  creature:getName():find("%[Aqua%]") or
                                  creature:getName():find("%[Volcanic%]") or
                                  creature:getName():find("%[Sacred%]") or
                                  creature:getName():find("%[Mighty%]") or
                                  creature:getName():find("%[Terra%]")) then
        -- might change this later
    end
    return true
end

local StepOnOrb = MoveEvent()
StepOnOrb:type("stepin")

function StepOnOrb.onStepIn(creature, item, position, fromPosition)
  	if not creature:isPlayer() or creature:isInGhostMode() then
		return true
	end

    local ownerId = item:getCustomAttribute("ownerId")
    local monsterLevel = item:getCustomAttribute("monsterLevel")
	
	print("owner: " .. ownerId)
	print("monster level: " .. monsterLevel)


    
    -- Check if player is owner
    if creature:getId() ~= ownerId then
	print("wrong owner")
        creature:sendTextMessage(MESSAGE_INFO_DESCR, "This reward belongs to someone else.")
        return true
    end
    
    -- Reward logic based on the item type  results
    
    if item:getId() == yellow_orb then
	print("gold")
        local rewardAmount = monsterLevel * 10  -- gold formula
        creature:addMoney(rewardAmount)
        creature:sendTextMessage(MESSAGE_INFO_DESCR, "You received " .. rewardAmount .. " gold.")
		
		
    elseif item:getId() == blue_orb then
	print("loot")
        local lootTable = {
            {itemId = 2160, minLevel = 1, maxLevel = 10},
            {itemId = 2161, minLevel = 11, maxLevel = 20},
            {itemId = 2162, minLevel = 21, maxLevel = 30},
			{itemId = 2162, minLevel = 31, maxLevel = 9999},
            -- Add more items for loot orb
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
        local expAmount = monsterLevel * 100  -- experience formula
        creature:addExperience(expAmount)
        creature:sendTextMessage(MESSAGE_INFO_DESCR, "You received " .. expAmount .. " experience.")
		
		
		
    elseif item:getId() == purple_orb then
	print("death")
			local monsterName = item:getCustomAttribute("MonsterName") 
			-- Choose a random variation
			local variation = nameVariations[math.random(#nameVariations)]
			local bossName = monsterName .. " " .. variation
			local boss = Game.createMonster(monsterName, position)
			
			
			--shders locals
			local RedShader = "Monster Might"
			--end
			
			boss:setMaxHealth(boss:getMaxHealth() * 2) -- Double the HP
			boss:addHealth(boss:getMaxHealth() * 2)
			boss:rename(bossName)  -- Rename the boss with the new name
			boss:registerEvent("hpdamageorbs")
			boss:registerEvent("manadamageorbs")
			boss:setShader(RedShader)
			boss:attachEffectById(9, true)
			boss:attachEffectById(25, true)
			boss:attachEffectById(26, true)
			
			creature:sendTextMessage(MESSAGE_INFO_DESCR, "A death orb has summoned a stronger boss!")
	else
	print("no reward type found")
	return true
    end

    -- Cleanup the orb item after collecting the reward
    item:remove()
	return true
end

StepOnOrb:id(38572,38693,38694,39940,39941)  -- ID of the orb item
StepOnOrb:register()


local TargetCombatEvent = EventCallback
TargetCombatEvent.onTargetCombat = function(creature, target)
    target:registerEvent("monsterorb")
    return RETURNVALUE_NOERROR
end
TargetCombatEvent:register()

print(">> Loading Orbs")