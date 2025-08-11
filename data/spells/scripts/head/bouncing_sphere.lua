
-- Configuration
local maxLoops = 5 -- Maximum number of loops
local baseDamageMultiplier = 1.5 -- Base damage multiplier
local healingMultiplier = 2.0 -- Healing multiplier
local minDelay = 200 -- Minimum delay in milliseconds
local maxDelay = 1000 -- Maximum delay in milliseconds

-- Function to calculate the delay based on distance
local function calculateDelay(playerPos, targetPos)
    local distance = math.sqrt((playerPos.x - targetPos.x)^2 + (playerPos.y - targetPos.y)^2)
    return minDelay + (maxDelay - minDelay) * (distance / 10)
end


local function executePingPong(creatureid, targetid, loop)
    if loop >= maxLoops then
        return
    end

    local player = Creature(creatureid)
    local target = Creature(targetid)

    if not player or not target then
        return
    end

    local damage = (player:getLevel() * 0.4) + 1

    -- Deal damage to the target
    doTargetCombatHealth(creatureid, targetid, COMBAT_PHYSICALDAMAGE, -damage, -damage, 11)

    -- Create distance effect from player to target
    doSendDistanceShoot(player:getPosition(), target:getPosition(), 75)

    local delay = calculateDelay(player:getPosition(), target:getPosition())

    addEvent(bouncingSphereReturn, delay, creatureid, targetid, loop, delay)
end

-- Handles the return phase: healing, effects, and next loop
function bouncingSphereReturn(creatureid, targetid, loop, delay)
    local player = Creature(creatureid)
    local target = Creature(targetid)

    if not player or not target then
        return
    end

    local healing = (player:getLevel() * 0.4 ) + 1

    -- Heal the player
    player:getPosition():sendMagicEffect(11)
    player:addHealth(healing)
    player:getPosition():sendMagicEffect(CONST_ME_HPUP)

    -- Create distance effect from target to player
    doSendDistanceShoot(target:getPosition(), player:getPosition(), 75)

    addEvent(executePingPong, delay, creatureid, targetid, loop+1)
end

function onCastSpell(creature, variant, isHotkey)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    -- Check if boots are equipped in feet slot
    local boots = player:getSlotItem(CONST_SLOT_HEAD)
    if not boots or boots:getId() ~= 38169 then
        player:sendCancelMessage("You must equip the Bouncing Sphere spell to use this effect.")
        return false
    end

    local playerPos = player:getPosition() 
    local target = Creature(variantToNumber(variant))
    local targetPos = target:getPosition()
    local playerId = creature:getId()
    local targetId = target:getId()

    if target == player then
        player:sendCancelMessage("You cannot use this spell on yourself.")
        return false
    end

    local loopCount = 0

    executePingPong(playerId, targetId, loopCount)

    return true
end
