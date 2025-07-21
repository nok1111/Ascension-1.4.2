-----------------------------

   arr1 = {
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 1, 1},
    {0, 0, 0, 3, 0, 1, 1},
    {0, 0, 0, 0, 0, 1, 1},
    {0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0},
}

   arr2 = {
    {0, 0, 1, 1, 1, 0, 0},
    {0, 0, 1, 1, 1, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 3, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0},
}

   arr3 = {
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 3, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 1, 1, 1, 0, 0},
	{0, 0, 1, 1, 1, 0, 0},
}

   arr4 = {
    {0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
    {1, 1, 0, 0, 0, 0, 0},
    {1, 1, 0, 3, 0, 0, 0},
    {1, 1, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0},
}

   arr5 = {
    {0, 0, 0, 0, 0, 0, 0},
    {0, 1, 0, 0, 0, 1, 0},
    {0, 0, 1, 1, 1, 0, 0},
    {0, 0, 1, 3, 1, 0, 0},
    {0, 0, 1, 1, 1, 0, 0},
    {0, 1, 0, 0, 0, 1, 0},
	{0, 0, 0, 0, 0, 0, 0},
}

local effect_out = 6


local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat1:setParameter(COMBAT_PARAM_EFFECT, effect_out)
combat1:setArea(createCombatArea(arr1))


local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, effect_out)
combat2:setArea(createCombatArea(arr2))

local combat3 = Combat()
combat3:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat3:setParameter(COMBAT_PARAM_EFFECT, effect_out)
combat3:setArea(createCombatArea(arr3))

local combat4 = Combat()
combat4:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat4:setParameter(COMBAT_PARAM_EFFECT, effect_out)
combat4:setArea(createCombatArea(arr4))

local combat5 = Combat()
combat5:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat5:setArea(createCombatArea(arr5))

local conditionburn_within = Condition(CONDITION_FIRE, CONDITIONID_COMBAT)
conditionburn_within:setParameter(CONDITION_PARAM_TICKS, 7500)
conditionburn_within:setParameter(CONDITION_PARAM_DELAYED, 1)
conditionburn_within:setParameter(CONDITION_PARAM_TICKINTERVAL, 1500)

function onGetFormulaValues1(player, skill, attack, factor)

	local power = skill * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.045) + (attack * 2.0) + 55
	local max = (level / 5) + (power * 0.085) + (attack * 2.5) + 80
	return -min, -max
end
function onGetFormulaValues2(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.045) + (attack * 2.0) + 55
	local max = (level / 5) + (power * 0.085) + (attack * 2.5) + 80
	return -min, -max
end
function onGetFormulaValues3(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.045) + (attack * 2.0) + 55
	local max = (level / 5) + (power * 0.085) + (attack * 2.5) + 80
	return -min, -max
end
function onGetFormulaValues4(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.045) + (attack * 2.0) + 55
	local max = (level / 5) + (power * 0.085) + (attack * 2.5) + 80
	return -min, -max
end

function onGetFormulaValues5(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.045) + (attack * 2.0) + 55
	local max = (level / 5) + (power * 0.085) + (attack * 2.5) + 80
	return -min, -max
end

combat1:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues1")
combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")
combat3:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues3")
combat4:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues4")
combat5:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues5")


local function burning_within(creatureId, variant)
    local creature = Creature(creatureId)
	if not creature then
		return
	end
    local level = creature:getLevel()
    local maglevel = creature:getMagicLevel()
	
	min = (level / 3)
    max = (level / 3)
	
    conditionburn_within:setParameter(CONDITION_PARAM_PERIODICDAMAGE, math.random(-min,-max))
    combat1:addCondition(conditionburn_within)
	combat2:addCondition(conditionburn_within)
	combat3:addCondition(conditionburn_within)
	combat4:addCondition(conditionburn_within)
	combat5:addCondition(conditionburn_within)
	--creature:getTarget():sendProgressbar(7.5 * 1.5, false)
end

function onCastSpell(creature, variant)

		local positionnube = creature:getPosition()
		positionnube.x = creature:getPosition().x + 2
		positionnube.y = creature:getPosition().y + 2
        positionnube:sendMagicEffect(634)


	local positioneffect1 = creature:getPosition()
    positioneffect1.x = positioneffect1.x + 2
    positioneffect1.y = positioneffect1.y + 1
   
	
	local positioneffect2 = creature:getPosition()
    positioneffect2.x = positioneffect2.x + 1
    positioneffect2.y = positioneffect2.y - 2
	
	local positioneffect3 = creature:getPosition()
    positioneffect3.x = positioneffect3.x + 1
    positioneffect3.y = positioneffect3.y + 1
	
	local positioneffect4 = creature:getPosition()
    positioneffect4.x = positioneffect4.x - 2
    positioneffect4.y = positioneffect4.y + 1
		
		
	  combat1:execute(creature, variant)
	  positioneffect1:sendMagicEffect(402)
	  	  
	  combat2:execute(creature, variant)
	  positioneffect2:sendMagicEffect(401)
	  
	  combat3:execute(creature, variant)
	  positioneffect3:sendMagicEffect(404)
	  
	  combat4:execute(creature, variant)
	  positioneffect4:sendMagicEffect(403)
	  
	  combat5:execute(creature, variant)
	  
	burning_within(creature:getId(), variant)
	creature:attachEffectById(130, true)
		

    return true
end