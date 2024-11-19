local zones = {

--AREA 1
    [1] = {
        id = 1,
        name = "Rat Place",
        monsters = {"spider", "tarantula"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 7000,
        active = false,
        tiles = {},
        maxMonsters = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = true, -- Whether to show the zone name on entering  
        despawnmonsters = false, -- Whether to despawn monster when no players are in area
    },
    [2] = {
        id = 2,
        name = "Twigkin Forest",
        monsters = {"twigkin", "flaming twigkin", "leafy twigkin"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = {},
        maxMonsters = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [3] = {
        id = 3,
        name = "Mining excavation",
        monsters = {"dwarf", "dwarf guard"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = {},
        maxMonsters = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [4] = {
        id = 4,
        name = "Mining excavation",
        monsters = {"dwarf", "dwarf guard", "dwarf soldier"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = {},
        maxMonsters = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [5] = {
        id = 5,
        name = "Mines of xxxxx",
        monsters = {"dwarf", "dwarf guard", "dwarf geomancer", "dwarf soldier"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = {},
        maxMonsters = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [6] = {
        id = 6,
        name = "Mines of xxxxx",
        monsters = {"troll", "dark troll", "wolf cub", "wolf"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = {},
        maxMonsters = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [7] = {
        id = 7,
        name = "Mines of xxxxx",
        monsters = {"thief", "rogue"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = {},
        maxMonsters = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [8] = {
        id = 8,
        name = "Mines of xxxxx",
        monsters = {"troll", "dark troll"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = {},
        maxMonsters = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [9] = {
        id = 9,
        name = "Mines of xxxxx",
        monsters = {"troll", "dark troll", "apprentice witch", "witch"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = {},
        maxMonsters = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },

    [10] = { --unfinished wrong monsters
        id = 10,
        name = "Mines of xxxxx",
        monsters = {"troll", "dark troll", "apprentice witch", "witch"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = {},
        maxMonsters = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [11] = { --unfinished wrong monsters
        id = 11,
        name = "Mines of xxxxx",
        monsters = {"troll", "dark troll", "apprentice witch", "witch"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = {},
        maxMonsters = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [12] = { 
        id = 12,
        name = "Mines of xxxxx",
        monsters = {"bear", "bear cub"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = {},
        maxMonsters = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [13] = { 
        id = 13,
        name = "Mines of xxxxx",
        monsters = {"skeleton"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = {},
        maxMonsters = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [14] = { 
        id = 14,
        name = "Mines of xxxxx",
        monsters = {"spider", "tarantula", "giant spider"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = {},
        maxMonsters = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [15] = { 
        id = 15,
        name = "Mines of xxxxx",
        monsters = {"spider", "tarantula", "giant spider"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = {},
        maxMonsters = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [16] = { 
        id = 16,
        name = "Mines of xxxxx",
        monsters = {"skeleton", "witch", "apprentice witch", "poison skeleton", "rogue"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = {},
        maxMonsters = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [17] = { 
        id = 17,
        name = "Bull's plain",
        monsters = {"minotaur", "minotaur mage", "minotaur archer", "minotaur guard"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = {},
        maxMonsters = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = true, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [18] = { 
        id = 18,
        name = "Bull's plain",
        monsters = {"minotaur", "minotaur mage", "skeleton", "minotaur guard"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = {},
        maxMonsters = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = true, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [19] = {
        id = 19,
        name = "Twigkin Forest",
        monsters = {"twigkin", "flaming twigkin", "leafy twigkin"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = {},
        maxMonsters = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [20] = {
        id = 20,
        name = "Elves Forest",
        monsters = {"elf", "elf scout", "elf arcanist"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = {},
        maxMonsters = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [21] = {
        id = 21,
        name = "Cursed Cementery",
        monsters = {"zombie", "mutated zombie", "abomination specimen", "skeleton", "poison skeleton"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = {},
        maxMonsters = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [22] = {
        id = 22,
        name = "Dark Cathedral",
        monsters = {"zombie", "mutated zombie", "abomination specimen", "skeleton", "poison skeleton", "witch"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = {},
        maxMonsters = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [23] = {
        id = 23,
        name = "xxxxx",
        monsters = {"earth elemental", "poison skeleton", "bonelord"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = {},
        maxMonsters = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [24] = {
        id = 24,
        name = "xxxxxx",
        monsters = {"earth elemental", "poison skeleton", "earth overlord", "medusa", "bonelord"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = {},
        maxMonsters = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
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
    local zoneTiles = Game.getZoneTilesVector(zone.id)
    local validPositions = {}

    for _, tileUserdata in ipairs(zoneTiles) do
        if tileUserdata and type(tileUserdata) == "userdata" then
            local pos = tileUserdata:getPosition()
            if Tile(pos):isWalkable() then
                table.insert(validPositions, pos)
            end
        end
    end

    if #validPositions == 0 then
        return nil
    end

    return validPositions[math.random(1, #validPositions)]  -- Pick a random valid position
end
     
local function getNumerPositionInZone(zone)
    local zoneTiles = Game.getZoneTilesVector(zone)
    local validPositions = {}

    for _, tileUserdata in ipairs(zoneTiles) do
        if tileUserdata and type(tileUserdata) == "userdata" then
            local pos = tileUserdata:getPosition()
            if Tile(pos):isWalkable() then
                table.insert(validPositions, pos)
            end
        end
    end

    if #validPositions == 0 then
        return 0
    end

    return #validPositions  -- Pick a random valid position
end                       


local function scheduleNextSpawn(zone)

     -- Check if players are still in the zone
    if Game.getZonePlayerCount(zone.id) < 1 then
        zone.active = false
        return
    end

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
      
    local zone = zones[zoneId]
    if not zone then
        return
    end
    print("onEnterZone")
    if not zone.active then
        zone.active = true
        scheduleNextSpawn(zone)
    end
    player:setStorageValue(10001, zoneId)

    -- Initialize tiles if they are empty
    if not zone.tiles or #zone.tiles == 0 then
        local tileCount = getNumerPositionInZone(zoneId)
        zone.tiles = {}  -- Ensure it's initialized as an empty table
        print("number of tiles: " .. tileCount)
        zone.maxMonsters = (tileCount / 15) + 1
        print("Zone " .. zoneId .. " has " .. tileCount .. " tiles. Max monsters: " .. zone.maxMonsters)
    end
    zone.active = true
    
    if zone then
    local storageValue = player:getStorageValue(10001)
    if storageValue ~= zone.id then
        print("Player " .. player:getName() .. " entering zone ID: " .. zoneId)
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
        zones[zoneId].active = false
        despawnMonsters(zones[zoneId])

         
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
        if not areZonesEqual(previousZones, newZones) and zoneid > 0 then
            onEnterZone(player, zoneid)  -- Call onEnterZone
        end
    end
    return true
end

zoneIn:zoneid(1,2)
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


zoneOut:zoneid(1,2)
zoneOut:register()


local creatureeventlogin = CreatureEvent("loginzones")

function creatureeventlogin.onLogin(player)
    local tile = Tile(player:getPosition())
    if tile then
        local zoneIds = tile:getZoneId() -- Assuming this returns a table of IDs
        local uniqueZones = {}

        for _, zoneId in ipairs(zoneIds) do
            if zoneId > 1 and not uniqueZones[zoneId] then
                uniqueZones[zoneId] = true -- Mark this zone ID as processed
                onEnterZone(player, zoneId)
            end
        end
    end
    return true
end


creatureeventlogin:register()



local creatureeventlogout = CreatureEvent("logoutzones")

function creatureeventlogout.onLogout(player)
    player:unregisterEvent("zone_death")
     local tile = Tile(player:getPosition())
    if tile then
        local zoneIds = tile:getZoneId() -- Assuming this returns a table of IDs
        local uniqueZones = {}

        for _, zoneId in ipairs(zoneIds) do
            if zoneId > 1 and not uniqueZones[zoneId] then
                uniqueZones[zoneId] = true -- Mark this zone ID as processed
                onLeaveZone(player, zoneId)
            end
        end
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