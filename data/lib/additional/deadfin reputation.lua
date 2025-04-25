-- DeadfinRepLib.lua
-- Library to manage Deadfin Port reputation system

DeadfinRepLib = {}

-- Storage values
DeadfinRepLib.ReputationStorage = Mainquest.reputationDeadfin
DeadfinRepLib.FriendlyUnlockStorage = Mainquest.reachedFriendlyDeadfin

-- Reputation thresholds
DeadfinRepLib.Tiers = {
    HATED = -1,
    STRANGER = 0,
    KNOWN_FACE = 10,
    FRIENDLY = 30,
}

-- Add or remove reputation
function DeadfinRepLib.addReputation(player, amount)
    if not player or not player:isPlayer() then return end

    local currentRep = player:getStorageValue(DeadfinRepLib.ReputationStorage)
    if currentRep < 0 then currentRep = 0 end

    local newRep = currentRep + amount
    player:setStorageValue(DeadfinRepLib.ReputationStorage, newRep)

    -- Check if player becomes Friendly for the first time
    if newRep >= DeadfinRepLib.Tiers.FRIENDLY and player:getStorageValue(DeadfinRepLib.FriendlyUnlockStorage) ~= 1 then
        player:setStorageValue(DeadfinRepLib.FriendlyUnlockStorage, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are now a friend of Deadfin Port!")
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    end
end

-- Get current reputation
function DeadfinRepLib.getReputation(player)
    if not player or not player:isPlayer() then return 0 end

    local rep = player:getStorageValue(DeadfinRepLib.ReputationStorage)
    return rep >= 0 and rep or 0
end

-- Get reputation title
function DeadfinRepLib.getTitle(player)
    local rep = DeadfinRepLib.getReputation(player)

    if rep >= DeadfinRepLib.Tiers.FRIENDLY then
        return "Friend of Deadfin"
    elseif rep >= DeadfinRepLib.Tiers.KNOWN_FACE then
        return "Known Face"
    elseif rep >= DeadfinRepLib.Tiers.STRANGER then
        return "Stranger"
    else
        return "Hated"
    end
end

-- Check if player is Friendly
function DeadfinRepLib.isFriendly(player)
    return DeadfinRepLib.getReputation(player) >= DeadfinRepLib.Tiers.FRIENDLY
end

-- Greet based on reputation (optional for NPCs)
function DeadfinRepLib.getGreeting(player)
    local title = DeadfinRepLib.getTitle(player)
    if title == "Friend of Deadfin" then
        return "Ahoy, trusted friend! What brings you to Deadfin Port today?"
    elseif title == "Known Face" then
        return "Eh, I've seen ye around. Watch yerself still."
    elseif title == "Stranger" then
        return "Never seen ya 'round here. Keep yer hands to yerself."
    else -- Hated
        return "Ye smell like trouble. Best shove off, landlubber!"
    end
end

return DeadfinRepLib
