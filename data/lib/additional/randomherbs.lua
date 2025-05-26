-- Herb configuration
local herbCategories = {
    commonHerb = {
        emptyPositions = {},
        maxAmount = 180, -- Individual max amount
        effectOnAppear = 12,
        emptyHerbId = 40055,
        activeHerbs = {
            {id = 35730, chance = 50},
            {id = 35731, chance = 50},
        },
    },
    rareHerb = {
        emptyPositions = {},
        maxAmount = 1000, -- Individual max amount
        effectOnAppear = 12,
        emptyHerbId = 29425,
        activeHerbs = {
            {id = 29424, chance = 25},
            {id = 29431, chance = 25},
            {id = 29430, chance = 25},
            {id = 29434, chance = 25},
        },
    },
    exoticHerb = {
        emptyPositions = {},
        maxAmount = 800, -- Individual max amount
        effectOnAppear = 12,
        emptyHerbId = 29427,
        activeHerbs = {
            {id = 29426, chance = 100},
        },
    },
    legendaryHerb = {
        emptyPositions = {},
        maxAmount = 600, -- Individual max amount
        effectOnAppear = 12,
        emptyHerbId = 29429,
        activeHerbs = {
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

-- Helper function: Get random herb ID based on chances
local function getRandomHerbId(herbs)
    local totalChance = 0
    for _, herb in ipairs(herbs) do
        totalChance = totalChance + herb.chance
    end

    local randomChance = math.random(1, totalChance)
    local cumulativeChance = 0

    for _, herb in ipairs(herbs) do
        cumulativeChance = cumulativeChance + herb.chance
        if randomChance <= cumulativeChance then
            return herb.id
        end
    end

    return herbs[#herbs].id
end

-- Function to discover empty herb positions dynamically
function discoverEmptyHerbs()
    -- Reset positions for each category
    for _, category in pairs(herbCategories) do
        category.emptyPositions = {}
    end

    -- Iterate over the map dimensions (adjust bounds to fit your map)
    for x = 207, 2021 do
        for y = 59, 1597 do
            for z = 1, 15 do
                local position = Position(x, y, z)
                local tile = Tile(position)

                if tile then
                    for categoryName, category in pairs(herbCategories) do
                        local emptyHerb = tile:getItemById(category.emptyHerbId)
                        if emptyHerb then
                            table.insert(category.emptyPositions, position)
                        end
                    end
                end
            end
        end
    end

    -- Shuffle empty herb positions to randomize placement
    for _, category in pairs(herbCategories) do
        shuffleTable(category.emptyPositions)
    end

    -- Debugging output
    -- for categoryName, category in pairs(herbCategories) do
    --     print(string.format("Discovered %d empty positions for %s herbs.", #category.emptyPositions, categoryName))
    -- end
end

-- Function to generate herbs on server startup
function generateHerbsOnStartup()
    for categoryName, category in pairs(herbCategories) do
        local placedInCategory = 0

        -- Shuffle the empty herb positions before placing herbs
        shuffleTable(category.emptyPositions)

        for _, position in ipairs(category.emptyPositions) do
            if placedInCategory >= category.maxAmount then
                break
            end

            local tile = Tile(position)
            if tile and tile:getItemById(category.emptyHerbId) then
                local herbId = getRandomHerbId(category.activeHerbs)
                tile:getItemById(category.emptyHerbId):transform(herbId)
                position:sendMagicEffect(category.effectOnAppear)
                placedInCategory = placedInCategory + 1
            end
        end

        -- Debugging output
        print(string.format("Placed %d herbs for %s category.", placedInCategory, categoryName))
    end
end

-- Function to refill a herb (herb gathering)
function refillHerb(targetId)
    for categoryName, category in pairs(herbCategories) do
        if targetId == category.emptyHerbId then
            -- Shuffle empty positions before selecting one to refill
            shuffleTable(category.emptyPositions)

            for _, position in ipairs(category.emptyPositions) do
                local tile = Tile(position)
                if tile and tile:getItemById(category.emptyHerbId) then
                    local herbId = getRandomHerbId(category.activeHerbs)
                    tile:getItemById(category.emptyHerbId):transform(herbId)
                    position:sendMagicEffect(category.effectOnAppear)
                    -- print("Herb refilled in category: " .. categoryName)
                    return true
                end
            end
            -- print("No empty positions found to refill herb in category: " .. categoryName)
            return false
        end
    end

    -- print("Invalid target ID: " .. targetId)
    return false
end

-- Call functions on server startup
-- discoverEmptyHerbs()
-- generateHerbsOnStartup()
