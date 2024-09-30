

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, 14)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combat:setArea(createCombatArea(AREA_CIRCLE2X2))

function onTargetCreature(creature, target)
	if not creature then
        return false
    end	
	--You can change the formula to be anything from creature (the player that cast) and target
	local min = (creature:getLevel() / 5) + (creature:getMagicLevel() * 35) + 100
	local max = (creature:getLevel() / 5) + (creature:getMagicLevel() * 35) + 120
	
	--creature:say("creature!", TALKTYPE_MONSTER_SAY)
	
	if not target:isMonster() then
	target:addHealth(math.random(min, max))
	target:getPosition():sendMagicEffect(CONST_ME_HPUP)
	end

	return true
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")


function onCastSpell(creature, variant, target)

        combat:execute(creature:getMaster(), variant)
        creature:remove()
		
    
    return true
end


