local config = {
	amount = 6
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)
combat:setParameter(COMBAT_PARAM_CREATEITEM, ITEM_WILDGROWTH)

local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGYBALL)
combat1:setParameter(COMBAT_PARAM_CREATEITEM, ITEM_MAGICWALL)

local function expandWall(cid, combatParam, pos)
	local creature = Creature(cid)
	if creature then
		local dir = creature:getDirection()
		if dir == 0 then
			pos.y = pos.y - 1
		elseif dir == 1 then
			pos.x = pos.x + 1
		elseif dir == 2 then
			pos.y = pos.y + 1
		elseif dir == 3 then
			pos.x = pos.x - 1
		end
		if creature:getPosition():isSightClear(pos, true) or combatParam == combat1 then
			if getTilePzInfo(pos) == FALSE then
				if creature:getPathTo(pos) ~= false then
					variant = positionToVariant(pos)
					combatParam:execute(creature, variant)
				end
			end
		end
	end
end

function onCastSpell(creature, variant, isHotkey)

	local cid = creature:getId()

	local Thingy = variant:getString()
	local combatParam = 0
	if Thingy == "wg" or Thingy == "wild growth" or Thingy == "" then
		combatParam = combat
	elseif Thingy == "mw" or Thingy == "magic wall" then
		combatParam = combat1
	else
		Creature(cid):sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		Creature(cid):getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end
	
	local pos = Creature(cid):getPosition()
	for i = 0, config.amount, 1 do
		addEvent(expandWall, i*500, cid, combatParam, pos)
	end
	return true
end
