local combat = Combat()
--combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_DRAWBLOOD)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)


local function detachEffect(playerid)
  local player = Player(playerid)
  if player then
    player:detachEffectById(87, true)
  end
end


function onCastSpell(creature, variant)
  local player = Player(creature)

  local LingeringDarkness = player:getStorageValue(PassiveSkills.LingeringDarkness)
  local duration = 8000
 
  if LingeringDarkness > 0 then
    duration = duration + (LingeringDarkness * 1000)
  end

  local condition = Condition(CONDITION_ATTRIBUTES, CONDITIONID_DEFAULT)
  condition:setParameter(CONDITION_PARAM_TICKS, duration)
  condition:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.darkaura) -- Unique sub ID for tracking
  condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

  local playerGuid = player:getId()
  addEvent(detachEffect, duration, playerGuid)

  combat:addCondition(condition)
  combat:execute(creature, variant)
  player:attachEffectById(87, true)
  -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    player:sendAddBuffNotification(104, (duration / 1000), 'Dark Aura', 5, 0)


    
	return true
end
