local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local SONGS = {
    {name="Ballad of the Drowned King", hint="Find the coral throne"},
    {name="Lament of the Last Shepherd", hint="Beware the woolless ones"},
    {name="The Mad Duke's Waltz", hint="Never dance clockwise in the ruins"}
}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink()
    if math.random(100) < 15 then
        selfSay({"*tunes cracked lute*", "*humming in broken chords*"})
    end
    npcHandler:onThink()
end

function greetCallback(cid)
    local player = Player(cid)
    local hasInstrument = player:getItemCount(12365) > 0 -- Lyre item
    
    doSendDialogNpc(cid, getNpcCid(),
        "*ghostly voice* You interrupt the eternal concert... "..
        (hasInstrument and "Ah! You carry music!" or "No instrument? How crude."),
        "Request Song&Teach Melody&Dark Request&Leave")
    return true
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then return false end
    local player = Player(cid)

    if msgcontains(msg, "request song") then
        local song = SONGS[math.random(#SONGS)]
        doSendDialogNpc(cid, getNpcCid(),
            "*plays discordant notes* This is '"..song.name.."'... "..
            "The hidden meaning? "..song.hint,
            "Teach Melody&Dark Request&Leave")

    elseif msgcontains(msg, "teach melody") then
        if player:getItemCount(12365) > 0 then -- Lyre
            player:addItem(12366, 1) -- Sheet music
            doSendDialogNpc(cid, getNpcCid(),
                "*presses icy fingers to your forehead* There... now you hear "..
                "the true music. Play this near the standing stones.",
                "Request Song&Leave")
        else
            doSendDialogNpc(cid, getNpcCid(),
                "*laughs bitterly* You're deaf to the harmonies! Get a lyre first!",
                "Request Song&Leave")
        end

    elseif msgcontains(msg, "dark request") then
        if player:getStorageValue(Storage.SoulFragment) > 0 then
            player:addItem(12367, 1) -- Black Harp
            doSendDialogNpc(cid, getNpcCid(),
                "*voice drops to a whisper* The forbidden song... "..
                "Play it only when ready to meet those who sleep beneath.",
                "close")
            npcHandler:unGreet(cid)
        else
            doSendDialogNpc(cid, getNpcCid(),
                "*covers ears* NO! Not until you've collected a soul fragment!",
                "Request Song&Leave")
        end

    elseif msgcontains(msg:lower(), "leave") or msgcontains(msg:lower(), "close") then
        doSendDialogNpc(cid, getNpcCid(),
            "*fades into mist* The music never ends...",
            "close")
        npcHandler:addModule(FocusModule:new())
        doSendDialogNpcClose(cid)
        npcHandler:unGreet(cid)
    end
    return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())