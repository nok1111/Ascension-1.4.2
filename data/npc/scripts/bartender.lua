local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- Whiskey types the bartender might comment on
local WHISKEY_TYPES = {
    "Blackwater Reserve",
    "Dragon's Breath",
    "Elven Moondew",
    "Dwarven Firebelly",
    "Phantom's Sigh"
}

-- Drinks for sale (itemId, price, description)
local DRINK_MENU = {
    {itemId = 2012, price = 10, name = "simple health potion", desc = "For when life gives you... well, you know."},
    {itemId = 2016, price = 5, name = "ale", desc = "The solution to - and cause of - most problems."},
    {itemId = 2006, price = 15, name = "mana potion", desc = "For when your magic runs dry... like conversations at last call."},
    {itemId = 2008, price = 50, name = "strong health potion", desc = "What doesn't kill you... this might fix."}
}

function onThink() 
    -- Occasionally mutters to himself when idle
    if math.random(100) < 5 then
        local musings = {
            "So many stories... so little truth...",
            "The glass never lies... only the lips do...",
            "Another night, another mask...",
            "I've served kings and beggars... both left the same way..."
        }
        selfSay(musings[math.random(#musings)])
    end
    npcHandler:onThink() 
end

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

function greetCallback(cid)
    local player = Player(cid)
    local hour = os.date("%H")
    local greeting = (tonumber(hour) < 18) and "Morning" or "Evening"
    
    doSendDialogNpc(cid, getNpcCid(), 
        "*polishes glass* "..greeting.." traveler. The spirits whisper you carry "..(player:getLevel() < 30 and "light" or "heavy").." burdens...", 
        "Whiskey&Stories&Trade&Silence")
    return true             
end

local function sellDrink(cid, drink)
    local player = Player(cid)
    if not player then return false end
    
    if player:getMoney() >= drink.price then
        player:removeMoney(drink.price)
        player:addItem(drink.itemId, 1)
        doSendDialogNpc(cid, getNpcCid(),
            "*slides a "..drink.name.." across the bar* \n"..drink.desc..
            "\nThat'll be "..drink.price.." gold. Remember - liquids go down easier than regrets.",
            "Whiskey&Stories&Trade&Leave")
        return true
    else
        doSendDialogNpc(cid, getNpcCid(),
            "*raises eyebrow* The only thing free here is advice: \n"..
            "Gold weighs less than thirst. Come back with "..drink.price.." coins.",
            "Trade&Leave")
        return false
    end
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then return false end
    local player = Player(cid)

    if msgcontains(msg:lower(), "whiskey") then
        local chosenWhiskey = WHISKEY_TYPES[math.random(#WHISKEY_TYPES)]
        doSendDialogNpc(cid, getNpcCid(), 
            "*pushes forward a glass of "..chosenWhiskey.."* \nThis one... it's seen more battles than most soldiers. "..
            "Distilled in the year the old king fell. Drink slow... the past always catches up.", 
            "Stories&Pay&Trade&Leave")
        
    elseif msgcontains(msg:lower(), "stories") then
        local stories = {
            "I once served a man who claimed to be immortal... he died the next morning.",
            "The scars behind the bar? Dragon raid of '73. The ones out front? Tax collectors.",
            "They say this stool was Gandalf's favorite. Who's Gandalf? Exactly.",
            "A paladin and a necromancer walked in together once... only one walked out. I'll never say which."
        }
        doSendDialogNpc(cid, getNpcCid(), 
            "*sighs* You want stories? "..stories[math.random(#stories)].." \nThe truth? That stays with the spirits.", 
            "Whiskey&Secrets&Trade&Leave")
        
    elseif msgcontains(msg:lower(), "secrets") then
        doSendDialogNpc(cid, getNpcCid(), 
            "*leans in close* The real secret? There are no secrets. \nJust truths nobody's brave enough to speak. "..
            "Now... that'll be 50 gold for the philosophy.", 
            "Pay&Trade&Leave")
        
    elseif msgcontains(msg:lower(), "pay") then
        if player:removeMoney(50) then
            doSendDialogNpc(cid, getNpcCid(), 
                "*nods* Money talks... but it never says anything interesting.", 
                "Whiskey&Stories&Trade&Leave")
        else
            doSendDialogNpc(cid, getNpcCid(), 
                "*chuckles* The one universal truth - empty pockets make for short conversations.", 
                "Trade&Leave")
        end

    elseif msgcontains(msg:lower(), "close") then
        npcHandler:addModule(FocusModule:new())
        doSendDialogNpcClose(cid)
        npcHandler:unGreet(cid)
        
    elseif msgcontains(msg:lower(), "trade") then
        local message = ""
    doSendDialogNpcClose(cid)
    npcHandler:unGreet(cid) 
   
    elseif msgcontains(msg:lower(), "simple health potion") then
        sellDrink(cid, DRINK_MENU[1])
    elseif msgcontains(msg:lower(), "ale") then
        sellDrink(cid, DRINK_MENU[2])
    elseif msgcontains(msg:lower(), "mana potion") then
        sellDrink(cid, DRINK_MENU[3])
    elseif msgcontains(msg:lower(), "strong health potion") then
        sellDrink(cid, DRINK_MENU[4])
        
    elseif msgcontains(msg:lower(), "silence") or msgcontains(msg:lower(), "leave") or msgcontains(msg:lower(), "nevermind") then
        doSendDialogNpc(cid, getNpcCid(), 
            "*nods* Sometimes the wisest choice is saying nothing at all...", 
            "close")
    end

    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())