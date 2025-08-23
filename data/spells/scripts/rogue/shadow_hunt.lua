local combat = Combat()


combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 533)



function onGetFormulaValues(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = ((level / 5) + (power * 0.060) + attack) * 0.38
    local max = ((level / 5) + (power * 0.0705) + attack * 1.3) * 0.45
	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")



local function castSpell(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combat:execute(creature, variant)
end

function onCastSpell(creature, variant)
if not creature then
        return false
    end
	
   combat:execute(creature, variant)

   addEvent(castSpell, 800, creature:getId(), variant)

   addEvent(castSpell, 1600, creature:getId(), variant)
   
   addEvent(castSpell, 2400, creature:getId(), variant)



  return true
end
