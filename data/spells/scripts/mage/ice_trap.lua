local ITEM_ID = 6707 -- Replace with your item ID
local EFFECT_ON_CREATE = CONST_ME_ICEAREA
local EFFECT_ON_REMOVE = CONST_ME_POFF
local TRAP_DURATION = 5000 -- Duration in milliseconds


-- Spell to place trapping items around the target
function onCastSpell(creature, variant)
    local target = Creature(variant:getNumber())
    if not target then
        creature:sendTextMessage(MESSAGE_STATUS_SMALL, "Target not found.")
        return false
    end

    local targetPos = target:getPosition()
    local positions = {
        Position(targetPos.x - 1, targetPos.y - 1, targetPos.z),
        Position(targetPos.x, targetPos.y - 1, targetPos.z),
        Position(targetPos.x + 1, targetPos.y - 1, targetPos.z),
        Position(targetPos.x - 1, targetPos.y, targetPos.z),
        Position(targetPos.x + 1, targetPos.y, targetPos.z),
        Position(targetPos.x - 1, targetPos.y + 1, targetPos.z),
        Position(targetPos.x, targetPos.y + 1, targetPos.z),
        Position(targetPos.x + 1, targetPos.y + 1, targetPos.z),
    }

    -- Create items around the target
    for _, pos in ipairs(positions) do
        local item = Game.createItem(ITEM_ID, 1, pos)
        if item then
		
		 pos:sendMagicEffect(EFFECT_ON_CREATE)
		
            addEvent(function()
                if item then
                    item:remove() -- Remove the item after the trap duration
                    pos:sendMagicEffect(EFFECT_ON_REMOVE)
                end
            end, TRAP_DURATION)
        end
    end

    return true
end
