local maxBoosters = 2  -- Maximum of 2 boosters as per your requirement
local effectMapping = {
    fire = 41,  -- Replace with your actual effect IDs
    ice = 42,
    life = 43,
    -- Combined effects if needed
    fire_ice = 47,
    fire_life = 48,
    ice_life = 49,
    fire_fire = 44,
    ice_ice = 45,
    life_life = 46
}

local playerBoosters = {}

-- Initializes and returns the booster table for the given player.
function initElementalBoosters(player)
    local id = player:getId()
    if not playerBoosters[id] then
        playerBoosters[id] = {
            boosters = {},
            currentEffects = {}  -- Track currently attached effects
        }
    end
    return playerBoosters[id]
end

function updatePlayerEffects(player)
    local data = initElementalBoosters(player)
    
    -- First remove all existing effects
    for _, effectId in pairs(data.currentEffects) do
        player:detachEffectById(effectId, true)
    end
    data.currentEffects = {}
    
    -- Determine which effect to show based on current boosters
    if #data.boosters == 0 then
        return  -- No effects to show
    elseif #data.boosters == 1 then
        local effectId = effectMapping[data.boosters[1].type]
        if effectId then
            player:attachEffectById(effectId, true)
            table.insert(data.currentEffects, effectId)
        end
    else
        -- For 2 boosters, we need to determine the combination
        local type1 = data.boosters[1].type
        local type2 = data.boosters[2].type
        local effectKey
        
        -- Check for double boosters
        if type1 == type2 then
            effectKey = type1 .. "_" .. type2
        else
            -- Sort to maintain consistent ordering (fire_ice same as ice_fire)
            if type1 < type2 then
                effectKey = type1 .. "_" .. type2
            else
                effectKey = type2 .. "_" .. type1
            end
        end
        
        local effectId = effectMapping[effectKey]
        if effectId then
            player:attachEffectById(effectId, true)
            table.insert(data.currentEffects, effectId)
        end
    end
end

-- Adds a booster entry for the given elemental type.
-- Only maxBoosters entries can be active at any time.
-- If the queue is full, the oldest booster is removed.
function addElementalBoost(player, boostType, amount)
    local data = initElementalBoosters(player)
    amount = amount or 1
    
    -- Remove oldest booster if we're at max
    if #data.boosters >= maxBoosters then
        table.remove(data.boosters, 1)
        -- Ensure we update effects when removing old boosters
        updatePlayerEffects(player)
    end
    
    table.insert(data.boosters, { type = boostType, amount = amount })
    updatePlayerEffects(player)
end



-- Clears all active boosters for the player.
function ClearBooster(player)
    local id = player:getId()
    if playerBoosters[id] then
        -- First remove all attached effects
        for _, effectId in pairs(playerBoosters[id].currentEffects) do
            player:detachEffectById(effectId, true)
        end
        -- Then clear the boosters
        playerBoosters[id] = {
            boosters = {},
            currentEffects = {}
        }
    end
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
    local data = initElementalBoosters(player)
    amount = amount or 1
    
    -- First remove all effects to prevent visual glitches
    for _, effectId in pairs(data.currentEffects) do
        player:detachEffectById(effectId, true)
    end
    data.currentEffects = {}
    
    while amount > 0 do
        local found = false
        for i, booster in ipairs(data.boosters) do
            if booster.type == boostType then
                found = true
                if booster.amount > amount then
                    booster.amount = booster.amount - amount
                    amount = 0
                else
                    amount = amount - booster.amount
                    table.remove(data.boosters, i)
                end
                break
            end
        end
        if not found then break end
    end
    
    -- Update effects after removal
    updatePlayerEffects(player)
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

function getActiveOrbs(player)
    local boosters = initElementalBoosters(player).boosters
    if #boosters < 2 then return nil, nil end
    return boosters[1].type, boosters[2].type
end

-- Adds random boosters to player
function addRandomBoosters(player, count)
    local orbTypes = {"fire", "ice", "life"}
    local data = initElementalBoosters(player)
    
    -- Clear existing boosters first to ensure we get new combinations
    data.boosters = {}
    
    for i = 1, math.min(count, maxBoosters) do
        -- Add random booster
        table.insert(data.boosters, {
            type = orbTypes[math.random(#orbTypes)]
        })
    end
    
    updatePlayerEffects(player)
    
    -- Return the orb types that were added
    if #data.boosters >= 2 then
        return data.boosters[1].type, data.boosters[2].type
    elseif #data.boosters == 1 then
        return data.boosters[1].type, nil
    end
    return nil, nil
end