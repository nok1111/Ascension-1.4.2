--item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This pet belongs to %s"):format(item:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))


petEvents = {}

function updatePlayerStamina(cid, extraStamina)
    local player = Creature(cid)
    if player then
        player:setStamina(player:getStamina() + extraStamina)
        stopEvent(petEvents[player:getId()])
        petEvents[player:getId()] = addEvent(updatePlayerStamina, 5 * 60 * 1000, cid, 10)
    end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local strId = tostring(item:getId())
    local activePetId = player:getStorageValue(STORAGEVALUE_PET_ID);
    local currentSummon = player:getSummons()
    local petId = item:getAttribute(ITEM_ATTRIBUTE_PETID)
	
	if item:hasAttribute(ITEM_ATTRIBUTE_PETID) == false then
        item:setAttribute(ITEM_ATTRIBUTE_PETID, 0)
        petId = 0
    end

    --[[if activePetId <= 0 and currentSummon and #currentSummon > 0 then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You can't summon pet when You have other summon creature!")
        return false
    end]]

    if activePetId > 0 and activePetId ~= petId then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You have to hide your current pet before summon new one!")
        return false
    end

  
    if item:getAttribute(ITEM_ATTRIBUTE_OWNER) == 0 then
        item:setAttribute(ITEM_ATTRIBUTE_OWNER, player:getAccountId())
		item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ("%s \n This pet belongs to %s"):format(item:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION), player:getName()))
        player:sendTextMessage(MESSAGE_INFO_DESCR, "[EGG] You are the owner of this egg")
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "[Pet System] You can name pets by using !petname + new name")
    else
        if item:getAttribute(ITEM_ATTRIBUTE_OWNER) == player:getAccountId() then
            if petId > 0 then
                --print("1|petId = "..tostring(petId))
                local activePetId = player:getStorageValue(STORAGEVALUE_PET_ID);
                if activePetId > 0 then
                    --print("Hide pet, update")
                    player:setStorageValue(STORAGEVALUE_PET_ID, 0);
                    local petLvl = player:getStorageValue(STORAGEVALUE_PET_LVL)
                    local petExp = player:getStorageValue(STORAGEVALUE_PET_EXP)
                    player:updatePet(activePetId, petLvl, petExp)
                    player:hidePet(activePetId)
                    stopEvent(petEvents[player:getId()])
                else
                    --print("Respawn pet")
                    player:respawnPet(petId, petTypeToPetName[egg2PetType[strId]])
                    player:setStorageValue(STORAGEVALUE_PET_ID, petId)
					local activePet = player:getPet()
                    if activePet then
                        player:setStorageValue(STORAGEVALUE_PET_LVL, activePet.level)
                        player:setStorageValue(STORAGEVALUE_PET_EXP, activePet.exp)
                    end
                    petEvents[player:getId()] = addEvent(updatePlayerStamina, 5 * 60 * 1000, player:getId(), 10)
                end
            else
                --create new pet and give it to player, in this ex will be common dog
                --print("pet to select:"..tostring(petTypeToPetName[egg2PetType[strId]]))
                local newPetId = player:summonPet(petTypeToPetName[egg2PetType[strId]])
                if newPetId > 0 then
                    --print("2|petId = "..tostring(newPetId))
                    item:setAttribute(ITEM_ATTRIBUTE_PETID, newPetId)
                    player:setStorageValue(STORAGEVALUE_PET_ID, newPetId)
                    player:setStorageValue(STORAGEVALUE_PET_LVL, 1)
                    player:setStorageValue(STORAGEVALUE_PET_EXP, 1)
                    petEvents[player:getId()] = addEvent(updatePlayerStamina, 5 * 60 * 1000, player:getId(), 10)
                end
            end
        else
            player:sendTextMessage(MESSAGE_INFO_DESCR, "This egg doesn't belong to You!")
        end
    end
    return true
end