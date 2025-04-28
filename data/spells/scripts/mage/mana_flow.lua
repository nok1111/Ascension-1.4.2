local config = {
	 rounds = 8, -- amount of ticks
	timer = 1500, -- time between ticks
	effect = CONST_ME_SKULLHORIZONTAL -- effect
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
		
local condition = Condition(CONDITION_REGENERATION, CONDITIONID_COMBAT)
condition:setParameter(CONDITION_PARAM_TICKS, config.timer)
condition:setParameter(CONDITION_PARAM_MANAGAIN, 0)
condition:setParameter(CONDITION_PARAM_MANATICKS, config.timer * config.rounds)
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)




function onCastSpell(creature, variant)
if creature:getCondition(CONDITION_REGENERATION, CONDITIONID_COMBAT, 25941) then creature:sendCancelMessage("Spell is already active.") local pos = creature:getPosition(creature) pos:sendMagicEffect(CONST_ME_POFF) return false end -- prevents stacking the spell.

	local min = (creature:getMaxMana() * 0.030) -- healingflow formula minimal
    local max = (creature:getMaxMana() * 0.030) -- healingflow formula maximum 

	function healingflow(creature, count)
	local creature = Creature(creature)
	if not creature then stopEvent(healingflow) return end
	creature:addMana(math.random(min, max))
	if count > 0 then addEvent(healingflow, config.timer, creature:getId(), count - 1) end	
	return true
	end

	creature:addMana(math.random(min, max))
	creature:addCondition(condition)
	addEvent(healingflow, config.timer, creature:getId(), config.rounds)
	creature:sendProgressbar(15000, false)
	 local player = Player(creature)
  if player then
  -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
	player:attachEffectById(18, true)
    player:sendAddBuffNotification(13, 13, 'Mana Flow', 5, 0)
  end
  
return combat:execute(creature, variant)		
end