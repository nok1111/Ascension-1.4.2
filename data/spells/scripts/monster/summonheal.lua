function getLowestHealthTarget(cid)
    local owner = Creature(cid):getMaster()
    if not owner then
        return nil
    end

    local lowestHealthTarget = nil
    local lowestHealthPercentage = 1 -- Start with 100%

    local spectators = Game.getSpectators(owner:getPosition(), false, false, 7, 7, 7, 7)
    for _, spectator in ipairs(spectators) do
        if spectator:isPlayer() or (spectator:isMonster() and spectator:getMaster() and spectator:getMaster():getId() == owner:getId()) then
            local healthPercentage = spectator:getHealth() / spectator:getMaxHealth()
            if healthPercentage < lowestHealthPercentage then
                lowestHealthPercentage = healthPercentage
                lowestHealthTarget = spectator
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

    local min = (owner:getLevel() / 5) + (owner:getMagicLevel() * 0.5) + 5
    local max = (owner:getLevel() / 5) + (owner:getMagicLevel() * 0.7) + 8

    local extrahealing = owner:getSpecialSkill(SPECIALSKILL_EXTRAHEALING)
    if extrahealing > 0 then
        min = min * (1 + (extrahealing / 100))
        max = max * (1 + (extrahealing / 100))
    end

    local position = target:getPosition()
    position:sendMagicEffect(701)
    cid:getPosition():sendDistanceEffect(position, 112)
    target:addHealth(math.random(min, max))

    return true
end
