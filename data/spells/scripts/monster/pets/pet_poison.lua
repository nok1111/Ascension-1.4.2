local combatpet1 = Combat()
local combatpoison1 = Combat()

for i, c in ipairs({combatpet1, combatpoison1}) do
    c:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
    c:setParameter(COMBAT_PARAM_EFFECT, 9)
    c:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 39)
    c:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
end

local conditionpet1 = Condition(CONDITION_POISON)
conditionpet1:setTicks(15000)
conditionpet1:setParameter(CONDITION_PARAM_DELAYED, 1)
conditionpet1:setParameter(CONDITION_PARAM_TICKINTERVAL, 1500)

local function calculateAverage(owner)
    local level = owner:getPetLevel()
    local a = 2.016
    local b = 1.749
    return (level^a + level^b) / 2
end

function Castpetpoison(cid, var)
    local creature = Creature(cid)
    if not creature then return end
    local owner = creature:getMaster()
    if not owner then return end
    local target = owner:getTarget()
    if not target then return end
    local averageDamage = calculateAverage(owner)
    local minDamage = averageDamage * 0.95
    local maxDamage = averageDamage * 1.05

    conditionpet1:setParameter(CONDITION_PARAM_PERIODICDAMAGE, math.random(minDamage, maxDamage))
    combatpet1:addCondition(conditionpet1)
end

 
function onCastSpell(creature, var, tar)
    Castpetpoison(creature:getId(), var)
	
	local targetmonster = creature:getTarget()	
	
	local frogLines = {
		"if love is poison, i have alot..",
		"In the moonlight's embrace, I croak for my one true love to hop into my life!",
		"Alas, my amphibian heart beats with the rhythm of unrequited love!",
		"Amidst the lily pads, I ponder: Will my prince(ss) charming ever come to kiss me?",
		"With each hop, I leap closer to finding my froggy soulmate!",
		"Oh, the drama! Oh, the romance! Oh, the sheer ribbeting excitement of it all!",
		"In the pond of love, I'm just a frog looking for my tadpole!",
		"From pond to pad, my love journey knows no bounds! (Except the ones around the swamp.)",
		"In the great froggy romance novel of life, I'm just a chapter waiting to be written!",
		"To find love, one must leap! And leap I shall, for love knows no bounds or lily pads!",
		"I'm like a frog in a pond, waiting for my perfect pondmate to hop into my life!",
		"With each croak, I serenade the night, hoping my one true love will hear my ribbits of passion!",
		"I'm just a frog, standing in front of a pond, asking it to love me!",
		"Here comes the rain again, falling on my froggy parade of despair!",
		"I see a little silhouette of a frog, will you do the frog-ango with me?",
		"Like a frog in the wind, I'm blowing in the breeze of heartache!",
		"Is this the real life? Is this just frog fantasy?",
		"I'm a frog on a mission, to find love in all the wrong places!",
		"I kissed a frog, and I liked it!",
		"Frog on the water, fire in my soul! (And a little bit of heartburn from all the angst.)",
		"I will always love you... even if you don't ribbit back.",
		"Froggy and the Jets, leaping into the night sky of romance!",
		"In the jungle, the mighty jungle, the frog sleeps tonight... alone.",
		"I've got the moves like Jagger... if Jagger was a frog!",
		"Leaping in the name of love, I jump higher, faster, frog-ier!",
		"Take a sad song and make it better... or just let me croak in peace.",
		"I'm like a frog in a teardrop, swimming in a sea of sorrow!",
		"Here I go again on my own, leaping down the only road I've ever known!",
		"I can't fight this feeling anymore... the feeling of being hopelessly frog-tangled in love!",
		"I will survive... or maybe I won't. Who knows? I'm just a frog.",
		"Don't stop believing... that frogs can find love in a hopeless place!",
		"I'm walking on sunshine... but it's raining in my heart!",
		"I'm too sexy for my pond, too sexy for my swamp!",
		"I've got a frog in my throat, and it's singing the blues of unrequited love!",
		"You're the one that I want... but am I the one that you need?",
		"I'm a frog in a material world, and I'm looking for a material girl!",
		"I've got a froggy feeling... that love is just around the corner!",
		"Fly me to the moon... or at least to the other side of the pond!",
		"I'm all out of love, I'm so lost without you... or maybe I'm just hungry.",
		"I'm like a frog in a cage, longing to break free from the chains of love!",
		"All you need is love... and maybe a good fly or two.",
		"Love is a battlefield... and I'm just a frog caught in the crossfire!",
		"I'm like a frog on the edge of glory, leaping into the abyss of romance!",
		"I'm a frog in the sky with diamonds, swimming through the stars of love!",
		"I'm a frog, hear me ribbit! I won't give up on love, not even for a second!",
		"I'm a frog, I'm a lover, I'm a froggy on the cover!",
		"I'm singing in the rain, just singing in the rain... and hoping you'll join me!",
		"I'm a frog, standing tall, ready to leap into the great unknown of love!",
		"I'm like a froggy phoenix, rising from the ashes of heartache!",
		"I'm a frog in the dark, searching for the light of love!",
		"I'm a frog, not a fighter... but I'll fight for your love!",
		"I'm a frog, and I'm fabulous! (But also a little bit lonely.)",
		"I'm a frog on a mission, searching for the holy grail of love!",
		"I'm like a frog in a fishbowl, swimming against the currents of romance!",
		"I'm a frog, hear me roar! (Or maybe just ribbit loudly.)",
		"I'm a frog in the spotlight, ready to shine in the darkness of love!",
		"I'm a frog, leaping through the pages of destiny!",
		"I'm like a frog in a snowstorm, cold and alone but still hopping towards love!",
		"I'm a frog, and I'm ready to take a leap of faith into the unknown of love!",
		"I'm a frog, and I'm ready to rock your world with my amphibian charm!",
		"Love is like a frog in a blender, mixed up but still hopping!",
		"In the frog race of love, I'm always jumping ahead!",
		"I'm a frog lost in the pond of romance, swimming towards your lily pad!",
		"Hop on over and kiss this frog, maybe I'll turn into your prince(ss) charming!",
		"I'm a frog in the rain, waiting for you to be my rainbow!",
		"My heart leaps like a frog in the moonlight whenever I see you!",
		"I'm a frog serenading the stars, hoping they'll sing our love song!",
		"Like a frog on a lilypad, I'm floating in the sea of your affection!",
		"My love for you is as endless as a frog's appetite for flies!",
		"Let's hop to it and leap into the pond of love together!",
		"I'm like a frog on a lily pad, basking in the sunshine of your smile!",
		"They say love is blind, but I'm a frog and I can see you're the one for me!",
		"I'm a frog on a journey, and you're the destination of my heart!",
		"In the frog-eat-fly world of romance, I've got my eyes on you!",
		"They say you have to kiss a lot of frogs to find your prince(ss), so pucker up!",
		"I'm a frog in a fairy tale, hoping for a happy ending with you!",
		"My heart beats like a frog's drum, echoing your name with every ribbit!",
		"They say opposites attract, so I'm a frog in love with a fish out of water!",
		"I'm a frog on a mission, and you're the treasure at the end of my rainbow!",
		"If love were a pond, I'd be the frog and you'd be the lilypad I'm jumping towards!",
		"They say love is a journey, so I'm a frog hopping along the path to your heart!",
		"I'm like a frog in a pond, surrounded by lily pads of love, but you're the prettiest one!",
		"My heart is like a frog's croak, loud and clear with love for you!",
		"I'm a frog in the river of life, and you're the current that carries me away!",
		"I'm like a frog in the desert, parched for your love but never giving up!",
		"Love is like a frog's leap, scary at first but exhilarating once you take the plunge!",
		"I'm a frog on a log, dreaming of the day you'll hop into my life!",
		"They say love is a dance, so I'm a frog ready to cha-cha-cha into your arms!",
		"I'm like a frog in a pond, surrounded by lilypads of love, but you're the biggest and brightest!",
		"I'm a frog in a tree, croaking my love song to the moon, hoping you'll hear!",
		"They say love is a battlefield, so I'm a frog ready to fight for your heart!",
		"I'm a frog on a lily pad, floating in the pond of your affection!",
		"I'm like a frog in a pond, surrounded by lilypads of love, but you're the one that stands out!",
		"I'm a frog on a mission, and you're the prize at the end of the rainbow!",
		"I'm like a frog in the rain, soaked with love for you!",
		"They say love is like a frog in a blender, but with you, it's more like a fairy tale!",
		"I'm a frog in a pond of love, and you're the lilypad I want to land on!",
		"I'm like a frog on a lilypad, floating in the sea of your affection!",
		"I'm a frog on a mission, and you're the destination of my heart!",
		"I'm a frog on a journey, and you're the rainbow at the end of my adventure!",
		"My love for you is like a frog's leap, always reaching for new heights!",
		"I'm like a frog on a log, dreaming of the day you'll hop into my life!",
		"They say love is a lily pad, and I'm just a frog waiting for you to land on me!",
		"I'm a frog in the pond of life, and you're the lilypad I'm reaching for!",
		"I'm like a frog in the rain, croaking my love song to the clouds!",
		"I'm a frog in the river of love, and you're the current that carries me away!",
		"They say love is a leap of faith, so I'm a frog ready to take the plunge for you!",
		"I'm a frog on a log, basking in the sunshine of your smile!",
		"I'm like a frog on a lily pad, floating in the pond of your affection!",
		"I'm a frog on a journey, and you're the treasure at the end of my rainbow!",
	}

	-- Select a random line from the frogLines array
	local randomLine = frogLines[math.random(#frogLines)]

	-- Make the night frog pet say the selected line

	local chanceToSay = math.random(1, 100)
	if chanceToSay <= 45 then
	-- Make the jelly pet say the selected line
		creature:say(randomLine, TALKTYPE_SAY)
	end


	
    return combatpet1:execute(creature, var)
end