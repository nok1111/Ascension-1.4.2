local combat = Combat()
local time_between_hits = 0.2 --seconds
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ICE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

local combat2 = Combat()
local time_between_hits2 = 0.1 --seconds

combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat2:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_NEWFIREBALLTWO)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat2:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

local combat3 = Combat()
local time_between_hits3 = 0.2 --seconds

combat3:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat3:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ORCSHAMAN)
combat3:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_BLUEBALL)
combat3:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat3:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

local combat4 = Combat()
local time_between_hits4 = 0.3 --seconds

combat4:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat4:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_BIGROCK)
combat4:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)
combat4:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat4:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)


function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 2.3) + 25
	local max = (level / 5) + (magicLevel * 2.4) + 26
	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onGetFormulaValues2(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 2.3) + 25
	local max = (level / 5) + (magicLevel * 2.4) + 26
	return -min, -max
end
combat2:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues2")

function onGetFormulaValues3(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 2.3) + 25
	local max = (level / 5) + (magicLevel * 2.4) + 26
	return -min, -max
end
combat3:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues3")

function onGetFormulaValues4(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 2.3) + 25
	local max = (level / 5) + (magicLevel * 2.4) + 26
	return -min, -max
end
combat4:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues4")

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

local function castSpell4(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combat4:execute(creature, variant)
	
end

function onCastSpell(creature, variant)
if not creature then
        return false
    end
	
   combat:execute(creature, variant)
	addEvent(castSpell2, 100, creature:getId(), variant)
	addEvent(castSpell3, 200, creature:getId(), variant)
	addEvent(castSpell4, 300, creature:getId(), variant)
  return true
end
