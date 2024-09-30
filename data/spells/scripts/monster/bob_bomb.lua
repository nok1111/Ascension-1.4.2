local area = createCombatArea{
	{0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
	{0, 1, 1, 1, 0}
}


function onCastSpell(cid, variant)
if not cid then
return false
end
    local owner = cid:getMaster()
    local min = (owner:getLevel() * 4.2)
    local max = (owner:getLevel() * 5)
	--print(min)
	--print(max)
    
    doAreaCombatHealth(owner:getId(), COMBAT_ENERGYDAMAGE, cid:getPosition(), area, -min, -max, CONST_ME_NONE)
	
	local position = cid:getPosition()
    position:sendMagicEffect(196)	
	position:sendMagicEffect(198)	
	cid:remove()

    return true
end