local sheepHerding = {
    -- Configurable settings
    monsterNames = {"Sheep", "Wooly Sheep", "Black Sheep"}, -- Names of sheep monsters (case-sensitive!)
    penCenter = Position(824, 1042, 7), -- Center of the pen
    penRadius = 5, -- Sheep must be within this distance to count
    storageKey = Mainquest.SheepHerding, -- Define in `constants.lua` (or use a number, e.g., 12345)
    sheepNeeded = 4, -- Sheep required to complete
    reward = {
        achievement = "Sheep Whisperer",
        itemId = 12345, -- Rainbow wool dye
        itemCount = 1,
        message = "You mastered the art of sheep herding!"
    }
}

-- Register the move event
local moveEvent = MoveEvent()

function moveEvent.onMoveCreature(creature, fromPosition, toPosition)
    -- Check if the moved creature is a valid sheep monster
    if not creature:isMonster() or not table.contains(sheepHerding.monsterNames, creature:getName()) then
        return true
    end

    -- Check if sheep is inside the pen area
    if toPosition:getDistance(sheepHerding.penCenter) <= sheepHerding.penRadius then
        local player = creature:getMaster() -- Player pushing the sheep
        if not player or not player:isPlayer() then
            return true
        end

        -- Initialize or increment storage
        local herdedSheep = math.max(0, player:getStorageValue(sheepHerding.storageKey))
        player:setStorageValue(sheepHerding.storageKey, herdedSheep + 1)
        player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Sheep herded! (%d/%d)", herdedSheep + 1, sheepHerding.sheepNeeded))

        -- Check for quest completion
        if herdedSheep + 1 >= sheepHerding.sheepNeeded then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, sheepHerding.reward.message)
            
            -- Give rewards
            if sheepHerding.reward.achievement then
                player:addAchievement(sheepHerding.reward.achievement)
            end
            if sheepHerding.reward.itemId then
                player:addItem(sheepHerding.reward.itemId, sheepHerding.reward.itemCount or 1)
            end
        end
    end
    return true
end

moveEvent:type("move")
moveEvent:register()

-- Auto-register storage on login (optional)
local loginEvent = CreatureEvent("SheepHerdingLogin")

function loginEvent.onLogin(player)
    player:registerEvent("sheepHerdingMove")
    if player:getStorageValue(sheepHerding.storageKey) == -1 then
        player:setStorageValue(sheepHerding.storageKey, 0)
    end
    return true
end

loginEvent:type("login")
loginEvent:register()