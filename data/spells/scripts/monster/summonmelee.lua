function onCastSpell(cid, variant)
    local owner = cid:getMaster()
    local target = cid:getTarget()
    local min = (owner:getLevel() / 6) + (owner:getMagicLevel() * 0.7) + 2
    local max = (owner:getLevel() / 6) + (owner:getMagicLevel() * 1.2) + 4

    local InfernalCommand = math.max(owner:getStorageValue(PassiveSkills.InfernalCommand) or 0, 0)
    min = min + (min * (InfernalCommand / 100))
    max = max + (max * (InfernalCommand / 100))
    
    doAreaCombatHealth(owner:getId(), COMBAT_PHYSICALDAMAGE, target:getPosition(), {1}, -min, -max, CONST_ME_HITAREA)
    return true
end