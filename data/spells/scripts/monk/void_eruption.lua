-- Delay between animations.
local animationDelay = 250
local combat = {}

-- Frames (1 = Area, 2 = Player, 3 = Player + Self Damaging)
local area = {
    {
        {0, 1, 0},
        {1, 2, 1},
        {0, 1, 0}
    },
    {
        {1, 0, 1},
        {0, 2, 0},
        {1, 0, 1}
    },
    {
        {0, 1, 1, 1, 0},
        {1, 0, 0, 0, 1},
        {1, 0, 2, 0, 1},
        {1, 0, 0, 0, 1},
        {0, 1, 1, 1, 0}
    },
	 {
        {1, 0, 1},
        {0, 2, 0},
        {1, 0, 1}
    },
	{
        {0, 1, 0},
        {1, 2, 1},
        {0, 1, 0}
    }
}

for i = 1, #area do
    combat[i] = Combat()
    combat[i]:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
    combat[i]:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NEWFIRBUBLE)
	combat[i]:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
	combat[i]:setParameter(COMBAT_PARAM_USECHARGES, true)
end

for x, _ in ipairs(area) do
    combat[x]:setArea(createCombatArea(area[x]))
end

local function executeCombat_FireWithin(p, i)
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

    -- Damage formula
    local level = player:getLevel()
    local str = player:getEffectiveSkillLevel(SKILL_SWORD)
	local vit = player:getMaxHealth() / 100
	local magic = player:getMagicLevel()
	local min = (player:getLevel() / 5) +  (vit * 25)  + (magic * 30) 
	local max = (player:getLevel() / 5) +  (vit * 25)  + (magic * 35) 

    for i = 1, #area do
        combat[i]:setFormula(COMBAT_FORMULA_LEVELMAGIC, 0, -min, 0, -max)
        if i == 1 then
            combat[i]:execute(player, var)
        else
            addEvent(executeCombat_FireWithin, (animationDelay * i) - animationDelay, p, i)
			
        end
    end

    return true
end