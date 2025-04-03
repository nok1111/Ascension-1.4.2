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
            attacker:addHealth(math.floor(-primaryDamage * 0.25))
            creature:getPosition():sendMagicEffect(CONST_ME_DRAWBLOOD)
        end
    end,

    ["[Sacred]"] = function(attacker, creature, primaryDamage, secondaryDamage)
        if math.random(100) <= 50 then
            creature:getPosition():sendMagicEffect(CONST_ME_HOLYDAMAGE)
            creature:addHealth(-math.floor(creature:getMaxHealth() * 0.03))
            return primaryDamage, secondaryDamage + 30
        end
        return primaryDamage, secondaryDamage
    end,

    ["[Arcane]"] = function(attacker, creature, primaryDamage, secondaryDamage)
    print("arcane")
        if math.random(100) <= 60 and primaryDamage < 0 then
            print("arcane trigered")
            creature:getPosition():sendMagicEffect(619)
            attacker:addMana(math.floor(-primaryDamage * 0.2))
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

    ["[Burning]"] = function(attacker, creature, primaryDamage, secondaryDamage)
        if math.random(100) <= 50 then
            creature:getPosition():sendMagicEffect(CONST_ME_FIREAREA)
            addEvent(function()
                if creature then
                    creature:addHealth(-math.floor(creature:getMaxHealth() * 0.03))
                    creature:getPosition():sendMagicEffect(CONST_ME_FIREATTACK)
                end
            end, 1000)
            return primaryDamage, secondaryDamage + 15
        end
        return primaryDamage, secondaryDamage
    end,

    ["[Shocking]"] = function(attacker, creature)
        if math.random(100) <= 35 then
            creature:getPosition():sendMagicEffect(259)
            creature:addCondition(Condition(CONDITION_DAZZLED, 4))
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
            {itemId = 2160, minLevel = 1, maxLevel = 10},
            {itemId = 2161, minLevel = 11, maxLevel = 20},
            {itemId = 2162, minLevel = 21, maxLevel = 9999}
        }
        for _, loot in ipairs(lootTable) do
            if monsterLevel >= loot.minLevel and monsterLevel <= loot.maxLevel then
                creature:addItem(loot.itemId, 1)
                creature:sendTextMessage(MESSAGE_INFO_DESCR, "You received a loot item.")
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