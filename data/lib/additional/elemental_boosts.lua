local maxBoosters = 5  -- Maximum number of booster entries allowed per player

-- Use a regular table keyed by player ID for persistent storage.
local playerBoosters = {}

-- Initializes and returns the booster table for the given player.
function initElementalBoosters(player)
    local id = player:getId()
    if not playerBoosters[id] then
        playerBoosters[id] = {}
    end
    return playerBoosters[id]
end

-- Adds a booster entry for the given elemental type.
-- Only maxBoosters entries can be active at any time.
-- If the queue is full, the oldest booster is removed.
function addElementalBoost(player, boostType, amount)
    local boosters = initElementalBoosters(player)
    amount = amount or 1

    if #boosters >= maxBoosters then
        table.remove(boosters, 1)
    end

    table.insert(boosters, { type = boostType, amount = amount })

    local playerName = player:getName() or "Unknown"
    -- Calculate the new total for this booster type.
    local total = getElementalBoost(player, boostType)
    print("Player '" .. playerName .. "' received booster '" .. boostType .. "' with amount: " .. tostring(amount))
    print("Total for booster '" .. boostType .. "' is now: " .. tostring(total))
    print("Current boosters for player '" .. playerName .. "':")
    for i, booster in ipairs(boosters) do
        print("  Slot " .. i .. ": Type = " .. booster.type .. ", Amount = " .. tostring(booster.amount))
    end
end

-- Clears all active boosters for the player.
function ClearBooster(player)
    local id = player:getId()
    playerBoosters[id] = {}
end

-- Returns the total booster amount for a given elemental type.
function getElementalBoost(player, boostType)
    local boosters = initElementalBoosters(player)
    local total = 0
    for _, booster in ipairs(boosters) do
        if booster.type == boostType then
            total = total + booster.amount
        end
    end
    return total
end

-- Consumes (removes) a specified amount of boosters for a given type.
-- It subtracts from the oldest matching entry first.
function removeElementalBoost(player, boostType, amount)
    local boosters = initElementalBoosters(player)
    amount = amount or 1
    while amount > 0 do
        local found = false
        for i, booster in ipairs(boosters) do
            if booster.type == boostType then
                found = true
                if booster.amount > amount then
                    booster.amount = booster.amount - amount
                    amount = 0
                else
                    amount = amount - booster.amount
                    table.remove(boosters, i)
                end
                break
            end
        end
        if not found then break end
    end
end

-- Checks if the player's booster table contains the specified chain in order.
-- The chain is passed as variable arguments. For example:
--    checkChainBoosters(player, "terra", "energy")
-- returns true if, in the player's booster table, there is at least one "terra" 
-- appearing before a later "energy", and the most recent booster is "energy".
function checkChainBoosters(player, ...)
    local chain = { ... }
    local boosters = initElementalBoosters(player)
    
    -- The player's booster table must have at least as many entries as the chain length.
    if #boosters < #chain then
        return false
    end

    -- Check that the most recent booster matches the last element in the chain.
    if boosters[#boosters].type ~= chain[#chain] then
        return false
    end

    -- Now check if the boosters contain the chain in order.
    local j = 1
    for i = 1, #boosters do
        if boosters[i].type == chain[j] then
            j = j + 1
            if j > #chain then
                break
            end
        end
    end

    return (j > #chain)
end


-- Returns a damage multiplier based on the total booster amount for a given elemental type.
-- For example, each booster adds 10% extra damage.
function getElementalBoostMultiplier(player, boostType)
    local boost = getElementalBoost(player, boostType)
    return 1 + (boost * 0.1)
end
