local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_NONE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)

local area = createCombatArea(AREA_CIRCLE3X3)
combat:setArea(area)

local maxsummons = 8

function onCastSpell(creature, var)
	local summoncount = creature:getSummons()
	if #summoncount < 8 then
		for i = 1, maxsummons - #summoncount do
			local mid = Game.createMonster("Mutated Rat", { x=creature:getPosition().x+math.random(-4, 4), y=creature:getPosition().y+math.random(-4, 4), z=creature:getPosition().z })
    			if not mid then
					return
				end
			mid:setMaster(creature)
			mid:getPosition():sendMagicEffect(CONST_ME_PURPLESMOKE)
		end
	end
	return combat:execute(creature, var)
end