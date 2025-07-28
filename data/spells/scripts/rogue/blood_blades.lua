function onCastSpell(creature, variant)
	local player = Player(creature)
  if player then
  

local blood_blades = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
blood_blades:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
blood_blades:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.blood_blades)
blood_blades:setParameter(CONDITION_PARAM_TICKS, 8000)

player:addCondition(blood_blades)


	player:attachEffectById(16, true)
	 -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    player:sendAddBuffNotification(83, 8, 'Blood Blades: Life steal effect 1.5% target max health.', 3, 0)
end
    return true
end
