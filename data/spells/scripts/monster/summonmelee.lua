function onCastSpell(cid, variant)
    local owner = cid:getMaster()
    local target = cid:getTarget()

    local skill = owner:getSkillLevel(SKILL_AXE)
	local attack = getWandAttack(owner:getId())
	local magic = owner:getMagicLevel()
    local power = skill * attack
    local magicpower = magic * attack
    local level = owner:getLevel()
    

    local min = (((level / 5) + (power * 0.045) + (magicpower * 0.12)) * 0.3) + 1
    local max = (((level / 5) + (power * 0.055) + (magicpower * 0.13)) * 0.3) + 2

    local InfernalCommand = math.max(owner:getStorageValue(PassiveSkills.InfernalCommand) or 0, 0)
    min = min + (min * (InfernalCommand / 100))
    max = max + (max * (InfernalCommand / 100))
    
    doAreaCombatHealth(owner:getId(), COMBAT_PHYSICALDAMAGE, target:getPosition(), {1}, -min, -max, CONST_ME_HITAREA)
    return true
end