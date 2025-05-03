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
    if not cid or not cid:isMonster() then
        print("[WARNING] Invalid servant_explode cast - no cid or not monster")
        return false
    end

    local owner = cid:getMaster()
    if not owner or not owner:isPlayer() then
        print("[WARNING] Invalid servant_explode cast - no valid owner")
        return false
    end

    local target = cid:getTarget()
    if not target then
        print("[WARNING] Servant explode with no target")
        return false
    end

    local level = math.max(owner:getLevel(), 1)
    local maglevel = math.max(owner:getMagicLevel(), 0)
    
    min = math.floor((maglevel * 2.0) + level)
    max = math.floor((maglevel * 2.3) + (level * 1.5))
    
    local combatArea = getCombatAreaByLevel(level)
    
    doAreaCombatHealth(owner:getId(), COMBAT_ENERGYDAMAGE, cid:getTarget():getPosition(), combatArea, -min, -max, 435)
    
    local position = cid:getPosition()
    if position then
        cid:remove()
    else
        print("[WARNING] Invalid position for servant removal")
    end

    return true
end
