
   local square1x1 = createCombatArea{
        {1, 1, 1},
        {1, 3, 1},
        {1, 1, 1}
    }



function onCastSpell(cid, variant)
    if not cid then
        return false
    end

    local owner = cid:getMaster()
    if not owner or not owner:isMonster() then
        return false
    end

    local target = cid:getTarget()
    if not target then
        return false
    end

    local level = owner:getMonsterLevel()

    
    local min = level * 4
    local max = level * 5.5


    
    doAreaCombatHealth(owner:getId(), COMBAT_EARTHDAMAGE, cid:getPosition(), square1x1, -min, -max, 21)
    cid:remove()

    return true
end
