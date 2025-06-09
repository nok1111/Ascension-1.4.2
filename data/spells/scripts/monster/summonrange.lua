

function onCastSpell(cid, variant)
local fromPos = cid:getPosition()
    local owner = cid:getMaster()
    local target = cid:getTarget()
	local targetposition = target:getPosition()
    local min = (owner:getLevel() / 6) + (owner:getMagicLevel() * 0.9) + 5
    local max = (owner:getLevel() / 6) + (owner:getMagicLevel() * 1.45) + 8

    local InfernalCommand = math.max(owner:getStorageValue(PassiveSkills.InfernalCommand) or 0, 0)
    min = min + (min * (InfernalCommand / 100))
    max = max + (max * (InfernalCommand / 100))
    
	fromPos:sendDistanceEffect(targetposition, CONST_ANI_FIRE)
    doAreaCombatHealth(owner:getId(), COMBAT_ENERGYDAMAGE, target:getPosition(), {1}, -min, -max, CONST_ME_FIREAREA)
    return true
end