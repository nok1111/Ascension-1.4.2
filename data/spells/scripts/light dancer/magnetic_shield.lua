
local MagneticShield = Condition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT)
MagneticShield:setParameter(CONDITION_PARAM_TICKS, 5000)
--subid
MagneticShield:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.MagneticShield)
MagneticShield:setParameter(CONDITION_PARAM_BUFF_SPELL, true)



function onCastSpell(creature, variant)

	

  local player = Player(creature)
  if not player then return end
  -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
	player:addCondition(MagneticShield)
	player:attachEffectById(17, true)
    player:sendAddBuffNotification(51, 8, 'magnetic shield, Immune to all damage types for the duration.', 5, 0)
  
return true		
end