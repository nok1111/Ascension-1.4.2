local combat = Combat()
local time_between_hits = 0.3 --seconds
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ORCSHAMAN)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_BLUEBALL)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:setArea(createCombatArea(AREA_SQUAREWAVE51, AREADIAGONAL_SQUAREWAVE5))


local combat2 = Combat()
local time_between_hits = 0.6 --seconds
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ORCSHAMAN)
combat2:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_BLUEBALL)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat2:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat2:setArea(createCombatArea(AREA_SQUAREWAVE52, AREADIAGONAL_SQUAREWAVE5))

local combat3 = Combat()
local time_between_hits = 0.9 --seconds
combat3:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat3:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ORCSHAMAN)
combat3:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_BLUEBALL)
combat3:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat3:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat3:setArea(createCombatArea(AREA_SQUAREWAVE53, AREADIAGONAL_SQUAREWAVE5))

function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 4.5) + 20
	local max = (level / 5) + (magicLevel * 7.6) + 48
	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onGetFormulaValues2(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 4.5) + 20
	local max = (level / 5) + (magicLevel * 7.6) + 48
	return -min, -max
end
combat2:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues2")


function onGetFormulaValues3(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 4.5) + 20
	local max = (level / 5) + (magicLevel * 7.6) + 48
	return -min, -max
end
combat3:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues3")

local function castSpell2(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combat2:execute(creature, variant)
end

local function castSpell3(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combat3:execute(creature, variant)
end

function onCastSpell(creature, variant)
if not creature then
        return false
    end
	combat1:execute(creature, variant)
    combat2:execute(creature, variant)
    combat3:execute(creature, variant)
  	addEvent(castSpell2, 1000, creature:getId(), variant)
	addEvent(castSpell3, 1200, creature:getId(), variant)
    return true
end
