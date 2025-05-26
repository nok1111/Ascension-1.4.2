-- Ore vein configuration
local oreVeinCategories = {
    copper = {
        emptyPositions = {},
        maxAmount = 150, -- Individual max amount
        effectOnAppear = 12,
        emptyVeinId = 40024,
        activeVeins = {
            {id = 39985, chance = 60},
            {id = 39981, chance = 40},
        },
    },
    silver = {
        emptyPositions = {},
        maxAmount = 100, -- Individual max amount
        effectOnAppear = 12,
        emptyVeinId = 29425,
        activeVeins = {
            {id = 29424, chance = 25},
            {id = 29431, chance = 25},
            {id = 29430, chance = 25},
            {id = 29434, chance = 25},
        },
    },
    purple = {
        emptyPositions = {},
        maxAmount = 800, -- Individual max amount
        effectOnAppear = 12,
        emptyVeinId = 29427,
        activeVeins = {
            {id = 29426, chance = 100},
        },
    },
    gold = {
        emptyPositions = {},
        maxAmount = 600, -- Individual max amount
        effectOnAppear = 12,
        emptyVeinId = 29429,
        activeVeins = {
            {id = 29432, chance = 60},
            {id = 29433, chance = 40},
        },
    },
}

-- Utility function to shuffle a table (Fisher-Yates shuffle)
local function shuffleTable(tbl)
    for i = #tbl, 2, -1 do
        local j = math.random(1, i)
        tbl[i], tbl[j] = tbl[j], tbl[i]
    end
end

-- Helper function: Get random vein ID based on chances
local function getRandomVeinId(veins)
    local totalChance = 0
    for _, vein in ipairs(veins) do
        totalChance = totalChance + vein.chance
    end

    local randomChance = math.random(1, totalChance)
    local cumulativeChance = 0

    for _, vein in ipairs(veins) do
        cumulativeChance = cumulativeChance + vein.chance
        if randomChance <= cumulativeChance then
            return vein.id
        end
    end

    return veins[#veins].id
end

-- Function to discover empty vein positions dynamically
function discoverEmptyVeins()
    -- Reset positions for each category
    for _, category in pairs(oreVeinCategories) do
        category.emptyPositions = {}
    end

    -- Iterate over the map dimensions (adjust bounds to fit your map)
   for x = 207, 2021 do
        for y = 59, 1597 do
            for z = 1, 15 do
                local position = Position(x, y, z)
                local tile = Tile(position)

                if tile then
                    for categoryName, category in pairs(oreVeinCategories) do
                        local emptyVein = tile:getItemById(category.emptyVeinId)
                        if emptyVein then
                            table.insert(category.emptyPositions, position)
                        end
                    end
                end
            end
        end
    end

    -- Shuffle empty vein positions to randomize placement
    for _, category in pairs(oreVeinCategories) do
        shuffleTable(category.emptyPositions)
    end

    -- Debugging output
    -- for categoryName, category in pairs(oreVeinCategories) do
    --     print(string.format("Discovered %d empty positions for %s veins.", #category.emptyPositions, categoryName))
    -- end
end

-- Function to generate veins on server startup
function generateVeinsOnStartup()
    for categoryName, category in pairs(oreVeinCategories) do
        local placedInCategory = 0

        -- Shuffle the empty vein positions before placing veins
        shuffleTable(category.emptyPositions)

        for _, position in ipairs(category.emptyPositions) do
            if placedInCategory >= category.maxAmount then
                break
            end

            local tile = Tile(position)
            if tile and tile:getItemById(category.emptyVeinId) then
                local veinId = getRandomVeinId(category.activeVeins)
                tile:getItemById(category.emptyVeinId):transform(veinId)
                position:sendMagicEffect(category.effectOnAppear)
                placedInCategory = placedInCategory + 1
            end
        end

        -- Debugging output
         print(string.format("Placed %d veins for %s category.", placedInCategory, categoryName))
    end
end

-- Function to refill a vein (mining)
function refillVein(targetId)
    for categoryName, category in pairs(oreVeinCategories) do
        if targetId == category.emptyVeinId then
            -- Shuffle empty positions before selecting one to refill
            shuffleTable(category.emptyPositions)

            for _, position in ipairs(category.emptyPositions) do
                local tile = Tile(position)
                if tile and tile:getItemById(category.emptyVeinId) then
                    local veinId = getRandomVeinId(category.activeVeins)
                    tile:getItemById(category.emptyVeinId):transform(veinId)
                    position:sendMagicEffect(category.effectOnAppear)
                    -- print("Vein refilled in category: " .. categoryName)
                    return true
                end
            end
            -- print("No empty positions found to refill vein in category: " .. categoryName)
            return false
        end
    end

    -- print("Invalid target ID: " .. targetId)
    return false
end

-- Call functions on server startup
-- discoverEmptyVeins()
-- generateVeinsOnStartup()
