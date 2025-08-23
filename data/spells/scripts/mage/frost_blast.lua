local combat = Combat()
local time_between_hits = 0.2 --seconds
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 176)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

local combat2 = Combat()
local time_between_hits2 = 0.2 --seconds

combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
combat2:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 176)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat2:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

local combat3 = Combat()
combat3:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NATUREAURA3)


local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 1000)
condition:setFormula(-1, 120, -1, 120)
combat3:addCondition(condition)



function onGetFormulaValues(player, skill, attack, factor)

    local magic = player:getMagicLevel()
    local power = skill * attack
    local magicpower = magic * attack
    local level = player:getLevel()
    

    local min = ((level / 5) + (power * 0.045) + (magicpower * 0.12) + 15) * 0.55
    local max = ((level / 5) + (power * 0.055) + (magicpower * 0.14) + 20) * 0.65
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onGetFormulaValues2(player, skill, attack, factor)

	local magic = player:getMagicLevel()
    local power = skill * attack
    local magicpower = magic * attack
    local level = player:getLevel()
    

    local min = ((level / 5) + (power * 0.045) + (magicpower * 0.12) + 15) * 0.55
    local max = ((level / 5) + (power * 0.055) + (magicpower * 0.14) + 20) * 0.65
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



function onCastSpell(creature, variant)
if not creature then
        return false
    end
	
local targetmonster = creature:getTarget()
	if not combat:execute(creature, variant) and targetmonster:getSpeed() < 1 then
		return false
	end

if (creature:getTarget() and creature:getTarget():isMonster()) and targetmonster:getSpeed() > 0    then 
combat3:execute(creature, variant)
 end
	
   combat:execute(creature, variant)
  addEvent(castSpell2, 200, creature:getId(), variant)
  return true
end
