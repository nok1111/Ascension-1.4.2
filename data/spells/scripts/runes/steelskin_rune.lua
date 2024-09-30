local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, 313)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)


local steelskin = Condition(CONDITION_ATTRIBUTES)
steelskin:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
steelskin:setParameter(CONDITION_PARAM_SUBID, 900)
steelskin:setParameter(CONDITION_PARAM_TICKS, 6000)

	
	
function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 3.2) + 20
	local max = (level / 5) + (magicLevel * 5.4) + 40
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
	creature:removeCondition(steelskin)
	creature:addCondition(steelskin)
	creature:setStorageValue(5, 5)
	creature:say("Steelskin.", TALKTYPE_MONSTER_SAY)
	creature:getPosition():sendMagicEffect(249)
	creature:sendRemoveBuffNotification(43)
	creature:sendAddBuffNotification(43, 6, 'Steelskin - 10% damage reduction', 3, 0)
	return combat:execute(creature, variant)
end
