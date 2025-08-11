local combat = Combat()

combat:setParameter(COMBAT_PARAM_EFFECT, 522)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 123)
combat:setParameter(COMBAT_PARAM_CREATEITEM, 40258)
combat:setArea(createCombatArea(AREA_WAVE6, AREADIAGONAL_WAVE6))

function onCastSpell(creature, variant, isHotkey)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    -- Check if boots are equipped in feet slot
    local boots = player:getSlotItem(CONST_SLOT_FEET)
    if not boots or boots:getId() ~= 9933 then
        player:sendCancelMessage("You must equip the Boots of the Salamander to use this effect.")
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

    return combat:execute(creature, variant)
end
