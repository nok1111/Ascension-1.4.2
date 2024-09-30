local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 50)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)




function onGetFormulaValues(player, skill, attack, factor)

	local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.045) + (attack * 2.5) + 50
	local max = (level / 5) + (power * 0.085) + (attack * 3.5) + 65
	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function applycross(position)  	
    position:sendMagicEffect(597)
end

local function castSpell(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combat:execute(creature, variant)
end


function onCastSpell(creature, variant)
local target = creature:getTarget()
local position = target:getPosition()
  
	
   addEvent(castSpell, 500, creature:getId(), variant)
   addEvent(applycross, 250, target:getPosition())
   position.x = target:getPosition().x + 1
   position.y = target:getPosition().y + 1
   
   position:sendMagicEffect(601)
  return true
end


