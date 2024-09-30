local animationDelay = 100
local secondwaveDelay = 150
local combat = {}
local combat2 = {}

-- Frames (1 = Area, 2 = Player, 3 = Player + Self Damaging)
local area = {
    -- 3x3 circle
    {
        {0, 1, 0},
        {1, 2, 1},
        {0, 1, 0}
    },
    -- 3x3 diagonal cross
    {
        {1, 0, 1},
        {0, 2, 0},
        {1, 0, 1}
    },
    -- 4x4 circle
    {
        {0, 1, 1, 0},
        {1, 0, 0, 1},
        {1, 0, 2, 1},
        {0, 1, 1, 0}
    },
    -- 5x5 circle
    {
        {0, 1, 1, 1, 0},
        {1, 0, 0, 0, 1},
        {1, 0, 2, 0, 1},
        {1, 0, 0, 0, 1},
        {0, 1, 1, 1, 0}
    },
    -- 6x6 circle
    {
        {0, 0, 1, 1, 0, 0},
        {0, 1, 0, 0, 1, 0},
        {1, 0, 0, 0, 0, 1},
        {1, 0, 0, 2, 0, 1},
        {0, 1, 0, 0, 1, 0},
        {0, 0, 1, 1, 0, 0}
    },
    -- 7x7 circle
    {
        {0, 0, 1, 1, 1, 0, 0},
        {0, 1, 0, 0, 0, 1, 0},
        {1, 0, 0, 0, 0, 0, 1},
        {1, 0, 0, 2, 0, 0, 1},
        {1, 0, 0, 0, 0, 0, 1},
        {0, 1, 0, 0, 0, 1, 0},
        {0, 0, 1, 1, 1, 0, 0}
    },
    -- 8x8 circle
    {
        {0, 0, 1, 1, 1, 1, 0, 0},
        {0, 1, 0, 0, 0, 0, 1, 0},
        {1, 0, 0, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 0, 0, 1},
        {1, 0, 0, 2, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 0, 0, 1},
        {0, 1, 0, 0, 0, 0, 1, 0},
        {0, 0, 1, 1, 1, 1, 0, 0}
    },
    -- 9x9 circle
    {
        {0, 0, 1, 1, 1, 1, 1, 0, 0},
        {0, 1, 0, 0, 0, 0, 0, 1, 0},
        {1, 0, 0, 0, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 2, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 0, 0, 0, 1},
        {0, 1, 0, 0, 0, 0, 0, 1, 0},
        {0, 0, 1, 1, 1, 1, 1, 0, 0}
    }
}



for i = 1, #area do
    combat[i] = Combat()
    combat[i]:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
    combat[i]:setParameter(COMBAT_PARAM_EFFECT, 53)
    combat[i]:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
    combat[i]:setParameter(COMBAT_PARAM_USECHARGES, true)
    
    combat2[i] = Combat()
    combat2[i]:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
    combat2[i]:setParameter(COMBAT_PARAM_EFFECT, 7)
    combat2[i]:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
    combat2[i]:setParameter(COMBAT_PARAM_USECHARGES, true)
end

for x, _ in ipairs(area) do
    combat[x]:setArea(createCombatArea(area[x]))
    combat2[x]:setArea(createCombatArea(area[x]))
end

local function executeCombat(p, i)
    if not p.player then
        return false
    end
    if not p.player:isPlayer() then
            return false
    end
    p.combat[i]:execute(p.player, p.var)
end

function onCastSpell(player, var)

    local p = {player = player, var = var, combat = combat}
    local p2 = {player = player, var = var, combat = combat2}

    -- Damage formula
    local level = player:getLevel()
    local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
    local magic = player:getMagicLevel()
    local vit = player:getMaxHealth()
    local min = (player:getLevel() / 5) + (vit * 0.0125) + (sword * 6.0)  + (magic * 15)
    local max = (player:getLevel() / 5) + (vit * 0.0125) + (sword * 6.5)  + (magic * 16)

    for i = 1, #area do
        combat[i]:setFormula(COMBAT_FORMULA_LEVELMAGIC, 0, -min, 0, -max)
        combat2[i]:setFormula(COMBAT_FORMULA_LEVELMAGIC, 0, -min, 0, -max)
        if i == 1 then
            combat[i]:execute(player, var)
            addEvent(executeCombat, secondwaveDelay * i, p2, i)
        else
            addEvent(executeCombat, (animationDelay * i) - animationDelay, p, i)
            addEvent(executeCombat, (secondwaveDelay * i) + animationDelay, p2, i)
        end
    end

    return true
end
