local combatpet1 = Combat()
local combatpoison1 = Combat()

for i, c in ipairs({combatpet1, combatpoison1}) do
    c:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
    c:setParameter(COMBAT_PARAM_EFFECT, 9)
    c:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 17)
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
    local averageDamage = calculateAverage(owner)
    local minDamage = averageDamage * 0.95
    local maxDamage = averageDamage * 1.05

    conditionpet1:setParameter(CONDITION_PARAM_PERIODICDAMAGE, math.random(minDamage, maxDamage))
    combatpet1:addCondition(conditionpet1)
end
 
function onCastSpell(creature, var, tar)
    Castpetpoison(creature:getId(), var)
	
	local targetmonster = creature:getTarget()	

local dworcLines = {
    "I'm a little dworc, short and stout!",
    "Look at my tiny hands and big feet!",
    "I may be small, but I'm mighty!",
    "I'm the cutest dworc you'll ever see!",
    "Tiny but fierce, that's me!",
    "I may be little, but my heart is big!",
    "I'm just a little dworc on a big adventure!",
    "I may be small, but I'm full of surprises!",
    "Watch out world, here comes the little dworc!",
    "I'm small in size but big in spirit!",
    "I'm just a little dworc with big dreams!",
    "I may be tiny, but I'm mighty!",
    "Even though I'm small, I'm still a dworc at heart!",
    "I may be little, but I've got a lot of love to give!",
    "I'm just a wee dworc exploring the world!",
    "Small but mighty, that's me!",
    "I'm a pint-sized dworc with a heart of gold!",
    "Don't let my size fool you, I'm full of energy!",
    "I may be little, but I've got a big personality!",
    "Look at me, I'm a dworc on a mission!",
    "I may be tiny, but I'm as brave as they come!",
    "I'm just a little dworc looking for adventure!",
    "Tiny dworc, big dreams!",
    "I may be small, but I'm ready for anything!",
    "I'm just a little dworc spreading joy wherever I go!",
    "Watch out world, here comes the little dworc!",
    "I may be small, but I'm mighty cute!",
    "I'm just a little dworc with a big heart!",
    "Small but mighty, that's me!",
    "I may be little, but I'm fierce!",
    "Look at me, I'm a dworc on a mission!",
    "I may be tiny, but I'm as brave as they come!",
    "I'm just a little dworc looking for adventure!",
    "Tiny dworc, big dreams!",
    "I may be small, but I'm ready for anything!",
    "I'm just a little dworc spreading joy wherever I go!",
    "Watch out world, here comes the little dworc!",
    "I may be small, but I'm mighty cute!",
    "I'm just a little dworc with a big heart!",
    "Small but mighty, that's me!",
    "I may be little, but I'm fierce!",
    "Look at me, I'm a dworc on a mission!",
    "I may be tiny, but I'm as brave as they come!",
    "I'm just a little dworc looking for adventure!",
    "Tiny dworc, big dreams!",
    "I may be small, but I'm ready for anything!",
    "I'm just a little dworc spreading joy wherever I go!",
    "Watch out world, here comes the little dworc!",
    "I may be small, but I'm mighty cute!",
    "I'm just a little dworc with a big heart!",
}

-- Select a random line from the dworcLines array
local randomLine = dworcLines[math.random(#dworcLines)]

	-- Make the night frog pet say the selected line

	local chanceToSay = math.random(1, 100)
	if chanceToSay <= 45 then
	-- Make the jelly pet say the selected line
		creature:say(randomLine, TALKTYPE_SAY)
	end


	
    return combatpet1:execute(creature, var)
end