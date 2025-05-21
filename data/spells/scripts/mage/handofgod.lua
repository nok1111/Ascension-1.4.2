if not PassiveSkills then
    dofile('data/scripts/PassiveTree/0_PassiveSkillsDataConfig.lua')
end

local combat = Combat()

combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREHAND)
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
	local power = magic * attack 
	local level = player:getLevel()


	local min = (level / 5) + (power * 0.065) + (attack * 2.3) + 50
	local max = (level / 5) + (power * 0.075) + (attack * 2.5) + 70
	return -min, -max
	
end
combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")



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
   combat:execute(creature, variant)
  	addEvent(castSpell2, 700, creature:getId(), variant)

  return true
end
