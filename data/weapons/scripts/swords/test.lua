
-- Define the duration of the Elemental Surge effect in milliseconds (5 seconds)
local ELEMENTAL_SURGE_DURATION = 5000
local BASE_DAMAGE_MIN = 1000
local BASE_DAMAGE_MAX = 1500


-- List of random spell IDs to choose from
local randomSpells = {
    {
        spellID = 1,
        effectID = 7,  -- Unique effect ID for this spell
        spellType = "damage",  -- Spell type: "damage" or "heal"
    },
    {
        spellID = 2,
        effectID = 9,  -- Unique effect ID for this spell
        spellType = "damage",  -- Spell type: "damage" or "heal"
    },
    {
        spellID = 3,
        effectID = 10,  -- Unique effect ID for this spell
        spellType = "damage",  -- Spell type: "damage" or "heal"
    },
    {
        spellID = 4,
        effectID = 15,  -- Unique effect ID for this spell
        spellType = "heal",  -- Spell type: "damage" or "heal"
    },
    {
        spellID = 5,
        effectID = 11,  -- Unique effect ID for this spell
        spellType = "damage",  -- Spell type: "damage" or "heal"
    },
	 {
        spellID = 6,
        effectID = 12,  -- Unique effect ID for this spell
        spellType = "damage",  -- Spell type: "damage" or "heal"
    }
}

-- List of 10 different random areas to choose from
local randomAreas = {
    createCombatArea({
        {0, 1, 0},
        {1, 3, 1},
        {0, 1, 0}
    }),
    createCombatArea({
        {1, 0, 1},
        {0, 3, 0},
        {1, 0, 1}
    }),
    createCombatArea({
        {1, 1, 1},
        {1, 3, 1},
        {1, 1, 1}
    }),
    createCombatArea({
        {0, 0, 0},
        {0, 3, 0},
        {0, 0, 0}
    }),
    createCombatArea({
        {1, 0, 1},
        {0, 3, 0},
        {1, 0, 1}
    }),
    createCombatArea({
        {0, 1, 0},
        {1, 3, 1},
        {0, 1, 0}
    }),
    createCombatArea({
        {1, 1, 1, 1, 1},
        {1, 0, 1, 0, 1},
        {1, 1, 3, 1, 1},
		{1, 0, 1, 0, 1},
        {1, 1, 1, 1, 1}
    }),
    createCombatArea({
        {0, 0, 0, 0, 0},
        {0, 1, 1, 1, 0},
        {0, 1, 3, 1, 0},
        {0, 1, 1, 1, 0},
        {0, 0, 0, 0, 0}
    }),
    createCombatArea({
        {1, 1, 1, 1, 1},
        {1, 0, 1, 0, 1},
        {1, 1, 3, 1, 1},
        {1, 0, 1, 0, 1},
        {1, 1, 1, 1, 1}
    }),
    createCombatArea({
        {0, 0, 0},
        {0, 3, 0},
        {0, 0, 0}
    })
}

local exhaust = Condition(CONDITION_EXHAUST_HEAL)
exhaust:setParameter(CONDITION_PARAM_TICKS, (configManager.getNumber(configKeys.EX_ACTIONS_DELAY_INTERVAL) - 1000))


function onUseWeapon(player, variant, creature)
		
	  if player:getCondition(CONDITION_EXHAUST_HEAL) then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_YOUAREEXHAUSTED))
        return true
    end
    local target = player:getTarget()
	
    -- Choose a random spell from the list
    local randomSpell = randomSpells[math.random(1, #randomSpells)]
	player:getPosition():sendMagicEffect(27)
	--player:say("rolling dice!: " .. randomSpell.spellID, TALKTYPE_MONSTER_SAY, false, player, player:getPosition())

    player:addCondition(CONDITION_EFFECT, ELEMENTAL_SURGE_DURATION, randomSpell.effectID)

    -- Choose a random area for the spell
    local randomArea = randomAreas[math.random(1, #randomAreas)]

    -- Cast the random spell at the target position (toPosition)
    local sword_skill = player:getEffectiveSkillLevel(SKILL_SWORD)
    local level = player:getLevel()
    
    local targetTile = Tile(target:getPosition())
    for _, creature in ipairs(targetTile:getCreatures()) do
        if creature:isMonster() or creature:isPlayer() then
            if randomSpell.spellType == "damage" and randomSpell.spellID == 6 then
                local damage = math.random(BASE_DAMAGE_MIN, BASE_DAMAGE_MAX) + (level * 2.4) + (sword_skill * 2.5) --formula damage area 8 (full aoe)
				
                doAreaCombatHealth(player:getId(), COMBAT_ENERGYDAMAGE, creature:getPosition(), randomAreas[8], -damage, -damage, randomSpell.effectID)
				player:say("rolling dice!: " .. randomSpell.spellID .. "  !jackpot!", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
            elseif randomSpell.spellType == "heal" then
                local healAmount = math.random(BASE_DAMAGE_MIN, BASE_DAMAGE_MAX) + (level * 3) + (sword_skill * 2) --formula heal
                --creature:addHealth(healAmount)
				doAreaCombatHealth(player:getId(), COMBAT_HEALING, creature:getPosition(), randomArea, healAmount, healAmount, randomSpell.effectID) --comenta esta linea si no quieres que ambos tu y el monster se cure y descomenta la de arriba
				player:say("rolling dice!: " .. randomSpell.spellID, TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
			elseif randomSpell.spellType == "damage" then
                local damage = math.random(BASE_DAMAGE_MIN, BASE_DAMAGE_MAX) + (level * 2) + (sword_skill * 1.5) --formula damage random areas
				
                doAreaCombatHealth(player:getId(), COMBAT_ENERGYDAMAGE, creature:getPosition(), randomArea, -damage, -damage, randomSpell.effectID)
				player:say("rolling dice!: " .. randomSpell.spellID, TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
            end
        end
    end


    player:addCondition(exhaust)
	

    return true
end



