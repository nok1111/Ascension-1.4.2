

function onCastSpell(cid, variant)
local fromPos = cid:getPosition()
    local owner = cid:getMaster()
    local target = cid:getTarget()
	local targetposition = target:getPosition()
    local min = (owner:getLevel() / 6) + (owner:getMagicLevel() * 0.9) + 5
    local max = (owner:getLevel() / 6) + (owner:getMagicLevel() * 0.145) + 8
	fromPos:sendDistanceEffect(targetposition, CONST_ANI_FIRE)
    doAreaCombatHealth(owner:getId(), COMBAT_ENERGYDAMAGE, target:getPosition(), {1}, -min, -max, CONST_ME_FIREAREA)
    return true
end