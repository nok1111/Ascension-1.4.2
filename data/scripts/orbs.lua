-- Orb Reward System with Fixes and Optimizations

local purple_orb = 38572
local green_orb = 38693
local blue_orb = 38694
local yellow_orb = 39941
local orange_orb = 39940

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
    {type = "Gold", itemId = yellow_orb, chance = 70, textcolor = TEXTCOLOR_YELLOW},
    {type = "Loot", itemId = blue_orb, chance = 70, textcolor = TEXTCOLOR_BLUE},
    {type = "Experience", itemId = green_orb, chance = 70, textcolor = TEXTCOLOR_LIGHTGREEN},
    {type = "Death", itemId = purple_orb, chance = 70, textcolor = TEXTCOLOR_PURPLE}
}

local nameVariations = {"[Shadow]", "[Aqua]", "[Volcanic]", "[Sacred]", "[Mighty]", "[Terra]"}

local Monster_orb = CreatureEvent("monsterorb")
function Monster_orb.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
    if not killer or not killer:isPlayer() or creature:getMaster() then return end
    local monsterType = MonsterType(creature:getName())
    if monsterType and monsterType:isBoss() then return end

    local rewardType = rewardTypes[math.random(#rewardTypes)]
    if math.random(100) > rewardType.chance then return end

    local orbPosition = getAdjacentPosition(creature:getPosition())
    local rewardOrb = Game.createItem(rewardType.itemId, 1, orbPosition)

    rewardOrb:setCustomAttribute("ownerId", killer:getId())
    rewardOrb:setCustomAttribute("monsterLevel", creature:getMonsterLevel() or 1)
    rewardOrb:setCustomAttribute("rewardType", rewardType.type)
    if rewardType.type == "Death" then
        rewardOrb:setCustomAttribute("MonsterName", creature:getName())
    end

    orbeffectLoop(orbPosition, rewardType.type, rewardType.textcolor, 10)
    return true
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
    if rewardTypeId == yellow_orb then
        creature:addMoney(monsterLevel * 10)
        creature:sendTextMessage(MESSAGE_INFO_DESCR, "You received " .. (monsterLevel * 10) .. " gold.")
    elseif rewardTypeId == blue_orb then
        local lootTable = {
            {itemId = 39161, minLevel = 1, maxLevel = 10, chance = 100, minAmount = 1, maxAmount = 3},  -- 1-3 valuable pouches
            {itemId = 37763, minLevel = 1, maxLevel = 10, chance = 100, minAmount = 1, maxAmount = 1},  -- always 1 dream feather
            {itemId = 2161, minLevel = 11, maxLevel = 20, chance = 50, minAmount = 2, maxAmount = 5},   -- 2-5 of item 2161
            {itemId = 2162, minLevel = 21, maxLevel = 9999, chance = 10, minAmount = 1, maxAmount = 1}  -- always 1 of item 2162
        }
        for _, loot in ipairs(lootTable) do
            if monsterLevel >= loot.minLevel and monsterLevel <= loot.maxLevel then
                local roll = math.random(1, 100)
                if roll <= loot.chance then
                    local amount = math.random(loot.minAmount, loot.maxAmount)
                    local itemnew = creature:addItem(loot.itemId, amount)
                    creature:sendTextMessage(MESSAGE_INFO_DESCR, "You received a loot item (" .. amount .. "x).")

                    local itemType = ItemType(loot.itemId)
                    if itemType:canHaveItemLevel() then
                        -- 20% chance to be RARE, otherwise COMMON
                        local rarity = "COMMON"
                        if math.random(1, 100) <= 20 then
                            rarity = "RARE"
                        end

                        local weaponType = itemType:getWeaponType()
                        itemnew:setItemLevel(1, true)
                        itemnew:setRarity(rarity)
                        local rarityLevel = itemnew:getRarityId()
                        if weaponType and rarityLevel > 1 then
                            if not itemnew:rollAttribute(creature, itemType, weaponType) then
                                  print("Failed to roll attribute for item: " .. itemnew:getId())
                            end
                        end
                    end
                else
                    creature:sendTextMessage(MESSAGE_INFO_DESCR, "No loot this time.")
                end
                break
            end
        end
    elseif rewardTypeId == green_orb then
        creature:addExperience(monsterLevel * 100)
        creature:sendTextMessage(MESSAGE_INFO_DESCR, "You received " .. (monsterLevel * 100) .. " experience.")
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

-- Register creature events once
local TargetCombatEvent = EventCallback
TargetCombatEvent.onTargetCombat = function(creature, target)
    target:registerEvent("monsterorb")
    target:registerEvent("EliteMonsterCombatHP")
    target:registerEvent("EliteMonsterCombatMana")
    return RETURNVALUE_NOERROR
end
TargetCombatEvent:register()

print(">> Loaded Orb Reward System with Fixes")