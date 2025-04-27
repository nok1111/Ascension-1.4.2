local action = Action()

-- Configuration
local CLEANUP_STORAGE = 2115
local CLEANUP_GOAL = 10
local TRASH_RESPAWN_TIME = 10 * 60 * 1000 -- 10 minutes
local STORAGE_RESET_TIME = 2 * 60 * 60 * 1000 -- 2 hours (in milliseconds)

function respawnTrash(originalItemId, position)
    local tile = Tile(position)
    if tile and not tile:getItemById(originalItemId) then
        Game.createItem(originalItemId, 1, position)
    end
end

function resetPlayerTrashStorage(playerId)
    local player = Player(playerId)
    if player then
        player:setStorageValue(CLEANUP_STORAGE, 0)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The docks of deadfin port have gotten dirty again. You can help clean up once more!")
    else
        -- Player offline, reset via SQL
        local playerData = db.query("UPDATE `player_storage` SET `value` = 0 WHERE `player_id` = " .. playerId .. " AND `key` = " .. CLEANUP_STORAGE .. ";")
    end
end


function action.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end

    -- Only proceed if trash has correct actionid
    if item.actionid ~= CLEANUP_STORAGE then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "Nothing interesting happens.")
        return true
    end

    -- Initialize storage if missing
    if player:getStorageValue(CLEANUP_STORAGE) < 0 then
        player:setStorageValue(CLEANUP_STORAGE, 0)
    end

    if player:getStorageValue(CLEANUP_STORAGE) >= CLEANUP_GOAL then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "You've already cleaned enough trash for now. Talk to Old Salty Jenn!")
        return true
    end

    -- Save original itemId before removing
    local originalItemId = item:getId()

    -- Remove the trash
    item:remove()

    -- Add progress
    local cleaned = player:getStorageValue(CLEANUP_STORAGE)
    player:setStorageValue(CLEANUP_STORAGE, cleaned + 1)

    player:sendTextMessage(MESSAGE_STATUS_SMALL, "You clean up the trash. (" .. (cleaned + 1) .. "/" .. CLEANUP_GOAL .. ")")
    fromPosition:sendMagicEffect(CONST_ME_POFF)

    -- Respawn trash after X minutes
    addEvent(respawnTrash, TRASH_RESPAWN_TIME, originalItemId, fromPosition)

    -- If finished cleaning, set a reset timer
    if (cleaned + 1) >= CLEANUP_GOAL then
        addEvent(resetPlayerTrashStorage, STORAGE_RESET_TIME, player:getId())
    end

    return true
end

action:aid(CLEANUP_STORAGE)
action:register()
