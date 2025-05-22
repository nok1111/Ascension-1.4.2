--[[
description = "Increse the damage of your ice clones by 10% per level",
effect = {
    { type = "storage", name = "IceCloneDamage", storage = PassiveSkills.IceCloneDamage, value = 10 }
},
]]

function onCastSpell(cid, variant)
local fromPos = cid:getPosition()
    local owner = cid:getMaster()
    local target = cid:getTarget()
	local targetposition = target:getPosition()
    local min = (owner:getLevel() / 6) + (owner:getMagicLevel() * 0.9) + 5
    local max = (owner:getLevel() / 6) + (owner:getMagicLevel() * 1.45) + 8

    local clone_damage = 0
	if owner and owner.getStorageValue then
		clone_damage = math.max(owner:getStorageValue(PassiveSkills.IceCloneDamage) or 0, 0)
	end
	local clone_extra_damage = 1 + (clone_damage / 100)
	min = min * clone_extra_damage	
	max = max * clone_extra_damage	

	fromPos:sendDistanceEffect(targetposition, 29)
    doAreaCombatHealth(owner:getId(), COMBAT_ICEDAMAGE, target:getPosition(), {1}, -min, -max, 42)
    return true
end