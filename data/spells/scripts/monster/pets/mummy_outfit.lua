

function onCastSpell(cid, variant)
local fromPos = cid:getPosition()
    local owner = cid:getMaster()
    local target = owner:getTarget()
	local targetposition = target:getPosition()
    local min = math.pow(owner:getPetLevel(), 1.1) 
    local max = math.pow(owner:getPetLevel(), 1.2) 
	local position = cid:getPosition()
    local players = Game.getSpectators(position, false, false, 8, 8)
	local t = math.random(min, max) * 60 * 1000  -- 5 minutes in milliseconds
    local condition = Condition(CONDITION_OUTFIT)
    condition:setOutfit({lookType = 65})
    condition:setTicks(t)

    for _, player in ipairs(players) do
        if player:isPlayer() then
            player:addCondition(condition)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
        end
    end
	
	local mummyLines = {
    "Peek-a-boo! Did I scare you, master?",
    "Hey there, daddy-o! Let's dance like ancient pharaohs!",
    "Watch me do the mummy dance, dad!",
    "Look, Dad! I've got bandages for days!",
    "Daddy, can I wrap you up like a mummy too?",
    "Check out my new wraps, pops! I'm stylish, huh?",
    "Dad, Am i old?!"
}

-- Select a random line from the mummyLines array
	local randomLine = mummyLines[math.random(#mummyLines)]

-- Make the mummy pet say the selected line
	cid:say(randomLine, TALKTYPE_SAY)

    return true
end