local area = createCombatArea{
    {1, 1, 1},
    {1, 3, 1},
    {1, 1, 1}
}


function onCastSpell(cid, variant)
	local fromPos = cid:getPosition()
    local owner = cid:getMaster()
    local target = owner:getTarget()
	local targetposition = target:getPosition()
	
    local min = (owner:getLevel() / 5) + (owner:getMagicLevel() * 1.5) + 15
    local max = (owner:getLevel() / 5) + (owner:getMagicLevel() * 2.6) + 25 

    fromPos:sendDistanceEffect(targetposition, 129)
    doAreaCombatHealth(owner:getId(), COMBAT_ENERGYDAMAGE, target:getPosition(), area, -min, -max, 230)
    return true
end