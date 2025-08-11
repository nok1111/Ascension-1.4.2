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
    {type = "Gold", itemId = yellow_orb, chance = 8, textcolor = TEXTCOLOR_YELLOW},
    {type = "Loot", itemId = blue_orb, chance = 6, textcolor = TEXTCOLOR_BLUE},
    {type = "Experience", itemId = green_orb, chance = 5, textcolor = TEXTCOLOR_LIGHTGREEN},
    {type = "Death", itemId = purple_orb, chance = 20, textcolor = TEXTCOLOR_PURPLE}
}

local nameVariations = {"[Shadow]", "[Aqua]", "[Volcanic]", "[Sacred]", "[Mighty]", "[Terra]"}

local Monster_orb = CreatureEvent("monsterorb")
function Monster_orb.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
    if not killer or not killer:isPlayer() or creature:getMaster() then return end
    if not creature:isMonster() then return end
    local monsterLevel = creature:getMonsterLevel() or 0
    if monsterLevel < 1 then return end

    local monsterType = MonsterType(creature:getName())
    if monsterType and monsterType:isBoss() then return end
    

    if creature:getStorageValue(purpleorbstorage) == 1 then
        -- Place each orb at a unique adjacent position if possible

        local yelloworb = Game.createItem(yellow_orb, 1, getAdjacentPosition(creature:getPosition()))
        local blueorb = Game.createItem(blue_orb, 1, getAdjacentPosition(creature:getPosition()))
        local greenorb = Game.createItem(green_orb, 1, getAdjacentPosition(creature:getPosition()))

        if yelloworb then 
            yelloworb:setCustomAttribute("ownerId", killer:getId())
            yelloworb:setCustomAttribute("monsterLevel", creature:getMonsterLevel() or 1)
            yelloworb:setCustomAttribute("rewardType", "Gold")
            orbeffectLoop(yelloworb:getPosition(), "Gold", TEXTCOLOR_YELLOW, 60)
        end

        if blueorb then 
            blueorb:setCustomAttribute("ownerId", killer:getId())
            blueorb:setCustomAttribute("monsterLevel", creature:getMonsterLevel() or 1)
            blueorb:setCustomAttribute("rewardType", "Loot")
            orbeffectLoop(blueorb:getPosition(), "Loot", TEXTCOLOR_BLUE, 60)
        end
        
        if greenorb then 
            greenorb:setCustomAttribute("ownerId", killer:getId())
            greenorb:setCustomAttribute("monsterLevel", creature:getMonsterLevel() or 1)
            greenorb:setCustomAttribute("rewardType", "Experience")
            orbeffectLoop(greenorb:getPosition(), "Experience", TEXTCOLOR_LIGHTGREEN, 60)
        end
        return true
    end

    

    for _, rewardType in ipairs(rewardTypes) do
        local mathrandom = math.random(100)
       -- print("mathrandom", mathrandom)
       -- print("rewardType.chance", rewardType.chance)
        if mathrandom <= rewardType.chance then
            local orbPosition = getAdjacentPosition(creature:getPosition())
            local rewardOrb = Game.createItem(rewardType.itemId, 1, orbPosition)
            rewardOrb:setCustomAttribute("ownerId", killer:getId())
            rewardOrb:setCustomAttribute("monsterLevel", creature:getMonsterLevel() or 1)
            rewardOrb:setCustomAttribute("rewardType", rewardType.type)
            if rewardType.type == "Death" then
                rewardOrb:setCustomAttribute("MonsterName", creature:getName())
            end
            orbeffectLoop(orbPosition, rewardType.type, rewardType.textcolor, 60)
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
    -- Classic Lifesteal: 30% chance
    if primaryDamage < 0 and math.random(100) <= 30 then
        local healed = math.floor(-primaryDamage * 0.3)
        attacker:addHealth(healed)
        doSendDistanceShoot(creature:getPosition(), attacker:getPosition(), 83)
        attacker:getPosition():sendMagicEffect(438)
        creature:getPosition():sendMagicEffect(305)
        if attacker:isMonster() then
            attacker:say("Your life is mine!", TALKTYPE_MONSTER_YELL)
        end
    end

    local function performVampiricAreaDrain(bid, drainRadius, drainPct)
        local boss = Creature(bid)
        if not boss then return end
        local bossPos = boss:getPosition()
        local drainAmount = 0
        local spectators = Game.getSpectators(bossPos, false, true, drainRadius, drainRadius, drainRadius, drainRadius)
        local playersfound = #spectators or 1
        
        for _, p in ipairs(spectators) do
            if p:isPlayer() and p:getHealth() > 1 then
                local dmg = math.max(1, math.floor(p:getMaxHealth() * drainPct))
                doSendDistanceShoot(p:getPosition(), bossPos, 83)
                p:getPosition():sendMagicEffect(781)
                drainAmount = drainAmount + dmg
                p:say("Your life is drained!", TALKTYPE_MONSTER_YELL)
            end
        end
        if drainAmount > 0 then
            boss:addHealth(drainAmount)
            bossPos:sendMagicEffect(438)
            boss:say("I feast on all your blood!", TALKTYPE_MONSTER_YELL)
        end

       doAreaCombatHealth(boss, COMBAT_LIFEDRAIN, bossPos, AREA_SQUARE2X2, -math.floor((boss:getMonsterLevel() * 3.5) * playersfound), -math.floor((boss:getMonsterLevel() * 4) * playersfound), 781)
    end
    -- Area Life Drain Pulse: 10% chance
    if primaryDamage < 0 and math.random(100) <= 20 and attacker:isMonster() then
        local drainRadius = 2
        local drainPct = 0.10
        local bossId = attacker:getId()
        local bossPos = attacker:getPosition()
        attacker:say("The air grows cold as I drain your life!", TALKTYPE_MONSTER_YELL)
        attacker:attachEffectById(189, true)
        addEvent(performVampiricAreaDrain, 3000, bossId, drainRadius, drainPct)
    end
end,

   ["[Sacred]"] = function(attacker, creature, primaryDamage, secondaryDamage)
    if math.random(100) <= 30 then
        local nearby = Game.getSpectators(attacker:getPosition(), false, true, 5, 5, 5, 5)
        local candidates = {}

        for _, target in ipairs(nearby) do
            if target:isPlayer() and target ~= attacker then
                table.insert(candidates, target)
            end
        end

        if #candidates == 0 then return primaryDamage, secondaryDamage end

        local selected = candidates[math.random(#candidates)]
        local posplayer = selected:getPosition()
        local pos = selected:getPosition()

        local positioneffect = posplayer 
        positioneffect.x = posplayer.x + 2
        positioneffect.y = posplayer.y + 1
        positioneffect:sendMagicEffect(1107)

        local creatureId = attacker:getId()
        
        function sacredHolyBlastEvent(casterId, pos, casterLevel)
            local caster = Creature(casterId)
            if not caster or not caster:isMonster() or not pos then return end

            local affected = Game.getSpectators(pos, false, true, 1, 1, 1, 1)
            local dmg = math.floor(casterLevel * 4)
            local landed = false
            for _, target in ipairs(affected) do
                if target:isPlayer() then
                    --print("[Sacred] Holy blast hit", target:getName(), "for", dmg)
                    landed = true
                end
            end
            doAreaCombatHealth(caster, COMBAT_HOLYDAMAGE, pos, explosiveArea, -dmg, -dmg, CONST_ME_HOLYAREA)
            if landed then
                local heal = math.floor(casterLevel * 10)
                caster:addHealth(heal)
                caster:getPosition():sendMagicEffect(701)
               -- print("[Sacred] Healed", caster:getName(), "for", heal)
            end
        end

        addEvent(sacredHolyBlastEvent, 1500, creatureId, pos, attacker:getMonsterLevel())

    end  

    return primaryDamage, secondaryDamage
end,

["[Arcane]"] = function(attacker, creature, primaryDamage, secondaryDamage)
    if primaryDamage < 0 and math.random(100) <= 35 then
        local nearby = Game.getSpectators(attacker:getPosition(), false, true, 5, 5, 5, 5)
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
            attacker:teleportTo(dest)
            dest:sendMagicEffect(CONST_ME_TELEPORT)

            local cid = attacker:getId()
            addEvent(function()
                local caster = Creature(cid)
                if not caster or not caster:isMonster() then return end
                local mindamage =caster:getMonsterLevel() * 3
                local maxdamage =caster:getMonsterLevel() * 3.3

                doAreaCombatHealth(cid, COMBAT_ENERGYDAMAGE, caster:getPosition(), explosiveArea, -mindamage, -maxdamage, 677)
            end, 1000)
        end
    end

    return primaryDamage, secondaryDamage
end,


    ["[Frostbound]"] = function(attacker, creature, primaryDamage, secondaryDamage)
        if math.random(100) <= 30 then
            local nearby = Game.getSpectators(attacker:getPosition(), false, true, 5, 5, 5, 5)
            local candidates = {}
    
            for _, target in ipairs(nearby) do
                if target:isPlayer() and target ~= attacker then
                    table.insert(candidates, target)
                end
            end
    
            if #candidates == 0 then return primaryDamage, secondaryDamage end
    
            local selected = candidates[math.random(#candidates)]
            local posplayer = selected:getPosition()
            local pos = selected:getPosition()
    
            local positioneffect = posplayer 
            positioneffect.x = posplayer.x + 1
            positioneffect.y = posplayer.y + 1
            positioneffect:sendMagicEffect(646)
    
            local attackerId = attacker:getId()
            
            function frostboundEvent(casterId, pos, casterLevel)
                local caster = Creature(casterId)
                if not caster or not caster:isMonster() or not pos then return end
    
                local affected = Game.getSpectators(pos, false, true, 1, 1, 1, 1)
                local dmg = math.floor(casterLevel * 4)
                local landed = false
                for _, target in ipairs(affected) do
                    if target:isPlayer() then
                        local stunDuration = 2000
                        local stun = Condition(CONDITION_STUN, CONDITIONID_COMBAT)
                        stun:setParameter(CONDITION_PARAM_TICKS, stunDuration)
                        target:addCondition(stun)
                        target:attachEffectById(190, true)

                        landed = true
                    end
                end

                doAreaCombatHealth(caster, COMBAT_ICEDAMAGE, pos, explosiveArea, -dmg, -dmg, 42)
                local positioneffect = posplayer 
                positioneffect.x = posplayer.x + 0
                positioneffect.y = posplayer.y + 0
                positioneffect:sendMagicEffect(53)
            end
    
            addEvent(frostboundEvent, 1500, attackerId, pos, attacker:getMonsterLevel())
        end
    end,

    ["[Plagued]"] = function(attacker, creature, primaryDamage, secondaryDamage)
        if math.random(100) <= 20 then
            --create a summon
            local function getRandomNearbyPosition(center, radius)
                local try = 0
                while try < 10 do
                    local dx = math.random(-radius, radius)
                    local dy = math.random(-radius, radius)
                    local pos = Position(center.x + dx, center.y + dy, center.z)
                    if Tile(pos) and Tile(pos):getThingCount() < 4 then
                        return pos
                    end
                    try = try + 1
                end
                return center -- fallback
            end
            local summonPos = getRandomNearbyPosition(attacker:getPosition(), 3)
            local summon = Game.createMonster("plagued spider", summonPos)
            if summon then
                attacker:addSummon(summon)
                --set 10% of creature max health
                summon:setMaxHealth(attacker:getMaxHealth() * 0.1)
                summon:addHealth(summon:getMaxHealth())
                summon:attachEffectById(188, true)
                doSendDistanceShoot(attacker:getPosition(), summon:getPosition(), 112)
            end
        end
    end,

   ["[Burning]"] = function(attacker, creature, primaryDamage, secondaryDamage)
    local CHAINDURATION = 6000 -- duration in ms, adjust as needed for your mechanic
    local conditionChain = Condition(CONDITION_FIRE, CONDITIONID_COMBAT)
    conditionChain:setParameter(CONDITION_PARAM_TICKS, CHAINDURATION)
    conditionChain:setParameter(CONDITION_PARAM_DELAYED, 1)
    conditionChain:setParameter(CONDITION_PARAM_TICKINTERVAL, 1000)
    conditionChain:setParameter(CONDITION_PARAM_PERIODICDAMAGE, -5)
    conditionChain:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.burningchain)

    if math.random(100) <= 20 then
    local function getChainTargets(nearby, max)
        local targets = {}
        for _, p in ipairs(nearby) do
            if p:isPlayer() and #targets < max then
                if p:getCondition(CONDITION_FIRE, 0, ConditionsSubIds.burningchain) then
                    return nil -- abort if anyone is already chained
                end
                table.insert(targets, p)
            elseif p:getCondition(CONDITION_FIRE, 0, ConditionsSubIds.burningchain) then
                return nil
            end
        end
        return targets
    end

    local nearby = Game.getSpectators(attacker:getPosition(), false, true, 7, 7, 7, 7)
    local chainTargets = getChainTargets(nearby, 3)
    if not chainTargets or #chainTargets == 0 then return end

    -- If only one player, chain to boss
    if #chainTargets == 1 and attacker and attacker:isMonster() then
        print("[Burning] Chaining to boss", attacker:getName())
        table.insert(chainTargets, attacker)
        -- Print all names in the chain
        print("[Burning] Chain participants:")
        for i, p in ipairs(chainTargets) do
            if p and p.getName then
                print(i, p:getName())
            end
        end
    end

    -- Apply burning chain condition to all affected players (NOT the boss)
    for _, p in ipairs(chainTargets) do
        if p and p:isPlayer() then
            p:addCondition(conditionChain:clone())
        end
    end

        -- Boss phrase when chaining starts
        local bossPhrases = {
            "You cannot escape the burning chains!",
            "Feel the searing pain of unity!",
            "Let the flames bind your souls!",
            "Burn together, or fall apart!"
        }
        if attacker and attacker:isMonster() then
            attacker:say(bossPhrases[math.random(#bossPhrases)], TALKTYPE_MONSTER_YELL)
        end

        -- Gather safe IDs for all chain targets
        local ids = {}
        for i = 1, #chainTargets do
            ids[i] = chainTargets[i]:getId()
        end
        local chainCount = #ids

        -- Player warnings (above head)
        for i = 1, chainCount do
            local p = Creature(ids[i])
            if p and p:isPlayer() then
                p:say("You are chained! Stay close or suffer!", TALKTYPE_MONSTER_YELL)
            end
        end

        -- Visual effect loop: fire chains every 200ms for the duration of the chain
        local function burningVisualChain(ids, chainCount, running)
            if not running() then return end
            for i=1,chainCount-1 do
                local p1 = Creature(ids[i])
                local p2 = Creature(ids[i+1])
                if p1 and p2 then
                    doSendDistanceShoot(p1:getPosition(), p2:getPosition(), CONST_ANI_FIRE)
                    doSendDistanceShoot(p2:getPosition(), p1:getPosition(), CONST_ANI_FIRE)
                    p1:getPosition():sendMagicEffect(CONST_ME_FIREATTACK)
                end
            end
            addEvent(burningVisualChain, 200, ids, chainCount, running)
        end

        -- This flag closure will be set to false when the chain ends
        local chainActive = true
        local function isChainActive() return chainActive end
        burningVisualChain(ids, chainCount, isChainActive)

        local function burningCheckChains(ids, chainCount, tick)
            tick = tick + 1
            local broken = false
            if tick >= 10 then
                for i=1,chainCount-1 do
                    local p1 = Creature(ids[i])
                    local p2 = Creature(ids[i+1])
                    if p1 and p2 then
                        local dist = getDistanceBetween(p1:getPosition(), p2:getPosition())
                        if dist > 3 then
                            -- Only punish players, not boss
                            if p1:isPlayer() then
                                p1:removeCondition(conditionChain)
                                p1:say("The burning chain snaps! You are scorched by the backlash!", TALKTYPE_MONSTER_YELL)
                                p1:getPosition():sendMagicEffect(CONST_ME_FIREAREA)
                                local burn = Condition(CONDITION_FIRE, CONDITIONID_COMBAT)
                                burn:setParameter(CONDITION_PARAM_TICKS, 4000)
                                burn:setParameter(CONDITION_PARAM_PERIODICDAMAGE, -math.floor(p1:getMaxHealth() * 0.075))
                                burn:setParameter(CONDITION_PARAM_TICKINTERVAL, 1000)
                                burn:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
                                burn:setParameter(CONDITION_PARAM_DELAYED, 1)
                                p1:addCondition(burn)

                                local stunDuration = 2000
                                local stun = Condition(CONDITION_STUN, CONDITIONID_COMBAT)
                                stun:setParameter(CONDITION_PARAM_TICKS, stunDuration)
                                p1:addCondition(stun)
                                p1:attachEffectById(66, true)

                            end
                            if p2:isPlayer() then
                                p2:removeCondition(conditionChain)
                                p2:say("The burning chain snaps! You are scorched by the backlash!", TALKTYPE_MONSTER_YELL)
                                p2:getPosition():sendMagicEffect(CONST_ME_FIREAREA)
                                local burn = Condition(CONDITION_FIRE, CONDITIONID_COMBAT)
                                burn:setParameter(CONDITION_PARAM_TICKS, 4000)
                                burn:setParameter(CONDITION_PARAM_PERIODICDAMAGE, -math.floor(p2:getMaxHealth() * 0.075))
                                burn:setParameter(CONDITION_PARAM_TICKINTERVAL, 1000)
                                burn:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
                                burn:setParameter(CONDITION_PARAM_DELAYED, 1)
                                p2:addCondition(burn)

                                local stunDuration = 2000
                                local stun = Condition(CONDITION_STUN, CONDITIONID_COMBAT)
                                stun:setParameter(CONDITION_PARAM_TICKS, stunDuration)
                                p2:addCondition(stun)
                                p2:attachEffectById(66, true)


                            end
                            broken = true
                        end
                    end
                end
            end
            if broken or tick >= 10 then
                for i = 1, chainCount do
                    local p = Creature(ids[i])
                    if p and p:isPlayer() then
                        p:removeCondition(conditionChain)
                    end
                end
                chainActive = false
                if not broken then
                    -- Reward: heal or shield only players
                    for i = 1, chainCount do
                        local p = Creature(ids[i])
                        if p and p:isPlayer() then
                            p:say("You are healed by the burning chain!", TALKTYPE_MONSTER_YELL)
                            p:addHealth(math.floor(p:getMaxHealth() * 0.15))
                            p:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
                            --remove condition
                            p:removeCondition(conditionChain)
                        end
                    end
                end
                return
            end
            addEvent(burningCheckChains, 500, ids, chainCount, tick)
        end
        -- No storage needed; all tracking is via condition
        -- (intentionally left blank)
        burningCheckChains(ids, chainCount, 0)
    end
end,


   ["[Darkness]"] = function(attacker, creature, primaryDamage, secondaryDamage)
    if not attacker or not creature then return end


    if math.random(100) <= 25 then
        local pos = attacker:getPosition()
        pos:sendMagicEffect(CONST_ME_EXPLOSIONAREA)
        doAreaCombatHealth(attacker:getId(), COMBAT_DEATHDAMAGE, pos, explosiveArea, -math.floor(attacker:getMonsterLevel() * 2), -math.floor(attacker:getMonsterLevel() * 2.5), 18)
    end
    if math.random(100) <= 45 then
        print("Darkness swap check")
        local boss = attacker
        if not boss or not creature then return end

        local conditionDarkness = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
        conditionDarkness:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
        conditionDarkness:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.darkness)
        conditionDarkness:setParameter(CONDITION_PARAM_TICKS, 8000)

        local bossPos = boss:getPosition()
        
        -- Find a random nearby player (excluding the boss itself if polymorphed)
        local nearby = Game.getSpectators(bossPos, false, true, 5, 5, 5, 5)
        local candidates = {}
        for _, target in ipairs(nearby) do
            if target:isPlayer() and target ~= boss and not target:getCondition(CONDITION_ATTRIBUTES, 0, ConditionsSubIds.darkness) then
                table.insert(candidates, target)
            end
        end
        if #candidates == 0 then return end
        local selected = candidates[math.random(#candidates)]
        local player = selected
        local playerPos = player:getPosition()
        local currentmapshader = player:getMapShader()

        playerPos:sendMagicEffect(CONST_ME_MORTAREA)
        bossPos:sendMagicEffect(CONST_ME_MORTAREA)
        boss:say("Embrace the shadows!", TALKTYPE_MONSTER_YELL)

        if currentmapshader ~= "Map - blind" then
            player:setMapShader("Map - blind", true)
            player:addCondition(conditionDarkness)
            print("Darkness applied")
        end
        
        local function performShadowSwap(bossId, playerId)
            local boss2 = Creature(bossId)
            local player2 = Player(playerId)
            if not boss2 or not player2 then return end
            local pos1 = boss2:getPosition()
            local pos2 = player2:getPosition()
            -- Swap positions
            boss2:teleportTo(pos2, false)
            player2:teleportTo(pos1, false)
            pos1:sendMagicEffect(CONST_ME_MORTAREA)
            pos2:sendMagicEffect(CONST_ME_MORTAREA)
            player2:say("You are engulfed by shadows and feel your position shift!", TALKTYPE_MONSTER_YELL)

            player:setMapShader(currentmapshader, true)
        end

        addEvent(function()
            performShadowSwap(boss:getId(), player:getId(), currentmapshader)
        end, 3000)

     print("Darkness check 2")
 
    end
    
end
}

-- Elite Variations Table
local eliteVariations = {
    {name = "[Vampiric]",    storage = MonsterStorage.Vampiric,    shader = "Blood Leech", effect = 179},
    {name = "[Sacred]",      storage = MonsterStorage.Sacred,      shader = "Divine Shine", effect = 180},
    {name = "[Arcane]",      storage = MonsterStorage.Arcane,      shader = "Arcane Pulse", effect = 181},
    {name = "[Frostbound]",  storage = MonsterStorage.Frostbound,  shader = "Frost Cloak", effect = 183},
    {name = "[Plagued]",     storage = MonsterStorage.Plagued,     shader = "Sickly Aura", effect = 184},
    {name = "[Burning]",     storage = MonsterStorage.Burning,     shader = "Flame Skin", effect = 185},
    {name = "[Darkness]",    storage = MonsterStorage.Darkness,    shader = "Mana Drain", effect = 187},
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

local allowedDefendTypes = {
    [COMBAT_ICEDAMAGE] = true,
    [COMBAT_PHYSICALDAMAGE] = true,
    [COMBAT_FIREDAMAGE] = true,
    [COMBAT_EARTHDAMAGE] = true,
    [COMBAT_ENERGYDAMAGE] = true,
    [COMBAT_HOLYDAMAGE] = true,
    [COMBAT_DEATHDAMAGE] = true,
    [COMBAT_LIFEDRAIN] = true,
    [COMBAT_MANADRAIN] = true
  }

local eliteCombatHp = CreatureEvent("EliteMonsterCombatHP")
function eliteCombatHp.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if not creature or not creature:isMonster() then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    
    if not allowedDefendTypes[primaryType] then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end    
    return modifyDamage(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
end
eliteCombatHp:register()

local eliteCombatMana = CreatureEvent("EliteMonsterCombatMana")
function eliteCombatMana.onManaChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if not creature or not creature:isMonster() then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    
    if not allowedDefendTypes[primaryType] then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end    
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
            boss:setMaxHealth(boss:getMaxHealth() * 5)
            boss:addHealth(boss:getMaxHealth())
            boss:rename(bossName)
            boss:setStorageValue(variation.storage, 1)
            boss:setStorageValue(purpleorbstorage, 1)
            --boss:setShader(variation.shader)
            boss:attachEffectById(9, true)
            boss:attachEffectById(variation.effect, true)
            --boss:attachEffectById(25, true)
            
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