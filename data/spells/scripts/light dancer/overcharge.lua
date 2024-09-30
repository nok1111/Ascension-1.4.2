local config = {
	 rounds = 8, -- amount of ticks
	timer = 1000, -- time between ticks
	effect = CONST_ME_SKULLHORIZONTAL -- effect 60
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, config.effect)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
		
local condition = Condition(CONDITION_REGENERATION)
condition:setParameter(CONDITION_PARAM_TICKS, config.timer)
condition:setParameter(CONDITION_PARAM_MANAGAIN, 0)
condition:setParameter(CONDITION_PARAM_MANATICKS, config.timer * config.rounds)
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)


local conditionstats = Condition(CONDITION_ATTRIBUTES)
conditionstats:setParameter(CONDITION_PARAM_TICKS, 8000)
conditionstats:setParameter(CONDITION_PARAM_SKILL_SWORDPERCENT, 140)
conditionstats:setParameter(CONDITION_PARAM_SKILL_DISTANCEPERCENT, 140)
conditionstats:setParameter(CONDITION_PARAM_STAT_MAGICPOINTSPERCENT, 140)

conditionstats:setParameter(CONDITION_PARAM_BUFF_SPELL, true)



function onCastSpell(creature, variant)
if creature:getCondition(CONDITION_REGENERATION,0, 25941) then creature:sendCancelMessage("Spell is already active.") local pos = creature:getPosition(creature) pos:sendMagicEffect(CONST_ME_POFF) return false end -- prevents stacking the spell.

	local min = (creature:getMaxHealth() * 0.03) -- Overcharge_event formula minimal
    local max = (creature:getMaxHealth() * 0.03) -- Overcharge_event formula maximum 

	function Overcharge_event(creature, count)
	local creature = Creature(creature)
	if not creature then stopEvent(Overcharge_event) return end
	creature:addHealth(math.random(-min, -max))
	creature:getPosition():sendMagicEffect(config.effect)
	if count > 0 then addEvent(Overcharge_event, config.timer, creature:getId(), count - 1) end	
	return true
	end

	creature:addMana(math.random(min, max))
	creature:addCondition(condition)
	creature:addCondition(conditionstats)
	addEvent(Overcharge_event, config.timer, creature:getId(), config.rounds)
	creature:sendProgressbar(9000, false)
	 local player = Player(creature)
  if player then
  -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    player:sendAddBuffNotification(51, 9, 'overcharged, all offensive stats increased by 40%. you will loose health due to its effects.', 5, 0)
  end
  
return combat:execute(creature, variant)		
end