local maxSummons = 8

function onCastSpell(creature, variant)
    if not creature then
        return false
    end

    local rajivpos = creature:getPosition()

    for i = 1, maxSummons do
        local rajsum = Game.createMonster("Dread Abomination", { x = rajivpos.x + math.random(-4, 4), y = rajivpos.y + math.random(-4, 4), z = rajivpos.z }, false, true)
        if rajsum then
            rajsum:setMaster(creature)
            rajsum:getPosition():sendMagicEffect(467)
        end
    end

    creature:say("Emerald Corruption!!", TALKTYPE_ORANGE_2)
    return true
end