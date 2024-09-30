function onCastSpell(creature, variant)
	local monsterName = variant:getString()
	local monsterType = MonsterType(monsterName)




local summons = {
    -- Monster name, percentage
    {"Demon Skeleton", 60},
    {"Lich", 50},
    {"Vampire", 50},
    {"Vampire Bride", 45},
    {"Vampire Viscount", 35},
    {"Undead Dragon", 30},
    {"Vampire", 25},
    {"Vampire Bride", 20},
    {"Vampire Viscount", 10},
    {"Undead Dragon", 1}   
}

local Max = 0
for i, v in pairs(summons) do
    summons[i][3] = Max
    Max = Max + v[2]
end

math.randomseed(os.time())
local monster = math.random(0, Max)
for _, v in pairs(summons) do
    if(monster >= v[3] and monster < (v[2] + v[3])) then
        Game.createMonster(v[1], creature:getPosition())
        break
    end
end


	if not getPlayerFlagValue(creature, PlayerFlag_CanSummonAll) then
		if not monsterType:isSummonable() then
			creature:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
			creature:getPosition():sendMagicEffect(CONST_ME_POFF)
			return false
		end

		if #creature:getSummons() >= 4 then
			creature:sendCancelMessage("You cannot summon more creatures.")
			creature:getPosition():sendMagicEffect(CONST_ME_POFF)
			return false
		end
	end

	local manaCost = monsterType:getManaCost()
	if creature:getMana() < manaCost and not getPlayerFlagValue(creature, PlayerFlag_HasInfiniteMana) then
		creature:sendCancelMessage(RETURNVALUE_NOTENOUGHMANA)
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	local position = creature:getPosition()
	local summon = Game.createMonster(v[1], creature:getPosition())


local Max = 0
for i, v in pairs(summons) do
    summons[i][3] = Max
    Max = Max + v[2]
end

math.randomseed(os.time())
local monster = math.random(0, Max)
for _, v in pairs(summons) do
    if(monster >= v[3] and monster < (v[2] + v[3])) then
        Game.createMonster(v[1], creature:getPosition())
        break
    end
end

	creature:addMana(-manaCost)
	creature:addManaSpent(manaCost)
	creature:addSummon(summon)
	position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	summon:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
