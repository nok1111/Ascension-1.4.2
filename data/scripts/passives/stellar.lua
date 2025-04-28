

local function applyStellar(playerId, creatureId, damage)
  local creature = Creature(creatureId)
  local attacker = Player(playerId)    
 
	     if creature and creature:isMonster() and attacker then
			if creature:getMaster() then
				return	false 
			end
			doTargetCombatHealth(attacker, creature, COMBAT_ENERGYDAMAGE, -damage, -damage, CONST_ME_NONE)
			attacker:say("stellar alligment!", TALKTYPE_MONSTER_SAY)
				local explo = creature:getPosition()
				explo.x = explo.x + 1
				explo.y = explo.y + 0
				explo:sendMagicEffect(382)
	    end
end

function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)

      if attacker and attacker:isPlayer() then
        local player = attacker:getPlayer()
        if player and vocationId == 7 then
			if 	origin == ORIGIN_MELEE or origin == ORIGIN_RANGED or origin == ORIGIN_SPELL then
				local chance = math.random(10)
			    if chance == 10 then
					-- Formula, can be modified.
					local magic = player:getMagicLevel()
					local level = player:getLevel()
					local extraDamage = (level / 5) + (magic * 3.3) + 15       	
					addEvent(applyStellar, 200, attacker:getId(), creature:getId(), extraDamage)
				end
			end
        end
    end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end
