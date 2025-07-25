-- Frames (1 = Area, 2 = Player, 3 = Player + Self Damaging)
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)


function onGetFormulaValues(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()

	local min = (level / 5) + (power * 0.075) + (attack * 3.5) + 75
	local max = (level / 5) + (power * 0.085) + (attack * 4.5) + 85
	return -min, -max
	
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


function onCastSpell(creature, var)
    if not creature then
        return
    end
    local target = creature:getTarget()
    if not target then
        return
    end
    target:attachEffectById(144, true)
    combat:execute(creature, var)
    return true
end