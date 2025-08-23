
local combat = Combat()

combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 237)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)


local combat2 = Combat()


combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, 7)
combat2:setArea(createCombatArea(AREA_SQUARE1X1))
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat2:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)




function onGetFormulaValues(player, skill, attack, factor)
	local magic = player:getMagicLevel()
    local power = skill * attack
    local magicpower = magic * attack
    local level = player:getLevel()
    

    local min = ((level / 5) + (power * 0.045) + (magicpower * 0.12) + 8) * 1.65
    local max = ((level / 5) + (power * 0.055) + (magicpower * 0.13) + 12) * 1.70
	return -min, -max
	
end
combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")



local function castSpell2(creatureId, variant, targetId)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combat2:execute(creature, variant)
	local target = Creature(targetId)
	if not target then
		return
	end
	target:attachEffectById(219, true)
end


function onCastSpell(creature, variant)
if not creature then
        return false
    end
   local target = creature:getTarget()
   if not target then
    return false
   end
   target:attachEffectById(218, true)
   	addEvent(castSpell2, 700, creature:getId(), variant, target:getId())

  return true
end
