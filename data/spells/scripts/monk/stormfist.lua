function onCastSpell(creature, variant)
  local player = Player(creature)
  if not player then
     return
  end

    local durationLevel = math.max(player:getStorageValue(PassiveSkills.StormfistDuration) or 0, 0)
    local duration = 3000 + (durationLevel * 1000)

    local stormfist = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
    stormfist:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
    stormfist:setParameter(CONDITION_PARAM_SUBID, 29512)
    stormfist:setParameter(CONDITION_PARAM_SKILL_MELEEPERCENT, 140)
    stormfist:setParameter(CONDITION_PARAM_TICKS, duration)

    player:addCondition(stormfist)
    player:attachEffectById(9, true)
    --print if true
    if player:getCondition(CONDITION_ATTRIBUTES, 0, 29512) then
      print("Stormfist condition: true")
    end
	 -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    player:sendAddBuffNotification(83, duration / 1000, 'Your physical damage sends a lighting shock to nearby target and gain 40% melee stats.', 3, 0)

    return true
end
