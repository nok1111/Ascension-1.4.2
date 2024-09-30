
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setArea(createCombatArea(AREA_SQUARE1X1))

function onGetFormulaValues(player, skill, attack, factor)
    local magic = player:getMagicLevel()
    local power = magic * attack 
    local level = player:getLevel()

    local min = ((level / 5) + (power * 0.10) + (attack * 4.0) + 300) / 2.5
    local max = ((level / 5) + (power * 0.11) + (attack * 4.1) + 350) / 2.0
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")



function onCastSpell(cid, variant)
    local owner = cid:getMaster()
    local target = owner:getTarget()
    
	combat:execute(owner:getId(), variant)
   -- doAreaCombatHealth(owner:getId(), COMBAT_ENERGYDAMAGE, cid:getPosition(), area, -min, -max, CONST_ME_NONE)   
    return true
end