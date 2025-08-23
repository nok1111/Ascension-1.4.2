local combat = Combat()
local combat2 = Combat()

local time_between_hits2 = 1.75 --seconds
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 438)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat2:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat2:setArea(createCombatArea(AREA_SQUARE1X1))


function onGetFormulaValues(player, skill, attack, factor)
	local magic = player:getMagicLevel()
    local power = skill * attack
    local magicpower = magic * attack
    local level = player:getLevel()
    

    local min = ((level / 5) + (power * 0.045) + (magicpower * 0.12) + 8) * 0.5
    local max = ((level / 5) + (power * 0.055) + (magicpower * 0.13) + 12) * 0.6
	return -min, -max
	
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onGetFormulaValues2(player, skill, attack, factor)
	local magic = player:getMagicLevel()
    local power = skill * attack
    local magicpower = magic * attack
    local level = player:getLevel()
    

    local min = ((level / 5) + (power * 0.045) + (magicpower * 0.12) + 8) * 1.1
    local max = ((level / 5) + (power * 0.055) + (magicpower * 0.13) + 12) * 1.2
	return -min, -max
	
end
combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")


local function castSpell(creatureId, variant, targetId)
	local creature = Creature(creatureId)
	if not creature then
		return
	end	
	local target = Creature(targetId)
	if target then
		target:attachEffectById(118, true)
	end
    combat2:execute(creature, variant)
	
end

function onCastSpell(creature, variant)
if not creature then
        return false
    end
local target = creature:getTarget()

  addEvent(castSpell,1600, creature:getId(), variant, target:getId())

  target:attachEffectById(117, true)
  combat:execute(creature, variant)
  
  return true
end
