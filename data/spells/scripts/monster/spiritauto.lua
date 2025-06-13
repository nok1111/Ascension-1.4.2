

function onCastSpell(cid, variant)
local fromPos = cid:getPosition()
    local owner = cid:getMaster()
    local target = cid:getTarget()
	local targetposition = target:getPosition()
    local min = (owner:getLevel() / 5) + (owner:getMagicLevel() * 0.4) + 5
    local max = (owner:getLevel() / 5) + (owner:getMagicLevel() * 0.8) + 6
	fromPos:sendDistanceEffect(targetposition, 165)
    doAreaCombatHealth(owner:getId(), COMBAT_HOLYDAMAGE, target:getPosition(), {1}, -min, -max, 40)
    return true
end