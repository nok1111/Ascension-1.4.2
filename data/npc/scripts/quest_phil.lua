local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- Constants
local STORAGE_QUEST = Mainquest.philstandup -- Storage ID for this quest
local JOKES_NEEDED = 5      -- Number of successful laughs required
local LAUGH_TIMEOUT = 12     -- Seconds to respond before failure

-- Joke database (with increasingly bad jokes)
local JOKES = {
    "Why was the scarecrow promoted? \nBecause he was outstanding in his field!",
    "What do you call a scarecrow with a PhD? \nDoctor Crow!",
    "Why don't scarecrows get lonely? \nThey're outstanding in their field! ...Wait did I already use that one?",
    "What's a scarecrow's favorite music? \nSTRAW-berry fields forever!",
    "Why did the scarecrow win an award? \nBecause he was... (sigh) never mind.",
    "How do scarecrows flirt? \nThey say 'Hey babe, want to straw-ggle?'",
    "Why did the scarecrow break up with the pumpkin? \nIt was a patchy relationship!",
    "What's a scarecrow's least favorite month? \nSep-timber! ...Get it? Like straw?",
    "Why can't scarecrows use computers? \nThey get stuck in the inter-net!",
    "What's a scarecrow's favorite drink? \nSTRAW-berry daiquiri! Okay I'll stop now..."
}

-- Track player progress during performances
local performingPlayers = {}

-- Basic NPC handlers
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 
    npcHandler:onThink()
    
    -- Check for players who didn't laugh in time
    local currentTime = os.time()
    for cid, data in pairs(performingPlayers) do
        if currentTime - data.lastJokeTime > LAUGH_TIMEOUT then
            local player = Player(cid)
            if player then
                player:say("...", TALKTYPE_MONSTER_SAY)
                selfSay("(The silence is deafening... Phil looks crestfallen.)", cid)
                performingPlayers[cid] = nil
                npcHandler:resetNpc(cid)
            end
        end
    end
end

-- Main greeting
function greetCallback(cid)
    local player = Player(cid)
    if not player then return false end


    
    if player:getStorageValue(STORAGE_QUEST) >= JOKES_NEEDED then
        doSendDialogNpc(cid, getNpcCid(), 
            "Thanks for being my audience! I've decided to quit comedy and become a... motivational speaker?",
            "close")
    else
        doSendDialogNpc(cid, getNpcCid(), 
            "Hey " .. player:getName() .. "! I'm trying out a new career as a stand-up scarecrow. Want to be my test audience?",
            "yes&no")
    end
    return true
end

-- Handle player responses
function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then return false end
    
    local player = Player(cid)
    if not player then return false end

    
    -- Start comedy routine
    if msgcontains(msg, "yes") then
        performingPlayers[cid] = {
            jokesHeard = 0,
            lastJokeTime = os.time()
        }
        tellNextJoke(cid)
        doSendDialogNpcClose(cid)
        return true
        
    elseif msgcontains(msg, "no") then
        selfSay("Wow. Even my own mother would've said yes... to get rid of me.", cid)
        npcHandler:unGreet(cid)
        doSendDialogNpcClose(cid)
        return true
        
    -- Handle laughs during performance
    elseif performingPlayers[cid] and (msgcontains(msg, "haha") or msgcontains(msg, "lol") or msgcontains(msg, "laugh")) then
        local data = performingPlayers[cid]
        data.jokesHeard = data.jokesHeard + 1
        
        if data.jokesHeard >= JOKES_NEEDED then
            player:setStorageValue(STORAGE_QUEST, JOKES_NEEDED)
            selfSay("I DID IT! I'M HILARIOUS! Take this as payment... though my career is clearly priceless.", cid)
            player:addItem(ITEM_SCARECROW_MIC, 1) -- Reward: cooking recepie or pet
            performingPlayers[cid] = nil
        else
            selfSay("(Phil beams with false confidence)", cid)
            addEvent(tellNextJoke, 4000, cid) -- Pause before next joke
        end
        return true
        
    elseif msgcontains(msg, "close") then
        if performingPlayers[cid] then
            selfSay("Walking out mid-show? That's cold... even for a human.", cid)
            performingPlayers[cid] = nil
        end
        npcHandler:unGreet(cid)
        doSendDialogNpcClose(cid)
        return true
    end
    
    return false
end

-- Joke delivery system
function tellNextJoke(cid)
    local player = Player(cid)
    if not player or not performingPlayers[cid] then return end
    
    local data = performingPlayers[cid]
    data.lastJokeTime = os.time()
    
    -- Get a random joke (that hasn't been told yet)
    local availableJokes = {}
    for i, joke in ipairs(JOKES) do
        if not data.toldJokes or not data.toldJokes[i] then
            table.insert(availableJokes, {index = i, text = joke})
        end
    end
    
    if #availableJokes == 0 then
        -- All jokes told but not enough laughs
        selfSay("(Phil looks at his notes) I... I got nothing left.", cid)
        performingPlayers[cid] = nil
        return
    end
    
    local selected = availableJokes[math.random(#availableJokes)]
    selfSay(selected.text, cid)
    
    -- Mark joke as told
    data.toldJokes = data.toldJokes or {}
    data.toldJokes[selected.index] = true
    
    -- Start timeout timer
    performingPlayers[cid].lastJokeTime = os.time()
end

-- Configure NPC
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())