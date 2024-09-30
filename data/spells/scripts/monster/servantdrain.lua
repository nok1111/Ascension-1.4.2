local function redirectingShoot(masterId, monsterPosition, manaDrained)
  local master = Creature(masterId)
  if master then
    master:addMana(manaDrained)
    monsterPosition:sendDistanceEffect(master:getPosition(), 67)
    master:getPosition():sendMagicEffect(CONST_ME_ENERGYHIT)
  end
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)

combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_GRAYPLASMA)


function onTargetCreature(creature, target)
	if creature then
		local master = creature:getMaster()
		if master then
			local manaDrained = (master:getLevel() / 3) + (master:getMagicLevel() * 0.18)
			addEvent(redirectingShoot, 50, master:getId(), creature:getPosition(), manaDrained)
		end
	end
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local function severalCast(creatureId, var)
	local creature = Creature(creatureId)
	if not creature then
		return true
	end
	combat:execute(creature, var)
end

function onCastSpell(creature, variant)
	for i = 1, 5 do
		addEvent(severalCast, 100 * i, creature:getId(), variant)
	end
end
