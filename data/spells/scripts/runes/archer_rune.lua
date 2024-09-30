function removeBarrel(creatureId)
    local c = Creature(creatureId)
    if not c then return false end

    c:remove()
end

local function getSummonCount(player)
	local undeadCount = 0
	local summons, summon = player:getSummons(), nil
	if #summons > 0 then
		for i = 1, #summons do
			summon = summons[i]
			if summon:getName():lower() == "explosive barrel" or summon:getName():lower() == "explosive barrel" then
				undeadCount = undeadCount + 1
			end
		end
	end
	return undeadCount
end

function onCastSpell(creature, variant, fromPosition, target, toPosition, isHotkey)
	
	if not creature then return false end
	local vocationId = creature:getVocation():getId()
	
	local creaturepos = variant:getPosition()
--	if vocationId ~= 2 then
--		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "This item is just usable by templars.")
--        player:getPosition():sendMagicEffect(CONST_ME_POFF)
--    	return false
 --   end
	
    if getSummonCount(creature) >= 2  then
        creature:sendCancelMessage("You can't have more of these summons.")
        creature:getPosition():sendMagicEffect(CONST_ME_POFF)
    	return false
    end


local summons = {
    -- Monster name, percentage
    {"explosive barrel", 50},
    {"explosive barrel", 50}
}


local Max = 0
for i, v in pairs(summons) do
    summons[i][3] = Max
    Max = Max + v[2]
end

math.randomseed(os.time())
local monster = math.random(0, Max)
for _, v in pairs(summons) do
    if(monster >= v[3] and monster < (v[2] + v[3])) then	
	local MyBarrelSummon = Game.createMonster(v[1], creaturepos, false, true)	
	creature:addSummon(MyBarrelSummon)
	--MyBarrelSummon:sendProgressbar(5*1000, false)
    addEvent(removeBarrel, 5*1000, MyBarrelSummon:getId()) --I think this isn't necessary
       -- break
    end
end
	
	return true
end
