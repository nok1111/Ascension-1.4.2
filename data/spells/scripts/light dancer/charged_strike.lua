local combat = Combat()
local combat2 = Combat()
local combat3 = Combat()

local time_between_hits2 = 1.75 --seconds
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 320)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, 371)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat2:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

combat3:setParameter(COMBAT_PARAM_EFFECT, 413)
--347



function onGetFormulaValues(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()

	local min = (level / 5) + (power * 0.045) + attack
	local max = (level / 5) + (power * 0.085) + attack * 1.5
	return -min, -max
	
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onGetFormulaValues2(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()

	local min = (level / 5) + (power * 0.035) + attack
	local max = (level / 5) + (power * 0.055) + attack * 1.5
	return -min, -max
	
end
combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")



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


function onCastSpell(creature, variant)

local target = creature:getTarget()
local sword = target:getPosition()
        sword.x = sword.x + 2
        sword.y = sword.y + 0
		
  
  
  if target:getCondition(CONDITION_ENERGY, 0, 25965) then
  addEvent(castSpell2, time_between_hits2 * 300, creature:getId(), variant)
  addEvent(castSpell2, time_between_hits2 * 500, creature:getId(), variant)	
  sword:sendMagicEffect(347)
  else
	addEvent(castSpell3, time_between_hits2 * 225, creature:getId(), variant)
	combat:execute(creature, variant) 
  end
  
  return true
end
