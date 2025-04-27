local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_PURPLESMOKE )
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_CAKE)

local condition = Condition(CONDITION_FEAR, CONDITIONID_COMBAT)
condition:setParameter(CONDITION_PARAM_TICKS, 6000)
combat:addCondition(condition)

function onCastSpell(creature, var, tar)
local targetmonster = creature:getTarget()

	if targetmonster:hasCondition(CONDITION_FIRE) then
        print("Target has the condition: " .. CONDITION_FIRE)
    else
        print("Target does not have the condition: " .. CONDITION_FIRE)
    end
	
	if not combat:execute(creature, var) and targetmonster:getSpeed() < 1 then
		return false
	end

	
	targetmonster:sendProgressbar(6000, false)
return true
end
