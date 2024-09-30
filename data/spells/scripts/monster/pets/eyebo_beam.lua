local function calculateAverageDamage(ownerLevel)
    local minDamage = 8 + (7 * (ownerLevel - 1))
    local maxDamage = 8 + (7 * (ownerLevel - 1)) + ((ownerLevel / 10) * 72)
    return minDamage, maxDamage
end


function onCastSpell(cid, variant)
    local owner = cid:getMaster()
    local min, max = calculateAverageDamage(owner:getPetLevel())
	
	-- Get the position and direction the creature is facing
	local cidPos = cid:getPosition()
	local direction = cid:getDirection()
	
	-- Calculate the positions for the 3-square line areas
	local positions = {}
	if direction == NORTH then
		positions = {
			Position(cidPos.x, cidPos.y - 1, cidPos.z),
			Position(cidPos.x, cidPos.y - 2, cidPos.z),
			Position(cidPos.x, cidPos.y - 3, cidPos.z)
		}
	elseif direction == SOUTH then
		positions = {
			Position(cidPos.x, cidPos.y + 1, cidPos.z),
			Position(cidPos.x, cidPos.y + 2, cidPos.z),
			Position(cidPos.x, cidPos.y + 3, cidPos.z)
		}
	elseif direction == WEST then
		positions = {
			Position(cidPos.x - 1, cidPos.y, cidPos.z),
			Position(cidPos.x - 2, cidPos.y, cidPos.z),
			Position(cidPos.x - 3, cidPos.y, cidPos.z)
		}
	elseif direction == EAST then
		positions = {
			Position(cidPos.x + 1, cidPos.y, cidPos.z),
			Position(cidPos.x + 2, cidPos.y, cidPos.z),
			Position(cidPos.x + 3, cidPos.y, cidPos.z)
		}
	end
	
	-- Perform area combat in the calculated positions
	for _, pos in ipairs(positions) do
		doAreaCombatHealth(owner:getId(), COMBAT_ENERGYDAMAGE, pos, 0, -min, -max, 9)
	end
    
	local eyebohLines = {
     "Pew pew! Check out my eye beam!",
    "Zap! Did you see that? I've got laser eyes!",
    "Whoosh! My eye beam is faster than lightning!",
    "Bang! My eye beam packs a punch!",
    "Pew pew pew! I'm a Baby firepower!",
    "Zap zap zap! I'm like a little superhero with laser eyes!",
    "Whoosh! My eye beam cuts through the air like a hot knife through butter!",
    "Bang bang! I'm a cero cero Eyeboh!",
    "Pew pew pew! My eye beam is unstoppable!",
    "Zap zap zap! Watch out, world! Here comes the hero Eyeboh!",

}

-- Select a random line from the eyebohLines array
local randomLine = eyebohLines[math.random(#eyebohLines)]

-- Make the Baby Eyeboh pet say the selected line
cid:say(randomLine, TALKTYPE_SAY)

	
    return true
end
