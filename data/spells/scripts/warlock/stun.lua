local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE )
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_CAKE)

local condition = Condition(CONDITION_FEAR, CONDITIONID_COMBAT)
condition:setParameter(CONDITION_PARAM_TICKS, 6000)
combat:addCondition(condition)

function onCastSpell(creature, var, tar)
local targetmonster = creature:getTarget()
	
	if not combat:execute(creature, var) or targetmonster:getSpeed() < 1 then
		return false
	else
		targetmonster:attachEffectById(64, true)
	end
	
	
return true
end
