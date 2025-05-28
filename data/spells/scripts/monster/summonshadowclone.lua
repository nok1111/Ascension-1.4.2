function onCastSpell(cid, variant)
    local owner = cid:getMaster()
    local target = cid:getTarget()
    local min = (owner:getLevel() / 5) + (owner:getMagicLevel() * 5.7) + owner:getLevel()
    local max = (owner:getLevel() / 5) + (owner:getMagicLevel() * 6.2) + owner:getLevel()
    
    doAreaCombatHealth(owner:getId(), COMBAT_DEATHDAMAGE, target:getPosition(), {1}, -min, -max, 461)
    return true
end