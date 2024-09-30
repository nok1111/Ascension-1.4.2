local config = {
	 rounds = 2, -- amount of ticks
	timer = 1000, -- time between ticks
	effect = CONST_ME_AURARED -- effect
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, config.effect)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
		
local condition = Condition(CONDITION_REGENERATION)
condition:setParameter(CONDITION_PARAM_TICKS, config.timer)
condition:setParameter(CONDITION_PARAM_MANAGAIN, 0)
condition:setParameter(CONDITION_PARAM_MANATICKS, config.timer * config.rounds)
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
condition:setParameter(CONDITION_PARAM_SUBID, 25941)

function onCastSpell(creature, variant)
if creature:getCondition(CONDITION_REGENERATION,0, 25941) then creature:sendCancelMessage("Spell is already active.") local pos = creature:getPosition(creature) pos:sendMagicEffect(CONST_ME_POFF) return false end -- prevents stacking the spell.
	local per = 5
	local maxhp = creature:getMaxHealth() * (20 / 100)
	if creature:getHealth() <=  maxhp then
	creature:sendCancelMessage("you are too low.")
	else
	 creature:say(creature:getHealth(), TALKTYPE_MONSTER_SAY, false, player, creature:getPosition())
	local min = (creature:getLevel() / 5) + (creature:getMagicLevel() * 1.4) + 5 -- Mana_Dot_Warlock formula minimal
    local max = (creature:getLevel() / 5) + (creature:getMagicLevel() * 1.8) + 7-- Mana_Dot_Warlock formula maximum 
    
	function Mana_Dot_Warlock(creature, count)
	local creature = Creature(creature)
	if not creature then stopEvent(Mana_Dot_Warlock) return end
	creature:addMana(math.random(min, max))
	creature:addHealth( -(creature:getMaxHealth() * (per / 100)))
	creature:getPosition():sendMagicEffect(config.effect)
	if count > 0 then addEvent(Mana_Dot_Warlock, config.timer, creature:getId(), count - 1) end	
	return true
	end
	
	creature:addMana(math.random(min, max))
	creature:addCondition(condition)	
	addEvent(Mana_Dot_Warlock, config.timer, creature:getId(), config.rounds)
	end
return combat:execute(creature, variant)		
end