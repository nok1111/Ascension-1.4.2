local MONSTER_DESPAWN_TIME = 10 * 60 * 1000 -- 10 minutes
local CLEANSING_TIME = 15 * 1000 -- 15 seconds
local EVENT_RADIUS = 5 -- Players within this range will receive credit

local BRAZIER_DATA = {
    [2019] = {storage = Mainquest.brazierone, position = Position(788, 861, 8)}, -- Brazier 1
    [2020] = {storage = Mainquest.braziertwo, position = Position(789, 860, 8)}, -- Brazier 2
    [2021] = {storage = Mainquest.brazierthree, position = Position(790, 861, 8)}  -- Brazier 3
}

-- Global wall data (same for all braziers)
local WALL_POSITIONS = {
    Position(783, 864, 8),
    Position(783, 865, 8),
    Position(794, 856, 8),
    Position(794, 857, 8)
}
local WALL_ITEM_ID = 1497

-- Track active braziers to prevent spam activation
local activeBraziers = {}

local function randomEffectAround(position)
    for _ = 1, 5 do
        local effectPos = Position(
            position.x + math.random(-1, 1),
            position.y + math.random(-1, 1),
            position.z
        )
        effectPos:sendMagicEffect(math.random(CONST_ME_FIREAREA, CONST_ME_PURPLEENERGY))
    end
end

local function createWalls()
    for _, pos in ipairs(WALL_POSITIONS) do
        Game.createItem(WALL_ITEM_ID, 1, pos)
    end
end

local function removeWalls()
    for _, pos in ipairs(WALL_POSITIONS) do
        local tile = Tile(pos)
        if tile then
            local item = tile:getItemById(WALL_ITEM_ID)
            if item then
                item:remove()
            end
        end
    end
end

local function removeMonster(monsterId)
    local monster = Monster(monsterId)
    if monster then
        monster:say("The spirit fades into the void...", TALKTYPE_MONSTER_YELL)
        monster:getPosition():sendMagicEffect(CONST_ME_POFF)
        monster:remove()
    end
end

local function spawnWraiths(position)
    for i = 1, 10 do
        addEvent(function()
            local spawnPos = Position(
                position.x + math.random(-2, 2),
                position.y + math.random(-2, 2),
                position.z
            )
            local wraith = Game.createMonster("Wraith", spawnPos)

            if wraith then
                addEvent(removeMonster, MONSTER_DESPAWN_TIME, wraith:getId()) -- Despawn after 10 minutes
            end
        end, i * 500) -- 500ms delay between each spawn
    end
end

local function activateBrazier(playerId, actionId)
    local player = Player(playerId)
    if not player then return end

    local brazier = BRAZIER_DATA[actionId]
    if not brazier then return end

    -- Check if the player already cleansed this brazier
    if player:getStorageValue(brazier.storage) == TASK_COMPLETED then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already cleansed this brazier. Seek out the others.")
        return
    end

    -- Ensure the player has the quest started (40075)
    if player:getStorageValue(40075) ~= TASK_START then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have no reason to interact with this brazier.")
        return
    end

    -- Check if another player is currently cleansing it
    if activeBraziers[actionId] then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "This brazier is already being cleansed! Wait for the ritual to finish.")
        return
    end

    activeBraziers[actionId] = true
    createWalls() -- Block exits

    -- Find all nearby players who are on the quest
    local nearbyPlayers = {}
    local spectators = Game.getSpectators(brazier.position, false, true, EVENT_RADIUS, EVENT_RADIUS, EVENT_RADIUS, EVENT_RADIUS)
    for _, creature in ipairs(spectators) do
        if creature:isPlayer() and creature:getStorageValue(40075) == TASK_START then
            table.insert(nearbyPlayers, creature)
        end
    end

    if #nearbyPlayers == 0 then
        activeBraziers[actionId] = nil
        removeWalls() -- Remove walls if nobody is present
        return
    end

    -- Notify players that the cleansing has started
    for _, p in ipairs(nearbyPlayers) do
        p:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You begin cleansing the brazier... Survive the spirits!")
    end

    -- Random effect around brazier while cleansing
    for i = 1, 3 do
        addEvent(randomEffectAround, i * 2000, brazier.position)
    end

    -- Spawn Wraiths around the brazier
    spawnWraiths(brazier.position)

    -- Delayed event for completing the cleansing
    addEvent(function()
        for _, p in ipairs(nearbyPlayers) do
            if p and p:getStorageValue(brazier.storage) ~= TASK_COMPLETED then
                p:setStorageValue(brazier.storage, TASK_COMPLETED)
                p:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have successfully cleansed the brazier.")
                brazier.position:sendMagicEffect(CONST_ME_HOLYAREA)
            end
        end

        -- Check if all braziers are completed for at least one player
        local allBraziersCleansed = true
        for _, p in ipairs(nearbyPlayers) do
            if p:getStorageValue(Mainquest.brazierone) ~= TASK_COMPLETED or
               p:getStorageValue(Mainquest.braziertwo) ~= TASK_COMPLETED or
               p:getStorageValue(Mainquest.brazierthree) ~= TASK_COMPLETED then
                allBraziersCleansed = false
                break
            end
        end

        -- If all braziers are cleansed, grant ritual completion
        if allBraziersCleansed then
            for _, p in ipairs(nearbyPlayers) do
                p:setStorageValue(Mainquest.bindingritual, TASK_COMPLETED)
                p:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The ritual is complete. The spirits are bound.")
            end
        end

        activeBraziers[actionId] = nil
        removeWalls() -- Remove the walls after cleansing is completed
    end, CLEANSING_TIME)
end


local brazierActions = Action()

function brazierActions.onUse(player, item, fromPosition, target, toPosition)
    if not player then return true end

    local actionId = item.actionid
    if BRAZIER_DATA[actionId] then
        activateBrazier(player:getId(), actionId)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Nothing happens.")
    end

    return true
end


for actionId, _ in pairs(BRAZIER_DATA) do
    brazierActions:aid(actionId)
end

brazierActions:register()
