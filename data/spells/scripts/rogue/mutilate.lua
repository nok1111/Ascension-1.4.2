local combat = Combat()
local time_between_hits = 0.2 --seconds
local time_between_hits2 = 0.4 --seconds
local time_between_hits3 = 0.6 --seconds
local time_between_hits4 = 0.8 --seconds

combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
--combat:setParameter(COMBAT_PARAM_EFFECT, 172)

function onGetFormulaValues(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = ((level / 5) + (power * 0.045) + attack) * 0.4
	local max = ((level / 5) + (power * 0.085) + attack * 1.5) * 0.4
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

	
combat:execute(creature, variant) 
addEvent(castSpell, 400, creature:getId(), variant)
addEvent(castSpell, 600, creature:getId(), variant)
  return true
end

