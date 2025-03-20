local fogTrigger = MoveEvent()

local function sendWhispers(playerId, step)
    local player = Player(playerId)
    if not player then
        return
    end

    local position = player:getPosition()

    local whispers = {
        "A faint whisper echoes in your mind...",
        "...We are still here... trapped...",
        "...Find our names... free us..."
    }

    if step <= #whispers then
        player:say(whispers[step], TALKTYPE_MONSTER_SAY, false, player, position)
        addEvent(sendWhispers, 4000, playerId, step + 1) -- Delayed whisper effect

        -- On last whisper, update quest storage
        if step == #whispers then
            addEvent(function()
                local playerCheck = Player(playerId)
                if playerCheck then
                    playerCheck:setStorageValue(Mainquest.eldenshadow, 1)
                    playerCheck:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You feel a cold presence. Something wants you to remember.")
                end
            end, 5000)
        end
    end
end

function fogTrigger.onStepIn(player, item, position, fromPosition)
    if not player or not player:isPlayer() then
        return false
    end

    -- Ensure player hasn't completed this already
    if player:getStorageValue(40063) >= TASK_COMPLETED then
        return true
    end

    -- Play whisper effect
    position:sendMagicEffect(CONST_ME_MORTAREA)

    -- Start the whisper sequence using the external function
    addEvent(sendWhispers, 3000, player:getId(), 1)

    return true
end

fogTrigger:aid(3000)
fogTrigger:register()
