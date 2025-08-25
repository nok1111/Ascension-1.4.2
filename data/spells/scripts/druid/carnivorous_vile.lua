local combat = Combat()
local combat2 = Combat()

local time_between_hits2 = 1.75 --seconds
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 438)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat2:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)


function onGetFormulaValues(player, skill, attack, factor)
	local magic = player:getMagicLevel()
    local power = skill * attack
    local magicpower = magic * attack
    local level = player:getLevel()
    

    local min = ((level / 5) + (power * 0.045) + (magicpower * 0.12) + 8) * 1.65
    local max = ((level / 5) + (power * 0.055) + (magicpower * 0.13) + 12) * 1.75
	return -min, -max
	
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onGetFormulaValues2(player, skill, attack, factor)
	local magic = player:getMagicLevel()
    local power = skill * attack
    local magicpower = magic * attack
    local level = player:getLevel()
    

    local min = ((level / 5) + (power * 0.045) + (magicpower * 0.12) + 8) * 1.55
    local max = ((level / 5) + (power * 0.055) + (magicpower * 0.13) + 12) * 1.65
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
		return 
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

local INFECTION_SUBID = 101
  if target:getCondition(CONDITION_POISON) then
	target:attachEffectById(122, true)
  addEvent(castSpell, 1250, creature:getId(), variant)
  else
  addEvent(castSpell2, 1250, creature:getId(), variant)
  target:attachEffectById(115, true)
  end
  
  
  return true
end
