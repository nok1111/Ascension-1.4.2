

function onCastSpell(creature, var)
local master = creature:getMaster()
local pet = master:getPet()
local owner = creature:getMaster()

	Game.sendAnimatedText(tostring(pet.name)..': Haste!', creature:getPosition(), TEXTCOLOR_YELLOW)
	local min = owner:getPetLevel()
	
local t = (2 + min) * 1000
local condition = Condition(CONDITION_HASTE)
condition:setParameter(CONDITION_PARAM_TICKS, t)
condition:setFormula(1.5, -70, 1.5, -70)
owner:addCondition(condition)


	 -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    owner:sendAddBuffNotification(85, 2 + min, 'movement speed increased for : ' .. 2 + min .. ' seconds', 3, 0)
	return true
end