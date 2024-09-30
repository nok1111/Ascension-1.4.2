

function onCastSpell(cid, variant)
local fromPos = cid:getPosition()
    local owner = cid:getMaster()
    local target = cid:getTarget()
	local targetposition = target:getPosition()
    local min = (owner:getLevel() / 5) + (owner:getMagicLevel() * 0.9) + 5
    local max = (owner:getLevel() / 5) + (owner:getMagicLevel() * 1.145) + 8
	fromPos:sendDistanceEffect(targetposition, 34)
    doAreaCombatHealth(owner:getId(), COMBAT_ENERGYDAMAGE, target:getPosition(), {1}, -min, -max, 5)
    return true
end