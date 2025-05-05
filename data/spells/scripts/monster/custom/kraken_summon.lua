local maxSummons = 8
local summonName = "Tentacle of the Kraken"
local summonPositions = {
    {x = -3, y = -3}, -- Top-left corner
    {x = 3, y = -3},  -- Top-right corner
    {x = -3, y = 3},  -- Bottom-left corner
    {x = 3, y = 3},   -- Bottom-right corner
    {x = 0, y = -4},  -- Top-center
    {x = 0, y = 4},   -- Bottom-center
    {x = -4, y = 0},  -- Left-center
    {x = 4, y = 0}    -- Right-center
}

local function summonMonsters(creature)
    local currentSummons = creature:getSummons()
    local summonCount = #currentSummons

    -- If the creature already has summons, do not summon more
    if summonCount > 0 then
        if math.random(1, 4) == 1 then
            creature:say("If my tentacles overwhelm you, how will you survive my wrath?", TALKTYPE_MONSTER_SAY)
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

        local summon = Game.createMonster(summonName, summonPos, true, false, creature)

        if summon then
            summon:setMaster(creature)

        end
    end

    addEvent(function()
        if not creature or creature:isRemoved() then
            return
        end

        local allDead = true
        for _, summon in ipairs(summons) do
            if summon and not summon:isRemoved() then
                allDead = false
                break
            end
        end

        if allDead then
            creature:say("Tremble, for my tentacles are ready to crush all!", TALKTYPE_MONSTER_SAY)
        end
    end, 100)

    return true
end

function onCastSpell(creature, variant)
    if not creature or not summonMonsters(creature) then
        return false
    end
    return true
end
