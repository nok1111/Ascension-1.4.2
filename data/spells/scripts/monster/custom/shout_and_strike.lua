local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 32)
combat:setParameter(COMBAT_PARAM_EFFECT, 18)

-- Custom damage formula
function getDamageValues()
    local minDamage = 300
    local maxDamage = 600
    return -minDamage, -maxDamage
end
combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "getDamageValues")

-- Function to check if a creature is facing the caster
local function isFacingCaster(creatureId, targetId)
    local creature = Creature(creatureId)
    local target = Creature(targetId)
    if not creature or not target then
        return
    end
    local casterPos = creature:getPosition()
    local targetPos = target:getPosition()

    -- Calculate direction of the target relative to the caster
    local dx = targetPos.x - casterPos.x
    local dy = targetPos.y - casterPos.y

    local targetDirection = target:getDirection()

    -- Determine if the target is facing the caster
    if targetDirection == DIRECTION_NORTH and dy > 0 then
        return true
    elseif targetDirection == DIRECTION_EAST and dx < 0 then
        return true
    elseif targetDirection == DIRECTION_SOUTH and dy < 0 then
        return true
    elseif targetDirection == DIRECTION_WEST and dx > 0 then
        return true
    end

    return false
end

-- Function to damage creatures facing the caster
local function damageFacingCreatures(creatureId, spectators)
    local creature = Creature(creatureId)
    if not creature then
        return
    end

    for _, targets in ipairs(spectators) do
        if creature:isCreature() and isFacingCaster(creature, targets:getId()) then
            combat:execute(creature, Variant(targets:getPosition()))
        end
    end
end

-- Main spell execution
function onCastSpell(creature, variant)
    creature:say("Don't look at me!", TALKTYPE_MONSTER_YELL)

    local casterPosition = creature:getPosition()
    local spectators = Game.getSpectators(casterPosition, false, false, 7, 7, 7, 7) -- 10x10 area

    -- Delay execution by 2 seconds for dramatic effect
    addEvent(damageFacingCreatures, 2000, creature:getId(), spectators)

    return true
end
