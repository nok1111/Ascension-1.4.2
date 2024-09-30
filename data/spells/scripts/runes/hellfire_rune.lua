
local condition = Condition(CONDITION_FIRE)
condition:setTicks(7500)
condition:setParameter(CONDITION_PARAM_DELAYED, 1)
condition:setParameter(CONDITION_PARAM_TICKINTERVAL, 1500)

local combat2 = Combat()

combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setArea(createCombatArea(AREA_CIRCLE3X3))




function onGetFormulaValues2(player, skill, attack, factor)
local magic = player:getMagicLevel()
local level = player:getLevel()
local target = player:getTarget()	
local min = (player:getLevel() / 5)  + (magic * 2.5)
local max = (player:getLevel() / 5)  + (magic * 2.5)
	return -min, -max
end

setCombatCallback(combat2, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")

local function hellfire_burn(creatureId, variant)
    local creature = Creature(creatureId)
	if not creature and creature:getTarget() then
		return
	end
    local level = creature:getLevel()
    local maglevel = creature:getMagicLevel()
	
	min = (maglevel * 2.5)
    max = (maglevel * 2.5)
	
    condition:setParameter(CONDITION_PARAM_PERIODICDAMAGE, math.random(-min,-max))
    combat2:addCondition(condition)
	combat2:execute(creature, variant)
end



local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 480)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 4)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:addCondition(stun)



function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 7.2) + 130
	local max = (level / 5) + (magicLevel * 8.3) + 140
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")





function onCastSpell(creature, variant, target)
hellfire_burn(creature:getId(), variant)
combat:execute(creature, variant)
	return true
end
