local blood = 1 -- Amount of Blood money to take.
local combat = Combat()
local toMana = 5 -- Heal how much mana per summon in percent.

local function healMana(pid, total)
	local player = Player(pid)
	if player then
		local mana = (player:getMaxMana() * (1 * toMana)) / 100 
		player:addMana(mana)
	end
end

local function repeatEffect(p, t, heal)
	local player = Player(p)
	local pos = Position(t)
	if player == nil or pos == nil then
		return
	end


	for i = 6, 1, -1 do
		addEvent(function(p, pos)
			if player == nil or pos == nil then
				return false
			end
			pos:sendDistanceEffect(player:getPosition(), 30)
		end, i * 100, player:getId(), pos)
	end

	addEvent(function(p)
		local player = Player(p)
		if player == nil then
			return false
		end
		player:getPosition():sendMagicEffect(196)
		healMana(player)
		end, 650, player:getId())
	return true
end

function onCastSpell(creature, variant)
	if creature then
		local times = 1
		local total = #creature:getSummons()
		if total >= 1 then
			for _, summon in pairs(creature:getSummons()) do
				if summon:getName() == "Blood Flower" then
					local player = Player(creature)
					local creature = Creature(summon)
					local pos = creature:getPosition()
					creature:remove()
					pos:sendMagicEffect(266)
					repeatEffect(player, pos, total)
				end
			end
		end
		return combat:execute(creature, variant)
	end
	return false
end
