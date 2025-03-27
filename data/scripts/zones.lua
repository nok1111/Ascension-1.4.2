local zones = {

--AREA 1
    [1] = {
        id = 1,
        name = "Rat Place",
        monsters = {"spider", "tarantula"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 7000,
        active = false,
        tiles = 0,
        maxMonsters = 0,
        playercount = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = true, -- Whether to show the zone name on entering  
        despawnmonsters = false, -- Whether to despawn monster when no players are in area
        onStartup = true, -- This will trigger monster spawn at startup

        boss = "Rat King",   -- Boss monster
        bossKillThreshold = 30, -- Number of kills required to spawn boss
        killCount = 0,
    
         -- Set a predefined boss spawn position or remove for random
         bossSpawnPosition = Position(100, 200, 7),  -- Example X, Y, Z coordinates
          -- WEATHER SETTINGS
         weather = {"Map - Rain", "Map - Fog"}, -- Possible weather types
        forceWeather = false, -- If true, weather will always stay the same
        activeWeather = nil, -- Stores the currently active weather
    },
    [2] = {
        id = 2,
        name = "Twigkin Forest",
        monsters = {"twigkin", "flaming twigkin", "leafy twigkin"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = 0,
        maxMonsters = 0,
        playercount = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = true, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
        onStartup = true, -- This will trigger monster spawn at startup


         -- WEATHER SETTINGS
        weather = {"Map - Rain", "Map - Fog"}, -- Possible weather types
        forceWeather = false, -- If true, weather will always stay the same
        activeWeather = nil, -- Stores the currently active weather
    },
    [3] = {
        id = 3,
        name = "Mining excavation",
        monsters = {"dwarf", "dwarf guard"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = 0,
        maxMonsters = 0,
        playercount = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = true, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
        onStartup = true, -- This will trigger monster spawn at startup

        weather = {"Map - Rain", "Map - Fog"}, -- Possible weather types
        forceWeather = false, -- If true, weather will always stay the same
        activeWeather = nil, -- Stores the currently active weather
    },
    [4] = {
        id = 4,
        name = "Mining excavation",
        monsters = {"dwarf", "dwarf guard", "dwarf soldier"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = 0,
        maxMonsters = 0,
        playercount = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = true, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
        onStartup = true, -- This will trigger monster spawn at startup

        weather = {"Map - Rain", "Map - Fog"}, -- Possible weather types
        forceWeather = false, -- If true, weather will always stay the same
        activeWeather = nil, -- Stores the currently active weather
    },
    [5] = {
        id = 5,
        name = "Mines of xxxxx",
        monsters = {"dwarf", "dwarf guard", "dwarf geomancer", "dwarf soldier"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = 0,
        maxMonsters = 0,
        playercount = 0,
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
        tiles = 0,
        maxMonsters = 0,
        playercount = 0,
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
        tiles = 0,
        maxMonsters = 0,
        playercount = 0,
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
        tiles = 0,
        maxMonsters = 0,
        playercount = 0,
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
        tiles = 0,
        maxMonsters = 0,
        playercount = 0,
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
        tiles = 0,
        maxMonsters = 0,
        playercount = 0,
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
        playercount = 0,
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
        playercount = 0,
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
        tiles = 0,
        maxMonsters = 0,
        playercount = 0,
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
        tiles = 0,
        maxMonsters = 0,
        playercount = 0,
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
        tiles = 0,
        maxMonsters = 0,
        playercount = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [16] = { 
        id = 16,
        name = "Shadow Hollow",
        monsters = {"skeleton", "witch", "witch apprentice", "poison skeleton", "rogue"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = 0,
        maxMonsters = 0,
        playercount = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = true, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
        onStartup = true, -- This will trigger monster spawn at startup

        boss = "Vael the Betrayer",   -- Boss monster
        bossKillThreshold = 10, -- Number of kills required to spawn boss
        killCount = 0,
    
         -- Set a predefined boss spawn position or remove for random
         bossSpawnPosition = Position(554, 757, 10)  -- Example X, Y, Z coordinates
    },
    [17] = { 
        id = 17,
        name = "Bull's plain",
        monsters = {"minotaur", "minotaur mage", "minotaur archer", "minotaur guard"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = 0,
        maxMonsters = 0,
        playercount = 0,
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
        tiles = 0,
        maxMonsters = 0,
        playercount = 0,
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
        tiles = 0,
        maxMonsters = 0,
        playercount = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [20] = {
        id = 20,
        name = "Verdant Grove",
        monsters = {"elf", "elf scout", "elf arcanist"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = 0,
        maxMonsters = 0,
        playercount = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = true, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
        onStartup = true, -- This will trigger monster spawn at startup
    },
    [21] = {
        id = 21,
        name = "Cursed Cementery",
        monsters = {"zombie", "mutated zombie", "abomination specimen", "skeleton", "poison skeleton"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = 0,
        maxMonsters = 0,
        playercount = 0,
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
        tiles = 0,
        maxMonsters = 0,
        playercount = 0,
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
        tiles = 0,
        maxMonsters = 0,
        playercount = 0,
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
        tiles = 0,
        maxMonsters = 0,
        playercount = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [25] = {
        id = 25,
        name = "Veil of Corruption",
        monsters = {"earth elemental", "poison skeleton", "earth overlord", "medusa", "bonelord"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = 0,
        maxMonsters = 0,
        playercount = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = true, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
        onStartup = true, -- This will trigger monster spawn at startup
    },
    [26] = {
        id = 26,
        name = "Ashen Grove",
        monsters = {"fire skeleton", "fire spider", "fire elemental"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = 0,
        maxMonsters = 0,
        playercount = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = true, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
        onStartup = true, -- This will trigger monster spawn at startup

          -- WEATHER SETTINGS
        weather = {"Map - Fog"}, -- Possible weather types
        forceWeather = false, -- If true, weather will always stay the same
        activeWeather = nil, -- Stores the currently active weather
    },
     [27] = {
        id = 27,
        name = "Gale Cementery",
        monsters = {"fire skeleton", "fire spider", "fire elemental"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = 0,
        maxMonsters = 0,
        playercount = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = true, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
        onStartup = true, -- This will trigger monster spawn at startup

          -- WEATHER SETTINGS
        weather = {"Map - Fog"}, -- Possible weather types
        forceWeather = false, -- If true, weather will always stay the same
        activeWeather = nil, -- Stores the currently active weather
    },
      [28] = {
        id = 28,
        name = "Eldenmere Ruins",
        monsters = {"fire skeleton", "fire spider", "fire elemental"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = 0,
        maxMonsters = 0,
        playercount = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = true, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
        onStartup = true, -- This will trigger monster spawn at startup

          -- WEATHER SETTINGS
        weather = {"Map - Fog"}, -- Possible weather types
        forceWeather = true, -- If true, weather will always stay the same
        activeWeather = nil, -- Stores the currently active weather
    },
    [29] = {
        id = 29,
        name = "Sporeveil Outskirts",
        monsters = {"sporecrawler", "fungal shambler", "fungus"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = 0,
        maxMonsters = 0,
        playercount = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = true, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
        onStartup = true, -- This will trigger monster spawn at startup


         -- WEATHER SETTINGS
        weather = {"Map - Rain", "Map - Fog"}, -- Possible weather types
        forceWeather = false, -- If true, weather will always stay the same
        activeWeather = nil, -- Stores the currently active weather
    },
    [30] = {
        id = 30,
        name = "Sporeveil Swamp",
        monsters = {"sporecrawler", "fungal shambler", "fungus"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
        active = false,
        tiles = 0,
        maxMonsters = 0,
        playercount = 0,
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = true, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
        onStartup = true, -- This will trigger monster spawn at startup


         -- WEATHER SETTINGS
        weather = {"Map - Rain", "Map - Fog"}, -- Possible weather types
        forceWeather = false, -- If true, weather will always stay the same
        activeWeather = nil, -- Stores the currently active weather
    },







--AREA 2
}

local activePlayers = {}
local zonemax_monsters_divider = 25


local function tablelength(T)
    local count = 0
    for _ in pairs(T) do
        count = count + 1
    end
    return count
end


local function getMaxMonstersForZone(zone)
    return math.floor(zone.tiles / zonemax_monsters_divider) + 1 --avoid going negative
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

local function calculateSpawnInterval(zone)
    local baseMin = zone.spawnIntervalMin
    local baseMax = zone.spawnIntervalMax
    local maxReduction = 0.6  -- 60% max reduction
    local maxPlayers = 10  -- 10+ players give full reduction

    -- Determine reduction factor based on player count
    local playerFactor = math.min(zone.playercount / maxPlayers, 1)  -- Clamped to max 1 (100%)

    -- Calculate reduced spawn interval
    local reducedMin = math.floor(baseMin * (1 - (maxReduction * playerFactor)))
    local reducedMax = math.floor(baseMax * (1 - (maxReduction * playerFactor)))

    return math.random(reducedMin, reducedMax)
end


local function scheduleNextSpawn(zone)
    print("scheduleNextSpawn called for zone " .. zone.id)

    -- Stop spawning if the zone is inactive or has no players
    if not zone.active or zone.playercount < 1 then
        print("Zone " .. zone.id .. " is inactive or has no players. Stopping spawn.")
        if zone.spawnEvent then
            stopEvent(zone.spawnEvent)
            zone.spawnEvent = nil
        end
        return
    end

    -- Check current monster count
    local currentMonsterCount = tablelength(zone.spawnedMonsters)
    if currentMonsterCount >= zone.maxMonsters then
        print("Zone " .. zone.id .. " is at max monster capacity (" .. currentMonsterCount .. "/" .. zone.maxMonsters .. "). Skipping spawn.")
        if zone.spawnEvent then
            stopEvent(zone.spawnEvent)
            zone.spawnEvent = nil
        end
        return
    end

    -- **Use the new dynamic spawn interval based on player count**
    local nextSpawnInterval = calculateSpawnInterval(zone)
    print("Scheduling next spawn for zone " .. zone.id .. " in " .. nextSpawnInterval .. " ms.")

    zone.spawnEvent = addEvent(function()
        -- Ensure conditions are still valid before spawning
        if tablelength(zone.spawnedMonsters) < zone.maxMonsters and zone.active and zone.playercount > 0 then
            spawnMonsters(zone)
        else
            print("Spawn loop stopped for zone " .. zone.id .. " (conditions no longer met).")
            zone.spawnEvent = nil
        end
    end, nextSpawnInterval)
end




local function spawnMonster(zone, currentMonsterCount)
    if currentMonsterCount >= zone.maxMonsters then
        print("Max monsters reached in zone " .. zone.id .. ". Skipping spawn.")
        return false -- Return false to indicate no monster was spawned
    end

    local spawnPosition = getRandomPositionInZone(zone)
    if not spawnPosition then
        print("No valid spawn position found in zone " .. zone.id .. ". Skipping spawn.")
        return false
    end

    local monsterName = zone.monsters[math.random(#zone.monsters)]
    local monster = Game.createMonster(monsterName, spawnPosition, false)
    if monster then
        zone.spawnedMonsters[monster:getId()] = true -- Track the spawned monster
        print("Spawned " .. monster:getName() .. " in zone " .. zone.id .. " at position (" .. spawnPosition.x .. ", " .. spawnPosition.y .. ", " .. spawnPosition.z .. ").")
        monster:registerEvent("zone_death") -- Register the monster death event
        return true -- Return true to indicate a monster was successfully spawned
    else
        print("Failed to spawn monster " .. monsterName .. " in zone " .. zone.id)
        return false
    end
end



function spawnMonsters(zone)
    if not zone.active or zone.playercount < 1 then
        print("Zone " .. zone.id .. " is inactive or has no players. Skipping spawn.")
        return
    end

    -- Call Game.getZoneMonsterCount once
    local currentMonsterCount = Game.getZoneMonsterCount(zone.id)
    print("Current monsters in zone " .. zone.id .. ": " .. currentMonsterCount .. "/" .. zone.maxMonsters)

    if currentMonsterCount >= zone.maxMonsters then
        print("Zone " .. zone.id .. " has reached max monster capacity. Skipping spawn.")
        return
    end

    -- Attempt to spawn a monster
    if spawnMonster(zone, currentMonsterCount) then
        -- Schedule the next spawn only if a monster was successfully spawned
        if currentMonsterCount + 1 < zone.maxMonsters then
            print("Monster spawned. Scheduling next spawn for zone " .. zone.id)
            scheduleNextSpawn(zone)
        else
            print("Max monster capacity reached after spawn. No further spawns scheduled for zone " .. zone.id)
        end
    end
end

local function spawnZoneBoss(zone)
    if not zone.boss then
        print("No boss defined for zone: " .. zone.name)
        return
    end

    -- Check if the boss is already alive
    if zone.spawnedBoss and Monster(zone.spawnedBoss) then
        print("Boss " .. zone.boss .. " is already alive in " .. zone.name .. ", skipping spawn.")
        return
    end

    -- Use predefined position if it exists, otherwise get a random one
    local spawnPosition = zone.bossSpawnPosition or getRandomPositionInZone(zone)
    
    if not spawnPosition then
        print("No valid spawn position for boss in zone: " .. zone.name)
        return
    end
    local RedShader = "Monster Might"
    local boss = Game.createMonster(zone.boss, spawnPosition, true)
    if boss then
        boss:setShader(RedShader)
        boss:attachEffectById(9, false)
        boss:attachEffectById(32, false)

        zone.spawnedBoss = boss:getId()  -- Store the boss ID
        print("Boss " .. zone.boss .. " spawned in " .. zone.name .. "!")

        -- Notify all players in the zone
        for _, player in ipairs(Game.getZonePlayersVector(zone.id)) do
            if player then
                player:sendExtendedOpcode(76, "The mighty " .. zone.boss .. " has appeared in " .. zone.name .. "!")
            end
        end
    else
        print("Failed to spawn boss " .. zone.boss .. " in zone " .. zone.name)
    end
end



function onMonsterDeath(monster, killer)
    local zoneIds = Tile(monster:getPosition()):getZoneId()
    print("Monster " .. monster:getName() .. " died in zone IDs: " .. table.concat(zoneIds, ", "))

    for _, zoneId in ipairs(zoneIds) do
        if zones[zoneId] then
            local zone = zones[zoneId]
            zone.spawnedMonsters[monster:getId()] = nil

            -- If the dead monster is the boss, remove the reference
            if zone.spawnedBoss == monster:getId() then
                print("Boss " .. zone.boss .. " has been defeated in " .. zone.name)
                zone.spawnedBoss = nil
            end

            -- Increase kill counter
            zone.killCount = (zone.killCount or 0) + 1
           
            -- Check if boss should spawn
            if zone.boss and not zone.spawnedBoss and zone.killCount >= zone.bossKillThreshold then

                spawnZoneBoss(zone)
                zone.killCount = 0 -- Reset kill count after boss spawns
            end

            print("Monster " .. monster:getName() .. " died. Current monsters: " .. Game.getZoneMonsterCount(zone.id))
            scheduleNextSpawn(zone)
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

    local storageValue = player:getStorageValue(10001)
    if storageValue ~= zone.id then
        print("Player " .. player:getName() .. " entering zone ID: " .. zoneId)

        if zone.showZoneName then
            player:sendExtendedOpcode(76, "You have entered the zone " .. zone.name)
        end
        player:setStorageValue(10001, zone.id)
    end

    -- Apply the currently active weather of the zone
    if zone.activeWeather then
        player:setMapShader(zone.activeWeather, true)
        print("Player " .. player:getName() .. " received weather " .. zone.activeWeather)
    end

    -- Initialize tiles if they are empty
    if not zone.tiles or zone.tiles == 0 then
        local tileCount = getNumerPositionInZone(zoneId)
        print("Number of tiles: " .. tileCount)
        zone.tiles = tileCount
        zone.maxMonsters = (tileCount / zonemax_monsters_divider) + 1
    else
        print("Zone " .. zoneId .. " already has tiles: " .. zone.tiles .. " tiles. Max monsters: " .. zone.maxMonsters)
    end

    -- Initialize player count
    if not zone.playercount or zone.playercount == 0 then
        local newplayerscount = Game.getZonePlayerCount(zoneId)
        print("Number of players: " .. newplayerscount)
        zone.playercount = newplayerscount
    else
        zone.playercount = zone.playercount + 1 -- Increment player count
        print("Zone " .. zoneId .. " already has players: " .. zone.playercount)
    end
    zone.active = true

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
    activePlayers[player:getId()] = nil
    
    -- Reset weather to default when leaving
    player:setMapShader("Map - Default", true)

    if zones[zoneId].playercount < 1 then
        zones[zoneId].active = false
        despawnMonsters(zones[zoneId])
    else
        zones[zoneId].playercount = zones[zoneId].playercount - 1
        print("New zone count: " .. zones[zoneId].playercount)
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


for RegZonesId, _ in pairs(zones) do
    zoneIn:zoneid(RegZonesId)
end
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
    if not areZonesEqual(previousZones, newZones) and zoneid > 0 then
        print("zoneid: " .. zoneid)
        onLeaveZone(player, zoneid)
    end

    return true
end


for RegZonesIdout, _ in pairs(zones) do
    zoneOut:zoneid(RegZonesIdout)
end
zoneOut:register()



local creatureeventlogin = CreatureEvent("loginzones")

function creatureeventlogin.onLogin(player)
    local tile = Tile(player:getPosition())
    if tile then
        local zoneIds = tile:getZoneId() -- Get all zones the tile belongs to
        local uniqueZones = {}

        for _, zoneId in ipairs(zoneIds) do
            if zoneId > 1 and not uniqueZones[zoneId] then
                uniqueZones[zoneId] = true -- Mark this zone ID as processed
                onEnterZone(player, zoneId)

                -- Check if this zone has active weather
                local zone = zones[zoneId]
                if zone and zone.activeWeather then
                    player:setMapShader(zone.activeWeather, true)
                    print("Applied weather " .. zone.activeWeather .. " for " .. player:getName() .. " on login")
                end
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
        local zoneIds = tile:getZoneId() -- Get all zones the tile belongs to
        local uniqueZones = {}

        for _, zoneId in ipairs(zoneIds) do
            if zoneId > 1 and not uniqueZones[zoneId] then
                uniqueZones[zoneId] = true -- Mark this zone ID as processed
                onLeaveZone(player, zoneId)
            end
        end
    end

    -- Reset the player's weather to default on logout
    player:setMapShader("Map - Default", true)
    print("Reset weather for " .. player:getName() .. " on logout.")

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





local function populateZonesOnStartup()
    print("Populating all zones with monsters on startup...")

    for _, zone in pairs(zones) do
        if zone.onStartup then
            print("Filling zone: " .. zone.name)

            -- Ensure tiles are counted for monster limits
            if zone.tiles == 0 then
                zone.tiles = getNumerPositionInZone(zone.id)
                zone.maxMonsters = math.floor(zone.tiles / zonemax_monsters_divider) + 1
            end

            -- Spawn monsters up to the zone's max limit instantly
            local spawnedCount = 0
            while spawnedCount < zone.maxMonsters do
                local spawnPosition = getRandomPositionInZone(zone)
                if spawnPosition then
                    local monsterName = zone.monsters[math.random(#zone.monsters)]
                    local monster = Game.createMonster(monsterName, spawnPosition, false)
                    if monster then
                        zone.spawnedMonsters[monster:getId()] = true
                        spawnedCount = spawnedCount + 1
                      --  print("Spawned " .. monster:getName() .. " in " .. zone.name)
                    end
                end
            end
        end
    end

    print("All startup zones populated with monsters.")
end

local globalevent = GlobalEvent("WeatherUpdate")

function globalevent.onThink()
    for _, zone in pairs(zones) do
        if zone.weather and #zone.weather > 0 then
            -- If weather is forced, keep it the same
            if zone.forceWeather then
                zone.activeWeather = zone.weather[1]
            else
                -- Randomize weather if not already set or after a while
                if not zone.activeWeather or math.random(1, 10) > 5 then -- 30% chance to change
                    if math.random(1, 100) <= 50 then  -- 70% chance for default weather
                        zone.activeWeather = "Map - Default"
                    else
                        zone.activeWeather = zone.weather[math.random(#zone.weather)] -- Pick from defined weather
                    end
                end
            end

            -- Apply the weather to players currently in the zone
            for _, player in ipairs(Game.getZonePlayersVector(zone.id)) do
                if player then
                    player:setMapShader(zone.activeWeather, true)
                    print("Updated weather for player " .. player:getName() .. " in zone " .. zone.name .. " to " .. zone.activeWeather)
                end
            end
        end
    end
    return true
end

globalevent:interval(10000) -- Runs every 60 seconds
globalevent:register()





local startupZones = GlobalEvent("ZonesStartUp")
function startupZones.onStartup()
    -- Call this function on server startup
    populateZonesOnStartup()
    return true
end
startupZones:register()
  
  print(">> Loading Zones")

