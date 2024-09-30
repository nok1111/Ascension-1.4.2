local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 6)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_BURSTARROW)
combat:setArea(createCombatArea(AREA_CIRCLE1X2))
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)


local combat2 = Combat()

combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setArea(createCombatArea(AREA_CIRCLE1X2))


local conditionburn_shots = Condition(CONDITION_FIRE)
conditionburn_shots:setTicks(7500)
conditionburn_shots:setParameter(CONDITION_PARAM_DELAYED, 1)
conditionburn_shots:setParameter(CONDITION_PARAM_TICKINTERVAL, 1500)

function onGetFormulaValues(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_DISTANCE) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.012)  + (magic * 2.2) + 4
	local max = (level / 5) + (power * 0.0145)  + (magic * 3.1) + 6
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


function onGetFormulaValues2(player, skill, attack, factor)
local magic = player:getMagicLevel()
local level = player:getLevel()
local target = player:getTarget()	
local min = (player:getLevel() / 5)  + (magic * 2.5)
local max = (player:getLevel() / 5)  + (magic * 2.5)
	return -min, -max
end

setCombatCallback(combat2, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")


local function CastSpellburningshots(creatureId, variant)
    local creature = Creature(creatureId)
	if not creature then
		return
	end
    local level = creature:getLevel()
    local maglevel = creature:getMagicLevel()
	
	min = (maglevel * 2.5)
    max = (maglevel * 2.5)
	
    conditionburn_shots:setParameter(CONDITION_PARAM_PERIODICDAMAGE, math.random(-min,-max))
    combat2:addCondition(conditionburn_shots)
	combat2:execute(creature, variant)
end



local function Explosive_damage(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
    combat:execute(creature, variant)
end

function onCastSpell(creature, variant)
	if not creature then
        return false
    end
	combat:execute(creature, variant)
	addEvent(Explosive_damage, 600, creature:getId(), variant)
	addEvent(Explosive_damage, 1300, creature:getId(), variant)
	addEvent(Explosive_damage, 1900, creature:getId(), variant)
	
	if creature:getTarget():getCondition(CONDITION_DRUNK, 0, 25970) and creature and creature:getTarget() then
	addEvent(CastSpellburningshots, 2000, creature:getId(), variant)
	end
	
		
	return true
end
