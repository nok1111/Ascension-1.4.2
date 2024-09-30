local config = {
    bossName = "Dark Lord", -- Name of the boss to summon
}

function summonBossIfNoWarlocks(creature)
    local pos = creature:getPosition()
    local spectators = Game.getSpectators(pos, false, false, 7, 7, 7, 7) -- Adjust the radius as needed
    
    local warlockCount = 0
    
    for _, spectator in ipairs(spectators) do
        if spectator:isMonster() and spectator:getName():lower() == "warlock" then
            warlockCount = warlockCount + 1
        end
    end
    
    if warlockCount == 0 then
        creature:remove()
        
        local boss = Game.createMonster(config.bossName, pos, true, true)
        if boss then
            pos:sendMagicEffect(CONST_ME_MAGIC_BLUE)
            
            -- Set boss HP to match the caster's current HP
            local currentHP = creature:getHealth()
            boss:setMaxHealth(creature:getMaxHealth())
            boss:addHealth(currentHP - boss:getHealth())
        end
    end
end

function onCastSpell(creature, variant)
    addEvent(summonBossIfNoWarlocks, 100, creature)
    return true
end
