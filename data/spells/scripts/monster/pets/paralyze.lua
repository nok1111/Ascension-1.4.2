	local combat = Combat()
	combat:setParameter(COMBAT_PARAM_EFFECT, 422)

	local condition = Condition(CONDITION_PARALYZE)
	condition:setParameter(CONDITION_PARAM_TICKS, 3000)
	condition:setFormula(-0.55, 0, -0.75, 0)
	combat:addCondition(condition)
	combat:addCondition(condition)

function onCastSpell(creature, var)
local master = creature:getMaster()
local pet = master:getPet()
	
	
	
	       	local paralyze_lines = {
"Got 'em! They're not moving!",
"Freeze, baddie! My friend needs a moment.",
"Oops, did I make you stop?",
"Hold still, we're just getting started!",
"They're stuck, thanks to me!",
"Look, no more moving from that one!",
"A little pause for our cause!",
"Tag! You're it and you can't leave!",
"And... freeze frame!",
"Hold that pose, villain!",

}

-- Select a random line from the paralyze_lines array
local randomLine = paralyze_lines[math.random(#paralyze_lines)]

-- Make the specter pet say the selected line
creature:say(randomLine, TALKTYPE_SAY)


	return combat:execute(creature, var)
end