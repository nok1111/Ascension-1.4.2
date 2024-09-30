

function onCastSpell(cid, variant)
local fromPos = cid:getPosition()
    local owner = cid:getMaster()
    local target = cid:getTarget()
	local targetposition = target:getPosition()
    local min = (owner:getLevel() / 5) + (owner:getMagicLevel() * 0.4) + 5
    local max = (owner:getLevel() / 5) + (owner:getMagicLevel() * 0.8) + 6
	fromPos:sendDistanceEffect(targetposition, 132)
    doAreaCombatHealth(owner:getId(), COMBAT_ENERGYDAMAGE, target:getPosition(), {1}, -min, -max, 48)
    return true
end