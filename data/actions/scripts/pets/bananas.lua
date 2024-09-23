
local TYPE_ITEM, TYPE_MONSTER, TYPE_NPC = 0, 2, 3
local PET_EXP = 50

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

    local currentExp = master:getStorageValue(STORAGEVALUE_PET_EXP)
    local petLevel = master:getStorageValue(STORAGEVALUE_PET_LVL)
    local activePetId = master:getStorageValue(STORAGEVALUE_PET_ID)
    
    -- Call the addPetExp function to add experience
    addPetExp(master, PET_EXP)
    
    Game.sendAnimatedText(PET_EXP, petPos, TEXTCOLOR_WHITE_EXP)
    target:say("Berries! "..pet.name.." likes berries!", TALKTYPE_WHISPER)
    toPosition:sendMagicEffect(36)

    item:remove(1)
    return true
end
