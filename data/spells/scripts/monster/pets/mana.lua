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

       	local mana_lines = {
"Mana magic, coming up!",
"Filling up your magic tank!",
"Sparkles and mana, just for you!",
"Who needs a mana potion when you have me?",
"Mana cuddles to the rescue!",
"Let’s make that magic bar happy again!",
"Mana kisses, coming right through!",
"Sprinkling some magic dust on you!",
"Your mana's best friend, at your service!",
"Waving my magic tail, your mana's full again!",

}

-- Select a random line from the mana_lines array
local randomLine = mana_lines[math.random(#mana_lines)]

-- Make the specter pet say the selected line
creature:say(randomLine, TALKTYPE_SAY)

    local averageMana = calculateAverage(owner)
    local minMana = averageMana * 0.95 -- 95% of average as minimum
    local maxMana = averageMana * 1.05 -- 105% of average as maximum
    owner:addMana(math.random(minMana, maxMana))
    owner:getPosition():sendMagicEffect(379)
    return true
end
