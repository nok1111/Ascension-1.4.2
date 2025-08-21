local combat = Combat()
local combat2 = Combat()
local time_between_hits = 0.2 --seconds
local time_between_hits2 = 0.4 --seconds
local time_between_hits3 = 0.6 --seconds
local time_between_hits4 = 0.8 --seconds


--combat:setParameter(COMBAT_PARAM_EFFECT, 172)

function onGetFormulaValues(player, skill, attack, factor)
	local power = skill * attack 
    local level = player:getLevel()

    local min = ((level / 5) + (power * 0.060) + attack * 1.0) * 0.20
    local max = ((level / 5) + (power * 0.0705) + attack * 1.3) * 0.22

	local butchersArt = player:getStorageValue(PassiveSkills.ButchersArt) or 0
	if butchersArt > 0 then
		local extra = butchersArt / 100
		min = min + ( min * extra)
		max = max + ( max * extra)
	end


	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onGetFormulaValues2(player, skill, attack, factor)
	local power = skill * attack 
    local level = player:getLevel()

    local min = ((level / 5) + (power * 0.060) + attack * 1.0) * 0.50
    local max = ((level / 5) + (power * 0.0705) + attack * 1.3) * 0.55

	local butchersArt = player:getStorageValue(PassiveSkills.ButchersArt) or 0
	if butchersArt > 0 then
		local extra = butchersArt / 100
		min = min + ( min * extra)
		max = max + ( max * extra)
	end


	return -min, -max
end
combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")

local function castSpell(creatureId, variant, targetId)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combat:execute(creature, variant)
	creature:say("1", TALKTYPE_MONSTER_SAY)
end

local function castLastHit(creatureId, variant, targetId)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
    combat2:execute(creature, variant)
	creature:say("last hit", TALKTYPE_MONSTER_SAY)
end

function onCastSpell(creature, variant)
if not creature then
        return 
    end
   local target = creature:getTarget()
	local position = target:getPosition()
	
	

	local butchersArt = creature:getStorageValue(PassiveSkills.ButchersArt) or 0
	if butchersArt > 0 then
		combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
		combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
		target:attachEffectById(137, true)
	else
		combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
		combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
		target:attachEffectById(136, true)
	end
	
combat:execute(creature, variant) 

addEvent(castSpell, 200, creature:getId(), variant, target:getId())
addEvent(castSpell, 300, creature:getId(), variant, target:getId())
addEvent(castLastHit, 1000, creature:getId(), variant, target:getId())
  return true
end

