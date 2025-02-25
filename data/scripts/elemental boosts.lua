local SpellElementalMapping = {
    -- Spells that add boosters
    ["Fire Blast"]    = { type = "fire",   action = "add",     amount = 1 },
    ["Terra Strike"]  = { type = "terra", action = "add",     amount = 1 },
    ["Rejuvenation"]  = { type = "holy",   action = "add",     amount = 1 },
    ["Energy Blast"] = { type = "energy",  action = "add",     amount = 1 },
    ["Mighty Roar"]   = { type = "might", action = "add",     amount = 1 },
    
    -- Example of a spell that consumes boosters
    ["Flame Overload"] = { type = "Fire_Booster", action = "consume", amount = 2 },
}

local eventspellcheck = EventCallback

function eventspellcheck.onSpellCheck(player, spell)
    -- Retrieve the spell name from the spell table (pushed by pushSpell)
    local spellName = spell.name or "unknown"
    print("Spell name: " .. spellName)
    
    -- Look up the booster action for this spell name in our mapping
    local boosterAction = SpellElementalMapping[spellName]
    if boosterAction then
        if boosterAction.action == "add" then
            -- Use the functional library call to add a booster to the player
            addElementalBoost(player, boosterAction.type, boosterAction.amount)
            player:say("add " .. boosterAction.type)
        elseif boosterAction.action == "consume" then
            -- Get the current booster amount for the specified type
            local current = getElementalBoost(player, boosterAction.type)
            if current < boosterAction.amount then
                player:sendCancelMessage("Not enough " .. boosterAction.type .. " boosters to cast " .. spellName)
                return false
            else
                removeElementalBoost(player, boosterAction.type, boosterAction.amount)
                player:say("consume " .. boosterAction.type)
            end
        end
    end

    return true
end

eventspellcheck:register()

print(">> loading Elemental Boosts")
