

function onCastSpell(cid, variant)
local fromPos = cid:getPosition()
    local owner = cid:getMaster()
    local target = cid:getTarget()
	local targetposition = target:getPosition()

    local skill = owner:getSkillLevel(SKILL_AXE)
	local attack = getWandAttack(owner:getId())
	local magic = owner:getMagicLevel()
    local power = skill * attack
    local magicpower = magic * attack
    local level = owner:getLevel()
    

    local min = (((level / 5) + (power * 0.045) + (magicpower * 0.12)) * 0.25) + 10
    local max = (((level / 5) + (power * 0.055) + (magicpower * 0.13)) * 0.25) + 15

    local InfernalCommand = math.max(owner:getStorageValue(PassiveSkills.InfernalCommand) or 0, 0)
    if InfernalCommand > 0 then
    min = min + (min * (InfernalCommand / 100))
    max = max + (max * (InfernalCommand / 100))
    end
	fromPos:sendDistanceEffect(targetposition, 34)
    doAreaCombatHealth(owner:getId(), COMBAT_PHYSICALDAMAGE, target:getPosition(), {1}, -min, -max, 5)
    return true
end