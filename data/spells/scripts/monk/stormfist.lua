function onCastSpell(creature, variant)
	local player = Player(creature)
  if player then
  

local stormfist = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
stormfist:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
stormfist:setParameter(CONDITION_PARAM_SUBID, 29500)
local durationLevel = math.max(player:getStorageValue(PassiveSkills.StormfistDuration) or 0, 0)
local duration = 3000 + (durationLevel * 1000)

stormfist:setParameter(CONDITION_PARAM_TICKS, duration)

player:addCondition(stormfist)
player:attachEffectById(9, true)

	 -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    player:sendAddBuffNotification(83, duration / 1000, 'Your physical damage sends a lighting shock to nearby target.', 3, 0)
end
    return true
end
