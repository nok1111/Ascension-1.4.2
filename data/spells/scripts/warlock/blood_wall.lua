local combat = Combat()
--combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_DRAWBLOOD)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local condition = Condition(CONDITION_ATTRIBUTES, CONDITIONID_DEFAULT)
condition:setParameter(CONDITION_PARAM_TICKS, 15000)
condition:setParameter(CONDITION_PARAM_SKILL_SHIELDPERCENT, 150)
condition:setParameter(CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, 150)
condition:setParameter(CONDITION_PARAM_SUBID, 3155) -- Unique sub ID for tracking
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
combat:addCondition(condition)

function onCastSpell(creature, variant)
  local player = Player(creature)
player:attachEffectById(63, true)
	

local player = Player(creature)
  if player then
  combat:execute(creature, variant)
  creature:addHealth(creature:getMaxHealth())
  -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    player:sendAddBuffNotification(104, 15, 'Blood Wall', 5, 0)
  end
  
  
	return true
end
