local gravestoneAction = Action()

local gravestoneData = {
    [2016] = { storageId = Mainquest.nameedwin, name = "Edwin the Watchful", requiredQuest = 40069 },
    [2017] = { storageId = Mainquest.nameseraphine, name = "Seraphine the Silent", requiredQuest = 40071 },
    [2018] = { storageId = Mainquest.namemarek, name = "Marek the Cursed", requiredQuest = 40073 }
}

local fakeMessages = {
    "The stone feels unnaturally cold to the touch...",
    "You hear a faint whisper... but it vanishes before you understand it.",
    "Dust and decay cling to the surface. There's no name here.",
    "A shadow flickers behind you... or was it just the wind?"
}

function discoverName(playerId, gravestone)
    local player = Player(playerId)
    if not player then
        return false
    end

    -- Ensure player has started the fog quest
    if player:getStorageValue(gravestone.requiredQuest) ~= 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not ready to understand this name yet.")
        return true
    end

    -- Check if the player has already found this name
    if player:getStorageValue(gravestone.storageId) ~= 1 then
        player:setStorageValue(gravestone.storageId, 1)
        player:say(gravestone.name .. "... the name lingers in your mind.", TALKTYPE_MONSTER_SAY)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have uncovered a lost name: " .. gravestone.name)
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already recorded this name.")
    end

    return true
end

function gravestoneAction.onUse(player, item, fromPosition, target, toPosition)
    if not player or not player:isPlayer() then
        return false
    end

    local gravestone = gravestoneData[item.actionid]
    if gravestone then
        addEvent(discoverName, 500, player:getId(), gravestone)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, fakeMessages[math.random(#fakeMessages)])
        fromPosition:sendMagicEffect(CONST_ME_MORTAREA)
    end

    return true
end

for actionId, _ in pairs(gravestoneData) do
    gravestoneAction:aid(actionId)
end
gravestoneAction:register()
