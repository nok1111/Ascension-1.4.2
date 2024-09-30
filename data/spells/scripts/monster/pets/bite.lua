local function calculateAverage(owner)
    local level = owner:getPetLevel()
    local a = 2.016
    local b = 1.749
    return (level^a + level^b) / 2
end

function onCastSpell(cid, variant)
    local owner = cid:getMaster()
    local target = owner:getTarget()

    -- Calculate average damage based on the pet's level
    local averageDamage = calculateAverage(owner)
    
    -- Adjust minimum and maximum damage based on the average
    local min = averageDamage * 0.9 -- Assuming min damage to be 90% of average
    local max = averageDamage * 1.1 -- Assuming max damage to be 110% of average
    
    doAreaCombatHealth(owner:getId(), COMBAT_PHYSICALDAMAGE, target:getPosition(), {1}, -min, -max, 1)
    
    local targetmonster = cid:getTarget()
    local position = targetmonster:getPosition()
    local positioneffect = position
    positioneffect.x = position.x + 1
    positioneffect.y = position.y + 1
    
    positioneffect:sendMagicEffect(469)
    
    local frazzlemawLines = {
        "Rrraaawr! Fear the tiny Frazzlemaw!",
        "Grrrr... I may be small, but I'm fierce!",
        "Chomp chomp! Who's hungry for mischief?",
        "Watch out! Frazzlemaw on the loose!",
        "Rawr! I may be pint-sized, but I pack a punch!",
        "Beware the tiny terror of the Frazzlemaw!",
        "Heehee! I'm a little Frazzlemaw with a big attitude!",
        "Rumble rumble... That's the sound of trouble!",
        "Roar! I'm the king of the mini-monsters!",
    }

    -- Define the chance for the pet to say the line (30%)
    if math.random(1, 100) <= 30 then
        local randomLine = frazzlemawLines[math.random(#frazzlemawLines)]
        cid:say(randomLine, TALKTYPE_SAY)
    end

    return true
end
