local spokenNames = {
    ["edwin"] = {storage = Mainquest.spokenedwin, message = "The air trembles as you honor the name: Edwin."},
    ["seraphine"] = {storage = Mainquest.spokenseraphine, message = "A soft whisper answers as you speak: Seraphine."},
    ["marek"] = {storage = Mainquest.spokenmarek, message = "A heavy silence falls after you utter: Marek."}
}

local talkaction = TalkAction("edwin", "seraphine", "marek")

local function finalNameEvent(cid)
    local player = Player(cid)
    if not player then return end

    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The final name echoes into the void... and peace returns.")
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
end

function talkaction.onSay(player, words, param, type)
    if player:getStorageValue(40077) ~= TASK_START then
        return false
    end

    local name = words:lower():gsub("!", ""):gsub(" ", "")
    local entry = spokenNames[name]
    if not entry then
        return false
    end

    if player:getStorageValue(entry.storage) ~= 1 then
        player:setStorageValue(entry.storage, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, entry.message)
        player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)

        local spokenCount = player:getStorageValue(Mainquest.spokenames)
        if spokenCount < 0 then
            spokenCount = 0
        end
        spokenCount = spokenCount + 1
        player:setStorageValue(Mainquest.spokenames, spokenCount)

        if spokenCount == 3 then
            addEvent(finalNameEvent, 2000, player:getId())
        end
    else
        player:sendTextMessage(MESSAGE_EVENT_DEFAULT, "You have already spoken that name.")
    end

    return false
end

talkaction:register()
