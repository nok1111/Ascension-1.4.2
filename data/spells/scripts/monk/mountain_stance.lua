function onCastSpell(creature, variant)
	local player = Player(creature)
  if player then
  

local mountain_stance = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
mountain_stance:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
mountain_stance:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.mountain_stance)
mountain_stance:setParameter(CONDITION_PARAM_STAT_MAXHEALTHPOINTSPERCENT, 125)

--local durationLevel = math.max(player:getStorageValue(PassiveSkills.StormfistDuration) or 0, 0)
local duration = 10000 --+ (durationLevel * 1000)

mountain_stance:setParameter(CONDITION_PARAM_TICKS, duration)

player:addCondition(mountain_stance)
player:attachEffectById(86, true)
player:attachEffectById(104, true)
player:attachEffectById(105, true)
player:attachEffectById(106, true)
	 -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    player:sendAddBuffNotification(83, duration / 1000, 'Reduce Damage taken by 30% and increases your max health by 25%.', 3, 0)
end
    return true
end
