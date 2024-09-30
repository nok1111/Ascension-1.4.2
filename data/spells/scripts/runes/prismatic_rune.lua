
local prsmatic_timer = 7500

local conditionpoisoned = Condition(CONDITION_POISON)
conditionpoisoned:setTicks(prsmatic_timer)
conditionpoisoned:setParameter(CONDITION_PARAM_SUBID, 25960)
conditionpoisoned:setParameter(CONDITION_PARAM_DELAYED, 1)
conditionpoisoned:setParameter(CONDITION_PARAM_TICKINTERVAL, 1500)

local conditionbeer = Condition(CONDITION_DRUNK)
conditionbeer:setTicks(prsmatic_timer)
conditionbeer:setParameter(CONDITION_PARAM_SUBID, 25970)
conditionbeer:setParameter(CONDITION_PARAM_DELAYED, 1)
conditionbeer:setParameter(CONDITION_PARAM_TICKINTERVAL, 1500)

local conditionstatic = Condition(CONDITION_ENERGY)
conditionstatic:setTicks(prsmatic_timer)
conditionstatic:setParameter(CONDITION_PARAM_SUBID, 25965)
conditionstatic:setParameter(CONDITION_PARAM_DELAYED, 1)
conditionstatic:setParameter(CONDITION_PARAM_TICKINTERVAL, 1500)


local combat2 = Combat()

combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setArea(createCombatArea(AREA_CIRCLE3X3))




function onGetFormulaValues2(player, skill, attack, factor)
local magic = player:getMagicLevel()
local level = player:getLevel()
local target = player:getTarget()	
local min = (player:getLevel() / 5)  
local max = (player:getLevel() / 5)  
	return -min, -max
end

setCombatCallback(combat2, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")

local function prismatic_burn(creatureId, variant)
    local creature = Creature(creatureId)
	if not creature and creature:getTarget() then
		return
	end
    local level = creature:getLevel()
	
	min = (level * 0.55)
    max = (level * 0.75)
	
    conditionpoisoned:setParameter(CONDITION_PARAM_PERIODICDAMAGE, math.random(-min,-max))
	conditionstatic:setParameter(CONDITION_PARAM_PERIODICDAMAGE, math.random(-min,-max))
	combat2:addCondition(conditionpoisoned)
	combat2:addCondition(conditionbeer)
    combat2:addCondition(conditionstatic)
	combat2:execute(creature, variant)
end



local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 484)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 73)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:addCondition(stun)



function onGetFormulaValues(player, level, magicLevel)
	local min = (level * 1.5) 
	local max = (level * 1.5) 
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")





function onCastSpell(creature, variant, target)
prismatic_burn(creature:getId(), variant)
combat:execute(creature, variant)

	return true
end
