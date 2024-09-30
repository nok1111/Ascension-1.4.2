local blood = 1
local time = 60
local health = 25 -- percent

function onCastSpell(creature, variant)
	local health = creature:getMaxHealth() * health / 100
	if health >= creature:getHealth() then
		return false
	end

	if creature:canCastSpell(blood) then
		local pos = creature:getPosition()

		creature:addHealth(-health)
		creature:addBuff(CONDITION_MANASHIELD, {ticks = time * 1000, shieldPoints = health * 3})
		pos:sendMagicEffect(blood_effects[creature:getDirection()][3])
		return true
	end
	return false
end
