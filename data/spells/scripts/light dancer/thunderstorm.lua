local config = {
    distanceEffect = 36, -- The ID of the distance effect to be used
    summonMonster = "energy orb", -- The name of the monster to be summoned
    effectOnSummon = 60, -- Effect to show on summoning
    maxRange = 7 -- Maximum range of the spell
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_NONE)


function removePet(creatureId)
    local c = Creature(creatureId)
    if not c then return false end

    c:remove()
end

function onCastSpell(creature, variant)
    
    local creaturePos = creature:getPosition()
	local target = creature:getTarget()
    local targetPos = target:getPosition()
    -- Calculate the direction and send the distance effect
    creaturePos:sendDistanceEffect(targetPos, config.distanceEffect)

    -- Add an event to summon the monster at the target position after the effect reaches
    addEvent(function()
        -- Summon the monster
        local summonedMonster = Game.createMonster(config.summonMonster, targetPos, false, true)
        if summonedMonster then
			creature:addSummon(summonedMonster)
            targetPos:sendMagicEffect(config.effectOnSummon)
			addEvent(removePet, 5 * 1000, summonedMonster:getId())
			 summonedMonster:sendProgressbar(5 * 1000, false)
        end
    end, 300) -- Adjust the delay as needed for the distance effect to reach the target

    return true
end
