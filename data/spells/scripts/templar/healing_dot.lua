local config = {
	healPercent = 3,
	 rounds = 5, -- amount of ticks
	timer = 1000, -- time between ticks
	effect = CONST_ME_SHINNYSPARK -- effect
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, config.effect)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
		
local condition = Condition(CONDITION_REGENERATION)
condition:setParameter(CONDITION_PARAM_TICKS, config.timer)
condition:setParameter(CONDITION_PARAM_HEALTHGAIN, 0)
condition:setParameter(CONDITION_PARAM_HEALTHTICKS, config.timer * config.rounds)
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
condition:setParameter(CONDITION_PARAM_SUBID, 25941)

function onCastSpell(creature, variant)
if creature:getCondition(CONDITION_REGENERATION,0, 25941) then creature:sendCancelMessage("Spell is already active.") local pos = creature:getPosition(creature) pos:sendMagicEffect(CONST_ME_POFF) return false end -- prevents stacking the spell.
local magic = creature:getMagicLevel()


		local FormulaHealthMin = (creature:getMaxHealth() * (config.healPercent/100) + magic * 3.5)
		local FormulaHealthMax = (creature:getMaxHealth() * (config.healPercent/100) + magic * 4.5)
		local FinalHealth = math.random(FormulaHealthMin, FormulaHealthMax)
		
		
	function healing(creature, count)
	local creature = Creature(creature)
	if not creature then stopEvent(healing) return end
	creature:addHealth(math.random(FormulaHealthMin, FormulaHealthMax))
	creature:getPosition():sendMagicEffect(config.effect)
	if count > 0 then addEvent(healing, config.timer, creature:getId(), count - 1) end	
	return true
	end

	creature:addHealth(math.random(FormulaHealthMin, FormulaHealthMax))
	creature:addCondition(condition)	
	addEvent(healing, config.timer, creature:getId(), config.rounds)
	creature:sendProgressbar(7000, false)
	local player = Player(creature)
	 if player then
  -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    player:sendAddBuffNotification(5, 7, 'Holy Light', 5, 0)
  end
return combat:execute(creature, variant)		
end