local function applyBloodBladesDamage(playerId, creatureId, damage)
  local creature = Creature(creatureId)
  local attacker = Player(playerId)
  if creature and attacker then
 
	local min = (attacker:getMaxHealth() * 0.15) + 10  -- healing formula minimal
    local max = (attacker:getMaxHealth() * 0.15) + 15  -- healing formula maximum 
	attacker:addHealth(math.random(min, max))
	attacker:getPosition():sendMagicEffect(353)
    creature:getPosition():sendMagicEffect(438)

  end
end

function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if creature and attacker then
      if attacker:isPlayer() then
        local player = attacker:getPlayer()
        if player and origin == ORIGIN_MELEE and player:getCondition(CONDITION_ATTRIBUTES, 0, 29500) then	
            -- Formula, can be modified.
            local extraDamage = (primaryDamage * 1.3)            		
            addEvent(applyBloodBladesDamage, 1, attacker:getId(), creature:getId(), extraDamage)        
        end
      end
    end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end
