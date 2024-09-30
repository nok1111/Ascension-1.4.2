local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_NONE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)

local area = createCombatArea(AREA_CIRCLE3X3)
combat:setArea(area)

local maxsummons = 8

function onCastSpell(creature, var)
	local summoncount = creature:getSummons()
	
		for i = 1, 3 do
			local mid = Game.createMonster("Godria Link", { x=creature:getPosition().x+math.random(-2, 2), y=creature:getPosition().y+math.random(-2, 2), z=creature:getPosition().z })
    			if not mid then
					return
				end
			mid:setMaster(creature)
		end
	
	return combat:execute(creature, var)
end