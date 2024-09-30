local area = createCombatArea{
    {1, 1, 1},
    {1, 3, 1},
    {1, 1, 1}
}


function onCastSpell(cid, variant)
    local owner = cid:getMaster()
    local target = owner:getTarget()
    local min = (owner:getLevel() / 5) + (owner:getMagicLevel() * 1.8) + 10
    local max = (owner:getLevel() / 5) + (owner:getMagicLevel() * 2.2) + 15
	--print(min)
	--print(max)
    
    doAreaCombatHealth(owner:getId(), COMBAT_ENERGYDAMAGE, cid:getPosition(), area, -min, -max, 181)
    return true
end