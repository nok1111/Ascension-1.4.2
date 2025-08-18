local function removeGOL(creatureId)
    local c = Creature(creatureId)
    if not c then return false end

    c:remove()
end

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_NONE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 591)


function onCastSpell(cid, var)
	local player = Player(cid)
	if not player then return false end

    local summonsGOL, summon_GOL = player:getSummons(), nil
	if #summonsGOL > 0 then
		for i = 1, #summonsGOL do
			summon_GOL = summonsGOL[i]
			if summon_GOL:getName():lower() == "Guardian of Light" then
				 player:sendCancelMessage("You can't have more of these summons.")
				player:getPosition():sendMagicEffect(CONST_ME_POFF)
				return false
			end
		end
	end

    local vocationId = player:getVocation():getId()
    local summonName = nil
    if vocationId == 1 then
        summonName = "Guardian of Light"
    elseif vocationId == 2 then
        summonName = "Guardian of Light"
    elseif vocationId == 3 then
        summonName = "Guardian of Light"
    elseif vocationId == 4 then
        summonName = "Guardian of Light"
    end
    
    if not summonName then return false end

    local mySummon = Game.createMonster(summonName, player:getPosition(), true, true)
    if not mySummon then
        return combat:execute(player, var)
    end

    player:addSummon(mySummon)
    mySummon:registerEvent("Summon_Damage")
	mySummon:sendProgressbar(18000, false)

    local deltaSpeed = math.max(player:getBaseSpeed() - mySummon:getBaseSpeed(), 0)
    mySummon:changeSpeed(deltaSpeed)

  
    player:say("The light will judge you!", TALKTYPE_MONSTER_SAY)
    addEvent(removeGOL, 18*1000, mySummon:getId()) --I think this isn't necessary
		local player = Player(creature)
	 if player then
  -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    player:sendAddBuffNotification(25, 18, 'Holy Guardian', 5, 0)
  end
    return combat:execute(player, var)
end