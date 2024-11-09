local zones = {

--AREA 1
    [1] = {
        id = 1,
        name = "Rat Place",
        monsters = {"rat"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 7000,
        active = false,
        tiles = {},
        maxMonsters = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = true, -- Whether to show the zone name	
    },
    [2] = {
        id = 2,
        name = "Troll Place",
        monsters = {"troll"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = {},
        maxMonsters = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
		showZoneName = false, -- Whether to show the zone name
    },



--AREA 2
}

local activePlayers = {}


local function tablelength(T)
    local count = 0
    for _ in pairs(T) do
        count = count + 1
    end
    return count
end


local function calculateZoneTiles(zoneId)
    local tiles = {}
    for x = 0, 1000 do  
        for y = 0, 1000 do
            local pos = Position(x, y, 7)  
            local tile = Tile(pos)
            if tile and tile:getZoneId() == zoneId then
                table.insert(tiles, pos)
            end
        end
    end
    return tiles
end


local function getMaxMonstersForZone(zone)
    return math.floor(zone.tiles / 15) + 1 --avoid going negative
end


local function getRandomPositionInZone(zone)
    local zoneTiles = Game.getZoneTilesVector(zone.id)  -- Retrieve all tiles in the zone
    if #zoneTiles == 0 then
        return nil  -- Return nil if there are no tiles
    end
    
    local randomIndex = math.random(1, #zoneTiles)  -- Pick a random index
    local tileUserdata = zoneTiles[randomIndex]  -- Get the tile at that index

    if tileUserdata and type(tileUserdata) == "userdata" then
        local pos = tileUserdata:getPosition()  -- Retrieve the position
        return pos  -- Return the position
    end
    
    return nil  -- Return nil if something goes wrong
end


local function scheduleNextSpawn(zone)
    local nextSpawnInterval = math.random(zone.spawnIntervalMin, zone.spawnIntervalMax)
    zone.spawnEvent = addEvent(function()
        spawnMonsters(zone)
    end, nextSpawnInterval)
end


local function spawnMonster(zone)
    local currentMonsterCount = Game.getZoneMonsterCount(zone.id)
   -- print("Current monster count in zone " .. zone.id .. ": " .. currentMonsterCount .. " (Max: " .. zone.maxMonsters .. ")")

    if currentMonsterCount >= zone.maxMonsters then
       -- print("Max monsters reached or zone inactive. Skipping spawn.")
        return
    end

    local spawnPosition = getRandomPositionInZone(zone)
	print(spawnPosition)
    if not spawnPosition then
        print("No valid spawn position found in zone " .. zone.id)
        return
    end

    local monsterName = zone.monsters[math.random(#zone.monsters)]
    local monster = Game.createMonster(monsterName, spawnPosition, false)
    if monster then
        zone.spawnedMonsters[monster:getId()] = true
        print("Spawned " .. monster:getName() .. " at position (" .. spawnPosition.x .. ", " .. spawnPosition.y .. ", " .. spawnPosition.z .. ").")
        monster:registerEvent("zone_death")
    else
        print("Failed to spawn monster " .. monsterName)
    end
end


function spawnMonsters(zone)
    if not zone.active then
        print("Zone " .. zone.id .. " is not active. Skipping spawn.")
        return
    end

    local currentMonsterCount = tablelength(zone.spawnedMonsters)

    if currentMonsterCount < zone.maxMonsters then
        spawnMonster(zone)
        scheduleNextSpawn(zone)
    else
       -- print("Max monsters reached. Not scheduling new spawn event.")
        zone.spawnEvent = nil
    end
end


function onMonsterDeath(monster, killer)
local zoneIds = Tile(monster:getPosition()):getZoneId()
print("Monster " .. monster:getName() .. " died in zone IDs: " .. table.concat(zoneIds, ", "))
for _, zoneId in ipairs(zoneIds) do
    if zones[zoneId] then
        local zone = zones[zoneId]
        zone.spawnedMonsters[monster:getId()] = nil
        print("Monster " .. monster:getName() .. " died. Current monsters: " .. tablelength(zone.spawnedMonsters))

        if not zone.spawnEvent then
            scheduleNextSpawn(zone)
        end
    end
end
return true
end


local function onEnterZone(player, zoneId)
    print("DEBUG: onEnterZone called")
    print("Player " .. player:getName() .. " entering zone ID: " .. zoneId)
   player:setStorageValue(10001, 1)
    

    local zone = zones[zoneId]
	if not zone then
		print("ERROR: Zone not found for ID: " .. zoneId)
		return
	end

	-- Initialize tiles if they are empty
	if not zone.tiles or #zone.tiles == 0 then
		local tileCount = Game.getZoneTileCount(zoneId)
		zone.tiles = {}  -- Ensure it's initialized as an empty table
		print("number of tiles: " .. tileCount)
		zone.maxMonsters = (tileCount / 15) + 1
		print("Zone " .. zoneId .. " has " .. tileCount .. " tiles. Max monsters: " .. zone.maxMonsters)
	end
    zone.active = true
	
	if zone then
    local storageValue = player:getStorageValue(10001)
    if storageValue ~= zone.id then
        player:setStorageValue(10001, zone.id)
        if zone.showZoneName then
            player:sendTextMessage(MESSAGE_INFO_DESCR, "You have entered the zone " .. zone.name)
        end
    end
end
	
    if not zone.spawnEvent then
        scheduleNextSpawn(zone)
    end
end


local function despawnMonsters(zone)
    print("Despawning monsters in zone ID: " .. zone.id)
    for monsterId, _ in pairs(zone.spawnedMonsters) do
        local monster = Monster(monsterId)
        if monster then
            monster:remove()
        end
    end
    zone.spawnedMonsters = {}
    if zone.spawnEvent then
        stopEvent(zone.spawnEvent)
        zone.spawnEvent = nil
    end
end


local function onLeaveZone(player, zoneId)
    print("Player " .. player:getName() .. " leaving zone ID: " .. zoneId)
    player:setStorageValue(10001, 0)
   -- player:sendTextMessage(MESSAGE_INFO_DESCR, "You have left the zone.")
    activePlayers[player:getId()] = nil

    local stillActive = false
    for _, activeZoneId in pairs(activePlayers) do
        if activeZoneId == zoneId then
            stillActive = true
            break
        end
    end

    if not stillActive then
        zones[zoneId].active = false
        despawnMonsters(zones[zoneId])
    end
end


local function checkPlayerStatus()
    for playerId, zoneId in pairs(activePlayers) do
        local player = Player(playerId)
        if player then
            local tile = Tile(player:getPosition())
            if not tile or tile:getZoneId() ~= zoneId then
                print("Player " .. player:getName() .. " is no longer in zone " .. zoneId)
                onLeaveZone(player, zoneId)
            end
        else
            activePlayers[playerId] = nil
        end
    end
    addEvent(checkPlayerStatus, 5000)
end


addEvent(checkPlayerStatus, 5000)

local zoneIn = MoveEvent()

function zoneIn.onStepIn(creature, item, position, fromPosition, zoneid)

    if creature:isPlayer() then
	local player = creature:getPlayer()
	print("starting in zone: " .. zoneid)


--[[	
local zoneTiles = Game.getZoneTilesVector(1)


if type(zoneTiles) == "table" then
    for index, tileUserdata in ipairs(zoneTiles) do
        if tileUserdata and type(tileUserdata) == "userdata" then
            local pos = tileUserdata:getPosition()  -- Directly attempt to get position from userdata
            if pos then
                print(string.format("Tile %d at position: x=%d, y=%d, z=%d", index, pos.x, pos.y, pos.z))
                pos:sendMagicEffect(CONST_ME_MAGIC_BLUE)
            else
                print(string.format("Tile %d: Unable to retrieve position", index))
            end
        else
            print(string.format("Tile %d: Invalid userdata", index))
        end
    end
else
    print("zoneTiles is not a table, type:", type(zoneTiles))
end

]]--





		if activePlayers[player:getId()] ~= zoneid then
			onEnterZone(player, zoneid)
		end
	end
    return true
end

zoneIn:zoneid(1)
zoneIn:register()


local zoneOut = MoveEvent()

function zoneOut.onStepOut(creature, item, position, fromPosition, zoneid)
   local player = creature:getPlayer()
    if not player then
        return true
    end

    local playerId = player:getId()
    local previousZones = Tile(fromPosition):getZoneId()  -- Assuming this returns a table now

    print("Player " .. player:getName() .. " is stepping out of zones: " .. table.concat(previousZones, ", "))

    addEvent(function(cid)
        local player = Player(cid)
        if not player then
            return
        end

        print("Player " .. player:getName() .. " has left the zones: " .. table.concat(previousZones, ", "))
        for _, zoneId in ipairs(previousZones) do
            onLeaveZone(player, zoneId)
        end

    end, 5000, playerId)


    return true
end

zoneOut:zoneid(1)
zoneOut:register()


local creatureeventlogin = CreatureEvent("loginzones")

function creatureeventlogin.onLogin(player)
    --player:registerEvent("zone_death")
    local tile = Tile(player:getPosition())
    if tile then
      --  if tile:getZoneId() >= 1 then
   --       onEnterZone(player, tile:getZoneId())
      --  end
    end
    return true
end

creatureeventlogin:register()



local creatureeventlogout = CreatureEvent("logoutzones")

function creatureeventlogout.onLogout(player)
    player:unregisterEvent("zone_death")
    local playerId = player:getId()
    local zoneId = activePlayers[playerId]
    if zoneId then
        onLeaveZone(player, zoneId)
    end
    return true
end

creatureeventlogout:register()







local creatureeventDeath = CreatureEvent("death_zones")

function creatureeventDeath.onDeath(creature, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
    if not creature:isMonster() then return true end
    onMonsterDeath(creature, killer)
end 

creatureeventDeath:register()  


local TargetCombatEvent = EventCallback
TargetCombatEvent.onTargetCombat = function(creature, target)
    target:registerEvent("death_zones")
    return RETURNVALUE_NOERROR
end
TargetCombatEvent:register()
  
  print(">> Loading Zones")