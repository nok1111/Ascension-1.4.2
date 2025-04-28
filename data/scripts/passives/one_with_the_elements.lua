local function elementProtection(playerId)
  local player = Player(playerId)
  if player then
    player:getPosition():sendMagicEffect(379)
  end
end

function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if creature then
      if creature:isPlayer() then
        local player = creature:getPlayer()
		local vocationId = player:getVocation():getId()
        if primaryType == COMBAT_PHYSICALDAMAGE or primaryType == COMBAT_ENERGYDAMAGE or primaryType == COMBAT_FIREDAMAGE or primaryType == COMBAT_EARTHDAMAGE or primaryType == COMBAT_DEATHDAMAGE or primaryType == COMBAT_HOLYDAMAGE or primaryType == COMBAT_ICEDAMAGE  then
          if vocationId == 2 then
           -- primaryDamage, secondaryDamage = primaryDamage * 0.80, secondaryDamage * 0.80
			player:addMana(creature:getMaxMana() * 2 / 100)
           addEvent(elementProtection, 200, player:getId())
          end
        end
      end
    end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end
