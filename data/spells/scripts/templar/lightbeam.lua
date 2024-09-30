local effect_damage = 600

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, effect_damage)
combat:setArea(createCombatArea(AREA_SQUAREWAVE51, AREADIAGONAL_SQUAREWAVE5))
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

local combat2 = Combat()
local time_between_hits2 = 0.3 --seconds
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, effect_damage)
combat2:setArea(createCombatArea(AREA_SQUAREWAVE52, AREADIAGONAL_SQUAREWAVE5))
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat2:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

local combat3 = Combat()
local time_between_hits3 = 0.5 --seconds
combat3:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat3:setParameter(COMBAT_PARAM_EFFECT, effect_damage)
combat3:setArea(createCombatArea(AREA_SQUAREWAVE53, AREADIAGONAL_SQUAREWAVE5))
combat3:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat3:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

local combat4 = Combat()
local time_between_hits4 = 0.5 --seconds
combat4:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat4:setParameter(COMBAT_PARAM_EFFECT, effect_damage)
combat4:setArea(createCombatArea(AREA_SQUAREWAVE53, AREADIAGONAL_SQUAREWAVE5))
combat4:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat4:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

function onGetFormulaValues(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.045) + (attack * 2.0) + 55
	local max = (level / 5) + (power * 0.085) + (attack * 2.5) + 80	
	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onGetFormulaValues2(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.045) + (attack * 2.0) + 55
	local max = (level / 5) + (power * 0.085) + (attack * 2.5) + 80	
	return -min, -max
end
combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")


function onGetFormulaValues3(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.045) + (attack * 2.0) + 55
	local max = (level / 5) + (power * 0.085) + (attack * 2.5) + 80 		
	return -min, -max
end
combat3:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues3")

function onGetFormulaValues4(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.045) + (attack * 2.0) + 55
	local max = (level / 5) + (power * 0.085) + (attack * 2.5) + 80				
	return -min, -max
end
combat4:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues4")


local function castSpell2(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combat2:execute(creature, variant)
end

local function castSpell3(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combat3:execute(creature, variant)
end

local function castSpell4(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combat4:execute(creature, variant)
end

function onCastSpell(creature, variant)
if not creature then
        return false
    end
   combat:execute(creature, variant)
	addEvent(castSpell2, 300, creature:getId(), variant)
	addEvent(castSpell3, 500, creature:getId(), variant)
	addEvent(castSpell3, 500, creature:getId(), variant)
    return true
end
