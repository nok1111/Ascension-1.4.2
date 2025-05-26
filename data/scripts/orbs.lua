-- Orb Reward System with Fixes and Optimizations

local purple_orb = 38572
local green_orb = 38693
local blue_orb = 38694
local yellow_orb = 39941
local orange_orb = 39940

local purpleorbstorage = 999899


local directions = {
    {x = 1, y = 0, z = 0},   -- East
    {x = -1, y = 0, z = 0},  -- West
    {x = 0, y = -1, z = 0},  -- North
    {x = 0, y = 1, z = 0}    -- South
}

function getAdjacentPosition(pos)
    local shuffled = {}
    for i = 1, #directions do
        shuffled[i] = directions[i]
    end
    -- Fisher-Yates shuffle
    for i = #shuffled, 2, -1 do
        local j = math.random(i)
        shuffled[i], shuffled[j] = shuffled[j], shuffled[i]
    end

    for _, dir in ipairs(shuffled) do
        local testPos = Position(pos.x + dir.x, pos.y + dir.y, pos.z)
        local tile = Tile(testPos)
        if tile and not tile:hasFlag(TILESTATE_BLOCKSOLID) then
            return testPos
        end
    end
    return pos -- fallback to center
end

local function orbeffectLoop(position, text, color, loops)
    if loops <= 0 then return end
    local orbIds = {purple_orb, green_orb, blue_orb, yellow_orb, orange_orb}
    for _, id in ipairs(orbIds) do
        if Tile(position):getItemById(id) then
            Game.sendAnimatedText(text .. " Orb", position, color)
            addEvent(orbeffectLoop, 1000, position, text, color, loops - 1)
            return
        end
    end
end

local rewardTypes = {
    {type = "Gold", itemId = yellow_orb, chance = 15, textcolor = TEXTCOLOR_YELLOW},
    {type = "Loot", itemId = blue_orb, chance = 8, textcolor = TEXTCOLOR_BLUE},
    {type = "Experience", itemId = green_orb, chance = 10, textcolor = TEXTCOLOR_LIGHTGREEN},
    {type = "Death", itemId = purple_orb, chance = 50, textcolor = TEXTCOLOR_PURPLE}
}

local nameVariations = {"[Shadow]", "[Aqua]", "[Volcanic]", "[Sacred]", "[Mighty]", "[Terra]"}

local Monster_orb = CreatureEvent("monsterorb")
function Monster_orb.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
    print("Orb")
    if not killer or not killer:isPlayer() or creature:getMaster() and  creature:getMonsterLevel() and  creature:getMonsterLevel() < 1 then return end
    local monsterType = MonsterType(creature:getName())
    if monsterType and monsterType:isBoss() then return end
    

    if creature:getStorageValue(purpleorbstorage) == 1 then
        -- Place each orb at a unique adjacent position if possible
        print("Purple Orb")

        local yelloworb = Game.createItem(yellow_orb, 1, getAdjacentPosition(creature:getPosition()))
        local blueorb = Game.createItem(blue_orb, 1, getAdjacentPosition(creature:getPosition()))
        local greenorb = Game.createItem(green_orb, 1, getAdjacentPosition(creature:getPosition()))

        if yelloworb then 
            yelloworb:setCustomAttribute("ownerId", killer:getId())
            yelloworb:setCustomAttribute("monsterLevel", creature:getMonsterLevel() or 1)
            yelloworb:setCustomAttribute("rewardType", "Gold")
            orbeffectLoop(yelloworb:getPosition(), "Gold", TEXTCOLOR_YELLOW, 10)
        end

        if blueorb then 
            blueorb:setCustomAttribute("ownerId", killer:getId())
            blueorb:setCustomAttribute("monsterLevel", creature:getMonsterLevel() or 1)
            blueorb:setCustomAttribute("rewardType", "Loot")
            orbeffectLoop(blueorb:getPosition(), "Loot", TEXTCOLOR_BLUE, 10)
        end
        
        if greenorb then 
            greenorb:setCustomAttribute("ownerId", killer:getId())
            greenorb:setCustomAttribute("monsterLevel", creature:getMonsterLevel() or 1)
            greenorb:setCustomAttribute("rewardType", "Experience")
            orbeffectLoop(greenorb:getPosition(), "Experience", TEXTCOLOR_LIGHTGREEN, 10)
        end
        return true
    end

    

    for _, rewardType in ipairs(rewardTypes) do
        local mathrandom = math.random(100)
        print("mathrandom", mathrandom)
        print("rewardType.chance", rewardType.chance)
        if mathrandom <= rewardType.chance then
            local orbPosition = getAdjacentPosition(creature:getPosition())
            local rewardOrb = Game.createItem(rewardType.itemId, 1, orbPosition)
            rewardOrb:setCustomAttribute("ownerId", killer:getId())
            rewardOrb:setCustomAttribute("monsterLevel", creature:getMonsterLevel() or 1)
            rewardOrb:setCustomAttribute("rewardType", rewardType.type)
            if rewardType.type == "Death" then
                rewardOrb:setCustomAttribute("MonsterName", creature:getName())
            end
            orbeffectLoop(orbPosition, rewardType.type, rewardType.textcolor, 10)
            droppedAny = true
        end
    end
    if droppedAny then return true end
end
Monster_orb:register()

local explosiveArea = createCombatArea({
    {1, 1, 1},
    {1, 3, 1},
    {1, 1, 1}
})


local eliteBehaviors = {
    ["[Vampiric]"] = function(attacker, creature, primaryDamage)
    if primaryDamage < 0 and math.random(100) <= 70 then
        local healed = math.floor(-primaryDamage * 0.25)
        doSendDistanceShoot(attacker:getPosition(), creature:getPosition(), 83)
        attacker:getPosition():sendMagicEffect(438)
        attacker:addHealth(healed)
        creature:getPosition():sendMagicEffect(305)
        print("[Vampiric] Healed", attacker:getName(), "for", healed)
    end
end,

   ["[Sacred]"] = function(attacker, creature, primaryDamage, secondaryDamage)
    if math.random(100) <= 50 then
        local nearby = Game.getSpectators(creature:getPosition(), false, true, 5, 5, 5, 5)
        local candidates = {}

        for _, target in ipairs(nearby) do
            if target:isPlayer() and target ~= creature then
                table.insert(candidates, target)
            end
        end

        if #candidates == 0 then return primaryDamage, secondaryDamage end

        local selected = candidates[math.random(#candidates)]
        local pos = selected:getPosition()
        pos:sendMagicEffect(CONST_ME_HOLYDAMAGE) -- warning effect

        local creatureId = creature:getId()

        addEvent(function()
            local caster = Creature(creatureId)
            if not caster or not caster:isMonster() then return end

            -- Always show the holy effect in the area
            doAreaCombatHealth(caster, COMBAT_HOLYDAMAGE, pos, explosiveArea, 0, 0, CONST_ME_HOLYAREA)

            local affected = Game.getSpectators(pos, false, true, 1, 1, 1, 1)
            local landed = false
            for _, target in ipairs(affected) do
                if target:isPlayer() then
                    local dmg = math.floor(target:getMaxHealth() * 0.05)
                    target:addHealth(-dmg)
                    print("[Sacred] Holy blast hit", target:getName(), "for", dmg)
                    landed = true
                end
            end

            if landed then
                local heal = math.floor(caster:getMaxHealth() * 0.25)
                caster:addHealth(heal)
                caster:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
                print("[Sacred] Healed", caster:getName(), "for", heal)
            end
        end, 1500)
    end  

    return primaryDamage, secondaryDamage
end,




    ["[Arcane]"] = function(attacker, creature, primaryDamage, secondaryDamage)
    if primaryDamage < 0 and math.random(100) <= 35 then
        local nearby = Game.getSpectators(creature:getPosition(), false, true, 5, 5, 5, 5)
        local targets = {}

        for _, target in ipairs(nearby) do
            if target ~= creature and (target:isPlayer()) then
                table.insert(targets, target)
            end
        end

        if #targets == 0 then return primaryDamage, secondaryDamage end

        local chosen = targets[math.random(#targets)]
        local targetPos = chosen:getPosition()

        -- Try to teleport to adjacent walkable tile
        local directions = {
            {x = 1, y = 0}, {x = -1, y = 0},
            {x = 0, y = 1}, {x = 0, y = -1},
            {x = 1, y = 1}, {x = -1, y = -1},
            {x = 1, y = -1}, {x = -1, y = 1}
        }

        local dest = nil
        for _, offset in ipairs(directions) do
            local pos = Position(targetPos.x + offset.x, targetPos.y + offset.y, targetPos.z)
            local tile = Tile(pos)
            if tile and not tile:hasFlag(TILESTATE_BLOCKSOLID) then
                dest = pos
                break
            end
        end

        if dest then
            creature:teleportTo(dest)
            dest:sendMagicEffect(CONST_ME_TELEPORT)

            local cid = creature:getId()
            addEvent(function()
                local caster = Creature(cid)
                if not caster or not caster:isMonster() then return end

                doAreaCombatHealth(caster, COMBAT_ENERGYDAMAGE, caster:getPosition(), explosiveArea, -50, -100, 677)
            end, 1000)
        end
    end

    return primaryDamage, secondaryDamage
end,


    ["[Corrosive]"] = function(attacker, creature, primaryDamage, secondaryDamage)
        if math.random(100) <= 40 and primaryDamage < 0 then
            creature:getPosition():sendMagicEffect(CONST_ME_GREEN_RINGS)
            creature:addHealth(-math.floor(creature:getMaxHealth() * 0.02))
            return primaryDamage, secondaryDamage
        end
        return primaryDamage, secondaryDamage
    end,

    ["[Frostbound]"] = function(attacker, creature)
        if math.random(100) <= 30 then
            creature:getPosition():sendMagicEffect(CONST_ME_ICEATTACK)
            if creature:isPlayer() then
                creature:addCondition(Condition(CONDITION_PARALYZE, 4))
            end
        end
    end,

    ["[Plagued]"] = function(attacker, creature)
        if math.random(100) <= 40 then
            creature:getPosition():sendMagicEffect(CONST_ME_POISONAREA)
            creature:addCondition(Condition(CONDITION_POISON, 4))
        end
    end,

   ["[Burning]"] = function(attacker, creature, primaryDamage)
    if math.random(100) <= 40 and creature then
        local originPos = creature:getPosition()
        local targets = Game.getSpectators(originPos, false, true, 3, 3, 3, 3)
        local burned = {}

        -- Main fire missile to the attacker
        doSendDistanceShoot(originPos, attacker:getPosition(), CONST_ANI_FIRE)
        attacker:getPosition():sendMagicEffect(CONST_ME_HITBYFIRE)
        table.insert(burned, attacker)

        -- Fire missiles from attacker to nearby targets
        local nearby = Game.getSpectators(attacker:getPosition(), false, true, 3, 3, 3, 3)
        for _, target in ipairs(nearby) do
            if target ~= creature and target ~= attacker and (target:isMonster() or target:isPlayer()) then
                doSendDistanceShoot(attacker:getPosition(), target:getPosition(), CONST_ANI_FIRE)
                target:getPosition():sendMagicEffect(CONST_ME_HITBYFIRE)
                table.insert(burned, target)
            end
        end

            -- Apply burning condition to all affected targets
            for _, target in ipairs(burned) do
                local burn = Condition(CONDITION_FIRE)
                burn:setTicks(3000) -- 3 seconds
                burn:setParameter(CONDITION_PARAM_PERIODICDAMAGE, -math.floor(target:getMaxHealth() * 0.03)) -- 3% max hp
                burn:setParameter(CONDITION_PARAM_TICKINTERVAL, 1000)
                burn:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
                target:addCondition(burn)
                print("[Burning] Applied burn to " .. target:getName())
            end
        end
    end,


    ["[Shocking]"] = function(attacker, creature)
    if math.random(100) <= 35 then
        local center = creature:getPosition()
        --center:sendMagicEffect(259)

        local targets = Game.getSpectators(center, false, true, 3, 3, 3, 3)
        for _, target in ipairs(targets) do
            if target ~= creature and (target:isPlayer() or (target:isMonster() and target:getMaster() and target:getMaster():isPlayer())) then
                doSendDistanceShoot(center, target:getPosition(), 143)
                target:getPosition():sendMagicEffect(419)
                local dmg = math.floor(target:getMaxHealth() * 0.06)
                print("[Shocking] Hit", target:getName(), "for", dmg, "damage.")
                target:addHealth(-dmg)
            end
        end

        local condition = Condition(CONDITION_DAZZLED)
        condition:setTicks(4000)
        creature:addCondition(condition)
    end
end,


    ["[Leeching]"] = function(attacker, creature, primaryDamage)
        if primaryDamage < 0 and math.random(100) <= 65 then
            attacker:addHealth(math.floor(-primaryDamage * 0.15))
            attacker:addMana(math.floor(-primaryDamage * 0.15))
            creature:getPosition():sendMagicEffect(517)
        end
    end,

    ["[Reaper]"] = function(attacker, creature, primaryDamage)
        if creature:getHealthPercent() < 50 and math.random(100) <= 80 then
            creature:getPosition():sendMagicEffect(CONST_ME_MORTAREA)
            return math.floor(primaryDamage * 1.4)
        end
        return primaryDamage
    end,

    ["[Bulwark]"] = function(attacker, creature, primaryDamage)
        if primaryDamage < 0 and math.random(100) <= 50 then
            creature:getPosition():sendMagicEffect(340)
            doTargetCombatHealth(creature, attacker, COMBAT_PHYSICALDAMAGE,
                math.floor(-primaryDamage * 0.1),
                math.floor(-primaryDamage * 0.15),
                573)
        end
    end,

    ["[Juggernaut]"] = function(attacker, creature, primaryDamage)
        if primaryDamage < 0 and math.random(100) <= 90 then
            creature:getPosition():sendMagicEffect(10)
            return math.floor(primaryDamage * 1.4)
        end
        return primaryDamage
    end,

    ["[Unholy]"] = function(attacker, creature, primaryDamage, secondaryDamage)
        if math.random(100) <= 60 and primaryDamage < 0 then
            creature:getPosition():sendMagicEffect(678)
            creature:addHealth(-math.floor(creature:getMaxHealth() * 0.05))
            return primaryDamage, secondaryDamage + 50
        end
        return primaryDamage, secondaryDamage
    end,

     ["[Explosive]"] = function(attacker, creature)
    if math.random(100) <= 45 then
        local pos = creature:getPosition()
        pos:sendMagicEffect(5)
        addEvent(function()
            if creature and creature:isCreature() then
                pos:sendMagicEffect(CONST_ME_EXPLOSIONAREA)
                doAreaCombatHealth(attacker, COMBAT_FIREDAMAGE, pos, explosiveArea,
                    -math.floor(creature:getMaxHealth() * 0.05),
                    -math.floor(creature:getMaxHealth() * 0.1),
                    CONST_ME_FIREAREA)
            end
        end, 1000)
    end
end
}

-- Elite Variations Table
local eliteVariations = {
    {name = "[Vampiric]",    storage = MonsterStorage.Vampiric,    shader = "Blood Leech"},
    {name = "[Sacred]",      storage = MonsterStorage.Sacred,      shader = "Divine Shine"},
    {name = "[Arcane]",      storage = MonsterStorage.Arcane,      shader = "Arcane Pulse"},
    {name = "[Corrosive]",   storage = MonsterStorage.Corrosive,   shader = "Toxic Mist"},
    {name = "[Frostbound]",  storage = MonsterStorage.Frostbound,  shader = "Frost Cloak"},
    {name = "[Plagued]",     storage = MonsterStorage.Plagued,     shader = "Sickly Aura"},
    {name = "[Burning]",     storage = MonsterStorage.Burning,     shader = "Flame Skin"},
    {name = "[Shocking]",    storage = MonsterStorage.Shocking,    shader = "Spark Field"},
    {name = "[Leeching]",    storage = MonsterStorage.Leeching,    shader = "Mana Drain"},
    {name = "[Reaper]",      storage = MonsterStorage.Reaper,      shader = "Death Mark"},
    {name = "[Bulwark]",     storage = MonsterStorage.Bulwark,     shader = "Reflect Armor"},
    {name = "[Juggernaut]",  storage = MonsterStorage.Juggernaut,  shader = "Stone Hide"},
    {name = "[Unholy]",      storage = MonsterStorage.Unholy,      shader = "Death Veil"},
    {name = "[Explosive]",   storage = MonsterStorage.Explosive,   shader = "Volatile Core"}
}


local function modifyDamage(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if not attacker or not attacker:isMonster() then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    for _, variation in ipairs(eliteVariations) do
        if attacker:getStorageValue(variation.storage) == 1 then
            local behavior = eliteBehaviors[variation.name]
            if behavior then
                local newPrimary, newSecondary = behavior(attacker, creature, primaryDamage, secondaryDamage)
                if newPrimary then primaryDamage = newPrimary end
                if newSecondary then secondaryDamage = newSecondary end
            end
            break
        end
    end

    return primaryDamage, primaryType, secondaryDamage, secondaryType
end


local eliteCombatHp = CreatureEvent("EliteMonsterCombatHP")
function eliteCombatHp.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    return modifyDamage(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
end
eliteCombatHp:register()

local eliteCombatMana = CreatureEvent("EliteMonsterCombatMana")
function eliteCombatMana.onManaChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    return modifyDamage(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
end
eliteCombatMana:register()

-- Step In Orb Collection
local StepOnOrb = MoveEvent()
StepOnOrb:type("stepin")
function StepOnOrb.onStepIn(creature, item, position, fromPosition)
    if not creature:isPlayer() or creature:isInGhostMode() then return true end

    local ownerId = item:getCustomAttribute("ownerId")
    local monsterLevel = item:getCustomAttribute("monsterLevel") or 1
    if creature:getId() ~= ownerId then
        creature:sendTextMessage(MESSAGE_INFO_DESCR, "This reward belongs to someone else.")
        return true
    end

    local rewardTypeId = item:getId()
    --YELLOW ORB HERE
    if rewardTypeId == yellow_orb then
        creature:addMoney(monsterLevel * 10)
        creature:sendTextMessage(MESSAGE_INFO_DESCR, "You received " .. (monsterLevel * 10) .. " gold.")
    --BLUE ORB HERE
    elseif rewardTypeId == blue_orb then
        local lootTable = {
            {itemId = 39161, minLevel = 1, maxLevel = 1000, chance = 100, minAmount = 1, maxAmount = 3},  -- valuable pouches
            {itemId = 37763, minLevel = 1, maxLevel = 1000, chance = 100, minAmount = 1, maxAmount = 1},  -- dream feather

            --one handed
            {itemId = 32789, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},   
            {itemId = 36358, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  
            {itemId = 36362, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  
            {itemId = 2403, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  

            --two handed
            {itemId = 2397, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},   
            {itemId = 23544, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  
            {itemId = 36381, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  

            --wands
            {itemId = 2182, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},   
            {itemId = 2181, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  
            {itemId = 2190, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  

            --bows
            {itemId = 31919, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},   
            {itemId = 32058, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},
            {itemId = 36242, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  

            --shields
            {itemId = 2541, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},   
            {itemId = 36241, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  
            {itemId = 36389, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  

            --orbs
            {itemId = 2511, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},   
            {itemId = 32723, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  
            {itemId = 2509, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  
            {itemId = 32721, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  


            --helms
            {itemId = 36251, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},   
            {itemId = 2462, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  
            {itemId = 2662, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  
            {itemId = 36193, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  
            {itemId = 36355, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  
            {itemId = 2501, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  
            --boots
            {itemId = 31879, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},   
            {itemId = 31890, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  
            --armor
            {itemId = 32859, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},   
            {itemId = 32867, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  
            {itemId = 36357, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  
            {itemId = 32863, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  
            {itemId = 32865, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  

            --legs
            {itemId = 32873, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},   
            {itemId = 2477, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  
            {itemId = 2488, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  
            {itemId = 2648, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  

            --ring
            {itemId = 38323, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},   
            {itemId = 38325, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  
            {itemId = 38324, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},
            {itemId = 38326, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},
            {itemId = 38331, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},
            {itemId = 38332, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},

            --global rings
            {itemId = 2164, minLevel = 11, maxLevel = 9999, chance = 10, minAmount = 1, maxAmount = 1},   -- item 2161
            {itemId = 2165, minLevel = 11, maxLevel = 9999, chance = 10, minAmount = 1, maxAmount = 1},  -- item 2162
            {itemId = 2166, minLevel = 11, maxLevel = 9999, chance = 10, minAmount = 1, maxAmount = 1},  -- item 2162
            {itemId = 2167, minLevel = 11, maxLevel = 9999, chance = 10, minAmount = 1, maxAmount = 1},  -- item 2162
            {itemId = 2168, minLevel = 11, maxLevel = 9999, chance = 10, minAmount = 1, maxAmount = 1},  -- item 2162
            {itemId = 2169, minLevel = 11, maxLevel = 9999, chance = 10, minAmount = 1, maxAmount = 1},  -- item 2162
            {itemId = 2207, minLevel = 11, maxLevel = 9999, chance = 10, minAmount = 1, maxAmount = 1},  -- item 2162
            {itemId = 2208, minLevel = 11, maxLevel = 9999, chance = 10, minAmount = 1, maxAmount = 1},  -- item 2162
            {itemId = 2209, minLevel = 11, maxLevel = 9999, chance = 10, minAmount = 1, maxAmount = 1},  -- item 2162
            {itemId = 2213, minLevel = 11, maxLevel = 9999, chance = 10, minAmount = 1, maxAmount = 1},  -- item 2162
            {itemId = 2214, minLevel = 11, maxLevel = 9999, chance = 10, minAmount = 1, maxAmount = 1},  -- item 2162

            --amulet
            {itemId = 38296, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},   -- item 2161
            {itemId = 38291, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  -- item 2162
            {itemId = 38293, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  -- item 2162
            {itemId = 38294, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  -- item 2162
            {itemId = 38295, minLevel = 11, maxLevel = 100, chance = 10, minAmount = 1, maxAmount = 1},  -- item 2162

    
        }
        -- Gather all eligible loot for this monster level
        local eligibleLoot = {}
        for _, loot in ipairs(lootTable) do
            if monsterLevel >= loot.minLevel and monsterLevel <= loot.maxLevel then
                table.insert(eligibleLoot, loot)
            end
        end

        -- Shuffle eligible loot to randomize order
        for i = #eligibleLoot, 2, -1 do
            local j = math.random(i)
            eligibleLoot[i], eligibleLoot[j] = eligibleLoot[j], eligibleLoot[i]
        end

        local drops = 0
        local maxDrops = 4
        for _, loot in ipairs(eligibleLoot) do
            if drops >= maxDrops then break end
            local roll = math.random(1, 100)
            if roll <= loot.chance then
                local amount = math.random(loot.minAmount, loot.maxAmount)
                local itemnew = creature:addItem(loot.itemId, amount)
                creature:sendTextMessage(MESSAGE_INFO_DESCR, "You received a loot item (" .. amount .. "x).")

                local itemType = ItemType(loot.itemId)             
                if itemType and itemType:canHaveItemLevel() then
                    -- 20% chance to be RARE, otherwise COMMON
                    local rarity = COMMON
                    if math.random(1, 100) <= 20 then
                        rarity = RARE
                    end

                    itemnew:setItemLevel(1, true)
                    itemnew:setRarity(rarity)
                    
                    

                    local rarityLevel = itemnew:getRarityId()
                    local weaponType = itemType:getWeaponType()
                    if rarityLevel > 1 then
                        if not itemnew:rollAttribute(creature, itemType, weaponType) then
                              print("Failed to roll attribute for item: " .. itemnew:getId())
                        end
                    end
                end
                drops = drops + 1
            end
        end
        if drops == 0 then
            creature:sendTextMessage(MESSAGE_INFO_DESCR, "No loot this time.")
        end
    --GREEN ORB HERE
    elseif rewardTypeId == green_orb then
        creature:addExperience(monsterLevel * 100)
        creature:sendTextMessage(MESSAGE_INFO_DESCR, "You received " .. (monsterLevel * 100) .. " experience.")
    --PURPLE ORB HERE
    elseif rewardTypeId == purple_orb then
        local monsterName = item:getCustomAttribute("MonsterName")
        local variation = eliteVariations[math.random(#eliteVariations)]
        local bossName = monsterName .. " " .. variation.name
        local boss = Game.createMonster(monsterName, position, true)
        if boss then
            boss:setMaxHealth(boss:getMaxHealth() * 2)
            boss:addHealth(boss:getMaxHealth())
            boss:rename(bossName)
            boss:setStorageValue(variation.storage, 1)
            boss:setStorageValue(purpleorbstorage, 1)
            boss:setShader(variation.shader)
            boss:attachEffectById(9, true)
            boss:attachEffectById(25, true)
            boss:attachEffectById(26, true)
        end
        creature:sendTextMessage(MESSAGE_INFO_DESCR, "A death orb has summoned a stronger boss!")
    end

    item:remove()
    return true
end
StepOnOrb:id(38572,38693,38694,39940,39941)
StepOnOrb:register()

local TargetCombatEventOrb = EventCallback
TargetCombatEventOrb.onTargetCombat = function(creature, target)

    return RETURNVALUE_NOERROR
end
TargetCombatEventOrb:register()

print(">> Loaded Orb Reward System")