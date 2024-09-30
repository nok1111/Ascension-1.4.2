local areas = {
    single = createCombatArea{
		{0, 0, 0},
        {0, 3, 0},
        {0, 0, 0}
	},
    cross1x1 = createCombatArea{
        {0, 1, 0},
        {1, 3, 1},
        {0, 1, 0}
    },
    square1x1 = createCombatArea{
        {1, 1, 1},
        {1, 3, 1},
        {1, 1, 1}
    },
}

local function getCombatAreaByLevel(level)
    if level <= 50 then
        return areas.single
    elseif level <= 100 then
        return areas.cross1x1
    else
        return areas.square1x1
    end
end

function onCastSpell(cid, variant)
    if not cid then
        return false
    end

    local owner = cid:getMaster()
    local level = owner:getLevel()
    local maglevel = owner:getMagicLevel()
	
	min = (maglevel * 2.0) + level
    max = (maglevel * 2.3) + (level * 1.5)
    
    local combatArea = getCombatAreaByLevel(level)
    
    doAreaCombatHealth(owner:getId(), COMBAT_ENERGYDAMAGE, cid:getTarget():getPosition(), combatArea, -min, -max, 435)
    
    local position = cid:getPosition()
    cid:remove()

    return true
end
