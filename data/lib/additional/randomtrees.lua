-- Woodcutting tree configuration
local treeData = {
    [37589] = { newTree = 39943, effectOnAppear = 12, maxAmount = 25 },
    [37594] = { newTree = 39943, effectOnAppear = 12, maxAmount = 25 },

    [37590] = { newTree = 39944, effectOnAppear = 12, maxAmount = 200 },

    [37595] = { newTree = 39945, effectOnAppear = 12, maxAmount = 200 },

    [37586] = { newTree = 39946, effectOnAppear = 12, maxAmount = 200 },
    [37596] = { newTree = 39946, effectOnAppear = 12, maxAmount = 200 },

    [37600] = { newTree = 39947, effectOnAppear = 12, maxAmount = 200 },

    [37597] = { newTree = 39948, effectOnAppear = 12, maxAmount = 200 },
    [37599] = { newTree = 39948, effectOnAppear = 12, maxAmount = 200 },

    [37603] = { newTree = 39949, effectOnAppear = 12, maxAmount = 200 },

    [37587] = { newTree = 39950, effectOnAppear = 12, maxAmount = 200 },
    [37588] = { newTree = 39950, effectOnAppear = 12, maxAmount = 200 },

    [37607] = { newTree = 39951, effectOnAppear = 12, maxAmount = 200 },
    [37605] = { newTree = 39951, effectOnAppear = 12, maxAmount = 200 },

    [37591] = { newTree = 39952, effectOnAppear = 12, maxAmount = 200 },
    [37592] = { newTree = 39952, effectOnAppear = 12, maxAmount = 200 },


    [40045] = { newTree = 40050, effectOnAppear = 12, maxAmount = 300 },
    [40046] = { newTree = 40051, effectOnAppear = 12, maxAmount = 100 },
    [40047] = { newTree = 40052, effectOnAppear = 12, maxAmount = 300 },
    [40048] = { newTree = 40052, effectOnAppear = 12, maxAmount = 50 },
    [40049] = { newTree = 40052, effectOnAppear = 12, maxAmount = 50 },

}

-- Table to store discovered tree positions
local treePositions = {}

-- Function to discover tree positions dynamically
function discoverTreePositions()
    treePositions = {} -- Reset table
--207, 59, 7 --- 2021, 1597, 7
    for x = 207, 2021 do
        for y = 59, 1597 do
            for z = 1, 7 do
               local position = Position(x, y, z)
                local tile = Tile(position)

                if tile then
                    for treeId, _ in pairs(treeData) do
                        local treeItem = tile:getItemById(treeId)
                        if treeItem then
                            table.insert(treePositions, { position = position, treeId = treeId })
                        end
                    end
                end
            end
        end
    end

    -- Debugging: Print discovered tree positions
    -- print("Discovered " .. #treePositions .. " trees for woodcutting.")
end

-- Utility function to shuffle a table (Fisher-Yates algorithm)
local function shuffleTable(tbl)
    for i = #tbl, 2, -1 do
        local j = math.random(1, i)
        tbl[i], tbl[j] = tbl[j], tbl[i]
    end
end

-- Function to generate trees on server startup
function generateTreesOnStartup()
    local placedTrees = {}

    -- Initialize tracking for each tree type
    for treeId, _ in pairs(treeData) do
        placedTrees[treeId] = 0
    end

    -- Shuffle tree positions to randomize placement
    shuffleTable(treePositions)

    for _, tree in ipairs(treePositions) do
        if placedTrees[tree.treeId] >= treeData[tree.treeId].maxAmount then
            break
        end

        local tile = Tile(tree.position)
        if tile and tile:getItemById(tree.treeId) then
            local treeInfo = treeData[tree.treeId]
            tile:getItemById(tree.treeId):transform(treeInfo.newTree)
            tree.position:sendMagicEffect(treeInfo.effectOnAppear)
            placedTrees[tree.treeId] = placedTrees[tree.treeId] + 1
        end
    end

    -- Debugging: Print how many trees were generated
    print("Generated " .. #treePositions .. " usable trees for woodcutting.")
end


-- Function to regrow a tree after being cut down
function regrowTree(targetId)
    -- Shuffle tree positions to randomize regrowth locations
    shuffleTable(treePositions)

    for _, tree in ipairs(treePositions) do
        local tile = Tile(tree.position)
        if tile and tile:getItemById(targetId) then
            local treeInfo = treeData[tree.treeId]
            tile:getItemById(targetId):transform(treeInfo.newTree)
            tree.position:sendMagicEffect(treeInfo.effectOnAppear)
            return true
        end
    end

    return false -- No matching tree found
end

print(">>> Loading Tree Systems")

-- Call functions on server startup
-- discoverTreePositions()
-- generateTreesOnStartup()
