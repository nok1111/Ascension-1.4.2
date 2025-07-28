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

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat2:setParameter(COMBAT_PARAM_USECHARGES, true)

function onGetFormulaValues2(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()

	local min2 = ((level / 5) + (power * 0.075) + (attack * 3.5) + 75) / 2
	local max2 = ((level / 5) + (power * 0.085) + (attack * 4.5) + 85) / 2


	return -min2, -max2
	
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
        return
    end
    local target = creature:getTarget()
    if not target then
        return
    end
    
    combat:execute(creature, variant)

    local DancingEdgeLevel = creature:getStorageValue(PassiveSkills.DancingEdge) or 0
    local random = math.random(1, 100)
    if DancingEdgeLevel > 0 and random <= DancingEdgeLevel then
        addEvent(castSpell2, 500, creature:getId(), variant)
        addBuffStack(creature, "ElusiveCharge", 1, 10000)
        target:attachEffectById(145, true)
    else
        target:attachEffectById(144, true)
        
    end
    return true
end