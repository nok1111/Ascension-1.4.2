local zones = {

--AREA 1
    [1] = {
        id = 1,
        name = "Garona Forest",
        monsters = {"spider", "tarantula"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 7000,
    
        tiles = 0,
        maxMonsters = 0,
    
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
        name = "Garona Forest",
        monsters = {"twigkin", "flaming twigkin", "leafy twigkin"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
    
        tiles = 0,
        maxMonsters = 0,
    
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
    
        tiles = 0,
        maxMonsters = 0,
    
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
    
        tiles = 0,
        maxMonsters = 0,
    
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
    
        tiles = 0,
        maxMonsters = 0,
        onStartup = true, -- This will trigger monster spawn at startup
    
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
    
        tiles = 0,
        maxMonsters = 0,
        onStartup = true, -- This will trigger monster spawn at startup    
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
    
        tiles = 0,
        maxMonsters = 0,
        onStartup = true, -- This will trigger monster spawn at startup    
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
    
        tiles = 0,
        maxMonsters = 0,
        onStartup = true, -- This will trigger monster spawn at startup    
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [9] = {
        id = 9,
        name = "Mines of xxxxx",
        monsters = {"troll", "dark troll", "apprentice witch"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
    
        tiles = 0,
        maxMonsters = 0,
        onStartup = true, -- This will trigger monster spawn at startup    
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
    
        tiles = 0,
        maxMonsters = 0,
        onStartup = true, -- This will trigger monster spawn at startup    
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
    
        tiles = {},
        maxMonsters = 0,
        onStartup = true, -- This will trigger monster spawn at startup    
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
    
        tiles = {},
        maxMonsters = 0,
        onStartup = true, -- This will trigger monster spawn at startup    
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
    
        tiles = 0,
        maxMonsters = 0,
        onStartup = true, -- This will trigger monster spawn at startup    
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [14] = { 
        id = 14,
        name = "Mines of xxxxx",
        monsters = {"spider", "tarantula"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
    
        tiles = 0,
        maxMonsters = 0,
        onStartup = true, -- This will trigger monster spawn at startup    
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
    
        tiles = 0,
        maxMonsters = 0,
        onStartup = true, -- This will trigger monster spawn at startup    
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
    
        tiles = 0,
        maxMonsters = 0,
    
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
    
        tiles = 0,
        maxMonsters = 0,
        
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = true, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
        onStartup = true, -- This will trigger monster spawn at startup
    },
    [18] = { 
        id = 18,
        name = "Bull's plain",
        monsters = {"minotaur", "minotaur mage", "skeleton", "minotaur guard"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
    
        tiles = 0,
        maxMonsters = 0,
        onStartup = true, -- This will trigger monster spawn at startup
    
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = true, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [19] = {
        id = 19,
        name = "Thornback Swamp",
        monsters = {"thornback turtle", "mature thornback turtle", "turtle"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
    
        tiles = 0,
        maxMonsters = 0,
        onStartup = true, -- This will trigger monster spawn at startup
        
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = true, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [20] = {
        id = 20,
        name = "Verdant Grove",
        monsters = {"elf", "elf scout", "elf arcanist"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
    
        tiles = 0,
        maxMonsters = 0,
        onStartup = true, -- This will trigger monster spawn at startup
    
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = true, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
        onStartup = true, -- This will trigger monster spawn at startup
    },
    [21] = {
        id = 21,
        name = "Cursed Cementery",
        monsters = {"zombie", "mutated zombie", "skeleton", "poison skeleton", "witch"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
    
        tiles = 0,
        maxMonsters = 0,
        onStartup = true, -- This will trigger monster spawn at startup    
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
    
        tiles = 0,
        maxMonsters = 0,
        onStartup = true, -- This will trigger monster spawn at startup    
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [23] = {
        id = 23,
        name = "xxxxx",
        monsters = {"Thornback Turtle", "Mature Thornback Turtle", "Banshee", "Ghostly Appearance", "Vengeful Spirit"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
    
        tiles = 0,
        maxMonsters = 0,
        onStartup = true, -- This will trigger monster spawn at startup    
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [24] = {
        id = 24,
        name = "Forgotten Library",
        monsters = {"Banshee", "Ghostly Appearance", "Vengeful Spirit"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
    
        tiles = 0,
        maxMonsters = 0,
        onStartup = true, -- This will trigger monster spawn at startup    
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = true, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
    },
    [25] = {
        id = 25,
        name = "Veil of Corruption",
        monsters = {"earth elemental", "poison skeleton", "earth overlord", "medusa", "bonelord"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
    
        tiles = 0,
        maxMonsters = 0,
    
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
    
        tiles = 0,
        maxMonsters = 0,
    
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
        monsters = {"Nameless Skeleton", "Nameless Zombie", "Nameless Putrid Zombie"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
    
        tiles = 0,
        maxMonsters = 0,
        onStartup = true, -- This will trigger monster spawn at startup    
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = true, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area

          -- WEATHER SETTINGS
        weather = {"Map - Fog"}, -- Possible weather types
        forceWeather = false, -- If true, weather will always stay the same
        activeWeather = nil, -- Stores the currently active weather
    },
      [28] = {
        id = 28,
        name = "Eldenmere Ruins",
        monsters = {"Nameless Skeleton", "Nameless Zombie", "Nameless Putrid Zombie"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
    
        tiles = 0,
        maxMonsters = 0,
    
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
    
        tiles = 0,
        maxMonsters = 0,
    
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
    
        tiles = 0,
        maxMonsters = 0,
    
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
    [31] = {
        id = 31,
        name = "Chlorophyll Tunnels",
        monsters = {"ivy", "rotbloom", "overgrowth ivy"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
    
        tiles = 0,
        maxMonsters = 0,
    
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = true, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
        onStartup = true, -- This will trigger monster spawn at startup

    },

    [32] = {
        id = 32,
        name = "xxxx",
        monsters = {"sporecrawler", "fungal shambler", "fungus"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
    
        tiles = 0,
        maxMonsters = 0,
    
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = false, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
        onStartup = true, -- This will trigger monster spawn at startup


         -- WEATHER SETTINGS
        weather = {"Map - Rain", "Map - Fog"}, -- Possible weather types
        forceWeather = false, -- If true, weather will always stay the same
        activeWeather = nil, -- Stores the currently active weather
    },
    [33] = {
        id = 33,
        name = "Wyrmfang Mountai",
        monsters = {"wyrm", "furious wyrm"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
    
        tiles = 0,
        maxMonsters = 0,
    
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = true, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
        onStartup = true, -- This will trigger monster spawn at startup


         -- WEATHER SETTINGS
        weather = {"Desert", "Desert3", "Desert4", "Map - Heatwave"}, -- Possible weather types
        forceWeather = false, -- If true, weather will always stay the same
        activeWeather = nil, -- Stores the currently active weather
    },
    [34] = {
        id = 34,
        name = "Troll Highlands",
        monsters = {"war troll", "spearman troll", "shaman troll"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
    
        tiles = 0,
        maxMonsters = 0,
    
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = true, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
        onStartup = true, -- This will trigger monster spawn at startup


         -- WEATHER SETTINGS
        weather = {"Desert", "Desert3", "Desert4", "Map - Heatwave"}, -- Possible weather types
        forceWeather = false, -- If true, weather will always stay the same
        activeWeather = nil, -- Stores the currently active weather
    },
    [35] = {
        id = 35,
        name = "Troll Fortress",
        monsters = {"war troll", "spearman troll", "shaman troll", "blademaster troll"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
    
        tiles = 0,
        maxMonsters = 0,
    
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = true, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
        onStartup = true, -- This will trigger monster spawn at startup

        boss = "Gor'mhaz the Old",   -- Boss monster
        bossKillThreshold = 85, -- Number of kills required to spawn boss
        killCount = 0,
        bossSpawnPosition = Position(892, 1029, 7),  -- Example X, Y, Z coordinates

         -- WEATHER SETTINGS
        weather = {"Desert", "Desert3", "Desert4", "Map - Heatwave"}, -- Possible weather types
        forceWeather = false, -- If true, weather will always stay the same
        activeWeather = nil, -- Stores the currently active weather
    },
    [36] = {
        id = 36,
        name = "Tuskin Mountain",
        monsters = {"hog", "tuskhog", "hog smasher", "hog bomber", "hog spearman", "hog champion", "hog elite", "hog shaman"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
    
        tiles = 0,
        maxMonsters = 0,
    
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
    [37] = {
        id = 37,
        name = "Murloks Beach",
        monsters = {"murlok", "murlok axeman", "murlok piercer", "murlok champion", "murlok shellthorn", "murlok shaman"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
    
        tiles = 0,
        maxMonsters = 0,
    
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
    [38] = {
        id = 38,
        name = "Murloks Beach",
        monsters = {"bonesand brawler", "bonesand hexbone", "bonesand lancer", "bonesand sentinel"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
    
        tiles = 0,
        maxMonsters = 0,
    
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = true, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
        onStartup = true, -- This will trigger monster spawn at startup

    },
    [39] = {
        id = 39,
        name = "desert draptors mountain",
        monsters = {"desert draptor"},
        spawnIntervalMin = 1000,
        spawnIntervalMax = 1000,
    
        tiles = 0,
        maxMonsters = 0,
    
        spawnedMonsters = {}, 
        spawnEvent = nil,
        showZoneName = true, -- Whether to show the zone name on entering
        despawnmonsters = false, -- -- Whether to despawn monster when no players are in area
        onStartup = true, -- This will trigger monster spawn at startup

         -- WEATHER SETTINGS
        weather = {"Desert", "Desert3", "Desert4", "Map - Heatwave"}, -- Possible weather types
        forceWeather = false, -- If true, weather will always stay the same
        activeWeather = nil, -- Stores the currently active weather

    },




--AREA 2
}

local activePlayers = {}
local zonemax_monsters_divider = 85 --higher less monsters


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


--
-- SPAWN LOGIC: Only zone.filled is used to control spawning.
-- If zone.filled == true, the zone is at max monster capacity and no further spawns are scheduled.
-- When a monster dies and the zone is no longer full, zone.filled is set to false and spawning resumes.
--
local function canZoneSpawn(zone)
    return not zone.filled
end

local function isZoneAtMonsterCap(zone)
    return zone.filled
end

local function scheduleNextSpawn(zone)
    print("scheduleNextSpawn called for zone " .. zone.id)

    if not canZoneSpawn(zone) then
        print("Zone " .. zone.id .. " is at monster cap (filled). Stopping spawn.")
        if zone.spawnEvent then
            stopEvent(zone.spawnEvent)
            zone.spawnEvent = nil
        end
        return
    end

    local nextSpawnInterval = math.random(zone.spawnIntervalMin, zone.spawnIntervalMax)
    print("Scheduling next spawn for zone " .. zone.id .. " in " .. nextSpawnInterval .. " ms.")

    zone.spawnEvent = addEvent(function()
        if canZoneSpawn(zone) then
            print("Spawning monster in zone " .. zone.id .. ".")
            spawnMonsters(zone)
        else
            print("Spawn loop stopped for zone " .. zone.id .. " (zone is filled).")
            zone.spawnEvent = nil
        end
    end, nextSpawnInterval)
end




local function spawnMonster(zone, currentMonsterCount)
    if currentMonsterCount >= zone.maxMonsters then
        --print("Max monsters reached in zone " .. zone.id .. ". Skipping spawn.")
        return false -- Return false to indicate no monster was spawned
    end

    local spawnPosition = getRandomPositionInZone(zone)
    if not spawnPosition then
        --print("No valid spawn position found in zone " .. zone.id .. ". Skipping spawn.")
        return false
    end

    local monsterName = zone.monsters[math.random(#zone.monsters)]
    local monster = Game.createMonster(monsterName, spawnPosition, false)
    if monster then
        print("Spawning " .. monster:getName() .. " in zone " .. zone.id .. " at position (" .. spawnPosition.x .. ", " .. spawnPosition.y .. ", " .. spawnPosition.z .. ").")
        if monster:getName() == "Furious Wyrm" then
            monster:setShader("Monster Might")
         end
        zone.spawnedMonsters[monster:getId()] = true -- Track the spawned monster
        --print("Spawned " .. monster:getName() .. " in zone " .. zone.id .. " at position (" .. spawnPosition.x .. ", " .. spawnPosition.y .. ", " .. spawnPosition.z .. ").")
        monster:registerEvent("death_zones") -- Register the monster death event
        return true -- Return true to indicate a monster was successfully spawned
    else
        --print("Failed to spawn monster " .. monsterName .. " in zone " .. zone.id)
        return false
    end
end



function spawnMonsters(zone)
    if not canZoneSpawn(zone) then
        print("Zone " .. zone.id .. " is at monster cap (filled). Skipping spawn.")
        return
    end

    local currentMonsterCount = Game.getZoneMonsterCount(zone.id)
    print("Current monsters in zone " .. zone.id .. ": " .. currentMonsterCount .. "/" .. zone.maxMonsters)

    if spawnMonster(zone, currentMonsterCount) then
        -- Update filled status
        if currentMonsterCount + 1 >= zone.maxMonsters then
            zone.filled = true
            print("Zone " .. zone.id .. " is now filled (at monster cap). No further spawns scheduled.")
        else
            scheduleNextSpawn(zone)
        end
    end
end

local function spawnZoneBoss(zone)
    if not zone.boss then
        --print("No boss defined for zone: " .. zone.name)
        return
    end

    -- Check if the boss is already alive
    if zone.spawnedBoss and Monster(zone.spawnedBoss) then
        --print("Boss " .. zone.boss .. " is already alive in " .. zone.name .. ", skipping spawn.")
        return
    end

    -- Use predefined position if it exists, otherwise get a random one
    local spawnPosition = zone.bossSpawnPosition or getRandomPositionInZone(zone)
    
    if not spawnPosition then
        --print("No valid spawn position for boss in zone: " .. zone.name)
        return
    end
    local RedShader = "Monster Might"
    local boss = Game.createMonster(zone.boss, spawnPosition, true)
    if boss then
        boss:setShader(RedShader)
        boss:attachEffectById(9, false)
        boss:attachEffectById(32, false)
        boss:registerEvent("death_zones")

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
        local zone = zones[zoneId]
        if zone then
            -- Remove monster from tracking
            zone.spawnedMonsters[monster:getId()] = nil

            -- Boss defeat logic
            if zone.spawnedBoss == monster:getId() then
                print("Boss " .. zone.boss .. " has been defeated in " .. zone.name)
                zone.spawnedBoss = nil
            end

            -- Increase kill counter and handle boss spawn
            zone.killCount = (zone.killCount or 0) + 1
            if zone.boss and not zone.spawnedBoss and zone.killCount >= zone.bossKillThreshold then
                spawnZoneBoss(zone)
                zone.killCount = 0
            end

            print("Monster " .. monster:getName() .. " died. Current monsters: " .. Game.getZoneMonsterCount(zone.id))

            -- Always allow the zone to schedule next spawn after a monster death
            zone.filled = false
            print("Scheduling next spawn for zone " .. zone.id .. " after monster death.")
            scheduleNextSpawn(zone)

        end
    end
    return true
end


local function despawnMonsters(zone)
    if zone.despawnmonsters then  -- Check if despawnmonsters is true
        if tablelength(zone.spawnedMonsters) == 0 then
            return
        end

        --print("Despawning monsters in zone ID: " .. zone.id)
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


local function onEnterZone(player, zoneId)
    local zone = zones[zoneId]
    if not zone then
        return
    end

    print("onEnterZone")
    local storageValue = player:getStorageValue(10001)
    if storageValue ~= zone.id then
        if zone.showZoneName then
            player:sendExtendedOpcode(76, "You have entered the zone " .. zone.name)
        end
        player:setStorageValue(10001, zone.id)
    end

    -- Apply the currently active weather of the zone
    if zone.activeWeather then
        player:setMapShader(zone.activeWeather, true)
    end

    -- Initialize tiles if they are empty
    if not zone.tiles or zone.tiles == 0 then
        local tileCount = getNumerPositionInZone(zoneId)
        zone.tiles = tileCount
        zone.maxMonsters = (tileCount / zonemax_monsters_divider) + 1
    end

end








local function onLeaveZone(player, zoneId)
    player:setStorageValue(10001, 0)
    activePlayers[player:getId()] = nil
    player:setMapShader("Map - Default", true)
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
        --print("zoneid: " .. zoneid)
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
                    --print("Applied weather " .. zone.activeWeather .. " for " .. player:getName() .. " on login")
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
    --print("Reset weather for " .. player:getName() .. " on logout.")

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
   return true
end 

creatureeventDeath:register()  






local function populateZonesOnStartup()
    --print("Populating all zones with monsters on startup...")

    for _, zone in pairs(zones) do
        if zone.onStartup then
            --print("Filling zone: " .. zone.name)

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
                        monster:registerEvent("death_zones")

                        if monster:getName() == "Furious Wyrm" then
                            monster:setShader("Monster Might")
                        end
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
                    --print("Updated weather for player " .. player:getName() .. " in zone " .. zone.name .. " to " .. zone.activeWeather)
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

