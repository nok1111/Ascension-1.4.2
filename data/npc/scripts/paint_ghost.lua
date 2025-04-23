local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local COLORS = {"vermilion", "ultramarine", "gamboge", "viridian", "mauve"}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink()
    if math.random(100) < 20 then
        selfSay({"*mixes spectral paints*", "The composition... it's all wrong!"})
    end
    npcHandler:onThink()
end

function greetCallback(cid)
    local player = Player(cid)
    local hasPaint = player:getItemCount(12355) > 0 -- Paintbrush item
    
    if hasPaint then
        doSendDialogNpc(cid, getNpcCid(),
            "*eyes glow* You've brought my brushes! Help me finish the masterpiece!",
            "Paint&Critique&Ghost Story&Leave")
    else
        doSendDialogNpc(cid, getNpcCid(),
            "*gestures frantically* I NEED my vermilion! The sunset looks like mud without it!",
            "Missing Colors&Ghost Story&Leave")
    end
    return true
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then return false end
    local player = Player(cid)

    if msgcontains(msg, "paint") then
        player:removeItem(12355, 1) -- Consumes paintbrush
        player:addItem(12356, 1) -- Gives "Haunted Portrait"
        doSendDialogNpc(cid, getNpcCid(),
            "*brush flies through air* There! Now the duke's portrait is perfect...\n"..
            "Take this copy. The eyes will follow you... always.",
            "Critique&Ghost Story&Leave")
    
    elseif msgcontains(msg, "critique") then
        local artTips = {
            "Never use more than three pigments in a sky!",
            "The dead make the best models... they never fidget.",
            "That tavern sign? I painted it while alive. My greatest shame."
        }
        doSendDialogNpc(cid, getNpcCid(), artTips[math.random(#artTips)], "Paint&Ghost Story&Leave")
    
    elseif msgcontains(msg, "missing colors") then
        local neededColor = COLORS[math.random(#COLORS)]
        doSendDialogNpc(cid, getNpcCid(),
            "I need "..neededColor.."! Last tube was stolen by those bandits near the mill.\n"..
            "Bring me a paintbrush and I'll reward you... somehow.",
            "Ghost Story&Leave")
    
    elseif msgcontains(msg, "ghost story") then
        doSendDialogNpc(cid, getNpcCid(),
            "*voice echoes* I died completing the bishop's fresco...\n"..
            "Fell from the scaffolding when I realized I'd forgotten to sign it!",
            "Paint&Critique&Leave")
    
    elseif msgcontains(msg:lower(), "leave") or msgcontains(msg:lower(), "close") then
        doSendDialogNpc(cid, getNpcCid(),
            "*fades into canvas* Come back when you appreciate REAL art...",
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