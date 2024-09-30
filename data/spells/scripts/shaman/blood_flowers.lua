local blood = 1
local summonName = "Blood Flower"

function onCastSpell(creature, variant)
	if #creature:getSummons() >= 3 then
		creature:getPosition():sendMagicEffect(3)
		creature:sendCancelMessage("You can only summon 3 flowers.")
		return false
	end

	if creature:canCastSpell(blood) then
		local pos = creature:getPosition()

		pos:sendMagicEffect(10)
		addEvent(function(cid)
				local creature = Player(cid)
				if creature then
					summonFlower(creature)
				end
			end, 590, creature:getId())
		return true
	end
	return false
end
