local combat = Combat()
local combat2 = Combat()

local time_between_hits2 = 1.75 --seconds
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 461)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)

combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, 516)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat2:setParameter(COMBAT_PARAM_USECHARGES, true)

--347



function onGetFormulaValues(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.045) + (attack * 1.2) + 40
	local max = (level / 5) + (power * 0.085) + (attack * 2.5) + 45
	return -min, -max
	
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onGetFormulaValues2(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.065) + (attack * 2.5) + 80
	local max = (level / 5) + (power * 0.085) + (attack * 2.8) + 90
	return -min, -max
	
end
combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")



local function castSpell2(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combat2:execute(creature, variant)
	creature:getTarget():getPosition():sendMagicEffect(173)
end

function onCastSpell(creature, variant)
if not creature then
        return false
    end
local target = creature:getTarget()
local sword = target:getPosition()
        sword.x = sword.x + 2
        sword.y = sword.y + 0
		
  
  
  if target:getCondition(CONDITION_STUN, 0) or target:getSkull() > 0 then
  --combat2:execute(creature, var) 
  
	castSpell2(creature:getId(), variant)
  else
	combat:execute(creature, variant) 
  end
  
  return true
end
