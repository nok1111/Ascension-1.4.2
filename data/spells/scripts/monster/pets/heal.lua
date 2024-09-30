function onCastSpell(creature, var)
    local master = creature:getMaster()
    local pet = master:getPet()
    local owner = creature:getMaster()

    local function calculateAverage(owner)
        local level = owner:getPetLevel()
        local a = 2.016
        local b = 1.749
        return (level^a + level^b) / 2
    end

    	local heal_lines = {
   "Look, I'm healing you!",
	"All better now, yay!",
	"Magic cuddles coming right up!",
	"Healing boop on your nose!",
	"Making the ouchies go away!",
	"Sprinkling some heal dust on you!",
	"Patch-up kisses, activate!",
	"Time for a heal hug!",
	"Guess who’s a heal hero? Me!",
	"Waving my heal tail, just for you!",

}

-- Select a random line from the heal_lines array
local randomLine = heal_lines[math.random(#heal_lines)]

-- Make the specter pet say the selected line
creature:say(randomLine, TALKTYPE_SAY)
    local averageHeal = calculateAverage(owner)
    local minHeal = averageHeal * 0.95 -- 95% of average as minimum
    local maxHeal = averageHeal * 1.05 -- 105% of average as maximum
    owner:addHealth(math.random(minHeal, maxHeal))
    owner:getPosition():sendMagicEffect(336)
    return true
end
