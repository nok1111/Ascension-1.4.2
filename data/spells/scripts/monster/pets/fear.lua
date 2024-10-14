

function onCastSpell(creature, var, tar)

local master = creature:getMaster()
local pet = master:getPet()
local owner = creature:getMaster()

	Game.sendAnimatedText(tostring(pet.name)..': Fear!', creature:getPosition(), TEXTCOLOR_YELLOW)
	local min = (math.pow(owner:getPetLevel(), 1.1) / 2) + .5
	
local t = min * 1000

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_PURPLESMOKE )
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_CAKE)

local condition = Condition(CONDITION_STUN)
condition:setParameter(CONDITION_PARAM_TICKS, t)
combat:addCondition(condition)


	if not combat:execute(creature, var) then
		return false
	end
	local targetmonster = creature:getTarget()
	
	targetmonster:sendProgressbar(min * 1000, false)
return true
end
