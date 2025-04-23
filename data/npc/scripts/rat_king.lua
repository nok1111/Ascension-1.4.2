local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local CHEESE_TYPES = {
    [12357] = {name = "blue cheese", favor = 3},
    [12358] = {name = "moon cheese", favor = 10},
    [12359] = {name = "rat cheese", favor = 1}
}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink()
    if math.random(100) < 10 then
        selfSay({"*squeaks orders*", "The tunnels must expand!"})
    end
    npcHandler:onThink()
end

function greetCallback(cid)
    local player = Player(cid)
    local favor = player:getStorageValue(Storage.RatFavor)
    
    if favor >= 50 then
        doSendDialogNpc(cid, getNpcCid(),
            "*nods crown* My loyal subject. The warren welcomes you.",
            "Tunnel News&Special Mission&Cheese Tax&Leave")
    else
        doSendDialogNpc(cid, getNpcCid(),
            "*sniffs* Your cheese taxes are overdue, human.",
            "Pay Cheese&Tunnel News&Beg&Leave")
    end
    return true
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then return false end
    local player = Player(cid)

    if msgcontains(msg, "pay cheese") then
        doSendDialogNpc(cid, getNpcCid(),
            "Present your tribute! (Hand me cheese)", 
            "Blue Cheese&Moon Cheese&Rat Cheese&Nevermind")
    
    elseif msgcontains(msg, "blue cheese") or msgcontains(msg, "moon cheese") or msgcontains(msg, "rat cheese") then
        for id, cheese in pairs(CHEESE_TYPES) do
            if msgcontains(msg, cheese.name) and player:getItemCount(id) > 0 then
                player:removeItem(id, 1)
                local newFavor = player:getStorageValue(Storage.RatFavor) + cheese.favor
                player:setStorageValue(Storage.RatFavor, newFavor)
                
                doSendDialogNpc(cid, getNpcCid(),
                    "*devours greedily* "..cheese.name.."! Your favor is now "..newFavor..".\n"..
                    (newFavor >= 50 and "You may enter the royal tunnels now!" or "More... I need MORE!"),
                    "Tunnel News&Leave")
                break
            end
        end
    
    elseif msgcontains(msg, "tunnel news") then
        local rumors = {
            "The alchemists are poisoning the west drains... war is coming.",
            "Newborn rats with two tails seen near the flour mill!",
            "Our spies say the baker hides his best cheese under false floorboards."
        }
        doSendDialogNpc(cid, getNpcCid(), rumors[math.random(#rumors)], "Pay Cheese&Leave")
    
    elseif msgcontains(msg, "special mission") and player:getStorageValue(Storage.RatFavor) >= 50 then
        player:addItem(12360, 1) -- Rat King's Token
        doSendDialogNpc(cid, getNpcCid(),
            "*whispers* Take this token to the butcher's cellar...\n"..
            "My agents will give you the sewer maps. DON'T lose them.",
            "Tunnel News&Leave")
    
    elseif msgcontains(msg, "beg") then
        doSendDialogNpc(cid, getNpcCid(),
            "*laughs* The weak perish in the tunnels! Bring CHEESE!",
            "Pay Cheese&Leave")
    
    elseif msgcontains(msg:lower(), "leave") or msgcontains(msg:lower(), "close") then
        doSendDialogNpc(cid, getNpcCid(),
            "*waves paw* Remember - the walls have ears and the ears have teeth...",
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