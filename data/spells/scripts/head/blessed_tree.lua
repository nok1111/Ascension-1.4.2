
local config = {
    summonMonster = "blessed tree", -- The name of the monster to be summoned
    effectOnSummon = 51, -- Effect to show on summoning
    maxRange = 7 -- Maximum range of the spell
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_NONE)


local function RemoveTree(creatureId)
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
    if not boots or boots:getId() ~= 38157 then
        player:sendCancelMessage("You must equip the Blessed Tree spell to use this effect.")
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


    -- Summon the monster
    local createdTree = Game.createMonster(config.summonMonster, targetPos, false, true)
    if createdTree then
        createdTree:setShader('magnetic')
        targetPos:sendMagicEffect(config.effectOnSummon)
        addEvent(RemoveTree, 30 * 1000, createdTree:getId())
    end

    return true
end
