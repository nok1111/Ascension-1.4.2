

function onCastSpell(creature, variant)
	local player = Player(creature)
  if player then
  

local blood_blades = Condition(CONDITION_ATTRIBUTES)
blood_blades:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
blood_blades:setParameter(CONDITION_PARAM_SUBID, 29500)
blood_blades:setParameter(CONDITION_PARAM_TICKS, 8000)

player:addCondition(blood_blades)

	local sword = player:getPosition()
        sword.x = sword.x + 1
        sword.y = sword.y + 1

    sword:sendMagicEffect(518, "Blood Blades")
	player:getPosition():sendMagicEffect(556)
	--playerpos:sendMagicEffect( 353, "Rage")
	 -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    player:sendAddBuffNotification(83, 8, 'Blood Blades: Life steal effect 1.5% target max health.', 3, 0)
end
    return true
end
