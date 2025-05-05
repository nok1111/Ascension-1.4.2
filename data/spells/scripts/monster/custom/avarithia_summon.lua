local maxSummons = 4 
local summonName = "Lumiel" 
local summonPositions = { 
    {x = -2, y = -2}, -- Top-left corner
    {x = 2, y = -2},  -- Top-right corner
    {x = -2, y = 2},  -- Bottom-left corner
    {x = 2, y = 2}    -- Bottom-right corner
}
local summonDuration = 15000

local function summonMonsters(creature)
    local currentSummons = creature:getSummons() 
    local summonCount = #currentSummons

    -- If the creature already has summons, do not summon more
    if summonCount > 0 then
        if math.random(1, 6) == 1 then
            creature:say("Seems like you can't even handle my apostles properly!", TALKTYPE_MONSTER_SAY)
        end
        return false
    end

    local summons = {} 
    local positionIndex = 1 
    for i = 1, maxSummons do
        local relativePos = summonPositions[positionIndex]
        positionIndex = positionIndex + 1
        local summonPos = {
            x = creature:getPosition().x + relativePos.x,
            y = creature:getPosition().y + relativePos.y,
            z = creature:getPosition().z
        }

        -- Create the summon
        local summon = Game.createMonster(summonName, summonPos, true, false, creature)
        if summon then
            
            summon:setMaster(creature)

            -- Set the summon health to half of its average health
            local avgHealth = summon:getMaxHealth() or 100 
            summon:setMaxHealth(avgHealth / 2)
            table.insert(summons, summon)
            summon:getPosition():sendMagicEffect(426)
        end
    end


    addEvent(function()
        if not creature or creature:isRemoved() then
            return 
        end

        for _, summon in ipairs(summons) do
            if summon and not summon:isRemoved() then
                summon:remove()
            end
        end
    end, summonDuration)

    return true
end

function onCastSpell(creature, variant)
    if not creature or not summonMonsters(creature) then
        return false
    end
    return true
end
