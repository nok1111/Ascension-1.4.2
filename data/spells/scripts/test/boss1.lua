local config = {
    monsterName = "Warlock", -- Name of the monster to summon inside cage
	bossName = "Dark Lord2", -- Name of the boss monster to summon
}

function onCastSpell(creature, variant)
    local casterPos = creature:getPosition()
    
    -- Summon the first Warlock monster near the caster
    local monster1 = Game.createMonster(config.monsterName, casterPos:getPosition())
    if monster1 then
        monster1:setMaster(creature)
    end
    
    -- Summon the second Warlock monster near the caster
    local monster2Pos = casterPos:getNextPosition(1)
    local monster2 = Game.createMonster(config.monsterName, monster2Pos)
    if monster2 then
        monster2:setMaster(creature)
    end
	
	 -- Determine the attributes of the existing creature (caster)
    local maxHealth = creature:getMaxHealth()
    local currentHealth = creature:getHealth()
    
    -- Summon the boss monster near the caster with the same health attributes
    local boss = Game.createMonster(config.bossName, casterPos:getPosition())
    if boss then
        boss:setMaxHealth(maxHealth)
        boss:setHealth(currentHealth)
    end
	
	-- Send a magic effect at the caster's original position
    casterPos:sendMagicEffect(CONST_ME_MAGIC_RED)
    
    -- Remove the caster
    creature:remove()
    
    
    
    return true
end
