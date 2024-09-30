local Rune_ID = 2269 --3160
local reagentId = 2260 --3147
local secondaryManaCost = 50 -- Example secondary mana cost

local vocationChargeChance = {
    [1] = { -- SORCERER vocation ID 1
        {extraMagicLevel = 5, chance = 10, extraCharges = {min = 1, max = 1}},
        {extraMagicLevel = 10, chance = 15, extraCharges = {min = 2, max = 3}},
        {extraMagicLevel = 20, chance = 25, extraCharges = {min = 3, max = 4}},
    },
    [2] = { -- DRUID vocation ID 2
        {extraMagicLevel = 8, chance = 12, extraCharges = {min = 1, max = 2}},
        {extraMagicLevel = 16, chance = 18, extraCharges = {min = 2, max = 3}},
        {extraMagicLevel = 30, chance = 30, extraCharges = {min = 3, max = 5}},
    },
    [3] = { -- PALADIN vocation ID 3
        {extraMagicLevel = 10, chance = 20, extraCharges = {min = 1, max = 2}},
        {extraMagicLevel = 20, chance = 25, extraCharges = {min = 2, max = 4}},
        {extraMagicLevel = 40, chance = 35, extraCharges = {min = 3, max = 5}},
    },
    [4] = { -- KNIGHT vocation ID 4
        {extraMagicLevel = 12, chance = 25, extraCharges = {min = 1, max = 2}},
        {extraMagicLevel = 24, chance = 30, extraCharges = {min = 2, max = 4}},
        {extraMagicLevel = 50, chance = 40, extraCharges = {min = 4, max = 6}},
    },
    -- Add other vocations as needed
}

function onCastSpell(creature, variant)
    local leftHand = creature:getSlotItem(CONST_SLOT_LEFT)
    local rightHand = creature:getSlotItem(CONST_SLOT_RIGHT)

    -- Check if the reagent item is in either the left or right hand slot
    if (not leftHand or leftHand:getId() ~= reagentId) and (not rightHand or rightHand:getId() ~= reagentId) then
        creature:sendTextMessage(MESSAGE_STATUS_SMALL, "You need to hold the reagent in your hand to cast this spell.")
        return false
    end

    local totalExtraCharges = 0
    local totalChance = 0
    local vocation = creature:getVocation():getId()
    local magicLevel = creature:getMagicLevel()

    if vocationChargeChance[vocation] then
        for _, checkpoint in ipairs(vocationChargeChance[vocation]) do
            if magicLevel >= checkpoint.extraMagicLevel then
                local minCharges = checkpoint.extraCharges.min
                local maxCharges = checkpoint.extraCharges.max
                totalExtraCharges = totalExtraCharges + math.random(minCharges, maxCharges)
                totalChance = totalChance + checkpoint.chance
            end
        end
    end

    local function handleRuneCreation(slotItem, slotType)
        local charges = 2
        if math.random(100) <= totalChance then
            charges = charges + totalExtraCharges
        end

        local rune = Game.createItem(Rune_ID, charges)
        if rune then
            slotItem:remove()
            creature:addItemEx(rune, true, slotType)
        end
        creature:getPosition():sendMagicEffect(13)
    end

    -- Handle both reagents if both hands have the reagent
    if leftHand and leftHand:getId() == reagentId and rightHand and rightHand:getId() == reagentId then
        if creature:getMana() >= secondaryManaCost then
            -- Remove both reagents and create runes in both slots
            creature:addMana(-secondaryManaCost)
            handleRuneCreation(leftHand, CONST_SLOT_LEFT)
            handleRuneCreation(rightHand, CONST_SLOT_RIGHT)
        else
            -- Use only the right hand reagent
            handleRuneCreation(rightHand, CONST_SLOT_RIGHT)
        end
    elseif rightHand and rightHand:getId() == reagentId then
        handleRuneCreation(rightHand, CONST_SLOT_RIGHT)
    elseif leftHand and leftHand:getId() == reagentId then
        handleRuneCreation(leftHand, CONST_SLOT_LEFT)
    end

    return true
end
