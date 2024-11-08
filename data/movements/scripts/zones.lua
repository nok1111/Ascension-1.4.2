package.path = package.path .. ';data/movements/scripts/?.lua'


local zones = require('zones_config')

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
    return math.floor(#zone.tiles / 15)
end


local function getRandomPositionInZone(zone)
    if #zone.tiles == 0 then
        return nil
    end
    return zone.tiles[math.random(#zone.tiles)]
end


local function scheduleNextSpawn(zone)
    local nextSpawnInterval = math.random(zone.spawnIntervalMin, zone.spawnIntervalMax)
    zone.spawnEvent = addEvent(function()
        spawnMonsters(zone)
    end, nextSpawnInterval)
end


local function spawnMonster(zone)
    local currentMonsterCount = tablelength(zone.spawnedMonsters)
    print("Current monster count in zone " .. zone.id .. ": " .. currentMonsterCount .. " (Max: " .. zone.maxMonsters .. ")")

    if currentMonsterCount >= zone.maxMonsters then
        print("Max monsters reached or zone inactive. Skipping spawn.")
        return
    end

    local spawnPosition = getRandomPositionInZone(zone)
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
        print("Max monsters reached. Not scheduling new spawn event.")
        zone.spawnEvent = nil
    end
end


function onMonsterDeath(monster, killer)
    local zoneId = Tile(monster:getPosition()):getZoneId()
    print("Monster " .. monster:getName() .. " died in zone ID: " .. zoneId)
    if zoneId ~= 0 and zones[zoneId] then
        local zone = zones[zoneId]
        zone.spawnedMonsters[monster:getId()] = nil
        print("Monster " .. monster:getName() .. " died. Current monsters: " .. tablelength(zone.spawnedMonsters))
        
        if not zone.spawnEvent then
            scheduleNextSpawn(zone)
        end
    end
    return true
end


local function onEnterZone(player, zoneId)
    print("DEBUG: onEnterZone called")
    print("Player " .. player:getName() .. " entering zone ID: " .. zoneId)
    player:setStorageValue(10001, 1)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "You have entered the zone.")
    activePlayers[player:getId()] = zoneId
    local zone = zones[zoneId]
    if not zone.tiles or #zone.tiles == 0 then
        zone.tiles = calculateZoneTiles(zoneId)
        zone.maxMonsters = getMaxMonstersForZone(zone)
        print("Zone " .. zoneId .. " has " .. #zone.tiles .. " tiles. Max monsters: " .. zone.maxMonsters)
    end
    zone.active = true
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
    player:sendTextMessage(MESSAGE_INFO_DESCR, "You have left the zone.")
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


function onStepIn(creature, item, position, fromPosition)
    print("DEBUG: onStepIn called")
    local player = creature:getPlayer()
    if not player then
        return true
    end

    local tile = Tile(position)
    if not tile then
        return true
    end

    local zoneId = tile:getZoneId()
    if zoneId == 0 then
        return true
    end

    if activePlayers[player:getId()] ~= zoneId then
        onEnterZone(player, zoneId)
    end

    return true
end


function onStepOut(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    local playerId = player:getId()
    local zoneId = activePlayers[playerId]
    if not zoneId then
        print("Player " .. player:getName() .. " has no active zone.")
        return true
    end

    print("Player " .. player:getName() .. " is stepping out of zone " .. zoneId)

    addEvent(function(cid)
        local player = Player(cid)
        if not player then
            return
        end

        local tile = Tile(player:getPosition())
        local currentZoneId = tile and tile:getZoneId() or 0
        if currentZoneId ~= zoneId then
            print("Player " .. player:getName() .. " has left the zone.")
            onLeaveZone(player, zoneId)
        else
            print("Player " .. player:getName() .. " is still in the zone.")
        end
    end, 5000, playerId)

    return true
end


function onLogin(player)
    player:registerEvent("zone_death")
    local tile = Tile(player:getPosition())
    if tile then
        local zoneId = tile:getZoneId()
        if zoneId ~= 0 then
            onEnterZone(player, zoneId)
        end
    end
    return true
end


function onLogout(player)
    player:unregisterEvent("zone_death")
    local playerId = player:getId()
    local zoneId = activePlayers[playerId]
    if zoneId then
        onLeaveZone(player, zoneId)
    end
    return true
end
