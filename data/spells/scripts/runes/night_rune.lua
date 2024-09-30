-- Frames (1 = Area, 2 = Player, 3 = Player + Self Damaging)
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 318)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 32)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)


local Death_Mark = Condition(CONDITION_CURSED)
Death_Mark:setParameter(CONDITION_PARAM_DELAYED, true)
Death_Mark:addDamage(5, 1000, 0)
Death_Mark:setParameter(CONDITION_PARAM_SUBID, 25974)
combat:addCondition(Death_Mark)

function onGetFormulaValues(player, level, maglevel)
    local min = (level / 5) + (maglevel * 10.6) + 16
    local max = (level / 5) + (maglevel * 13.0) + 38
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")


function onCastSpell(creature, variant, fromPosition, target, toPosition, isHotkey)

	local target = creature:getTarget()
	target:say("Death Mark!", TALKTYPE_MONSTER_SAY)
	target:sendProgressbar(5000, false)
	
    return combat:execute(creature, variant)
end