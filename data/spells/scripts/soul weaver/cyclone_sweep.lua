-- Cyclone Sweep (Monk Spell)
-- Consumes 1 Fire + 1 Ice orb
-- Pulls in enemies, then pushes them away, dealing fire+ice damage and applying slow/stun

local elementalBoosts = dofile('data/lib/additional/elemental_boosts.lua')

local PULL_RADIUS = 3
local PUSH_DELAY = 500
local SLOW_DURATION = 2000
local STUN_DURATION = 1200

local function getNearbyEnemies(player, radius)
    local pos = player:getPosition()
    local enemies = {}
    for x = -radius, radius do
        for y = -radius, radius do
            local checkPos = Position(pos.x + x, pos.y + y, pos.z)
            local creature = Tile(checkPos):getTopCreature()
            if creature and creature ~= player and creature:isMonster() then
                table.insert(enemies, creature)
            end
        end
    end
    return enemies
end

local function moveTowards(monster, targetPos)
    local mpos = monster:getPosition()
    local dx = targetPos.x - mpos.x
    local dy = targetPos.y - mpos.y
    local stepX = (dx ~= 0) and (dx > 0 and 1 or -1) or 0
    local stepY = (dy ~= 0) and (dy > 0 and 1 or -1) or 0
    local newPos = Position(mpos.x + stepX, mpos.y + stepY, mpos.z)
    if Tile(newPos):getTopCreature() == nil and not Tile(newPos):hasProperty(CONST_PROP_BLOCKSOLID) then
        monster:teleportTo(newPos)
        newPos:sendMagicEffect(42)
        return newPos
    end
    return mpos
end

local function moveAway(monster, fromPos)
    local mpos = monster:getPosition()
    local dx = mpos.x - fromPos.x
    local dy = mpos.y - fromPos.y
    local stepX = (dx ~= 0) and (dx > 0 and 1 or -1) or 0
    local stepY = (dy ~= 0) and (dy > 0 and 1 or -1) or 0
    local newPos = Position(mpos.x + stepX, mpos.y + stepY, mpos.z)
    local tile = Tile(newPos)
    if tile:getTopCreature() == nil and not tile:hasProperty(CONST_PROP_BLOCKSOLID) then
        monster:teleportTo(newPos)
        newPos:sendMagicEffect(41)
        return newPos, false
    else
        return mpos, true -- Blocked, for stun
    end
end

local function applySlow(monster)
    local slow = Condition(CONDITION_PARALYZE, CONDITIONID_COMBAT)
    slow:setParameter(CONDITION_PARAM_TICKS, SLOW_DURATION)
    slow:setParameter(CONDITION_PARAM_SPEED, -400)
    monster:addCondition(slow)
end

local function applyStun(monster)
    local stun = Condition(CONDITION_STUN, CONDITIONID_COMBAT)
    stun:setParameter(CONDITION_PARAM_TICKS, STUN_DURATION)
    monster:addCondition(stun)
end

-- Skill-based formula for Cyclone Sweep
function onGetFormulaValues_CycloneSweep(player, skill, attack, factor)
    local sword = player:getEffectiveSkillLevel(SKILL_SWORD)
    local power = sword * attack
    local level = player:getLevel()
    local min = (level / 4) + (power * 0.055) + attack * 1.1
    local max = (level / 4) + (power * 0.095) + attack * 1.7
    return -min, -max
end

local function applyDamage(player, monster)
    -- Fire damage
    local combatFire = Combat()
    combatFire:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
    combatFire:setParameter(COMBAT_PARAM_EFFECT, 41)
    combatFire:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues_CycloneSweep")
    combatFire:execute(player, Variant(monster:getId()))
    -- Ice damage
    local combatIce = Combat()
    combatIce:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
    combatIce:setParameter(COMBAT_PARAM_EFFECT, 42)
    combatIce:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues_CycloneSweep")
    combatIce:execute(player, Variant(monster:getId()))
end

function onCastSpell(player, variant)
    -- Check orbs
    local boosters = elementalBoosts.initElementalBoosters(player).boosters
    local types = {}
    for _, b in ipairs(boosters) do types[b.type] = (types[b.type] or 0) + 1 end
    if (types["fire"] or 0) < 1 or (types["ice"] or 0) < 1 then
        player:sendCancelMessage("You need 1 Fire and 1 Ice orb to use Cyclone Sweep.")
        return false
    end
    -- Spend orbs
    local newBoosters = {}
    local fireSpent, iceSpent = 0, 0
    for _, b in ipairs(boosters) do
        if b.type == "fire" and fireSpent < 1 then fireSpent = fireSpent + 1
        elseif b.type == "ice" and iceSpent < 1 then iceSpent = iceSpent + 1
        else table.insert(newBoosters, b) end
    end
    elementalBoosts.initElementalBoosters(player).boosters = newBoosters
    elementalBoosts.updatePlayerEffects(player)
    -- Visual start
    player:getPosition():sendMagicEffect(49) -- Swirl effect
    player:say("Cyclone Sweep!", TALKTYPE_MONSTER_SAY)
    -- Pull phase
    local enemies = getNearbyEnemies(player, PULL_RADIUS)
    local pulled = {}
    for _, enemy in ipairs(enemies) do
        local newPos = moveTowards(enemy, player:getPosition())
        applySlow(enemy)
        table.insert(pulled, enemy)
    end
    -- Push phase after delay
    addEvent(function()
        for _, enemy in ipairs(pulled) do
            local oldPos = enemy:getPosition()
            local newPos, blocked = moveAway(enemy, player:getPosition())
            applyDamage(player, enemy)
            if blocked then applyStun(enemy) end
        end
    end, PUSH_DELAY)
    return true
end
