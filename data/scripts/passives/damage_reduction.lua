local config = {
    maxMissChance = 50, -- Maximum miss chance in percent
    levelDifferenceFactor = 0.65, -- Miss chance increase per level difference
}

function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if creature and attacker then
        if creature:isMonster() and attacker:isPlayer() then
            local monster_level = creature:getMonsterLevel()
            local player_level = attacker:getLevel()
            local level_difference = monster_level - player_level

            -- Calculate miss chance based on level difference
            -- Only apply miss chance if the monster level is higher than the player level
            if monster_level > 0 and level_difference > 0 then
			
                local miss_chance = math.min(level_difference * config.levelDifferenceFactor, config.maxMissChance)
			print(miss_chance)
                -- Apply miss chance
                if math.random(100) <= miss_chance then
                    -- Miss the attack
					print("miss")
					creature:getPosition():sendMagicEffect(270) -- Visual feedback for missed hit
                    creature:getPosition():sendMagicEffect(577) -- Visual feedback for missed hit
                    primaryDamage = 0
					secondaryDamage = 0
                end
            end
        end
    end

    return primaryDamage, primaryType, secondaryDamage, secondaryType
end
