-- Frames (1 = Area, 2 = Player, 3 = Player + Self Damaging)
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)


function onGetFormulaValues(player, skill, attack, factor)
	local power = skill * attack 
    local level = player:getLevel()

    local min = ((level / 5) + (power * 0.060) + attack * 1.0) * 1.1
    local max = ((level / 5) + (power * 0.0705) + attack * 1.3) * 1.1
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

    local min = ((level / 5) + (power * 0.060) + attack * 1.0) * 1.1
    local max = ((level / 5) + (power * 0.0705) + attack * 1.3) * 1.1
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
        local ElusiveCharge = math.max(getBuffStack(creature, "ElusiveCharge") or 0, 0)
        creature:sendAddBuffNotification(35, 10, 'Elusive Charge.', 3, ElusiveCharge)

        target:attachEffectById(145, true)
    else
        target:attachEffectById(144, true)
        
    end
    return true
end