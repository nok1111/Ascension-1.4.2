-- Configuration
local maxLoops = 10 -- Maximum number of loops
local baseDamageMultiplier = 1.5 -- Base damage multiplier
local healingMultiplier = 2.0 -- Healing multiplier
local minDelay = 200 -- Minimum delay in milliseconds
local maxDelay = 1000 -- Maximum delay in milliseconds

-- Function to calculate the delay based on distance
local function calculateDelay(playerPos, targetPos)
    local distance = math.sqrt((playerPos.x - targetPos.x)^2 + (playerPos.y - targetPos.y)^2)
    return minDelay + (maxDelay - minDelay) * (distance / 10)
end

-- Function to calculate damage based on level and magic level
local function calculateDamage(creature)
    local level = creature:getLevel()
    local magicLevel = creature:getMagicLevel()
    return (level * 2 + magicLevel * 3) * baseDamageMultiplier
end

-- Function to calculate healing based on level and magic level
local function calculateHealing(creature)
    local level = creature:getLevel()
    local magicLevel = creature:getMagicLevel()
    return (level * 2 + magicLevel * 3) * healingMultiplier
end

-- Main spell function
function onCastSpell(creature, variant)
    local player = creature:getId()
    local target = creature:getTarget():getId()
    local playerPos = creature:getPosition()
    local targetPos = creature:getTarget():getPosition()
    local loopCount = 0

    local function executePingPong(creatureid, targetid, loop)
        if loop >= maxLoops then
            return
        end

        local player = Creature(creatureid)
        local target = Creature(targetid)

        if not player or not target then
            return
        end

        local damage = calculateDamage(player)

        -- Deal damage to the target
        doTargetCombatHealth(creatureid, targetid, COMBAT_PHYSICALDAMAGE, -damage, -damage, 11)

        -- Create distance effect from player to target
        doSendDistanceShoot(player:getPosition(), target:getPosition(), 75)

        loop = loop + 1
        local delay = calculateDelay(player:getPosition(), target:getPosition())

        addEvent(function()
            local player = Creature(creatureid)
            local target = Creature(targetid)

            if not player or not target then
                return
            end

            local healing = calculateHealing(player)

            -- Heal the player
			player:getPosition():sendMagicEffect(11)
			player:addHealth(healing)
			player:getPosition():sendMagicEffect(701)
			

            -- Create distance effect from target to player
            doSendDistanceShoot(target:getPosition(), player:getPosition(), 75)

            addEvent(executePingPong, delay, creatureid, targetid, loop)
        end, delay)
    end

    executePingPong(player, target, loopCount)
    return true
end
