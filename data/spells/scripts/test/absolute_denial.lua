local config = {
    maxchain = 30,
    speed = 200,
    speed2 = 200,
    mfx = 439,
    dfx = 159,
    element = COMBAT_ENERGYDAMAGE,
    xradius = 3,
    yradius = 3
}

local damageCombat = Combat()
damageCombat:setParameter(COMBAT_PARAM_TYPE, config.element)
damageCombat:setParameter(COMBAT_PARAM_EFFECT, config.mfx)

function onGetDamageFormulaValues(creature, skill, attack, factor)
    local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
    local power = sword * attack 
    local level = player:getLevel()
    local magic = player:getMagicLevel()

    local min = (level / 5) + (power * 0.07) + (attack * 1.5) + 120
    local max = (level / 5) + (power * 0.08) + (attack * 2.0) + 150
    return -min, -max
end

damageCombat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetDamageFormulaValues")

local healCombat = Combat()
healCombat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
healCombat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)

function onGetHealFormulaValues(creature, skill, attack, factor)
    local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
    local power = sword * attack 
    local level = player:getLevel()
    local magic = player:getMagicLevel()

    local min = (level / 5) + (power * 0.07) + (attack * 1.5) + 120
    local max = (level / 5) + (power * 0.08) + (attack * 2.0) + 150
    return min, max
end

healCombat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetHealFormulaValues")

local function damageDenial(cid, targetId)
    local creature = Creature(cid)
    if not creature then
        return false
    end
    local target = Creature(targetId)
    if not target then
        return false
    end
    damageCombat:execute(creature, Variant(target:getPosition()))
    return true
end

local function addHealthWithDelay(cid)
    local creature = Creature(cid)
    if not creature then
        return false
    end
    healCombat:execute(creature, Variant(creature:getPosition()))
    return true
end

function onCastSpell(creature, variant, target)
    local creaturePos = creature:getPosition()
    local targets = Game.getSpectators(creaturePos, false, false, 2, 2, 2, 2)
    local numTargets = #targets
    if numTargets == 0 then
        creature:sendCancelMessage("There are no creatures in the area.")
        return false
    end
    if numTargets > config.maxchain then
        numTargets = config.maxchain
    end
    creaturePos:sendDistanceEffect(creaturePos, config.dfx)
    for i = 1, numTargets do
        local targetCreature = targets[i]
        local targetCreatureId = targetCreature:getId()
        addEvent(damageDenial, i * config.speed, creature:getId(), targetCreatureId)
        addEvent(addHealthWithDelay, i * config.speed2, creature:getId())
        targetCreature:getPosition():sendDistanceEffect(creaturePos, config.dfx)
        creaturePos = targetCreature:getPosition()
    end
    return true
end
