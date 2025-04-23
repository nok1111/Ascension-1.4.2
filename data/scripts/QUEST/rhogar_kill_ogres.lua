-- data/scripts/ogre_kill_tracker.lua
local ogreTypes = {
    ["Ogre"] = true,
    ["Ogre Warrior"] = true,
    ["Ogre Brawler"] = true,
    ["Ogre Smasher"] = true,
    ["Ogre Shaman"] = true
}

local killEvent = CreatureEvent("OgreKillTracker")

function killEvent.onKill(player, target)
    -- Verify both player and target exist
    if not player or not target then
        return true
    end
    
    -- Check if killed creature is a valid ogre type
    if ogreTypes[target:getName()] then
        -- Set storage and notify player
        player:setStorageValue(Mainquest.KilledOgre, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have defeated an "..target:getName()..". Rhogar will respect this kill.")
    end
    return true
end

killEvent:register()

-- Register the event on player login
local loginEvent = CreatureEvent("OgreKillLogin")
function loginEvent.onLogin(player)
    player:registerEvent("OgreKillTracker")
    return true
end

loginEvent:register()