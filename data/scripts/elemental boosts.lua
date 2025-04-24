local SpellElementalMapping = {
    -- Spells that add boosters
    ["fire fist"]    = { type = "fire",   action = "add",     amount = 1 },
    ["Terra Strike"]  = { type = "terra", action = "add",     amount = 1 },
    ["Rejuvenation"]  = { type = "holy",   action = "add",     amount = 1 },
    ["Energy Blast"] = { type = "energy",  action = "add",     amount = 1 },
    ["Mighty Roar"]   = { type = "might", action = "add",     amount = 1 },
    
    -- Example of a spell that consumes boosters
    ["fire fist"] = { type = "fire", action = "consume", amount = 2 },
}

local eventspellcheck = EventCallback

function eventspellcheck.onSpellCheck(player, spell)

    local spellName = spell.name and spell.name:lower() or "unknown"
    print("Spell name: " .. spellName)

    -- Look up the booster action for this spell name in our mapping
    local boosterAction = SpellElementalMapping[spellName]
    if boosterAction then
        print("Found booster action for spell: " .. spellName)
        if boosterAction.action == "add" then
            -- Use the functional library call to add a booster to the player
            addElementalBoost(player, boosterAction.type, boosterAction.amount)
            player:say("add " .. boosterAction.type)
            print("added" .. boosterAction.type)
        elseif boosterAction.action == "consume" then
            print("consuming spell: " .. spellName)
            local current = getElementalBoost(player, boosterAction.type)
            print("boosts: " .. current)
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
