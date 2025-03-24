local stoneAction = Action()

-- Unique action IDs for the 4 power stones
local STONE_ACTION_IDS = {
    [2022] = true,
    [2023] = true,
    [2024] = true,
    [2025] = true
}

local PROGRESS_STORAGE = Mainquest.stonestabilized
local QUEST_REQUIRED = 40091 -- Task must be started
local TOTAL_STONES_REQUIRED = 4

function stoneAction.onUse(player, item, fromPosition, target, toPosition)
    if not player or not player:isPlayer() then return true end

    if player:getStorageValue(QUEST_REQUIRED) ~= TASK_START then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You feel a faint hum, but you are unsure what to do.")
        return true
    end

    local actionId = item.actionid
    if not STONE_ACTION_IDS[actionId] then return true end

    local stoneUsedStorage = actionId
    if player:getStorageValue(stoneUsedStorage) == 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already stabilized this stone.")
        return true
    end

    -- Mark this stone as used
    player:setStorageValue(stoneUsedStorage, 1)

    -- Increment progress
    local currentProgress = player:getStorageValue(PROGRESS_STORAGE)
    if currentProgress < 0 then currentProgress = 0 end
    currentProgress = currentProgress + 1
    player:setStorageValue(PROGRESS_STORAGE, currentProgress)

    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You adjust the stone’s energy. It hums softly as it stabilizes.")
    toPosition:sendMagicEffect(CONST_ME_ENERGYAREA)

    -- Completion message
    if currentProgress >= TOTAL_STONES_REQUIRED then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "All four stones are stable. The machine's core stops pulsing.")
    end

    return true
end

-- Register all stone action IDs
for actionId in pairs(STONE_ACTION_IDS) do
    stoneAction:aid(actionId)
end

stoneAction:register()
