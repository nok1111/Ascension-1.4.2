local spokenNames = {
    ["edwin"] = Mainquest.spokenedwin,
    ["seraphine"] = Mainquest.spokenseraphine,
    ["marek"] = Mainquest.spokenmarek
}

local talkaction = TalkAction("")

function talkaction.onSay(player, words, param, type)
    if player:getStorageValue(40077) ~= TASK_START then
        return false
    end

    local name = words:lower():gsub("!", ""):gsub(" ", "")
    local storage = spokenNames[name]

    if storage and player:getStorageValue(storage) ~= TASK_COMPLETED then
        player:setStorageValue(storage, TASK_COMPLETED)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The air trembles as you honor the name: " .. name:sub(1,1):upper() .. name:sub(2))
        player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
    end

    if player:getStorageValue(Mainquest.spokenedwin) == TASK_COMPLETED and
       player:getStorageValue(Mainquest.spokenseraphine) == TASK_COMPLETED and
       player:getStorageValue(Mainquest.spokenmarek) == TASK_COMPLETED and
       player:getStorageValue(Mainquest.spokenames) ~= TASK_COMPLETED then

        player:setStorageValue(Mainquest.spokenames, TASK_COMPLETED)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The final name echoes into the void... and peace returns.")
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
    end
    return false
end

talkaction:register()
