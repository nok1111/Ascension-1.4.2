local area = createCombatArea{
    {1, 1, 1},
    {1, 3, 1},
    {1, 1, 1}
}


function onCastSpell(cid, variant)
    local owner = cid:getMaster()
    local min = (owner:getLevel() / 5) + (owner:getMagicLevel() * 1.8) + 10
    local max = (owner:getLevel() / 5) + (owner:getMagicLevel() * 2.2) + 15
	--print(min)
	--print(max)

    local InfernalCommand = math.max(owner:getStorageValue(PassiveSkills.InfernalCommand) or 0, 0)
    min = min + (min * (InfernalCommand / 100))
    max = max + (max * (InfernalCommand / 100))
    
    doAreaCombatHealth(owner:getId(), COMBAT_ENERGYDAMAGE, cid:getPosition(), area, -min, -max, 443)
    return true
end