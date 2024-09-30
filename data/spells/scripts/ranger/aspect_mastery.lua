local ASPECT_MODE = 50010 -- Adjust the storage value as needed

function removeArcherPet(creatureId)
    local c = Creature(creatureId)
    if not c then return false end

    c:remove()
end

-- Define the monster pets for level ranges
local petOptions = {
    { minLevel = 125, maxLevel = 249, pet = "Hunting Wolf" },
    { minLevel = 250, maxLevel = 1000, pet = "Elite Wolf" },
    -- Add more level range and pet mappings as needed
}

local function getAvailablePet(player)
    local playerLevel = player:getLevel()

    for _, option in ipairs(petOptions) do
        if playerLevel >= option.minLevel and playerLevel <= option.maxLevel then
            return option.pet
        end
    end

    return nil
end

local function getArcherpetsCount(player)
    local summonCount = 0
    local summons = player:getSummons()

    for _, summon in ipairs(summons) do
        local summonName = summon:getName():lower()
        for _, option in ipairs(petOptions) do
            if summonName == option.pet:lower() then
                summonCount = summonCount + 1
                break  -- Exit inner loop once a match is found
            end
        end
    end

    return summonCount
end

function onCastSpell(creature, variant)
    local player = creature:getPlayer()
    if not player then
        return false
    end
    print("tiggered")
    local currentMode = player:getStorageValue(ASPECT_MODE)

    if currentMode == 0 or currentMode == -1 then

        -- Switch to Demolition Mode
        player:setStorageValue(ASPECT_MODE, 1)
        local summons = player:getSummons()

        for _, summon in ipairs(summons) do
            local summonName = summon:getName():lower()
            for _, option in ipairs(petOptions) do
                if summonName == option.pet:lower() then
                    removeArcherPet(summon:getId())
                    break  -- Exit inner loop once a match is found
                end
            end
        end

        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Demolition Mode activated.")
        print(player:getStorageValue(ASPECT_MODE))

    elseif currentMode == 1 then

        -- Switch to Beast Mode
        local healthAmount = player:getMaxHealth()
        local halfHp = healthAmount * 2.5

        if getArcherpetsCount(player) >= 1 then
            player:sendCancelMessage("You can't have more of these summons.")
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return false
        end

        -- Get available pet based on player's level range
        local selectedPet = getAvailablePet(player)

        if not selectedPet then
            player:sendCancelMessage("No pet available for your level range.")
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return false
        end

        -- Create summon
        local summonPet = Game.createMonster(selectedPet, player:getPosition())
		local pethp = player:getMaxHealth()

        if not summonPet then
            player:sendCancelMessage("Failed to create summon.")
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return false
        end

        player:addSummon(summonPet)
		
        summonPet:setMaxHealth(halfHp * pethp)
        summonPet:setHealth(halfHp * pethp)
        summonPet:registerEvent("Summon_Damage")

        local deltaSpeed = math.max(player:getBaseSpeed() - summonPet:getBaseSpeed(), 0)
        summonPet:changeSpeed(deltaSpeed * 0.8)

        if player:getTarget() then
            summonPet:setTarget(player:getTarget())
            local path = summonPet:getPathTo(player:getTarget():getPosition())
            if path then
                summonPet:move(path[1])
            end
        end

        player:say("Hear my call!", TALKTYPE_MONSTER_SAY)

        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Beast Mode activated.")

        -- Remove Demolition Mode storage
        player:setStorageValue(ASPECT_MODE, -1)
        print(player:getStorageValue(ASPECT_MODE))
    end

    return true
end
