local function applynightbladeDamage(playerId, creatureId, damage)
  local creature = Creature(creatureId)
  local attacker = Player(playerId)
  
 
    
  if creature and attacker then
  if attacker:getStorageValue(5000) == 1 then
    doTargetCombatHealth(attacker, creature, COMBAT_ENERGYDAMAGE, -damage, -damage, CONST_ME_PURPLEDEATH)
	local min = (attacker:getMaxMana() * 0.14) -- healing formula minimal
    local max = (attacker:getMaxMana() * 0.17) -- healing formula maximum 
	attacker:addMana(math.random(min, max))
    attacker:say("Deathbringer!", TALKTYPE_MONSTER_SAY)
	attacker:getPosition():sendMagicEffect(379)
    attacker:getPosition():sendMagicEffect(318)
	 local explo = creature:getPosition()
        explo.x = explo.x + 1
        explo.y = explo.y + 1
    explo:sendMagicEffect(CONST_ME_CAKE)
	end
  end
end

function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if creature and attacker then
      if attacker:isPlayer() then
        local player = attacker:getPlayer()
        if player and player:getStorageValue(5000) == 1 and origin == ORIGIN_MELEE or origin == ORIGIN_RANGED or origin == ORIGIN_SPELL then
		local chance = math.random(20)
          if chance == 20 then
            -- Formula, can be modified.
            local extraDamage = (primaryDamage * 1.8)            
			player:setHitCount(CONST_LIGHTBRINGER_HITS_RESET)
            addEvent(applynightbladeDamage, 200, attacker:getId(), creature:getId(), extraDamage)
          end
          player:setHitCount(player:getHitCount() + 1)
        end
      end
    end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end
