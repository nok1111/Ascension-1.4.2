

function onCastSpell(creature, var)
    local master = creature:getMaster()
    local pet = master:getPet()
    local owner = creature:getMaster()

    creature:say("cluck cluck!!", TALKTYPE_SAY)
    local level = owner:getPetLevel()
    
    -- Table of items with their IDs and chances based on owner level
    local itemsByLevel = {
        [1] = {{itemId = 7910, chance = 65}, {itemId = 7909, chance = 35}},
        [2] = {{itemId = 7910, chance = 65}, {itemId = 7909, chance = 35}},
        [3] = {{itemId = 7910, chance = 65}, {itemId = 7909, chance = 35}},
        [4] = {{itemId = 7910, chance = 65}, {itemId = 7909, chance = 35}},
        [5] = {{itemId = 7910, chance = 65}, {itemId = 7909, chance = 35}},
        [6] = {{itemId = 7910, chance = 65}, {itemId = 7909, chance = 35}},
        [7] = {{itemId = 7910, chance = 65}, {itemId = 7909, chance = 35}},
        [8] = {{itemId = 7910, chance = 65}, {itemId = 7909, chance = 35}},
        [9] = {{itemId = 7910, chance = 65}, {itemId = 7909, chance = 30}, {itemId = 11213, chance = 5}},
        [10] = {{itemId = 7910, chance = 65}, {itemId = 7909, chance = 30}, {itemId = 11213, chance = 5}},
    }
    
    -- Get items based on owner level
    local items = itemsByLevel[level] or {}
    
    -- Randomly select an item based on chances
    local totalChance = 0
    for _, itemInfo in ipairs(items) do
        totalChance = totalChance + itemInfo.chance
    end
    
    local randomNum = math.random(totalChance)
    local selectedItem = nil
    local cumulativeChance = 0
    for _, itemInfo in ipairs(items) do
        cumulativeChance = cumulativeChance + itemInfo.chance
        if randomNum <= cumulativeChance then
            selectedItem = itemInfo.itemId
            break
        end
    end
    
  -- Create the selected item at a random position in a 3x3 radius from the target
    if selectedItem then
        local targetPos = owner:getPosition()
        local radius = 1 -- 3x3 radius is 1 in each direction
        local newPos = Position(targetPos.x + math.random(-radius, radius), targetPos.y + math.random(-radius, radius), targetPos.z)
        Game.createItem(selectedItem, 1, newPos)
    end
    
    
    
	local squirrelLines = {
    "I hit the jackpot! Look what I found buried here!",
    "Whoa, check out this tasty treasure I unearthed!",
    "Eureka! I've struck culinary gold in the dirt!",
    "Score! Dinner is served, and it's buried right here!",
    "I'm like a gourmet chef, uncovering delicious delights!",
    "What's this? A buried buffet just for me!",
    "Look what I dug up! It's a squirrel's dream come true!",
    "Yippee! My food-finding skills are unbe-leaf-able!",
    "Ahoy! There be nuts buried 'neath these grounds!",
    "Well, well, well... What do we have here? A nutty surprise!",
    "Hold the phone! I've hit the motherlode of snacks!",
    "Digging pays off once again! Check out my tasty treasure!",
    "Holy acorns! You won't believe what I found buried here!",
    "Huzzah! It's like a treasure hunt, but with snacks!",
    "Hot diggity dog! I'm a squirrel on a mission, and I've struck gold!",
    "I've got a nose for nuts, and it led me straight to this tasty treat!",
    "Shiver me whiskers! Look at the delicious bounty I've unearthed!",
    "This calls for a celebration! I've found a feast fit for a squirrel king!",
    "Who needs a grocery store when you've got the great outdoors?",
    "I've got a sixth sense for snacks, and it's telling me there's food buried here!",
    "Well, butter my tail and call me a squirrel! Look what I found!",
    "Step aside, Indiana Jones! This squirrel is the ultimate treasure hunter!",
    "What's that you say? Oh, just the sound of me striking snack gold!",
    "I may be small, but my appetite is mighty! Feast your eyes on my latest discovery!",
    "I'm like a gourmet detective, sniffing out culinary delights wherever I go!",
    "Move over, truffle pigs! There's a new food-finding champion in town!",
    "Looks like I hit the foodie jackpot! Time to dig in!",
    "I'm not just a squirrel, I'm a snack-seeking missile!",
    "Well, I'll be a squirrel's uncle! Look what I found buried here!",
    "Hold onto your acorns, folks! It's snack time, and I've got the goods!",
    "You can bury your nuts, but you can't hide them from me!",
    "I've got a one-track mind, and that track leads straight to food!",
    "Stop the presses! I've found the culinary discovery of the century!",
    "Call off the search party! I've found the missing ingredient: deliciousness!",
    "What's that rustling sound? Oh, just me, unearthing snacks like a boss!",
    "I've got the golden paw when it comes to finding buried treasures!",
    "The early squirrel gets the worm, or in this case, the nut!",
    "Eeny, meeny, miny, moe... Looks like this spot is where snacks grow!",
    "Bingo! I've hit the snack jackpot! Who's hungry?",
    "Move over, Gordon Ramsquirrel! I've got a new recipe: nuts, dirt, and deliciousness!",
    "I'm not just a squirrel, I'm a culinary connoisseur!",
    "Well, I'll be a monkey's uncle! Scratch that... I'll be a squirrel's uncle!",
    "You never know what you'll find when you start digging! Today, it's snacks!",
    "I'm like a foodie archaeologist, uncovering ancient snacks buried in the earth!",
    "Looks like I've stumbled upon a squirrel smorgasbord! Dig in, everyone!",
    "I've got a sixth sense for snacks, and it's tingling right now!",
    "This calls for a victory dance! I've found the holy grail of squirrel snacks!",
    "I may be small, but my appetite is mighty! And look what I've found to satisfy it!",
    "I'm like a squirrel detective, following the clues straight to deliciousness!",
    "Well, blow me down! Look what I found buried here! It's snack o'clock!",
}

-- Select a random line from the squirrelLines array
local randomLine = squirrelLines[math.random(#squirrelLines)]

-- Make the squirrel pet say the selected line
creature:say(randomLine, TALKTYPE_SAY)


    return true
end
