local camelLure = {
    itemId = 5902, -- Carrot
    actionId = false,
    followDuration = 9000, -- 3.5 seconds
    moveInterval = 800, -- Move every 800ms
    soundInterval = 1000, -- Sound every 1s
    sounds = {"Nom nom", "Yummy", "*chews*", "Delicious"},
    maxDistance = 5, -- Max follow distance
    rewardPositions = {
        Position(679, 1120, 7), -- Add your positions here
        Position(680, 1120, 7),
    },
    storageKey = 45001, -- Storage key for tracking
    rewardMessage = "You've successfully led the camel to its destination!"
}

local lure = Action()

local activeCamels = {} -- Track active camels and their events

local function moveCamelToPlayer(camel, player)

    if not camel:isMonster() or not player:isPlayer() then
        
        if activeCamels[camel:getId()] then
            
            activeCamels[camel:getId()] = nil
        end
        return
    end

    local camelPos = camel:getPosition()
    local playerPos = player:getPosition()
    
    -- Check if camel reached any reward position
    for _, rewardPos in ipairs(camelLure.rewardPositions) do
        if camelPos == rewardPos then
            -- Give storage reward
            player:setStorageValue(camelLure.storageKey, math.max(1, player:getStorageValue(camelLure.storageKey)) + 1)
            player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, camelLure.rewardMessage)
            
            -- Remove camel
            camel:remove()
            if activeCamels[camel:getId()] then
                activeCamels[camel:getId()] = nil
            end
            return
        end
    end
    
    -- Stop if player is too far
    if camelPos:getDistance(playerPos) > camelLure.maxDistance then
        if activeCamels[camel:getId()] then
            activeCamels[camel:getId()] = nil
        end
        return
    end

    -- Calculate path and move
    local path = camel:getPathTo(playerPos, 0, 1, true, true)

    if path and #path > 0 then
        print("#path > 0")
        local moveSuccess = camel:move(path[1])
        if not moveSuccess then
            -- Try alternative movement if primary path fails
            local directions = {NORTH, EAST, SOUTH, WEST}
            for _, dir in ipairs(directions) do
                local newPos = camelPos:getAdjacentPosition(dir)
                if Tile(newPos):getGround() and not Tile(newPos):hasFlag(TILESTATE_BLOCKPATH) then
                    camel:move(dir)

                    break
                end
            end
        end
    end

    -- Continue moving if still active
    if activeCamels[camel:getId()] then
        activeCamels[camel:getId()].moveEvent = addEvent(function()
            moveCamelToPlayer(camel, player)
        end, camelLure.moveInterval)
    end
end

function lure.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Check target is camel
    if not target or not target:isMonster() or target:getName():lower() ~= "camel" then
        player:sendCancelMessage("You can only use this on a camel.")
        return true
    end

    local camel = target
    
    -- Check distance
    if camel:getPosition():getDistance(player:getPosition()) > camelLure.maxDistance then
        player:sendCancelMessage("You need to be adjacent to the camel.")
        return true
    end

    -- Cancel any existing effect on this camel
    if activeCamels[camel:getId()] then
        stopEvent(activeCamels[camel:getId()].moveEvent)
        for _, soundEvent in ipairs(activeCamels[camel:getId()].soundEvents) do
            stopEvent(soundEvent)
        end
    end

    -- Initial sound
    camel:say(camelLure.sounds[math.random(#camelLure.sounds)], TALKTYPE_MONSTER_SAY)
    camel:attachEffectById(40, true)

    -- Start movement process
    activeCamels[camel:getId()] = {
        moveEvent = 0,
        soundEvents = {},
        player = player
    }
    moveCamelToPlayer(camel, player)

    -- Schedule sounds
    for i = 1, math.floor(camelLure.followDuration / camelLure.soundInterval) do
        activeCamels[camel:getId()].soundEvents[i] = addEvent(function()
            if camel:isMonster() and activeCamels[camel:getId()] and 
               camel:getPosition():getDistance(player:getPosition()) <= camelLure.maxDistance then
                camel:say(camelLure.sounds[math.random(#camelLure.sounds)], TALKTYPE_MONSTER_SAY)
            end
        end, i * camelLure.soundInterval)
    end

    -- Stop following after duration
    activeCamels[camel:getId()].stopEvent = addEvent(function()
        if activeCamels[camel:getId()] then
            stopEvent(activeCamels[camel:getId()].moveEvent)
            for _, soundEvent in ipairs(activeCamels[camel:getId()].soundEvents) do
                stopEvent(soundEvent)
            end
            activeCamels[camel:getId()] = nil
        end
    end, camelLure.followDuration)

    item:remove(1)
    return true
end

-- Register item
if camelLure.actionId and camelLure.actionId > 0 then
    lure:aid(camelLure.actionId)
end
lure:id(camelLure.itemId)
lure:allowFarUse(true)
lure:register()