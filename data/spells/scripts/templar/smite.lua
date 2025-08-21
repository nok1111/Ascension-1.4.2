
local combat2 = Combat()
local time_between_hits2 = 0.5 --seconds
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, 40)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat2:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)



function onGetFormulaValues2(player, skill, attack, factor)
	local power = skill * attack 
    local level = player:getLevel()
    local magic = player:getMagicLevel()

    local min = (level / 5) + (power * 0.062) + attack
    local max = (level / 5) + (power * 0.0705) + attack * 1.3
	return -min, -max
end
combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")


local function castSpell(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combat2:execute(creature, variant)
end


function onCastSpell(creature, variant)

local target = creature:getTarget()
local sword = target:getPosition()
		
  sword:sendMagicEffect(530)
  if not creature then
        return false
    end
	
	addEvent(castSpell, 600, creature:getId(), variant)
  return true
end
