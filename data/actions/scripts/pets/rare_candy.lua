
local TYPE_ITEM, TYPE_MONSTER, TYPE_NPC = 0, 2, 3
local PET_LEVEL_UP = 1

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local pet = player:getPet()
    if not pet then
        player:sendCancelMessage("You don't have a pet.")
        return true
    end
    
    local petPos = target:getPosition()

    local master = target:getMaster()
    if not master then
        player:sendCancelMessage("Can only use this on your own pets.")
        return true
    end

    if target:getId() ~= pet.monsterId then
        player:sendCancelMessage("You can only feed your own pets.")
        return true
    end

    local petLevel = master:getStorageValue(STORAGEVALUE_PET_LVL)
    
    -- Increase pet level by 1
    master:setStorageValue(STORAGEVALUE_PET_LVL, petLevel + PET_LEVEL_UP)
    
    Game.sendAnimatedText("Level Up!", petPos, TEXTCOLOR_WHITE_EXP)
    target:say("Level up! "..pet.name.." leveled up!", TALKTYPE_WHISPER)
    toPosition:sendMagicEffect(36)

    item:remove(1)
    return true
end
