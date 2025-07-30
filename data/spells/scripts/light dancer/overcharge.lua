
local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SKULLHORIZONTAL)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
		
local conditionstats = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
conditionstats:setParameter(CONDITION_PARAM_TICKS, 8000)
conditionstats:setParameter(CONDITION_PARAM_SKILL_SWORDPERCENT, 140)
conditionstats:setParameter(CONDITION_PARAM_SKILL_DISTANCEPERCENT, 140)
conditionstats:setParameter(CONDITION_PARAM_STAT_MAGICPOINTSPERCENT, 140)
conditionstats:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.overcharged)
conditionstats:setParameter(CONDITION_PARAM_BUFF_SPELL, true)


function onCastSpell(creature, variant)
if not creature then
	return
end

creature:addCondition(conditionstats)

  -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
player:attachEffectById(17, true)
player:sendAddBuffNotification(51, 8, 'overcharged, all offensive stats increased by 40%. you will loose health due to its effects.', 5, 0)

  
return combat:execute(creature, variant)		
end