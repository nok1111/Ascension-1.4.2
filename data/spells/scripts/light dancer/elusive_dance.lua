-- Elusive Dance Spell (Rebuilt)
-- Single 3x3 area, executes every 200ms for 4 times, uses combat formula (onGetFormulaValues)

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setArea(createCombatArea(AREA_SQUARE2X2))

function onGetFormulaValues(player, skill, attack, factor)
    local power = skill * attack
    local level = player:getLevel()
    local min = (level / 5) + (power * 0.075) + (attack * 3.5) + 75
    local max = (level / 5) + (power * 0.085) + (attack * 4.5) + 85
    return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function repeatCombat(creatureId, var, times, delay, count)
    count = count or 1
    local creature = Creature(creatureId)
    if not creature or not creature:isPlayer() then return end
    combat:execute(creature, var)
    if count < times then
        addEvent(repeatCombat, delay, creatureId, var, times, delay, count + 1)
    end
end

function onCastSpell(creature, var)
    if not creature then return end
    repeatCombat(creature:getId(), var, 2, 200)
    creature:attachEffectById(146, true)
    return true
end