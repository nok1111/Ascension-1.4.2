function removePet(creatureId)
    local c = Creature(creatureId)
    if not c then return false end

    c:remove()
end

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_NONE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_BLOCKHIT)

local area = createCombatArea(AREA_CROSS1X1)
setCombatArea(combat, area)



function onCastSpell(cid, var)
	local player = Player(cid)
	if not player then return false end

    local summonshigh, summonhigh = player:getSummons(), nil
	if #summonshigh > 0 then
		for i = 1, #summonshigh do
			summonhigh = summonshigh[i]
			if summonhigh:getName():lower() == "shadow seeker" or summonhigh:getName():lower() == "heket" or summonhigh:getName():lower() == "abomination1" then
				 player:sendCancelMessage("You can't have more of these summons.")
				player:getPosition():sendMagicEffect(CONST_ME_POFF)
				return false
			end
		end
	end

    local vocationId = player:getVocation():getId()
    local summonName = nil
    if vocationId == 1 then
        summonName = "abomination1"
    elseif vocationId == 2 then
        summonName = "abomination1"
    elseif vocationId == 3 then
        summonName = "abomination1"
    elseif vocationId == 4 then
        summonName = "abomination1"
	elseif vocationId == 5 then
        summonName = "abomination1"--here goes transformation
    end
    
    if not summonName then return false end

    local mySummon = Game.createMonster(summonName, player:getPosition(), true, true)
    if not mySummon then
        return combat:execute(player, var)
    end

  local healthAmount = player:getMaxHealth()
	local halfhp = healthAmount * 10
	
    player:addSummon(mySummon)
	if player:getTarget() then
	mySummon:setTarget(player:getTarget())
	end
	mySummon:setMaxHealth(halfhp)
	mySummon:setHealth(halfhp)
    mySummon:registerEvent("Summon_Damage")
	mySummon:registerEvent("petheal")

    --local deltaSpeed = math.max(player:getBaseSpeed() - mySummon:getBaseSpeed(), 0)
   -- mySummon:changeSpeed(deltaSpeed)

  
    player:say("Challenge my Creation!", TALKTYPE_MONSTER_SAY)
    addEvent(removePet, 1*60*1000, mySummon:getId()) --I think this isn't necessary
    return combat:execute(player, var)
end