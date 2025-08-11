function removePet(creatureId)
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
			if summon:getName():lower() == "void guard" or summon:getName():lower() == "void mage" or summon:getName():lower() == "void archer" then
				undeadCount = undeadCount + 1
			end
		end
	end
	return undeadCount
end

function onCastSpell(cid, variant)
	local monsterName = variant:getString()
	local monsterType = MonsterType(monsterName)
	local player = Player(cid)

local player = Player(cid)
	if not player then return false end

	
	
    if getSummonCount(player) >= 4  then
        player:sendCancelMessage("You can't have more of these summons.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
    	return false
    end


local summons = {
    -- Monster name, percentage
    {"void guard", 50},
    {"void mage", 50},
	{"void archer", 50}
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
	
local player = Player(cid)	
local level = player:getLevel()

        --Game.createMonster(v[1], creature:getPosition())
		
		local mySummonvoid = Game.createMonster(v[1], player:getPosition())
		
	player:addSummon(mySummonvoid)
	if player:getTarget() then
	mySummonvoid:setTarget(player:getTarget())
	local path = mySummonvoid:getPathTo(player:getTarget():getPosition())
		if path then
		mySummonvoid:move(path[1])
		end
	end
	mySummonvoid:setMaxHealth(level * mySummonvoid:getMaxHealth())
	mySummonvoid:setHealth(level * mySummonvoid:getMaxHealth())
    mySummonvoid:registerEvent("Summon_Damage")
	--mySummonvoid:registerEvent("petheal")

    local deltaSpeed = math.max(player:getBaseSpeed() - mySummonvoid:getBaseSpeed(), 0)
    mySummonvoid:changeSpeed(deltaSpeed)

  
    player:say("arise!", TALKTYPE_MONSTER_SAY)
    addEvent(removePet, 5*60*1000, mySummonvoid:getId()) --I think this isn't necessary
		
       -- break
    end
end
	
	return true
end
