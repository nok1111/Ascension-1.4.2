local area = {
	{
		{0, 0, 1, 0, 0},
		{0, 1, 3, 1, 0},
		{1, 0, 0, 0, 1},
	}
	,
	{
		{0, 0, 1, 0, 0},
		{0, 1, 1, 1, 0},
		{1, 0, 3, 0, 1},
	}
	,
	{
		{0, 0, 1, 0, 0},
		{0, 1, 1, 1, 0},
		{1, 0, 1, 0, 1},
		{0, 0, 3, 0, 0},
	}
	,
	{
		{0, 0, 1, 0, 0},
		{0, 1, 1, 1, 0},
		{1, 0, 1, 0, 1},
		{0, 0, 1, 0, 0},
		{0, 0, 3, 0, 0},
	}
	,
	{
		{0, 0, 1, 0, 0},
		{0, 1, 1, 1, 0},
		{1, 0, 1, 0, 1},
		{0, 0, 1, 0, 0},
		{0, 0, 0, 0, 0},
		{0, 0, 3, 0, 0},
	}
}

local spell = SpellLib:new(area)

spell:doSetCombatParam(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
spell:doSetCombatParam(COMBAT_PARAM_EFFECT, CONST_ME_NEWEARTHQUAKE)
spell:doSetCombatParam(COMBAT_PARAM_BLOCKARMOR, true)
spell:doSetCombatParam(COMBAT_PARAM_BLOCKSHIELD, true)
spell:doSetCombatFormula(COMBAT_FORMULA_LEVELMAGIC, {-0.6, -0, -1.0, 0})

spell:setInterval(200)

local function startCombat(param)
	local result = spell:startCombat(param)


		addEvent(startCombat, spell:getInterval(1), param)


	return result
end

function onCastSpell(cid, var)
	local player = Player(cid)
	--player:canMove(false)

	return startCombat({cid = cid, var = var, player = player, count = 0})
end
