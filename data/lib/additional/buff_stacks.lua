--[[
Usage examples:

-- Add 1 permanent stack:
addBuffStack(player, "ElusiveCharge", 1)

-- Add 1 temporary stack (decays after 5 seconds):
addBuffStack(player, "ElusiveCharge", 1, 5000) -- duration in ms

-- Remove 1 stack (manual, also cancels timer if temporary):
removeBuffStack(player, "ElusiveCharge", 1)

-- Get current number of stacks:
local charges = getBuffStack(player, "ElusiveCharge")

-- Set stack count directly (resets all timers):
setBuffStack(player, "ElusiveCharge", 5)

-- Clear all stacks for a player:
clearAllBuffStacks(player)

-- Clear a specific stack:
clearBuffStack(player, "ElusiveCharge")

-- Call on logout to prevent leaks:
onPlayerLogout_clearBuffStacks(player)
]]

local playerStacks = {}

-- Initializes and returns the stack table for the given player.
function initBuffStacks(player)
    local id = player:getId()
    if not playerStacks[id] then
        playerStacks[id] = {}
    end
    return playerStacks[id]
end

-- Adds stacks to a named buff for the player.
-- Adds stacks to a named buff for the player. If durationMs is set, the stack is temporary.
function addBuffStack(player, stackName, amount, durationMs)
    local stacks = initBuffStacks(player)
    amount = amount or 1

    if not stacks[stackName] then
        stacks[stackName] = {count = 0, timers = {}}
    end

    if durationMs then
        -- Stop all existing timers (refresh behavior)
        if stacks[stackName].timers then
            for _, timer in ipairs(stacks[stackName].timers) do
                stopEvent(timer)
            end
            stacks[stackName].timers = {}
        end
        -- Set the new count (old + new)
        stacks[stackName].count = stacks[stackName].count + amount
        -- Start a single timer for all stacks
        local timer = addEvent(function()
            setBuffStack(player, stackName, 0)
            player:say(stackName .. ': 0')
        end, durationMs)
        table.insert(stacks[stackName].timers, timer)
    else
        -- Permanent stacks: just add
        stacks[stackName].count = stacks[stackName].count + amount
    end

    local count = getBuffStack(player, stackName)
    player:say(stackName .. ": " .. count)
end

-- Removes stacks from a named buff for the player (cannot go below 0).
-- If fromDecay is true, only remove one decaying stack and clear its timer.
function removeBuffStack(player, stackName, amount, fromDecay)
    if not player or not player:isPlayer() then return end
    local stacks = initBuffStacks(player)
    if not stacks[stackName] then return end

    amount = amount or 1

    if fromDecay then
        -- Remove only one decaying stack and its timer (legacy, but not used in refresh model)
        if #stacks[stackName].timers > 0 then
            table.remove(stacks[stackName].timers, 1)
        end
        stacks[stackName].count = math.max(stacks[stackName].count - 1, 0)
    else
        stacks[stackName].count = math.max(stacks[stackName].count - amount, 0)
        -- If manually removed, also clear timers for temporary stacks
        if stacks[stackName].count == 0 and stacks[stackName].timers then
            for _, timer in ipairs(stacks[stackName].timers) do
                stopEvent(timer)
            end
            stacks[stackName].timers = {}
        end
    end

    local count = getBuffStack(player, stackName)
    player:say(stackName .. ": " .. count)
end

-- Sets the stack count for a named buff for the player.
function setBuffStack(player, stackName, amount)
    local stacks = initBuffStacks(player)
    if stacks[stackName] and stacks[stackName].timers then
        -- Clear all timers if resetting
        for _, timer in ipairs(stacks[stackName].timers) do
            stopEvent(timer)
        end
        stacks[stackName].timers = {}
    end
    if not stacks[stackName] then
        stacks[stackName] = {count = 0, timers = {}}
    end
    stacks[stackName].count = math.max(amount or 0, 0)
end

-- Gets the current stack count for a named buff for the player.
function getBuffStack(player, stackName)
    local stacks = initBuffStacks(player)
    return stacks[stackName] and stacks[stackName].count or 0
end

-- Clears all stacks for a player.
function clearAllBuffStacks(player)
    local stacks = initBuffStacks(player)
    for _, stack in pairs(stacks) do
        if stack.timers then
            for _, timer in ipairs(stack.timers) do
                stopEvent(timer)
            end
        end
    end
    playerStacks[player:getId()] = {}
end

-- Clears a specific stack for a player.
function clearBuffStack(player, stackName)
    local stacks = initBuffStacks(player)
    if stacks[stackName] and stacks[stackName].timers then
        for _, timer in ipairs(stacks[stackName].timers) do
            stopEvent(timer)
        end
    end
    stacks[stackName] = nil
end

-- Optionally: Call this on player logout to prevent memory leaks
function onPlayerLogout_clearBuffStacks(player)
    clearAllBuffStacks(player)
    playerStacks[player:getId()] = nil
end
