-- Cyclone Sweep (Monk Spell)
-- Pulls in enemies, then pushes them away, dealing fire+ice damage and applying slow/stun

local PULL_RADIUS = 3
local SLOW_DURATION = 2000
local STUN_DURATION = 1200

-- Constants for animation timing
local PULL_DELAY_PER_TILE = 100 -- ms between tile movements
local PUSH_DELAY_PER_TILE = 100 -- ms between tile movements

local paralyzedDuration = 2500

local paralyzed = Condition(CONDITION_PARALYZE, CONDITIONID_COMBAT)
paralyzed:setParameter(CONDITION_PARAM_TICKS, paralyzedDuration)
paralyzed:setFormula(-0.5, 0, -0.5, 0)

-- Helper function to extract creature IDs
local function getCreatureIds(creatures)
    local ids = {}
    for _, creature in ipairs(creatures) do
        if creature and creature:getId() then
            table.insert(ids, creature:getId())
        end
    end
    return ids
end

-- Calculate path from start to end position
local function getPathTo(startPos, endPos)
    local path = {}
    local dx = endPos.x - startPos.x
    local dy = endPos.y - startPos.y
    
    local steps = math.max(math.abs(dx), math.abs(dy))
    for i = 0, steps do
        local ratio = i/steps
        local x = startPos.x + math.floor(dx * ratio + 0.5)
        local y = startPos.y + math.floor(dy * ratio + 0.5)
        table.insert(path, Position(x, y, startPos.z))
    end
    return path
end

-- Calculate path away from start position
local function getPathAwayFrom(startPos, awayFromPos)
    local path = {}
    local dx = startPos.x - awayFromPos.x
    local dy = startPos.y - awayFromPos.y
    
    -- Normalize direction
    local stepX = (dx ~= 0) and (dx > 0 and 1 or -1) or 0
    local stepY = (dy ~= 0) and (dy > 0 and 1 or -1) or 0
    
    for i = 1, PULL_RADIUS do
        table.insert(path, Position(
            startPos.x + (stepX * i),
            startPos.y + (stepY * i),
            startPos.z
        ))
    end
    return path
end

-- Fire damage combat
local combatFire = Combat()
combatFire:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combatFire:setParameter(COMBAT_PARAM_EFFECT, 201)

-- Skill-based formula for Cyclone Sweep
function onGetFormulaValues_Fire(player, skill, attack, factor)
    local sword = player:getEffectiveSkillLevel(SKILL_SWORD)
    local power = sword * attack
    local level = player:getLevel()
    local min = (level / 4) + (power * 0.055) + attack * 1.1
    local max = (level / 4) + (power * 0.095) + attack * 1.7
    return -min, -max
end
combatFire:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues_Fire")

-- Ice damage combat 
local combatIce = Combat()
combatIce:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combatIce:setParameter(COMBAT_PARAM_EFFECT, 42)

-- Skill-based formula for Cyclone Sweep
function onGetFormulaValues_Ice(player, skill, attack, factor)
    local sword = player:getEffectiveSkillLevel(SKILL_SWORD)
    local power = sword * attack
    local level = player:getLevel()
    local min = (level / 4) + (power * 0.055) + attack * 1.1
    local max = (level / 4) + (power * 0.095) + attack * 1.7
    return -min, -max
end

combatIce:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues_Ice")

local function getNearbyEnemies(player, radius)
    local pos = player:getPosition()
    local enemies = {}
    for x = -radius, radius do
        for y = -radius, radius do
            local checkPos = Position(pos.x + x, pos.y + y, pos.z)
            local tile = Tile(checkPos)
            if tile then
                local creature = tile:getTopCreature()
                if creature and creature ~= player and (creature:isPlayer() or creature:isMonster()) then
                    table.insert(enemies, creature)
                end
            end
        end
    end
    return enemies
end

local function animatePull(player, enemies)
    local pulled = {}
    for _, enemy in ipairs(enemies) do
        table.insert(pulled, {creature = enemy, id = enemy:getId()})
        local path = getPathTo(enemy:getPosition(), player:getPosition())
        for i = 1, #path - 1 do
            addEvent(function(playerId, enemyId, pos)
                local player = Player(playerId)
                local enemy = Creature(enemyId)
                if not player or not enemy then return end
                
                local tile = Tile(pos)
                if tile and tile:isWalkable() and not (tile:hasFlag(TILESTATE_FLOORCHANGE) or tile:hasFlag(TILESTATE_PROTECTIONZONE) or tile:hasProperty(CONST_PROP_BLOCKSOLID)) and tile:getTopCreature() == nil then
                    enemy:teleportTo(pos)
                    pos:sendMagicEffect(CONST_ME_POFF)
                end
                enemy:addCondition(paralyzed)
            end, PULL_DELAY_PER_TILE * (i-1), player:getId(), enemy:getId(), path[i])
        end
    end
    return pulled
end

local function animatePush(player, pulled)

    local effectPos = Position(player:getPosition())
    effectPos.x = effectPos.x + 1
    effectPos.y = effectPos.y + 1
    effectPos:sendMagicEffect(647)

    for _, enemyData in ipairs(pulled) do
        local path = getPathAwayFrom(enemyData.creature:getPosition(), player:getPosition())
        for i = 1, #path do
            addEvent(function(playerId, enemyId, pos)
                local player = Player(playerId)
                local enemy = Creature(enemyId)
                if not player or not enemy then return end
                
                local blocked = false
                local tile = Tile(pos)
                if tile and tile:isWalkable() and not (tile:hasFlag(TILESTATE_FLOORCHANGE) or tile:hasFlag(TILESTATE_PROTECTIONZONE) or tile:hasProperty(CONST_PROP_BLOCKSOLID)) and tile:getTopCreature() == nil then
                    enemy:teleportTo(pos)
                    pos:sendMagicEffect(CONST_ME_POFF)
                else
                    blocked = true
                end
                
                if i == #path then -- Final position
                    combatFire:execute(player, Variant(enemy:getId()))
                    combatIce:execute(player, Variant(enemy:getId()))
                    enemy:addCondition(paralyzed)
                end
            end, PUSH_DELAY_PER_TILE * (i-1), player:getId(), enemyData.id, path[i])
        end
    end
end


function onCastSpell(player, variant)
    -- Give 2 random orbs with 60 second duration
    addRandomBoosters(player, 2)
    player:sendTextMessage(MESSAGE_STATUS_WARNING, "You gained 2 random orbs!")
    
    -- Visual start
    player:getPosition():sendMagicEffect(49) -- Swirl effect
    player:say("Cyclone Sweep!", TALKTYPE_MONSTER_SAY)

    -- Effect position logic
    local effectPos = Position(player:getPosition())
    effectPos.x = effectPos.x + 2
    effectPos.y = effectPos.y + 2
    effectPos:sendMagicEffect(635)
    -- Pull phase
    local enemies = getNearbyEnemies(player, PULL_RADIUS)
    local pulled = animatePull(player, enemies)

    -- Push after pull completes
    addEvent(function(playerId, pulledData)
        local player = Player(playerId)
        if not player then return end
        
        local pulledCreatures = {}
        for _, data in ipairs(pulledData) do
            local creature = Creature(data.id)
            if creature then
                table.insert(pulledCreatures, {creature = creature, id = data.id})
            end
        end
        
        animatePush(player, pulledCreatures)
    end, PULL_DELAY_PER_TILE * PULL_RADIUS * 2, player:getId(), pulled)
    return true
end
