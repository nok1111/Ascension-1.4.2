

function onCastSpell(cid, variant)
local fromPos = cid:getPosition()
    local owner = cid:getMaster()
    local target = cid:getTarget()
	local targetposition = target:getPosition()
    local min = (owner:getLevel() / 6) + (owner:getMagicLevel() * 0.9) + 5
    local max = (owner:getLevel() / 6) + (owner:getMagicLevel() * 1.45) + 8
	fromPos:sendDistanceEffect(targetposition, 29)
    doAreaCombatHealth(owner:getId(), COMBAT_ICEDAMAGE, target:getPosition(), {1}, -min, -max, 42)
    return true
end