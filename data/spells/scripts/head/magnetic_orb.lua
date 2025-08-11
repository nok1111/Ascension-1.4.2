
local config = {
    distanceEffect = 36, -- The ID of the distance effect to be used
    summonMonster = "energy orb", -- The name of the monster to be summoned
    effectOnSummon = 60, -- Effect to show on summoning
    maxRange = 7 -- Maximum range of the spell
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_NONE)


local function Removeorb(creatureId)
    local c = Creature(creatureId)
    if not c then return false end

    c:remove()
end


function onCastSpell(creature, variant, isHotkey)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    -- Check if boots are equipped in feet slot
    local boots = player:getSlotItem(CONST_SLOT_HEAD)
    if not boots or boots:getId() ~= 38167 then
        player:sendCancelMessage("You must equip the Magnetic Orb spell to use this effect.")
        return false
    end

    local targetPos = variant:getPosition()
    if not targetPos then
        player:sendCancelMessage("No target position.")
        return false
    end

    local tile = Tile(targetPos)
    if not tile or tile:hasFlag(TILESTATE_BLOCKSOLID) then
        player:sendCancelMessage("You can't teleport there.")
        return false
    end

        local creaturePos = creature:getPosition()

        -- Calculate the direction and send the distance effect
        creaturePos:sendDistanceEffect(targetPos, config.distanceEffect)
    
        -- Add an event to summon the monster at the target position after the effect reaches
        addEvent(function()
            -- Summon the monster
            local summonedMonster = Game.createMonster(config.summonMonster, targetPos, false, true)
            if summonedMonster then
                creature:addSummon(summonedMonster)
                summonedMonster:attachEffectById(128, true)
                targetPos:sendMagicEffect(config.effectOnSummon)
                addEvent(Removeorb, 5 * 1000, summonedMonster:getId())
            end
        end, 300) -- Adjust the delay as needed for the distance effect to reach the target

    return true
end
