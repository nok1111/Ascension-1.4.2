function getLowestHealthTarget(cid)
    local owner = Creature(cid):getMaster()
    if not owner then
        return nil
    end

    local lowestHealthTarget = nil
    local lowestHealthPercentage = 1 -- Start with 100%

    local spectators = Game.getSpectators(owner:getPosition(), false, false, 7, 7, 7, 7)
    for _, spectator in ipairs(spectators) do
        if spectator:isPlayer() then
            local ownerParty = owner:getParty()
            local spectatorParty = spectator:getParty()
            -- Only heal the owner or their party members
            if spectator == owner or (ownerParty and spectatorParty and ownerParty == spectatorParty) then
                local healthPercentage = spectator:getHealth() / spectator:getMaxHealth()
                if healthPercentage < lowestHealthPercentage then
                    lowestHealthPercentage = healthPercentage
                    lowestHealthTarget = spectator
                end
            end
        end
    end

    return lowestHealthTarget
end

function onCastSpell(cid, var)
    local owner = Creature(cid):getMaster()
    if not owner then
        return false
    end

    local target = getLowestHealthTarget(cid)
    if not target then
        return false
    end

    local min = (owner:getLevel() / 5) + (owner:getMagicLevel() * 0.25) + 5
    local max = (owner:getLevel() / 5) + (owner:getMagicLevel() * 0.32) + 8

    local LuminousBond = owner:getStorageValue(PassiveSkills.LuminousBond) or 0
    if LuminousBond > 0 then
        min = min + (min * (LuminousBond / 100))
        max = max + (max * (LuminousBond / 100))
    end

    local position = target:getPosition()
    position:sendMagicEffect(602)
    cid:getPosition():sendDistanceEffect(position, 166)
    target:addHealth(math.random(min, max))

    return true
end
