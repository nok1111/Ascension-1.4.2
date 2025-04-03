local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE) 
combat:setParameter(COMBAT_PARAM_EFFECT, 37) 
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 4) 

local function applyEchoStrike(creatureId, targetId, remainingHits, delay)
    local creature = Creature(creatureId)
    local target = Creature(targetId)
    if not creature or not target or remainingHits <= 0 then
        return
    end

    -- Distance effect from caster to target
    local casterPos = creature:getPosition()
    local targetPos = target:getPosition()


        --local targetPosOffset = target:getPosition()
        --targetPosOffset.x = target:getPosition().x + 1
        --targetPosOffset.y = target:getPosition().y + 1
        --targetPosOffset:sendMagicEffect(37)

 
    combat:execute(creature, Variant(target:getPosition()))
   
    -- Schedule the next strike
    addEvent(applyEchoStrike, delay, creatureId, targetId, remainingHits - 1, delay)
end

function onCastSpell(creature, variant)
    local target = Creature(variant:getNumber())
    if not target then
        creature:sendCancelMessage("No valid target.")
        return false
    end

    local hitCount = 6  -- Number of hits
    local delay = 250  -- Milliseconds between hits

    -- Start the repeated damage sequence
    applyEchoStrike(creature:getId(), target:getId(), hitCount, delay)

    return true
end
