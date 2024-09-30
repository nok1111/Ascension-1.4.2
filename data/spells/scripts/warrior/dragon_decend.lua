local combat = Combat()
local time_between_hits = 0.2 --seconds
local time_between_hits2 = 0.4 --seconds
local time_between_hits3 = 0.6 --seconds
local time_between_hits4 = 0.8 --seconds

combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:setParameter(COMBAT_PARAM_EFFECT, 480)

function onGetFormulaValues(player, skill, attack, factor)
  local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
    local power = sword * attack 
    local level = player:getLevel()
    local magic = player:getMagicLevel()

    local min = (level / 5) + (power * 0.10) + (attack * 5.0) + 350
    local max = (level / 5) + (power * 0.15) + (attack * 5.5) + 450
	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function castSpell(creatureId, variant, position_effect)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	local positioneffect3 = position_effect
    positioneffect3.x = position_effect.x + 1
    positioneffect3.y = position_effect.y + 1
	positioneffect3:sendMagicEffect(580)
	positioneffect3:sendMagicEffect(341)
    combat:execute(creature, variant)
end

function onCastSpell(creature, variant)
if not creature then
        return false
    end
	
	local target = creature:getTarget()
	local position = target:getPosition()
	local position_effect = target:getPosition()

addEvent(castSpell, 700, creature:getId(), variant, position_effect)

   
	
	if math.random(1, 2) > 1 then
	local positioneffect2 = position
    positioneffect2.x = position.x - 0
    positioneffect2.y = position.y - 0
	positioneffect2:sendMagicEffect(578)
	
	
	local position_target2 = target:getPosition()
    position_target2.x = target:getPosition().x + 1
    position_target2.y = target:getPosition().y + 2
	position_target2:sendMagicEffect(654)
	else
	local positioneffect = position
    positioneffect.x = position.x + 2
    positioneffect.y = position.y + 0
    positioneffect:sendMagicEffect(579)

	
	local position_target2 = target:getPosition()
    position_target2.x = target:getPosition().x + 4
    position_target2.y = target:getPosition().y + 2
	position_target2:sendMagicEffect(654)
	end
	

  return true
end

