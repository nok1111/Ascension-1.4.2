local config = {
	 rounds = 7, -- amount of ticks
	timer = 2500, -- time between ticks
	effect = CONST_ME_MAGIC_RED -- effect
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, config.effect)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
		
local condition = Condition(CONDITION_REGENERATION, CONDITIONID_COMBAT)
condition:setParameter(CONDITION_PARAM_TICKS, config.timer)
condition:setParameter(CONDITION_PARAM_HEALTHGAIN, 0)
condition:setParameter(CONDITION_PARAM_HEALTHTICKS, config.timer * config.rounds)
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
condition:setParameter(CONDITION_PARAM_SUBID, 25941)

function onCastSpell(creature, variant)
if creature:getCondition(CONDITION_REGENERATION,0, 25941) then creature:sendCancelMessage("Spell is already active.") local pos = creature:getPosition(creature) pos:sendMagicEffect(CONST_ME_POFF) return false end -- prevents stacking the spell.

	local min = (creature:getMaxHealth() * 0.07) -- healing formula minimal
    local max = (creature:getMaxHealth() * 0.15) -- healing formula maximum 

	function healing(creature, count)
	local creature = Creature(creature)
	if not creature then stopEvent(healing) return end
	creature:addHealth(math.random(min, max))
	creature:getPosition():sendMagicEffect(config.effect)
	if count > 0 then addEvent(healing, config.timer, creature:getId(), count - 1) end	
	return true
	end

	creature:addHealth(math.random(min, max))
	creature:addCondition(condition)	
	addEvent(healing, config.timer, creature:getId(), config.rounds)
	
return combat:execute(creature, variant)		
end