local combat = Combat()
local combat2 = Combat()

local time_between_hits2 = 1.75 --seconds
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat2:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)


function onGetFormulaValues(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
	local magic = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.045) + (attack * 2.8) + 80
	local max = (level / 5) + (power * 0.085) + (attack * 2.5) + 90
	return -min, -max
	
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onGetFormulaValues2(player, skill, attack, factor)
	local magic = player:getMagicLevel()
	local power = magic * attack 
	local level = player:getLevel()


	local min = (level / 5) + (power * 0.065) + (attack * 1.5) + 35
	local max = (level / 5) + (power * 0.085) + (attack * 2.3) + 45
	return -min, -max
	
end
combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")


local function castSpell(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
	if creature:getTarget() then
	creature:getTarget():getPosition():sendMagicEffect(173)
	else
	return false
	end
	
    combat:execute(creature, variant)
	
end

local function castSpell2(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combat2:execute(creature, variant)
end



function onCastSpell(creature, variant)
if not creature then
        return false
    end
local target = creature:getTarget()
local sword = target:getPosition()
        sword.x = sword.x + 1
        sword.y = sword.y + 1
		
  sword:sendMagicEffect(446)
  
  if target:getCondition(CONDITION_POISON, 0, 25960) then
  addEvent(castSpell, 1750, creature:getId(), variant)
  else
  addEvent(castSpell2, 1750, creature:getId(), variant)
  end
  
  return true
end
