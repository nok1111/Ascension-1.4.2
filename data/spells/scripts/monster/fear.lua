local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_PURPLESMOKE )
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_CAKE)

local condition = Condition(CONDITION_STUN)
condition:setParameter(CONDITION_PARAM_TICKS, 6000)
combat:setCondition(condition)

function onCastSpell(creature, var, tar)
	if not combat:execute(creature, var) then
		return false
	end
	local targetmonster = creature:getTarget()
	
	targetmonster:sendProgressbar(6000, false)
return true
end
