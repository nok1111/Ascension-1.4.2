

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
    

    local min = (((level / 5) + (power * 0.045) + (magicpower * 0.12)) * 0.08) + 1
    local max = (((level / 5) + (power * 0.055) + (magicpower * 0.13)) * 0.10) + 2

	fromPos:sendDistanceEffect(targetposition, 165)
    doAreaCombatHealth(owner:getId(), COMBAT_HOLYDAMAGE, target:getPosition(), {1}, -min, -max, 40)


    local AeryManaRestore = owner:getStorageValue(PassiveSkills.AeryManaRestore) or 0
	if AeryManaRestore > 0 then
		--Spirit Auto now restores 3% of your max mana per level
		local maxMana = owner:getMaxMana()
		local AeryManaRestore = maxMana * (AeryManaRestore / 100)
		owner:addMana(AeryManaRestore)
	end
    return true
end