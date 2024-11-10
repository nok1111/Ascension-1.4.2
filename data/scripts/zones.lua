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
		despawnmonsters = false, -- Whether to show the zone name
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
		despawnmonsters = false, -- Whether to show the zone name
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

        -- Check if the tile is walkable and not blocked
        if Tile(pos):isWalkable() and not Game.getObjectFromPosition(pos) then
            return pos  -- Return the position if valid
        end
    end

    return nil  -- Return nil if position is blocked or not walkable
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
    if zone.despawnmonsters then  -- Check if despawnmonsters is true
        if tablelength(zone.spawnedMonsters) == 0 then
            return
        end

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
end


local function onLeaveZone(player, zoneId)
    print("Player " .. player:getName() .. " leaving zone ID: " .. zoneId)
    player:setStorageValue(10001, 0)
   -- player:sendTextMessage(MESSAGE_INFO_DESCR, "You have left the zone.")
    activePlayers[player:getId()] = nil
	
	 if Game.getZonePlayerCount(zoneId) < 1 then
        despawnMonsters(zones[zoneId])
		 zones[zoneId].active = false
		else
		 zones[zoneId].active = true
    end
end


function isZoneIdInZones(zoneId)
    for _, zone in pairs(zones) do
        if zone.id == zoneId then
            return true
        end
    end
    return false
end

-- Function to check if two tables are equal
local function areZonesEqual(zoneTable1, zoneTable2)
    if #zoneTable1 ~= #zoneTable2 then
        return false
    end

    for i, v in ipairs(zoneTable1) do
        if v ~= zoneTable2[i] then
            return false
        end
    end
    return true
end

local zoneIn = MoveEvent()

function zoneIn.onStepIn(creature, item, position, fromPosition, zoneid)
  if creature:isPlayer() then
        local player = creature:getPlayer()
        local previousZones = Tile(fromPosition):getZoneId()  -- Get the previous zone
        local newZones = Tile(player:getPosition()):getZoneId()  -- Get the new zone

        -- Use areZonesEqual() to check if the zones are different
        if not areZonesEqual(previousZones, newZones) then
            onEnterZone(player, zoneid)  -- Call onEnterZone
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

    local previousZones = Tile(fromPosition):getZoneId()
    local newZones = Tile(player:getPosition()):getZoneId()
	
    -- Check if the zones are different
    if not areZonesEqual(previousZones, newZones) then
        if #previousZones > 0 then
            local uniqueZones = {}
            for _, loopzoneId in ipairs(previousZones) do
                if loopzoneId ~= 0 and loopzoneId ~= zoneid then
                    uniqueZones[loopzoneId] = true
                    print("zoneid: " .. zoneid)
                    print("loopzoneId: " .. loopzoneId)
                end
            end

            for loopzoneId in pairs(uniqueZones) do
                onLeaveZone(player, loopzoneId)
            end
        end
    end

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
   if not creature:isMonster() then
        return true
    end

    -- Check if the monster is a summon by verifying if it has a master
    if creature:getMaster() then
        return true  -- Skip further processing if the monster was a summon
    end

    -- Call the onMonsterDeath function if it's not a summon
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