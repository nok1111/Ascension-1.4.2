

function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if creature then
      if creature:isPlayer() then
        local player = creature:getPlayer()
		local vocationId = player:getVocation():getId()
        if primaryType == COMBAT_PHYSICALDAMAGE or primaryType == COMBAT_ENERGYDAMAGE then
          if vocationId == 8 then
            primaryDamage, secondaryDamage = primaryDamage * 0.80, secondaryDamage * 0.80
			
           creature:getPosition():sendMagicEffect(445)
          end
        end
      end
    end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end
