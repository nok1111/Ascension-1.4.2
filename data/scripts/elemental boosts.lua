local elementalBoosts = {}

local SpellElementalMapping = {
    -- Spells that add boosters
    ["xxxx"]    = { type = "fire", action = "add", amount = 1 },
    ["xxxx"]    = { type = "ice",  action = "add", amount = 1 },
    ["xxxx"]   = { type = "life", action = "add", amount = 1 },
    
    -- Spells that consume boosters
    ["xxxx"]    = { type = "fire", action = "consume", amount = 1 },
    ["xxxx"]    = { type = "ice",  action = "consume", amount = 1 },
    ["life beam"]    = { type = "life", action = "consume", amount = 1 }
}

local eventspellcheck = EventCallback

function eventspellcheck.onSpellCheck(player, spell)
    local spellName = spell.name and spell.name:lower() or "unknown"
    local boosterAction = SpellElementalMapping[spellName]
    
    if not boosterAction then
        print("no booster action")
        return true
    end

    if boosterAction.action == "add" then
        addElementalBoost(player, boosterAction.type, boosterAction.amount)
        player:say("Gained " .. boosterAction.type .. " boost!", TALKTYPE_MONSTER_SAY)
    elseif boosterAction.action == "consume" then
        if getElementalBoost(player, boosterAction.type) < boosterAction.amount then
            player:sendCancelMessage("Not enough " .. boosterAction.type .. " boosters!")
            return false
        end
        removeElementalBoost(player, boosterAction.type, boosterAction.amount)
        player:say("Consumed " .. boosterAction.type .. " boost!", TALKTYPE_MONSTER_SAY)
    end
    
    return true
end

eventspellcheck:register()
print("[Loaded] elemental_boosts.lua")

