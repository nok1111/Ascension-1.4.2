


local experiment_pos = {   
	Position(4157, 4063, 6), -- position of energy wall
	Position(4157, 4081, 6), -- position of energy wall

}

local tube_tile1 = Tile(experiment_pos[1])  
local tube_tile2 = Tile(experiment_pos[2]) 




function onCastSpell(creature, var)
if not creature then
return false
end
	creature:say("Come out my creatures! show them the true meaning of fear!", TALKTYPE_ORANGE_2)
	--creature:say("I Need to do this Myself!", TALKTYPE_MONSTER_SAY)
	creature:getPosition():sendMagicEffect(CONST_ME_FIREATTACK)
	
		Game.createMonster("putrid experiment", Position(4157, 4064, 6), true, true) --left
		Game.createMonster("putrid experiment", Position(4157, 4080, 6), true, true) --right

		
		experiment_pos[1]:sendMagicEffect(283)
		experiment_pos[2]:sendMagicEffect(283)  

	return true
end