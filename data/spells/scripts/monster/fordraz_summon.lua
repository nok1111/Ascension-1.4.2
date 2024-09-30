


local frodraz_pos = {   
	Position(3473, 3790, 4), -- position of energy wall
	Position(3473, 3800, 4), -- position of energy wall
	Position(3484, 3800, 4), -- position of energy wall
	Position(3484, 3790, 4), -- position of energy wall

}

local floor_fordraz_tile1 = Tile(frodraz_pos[1])  
local floor_fordraz_tile2 = Tile(frodraz_pos[2]) 
local floor_fordraz_tile3 = Tile(frodraz_pos[3]) 
local floor_fordraz_tile4 = Tile(frodraz_pos[4]) 




function onCastSpell(creature, var)
if not creature then
return false
end
	--and #summons < 1
local summons = creature:getSummons()
if #summons < 4 then
	creature:say("Come here my little pets!", TALKTYPE_ORANGE_2)
	--creature:say("I Need to do this Myself!", TALKTYPE_MONSTER_SAY)
	creature:getPosition():sendMagicEffect(170)
	
		local summon1 = Game.createMonster("corrupted anomaly", Position(3473, 3790, 4), true, true) --left
		local summon2 = Game.createMonster("corrupted anomaly", Position(3473, 3800, 4), true, true) --right
		local summon3 = Game.createMonster("corrupted anomaly", Position(3484, 3800, 4), true, true) --right
		local summon4 = Game.createMonster("corrupted anomaly", Position(3484, 3790, 4), true, true) --right

		creature:addSummon(summon1)
		creature:addSummon(summon2)
		creature:addSummon(summon3)
		creature:addSummon(summon4)
		
		frodraz_pos[1]:sendMagicEffect(56)
		frodraz_pos[2]:sendMagicEffect(56)
		frodraz_pos[3]:sendMagicEffect(56) 
		frodraz_pos[4]:sendMagicEffect(56) 	
		return true
end		

	return true
end