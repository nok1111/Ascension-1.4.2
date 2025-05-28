local combat = Combat()
local time_between_hits = 0.2 --seconds
local time_between_hits2 = 0.4 --seconds
local time_between_hits3 = 0.6 --seconds
local time_between_hits4 = 0.8 --seconds


--combat:setParameter(COMBAT_PARAM_EFFECT, 172)

function onGetFormulaValues(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = ((level / 5) + (power * 0.045) + attack) * 0.4
	local max = ((level / 5) + (power * 0.085) + attack * 1.5) * 0.4

	local butchersArt = player:getStorageValue(PassiveSkills.ButchersArt) or 0
	if butchersArt > 0 then
		local extra = butchersArt / 100
		min = min + ( min * extra)
		max = max + ( max * extra)
	end


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
   local target = creature:getTarget()
	local position = target:getPosition()
	local positioneffect = position
    positioneffect.x = position.x + 1
    positioneffect.y = position.y + 1
	
    positioneffect:sendMagicEffect(361)
	

	local butchersArt = creature:getStorageValue(PassiveSkills.ButchersArt) or 0
	if butchersArt > 0 then
		combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
	end
	
combat:execute(creature, variant) 
addEvent(castSpell, 400, creature:getId(), variant)
addEvent(castSpell, 600, creature:getId(), variant)
  return true
end

