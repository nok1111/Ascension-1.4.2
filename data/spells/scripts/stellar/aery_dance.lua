local config = {
    projectileEffect = 179, -- The projectile effect
    combatEffect = 552, -- The combat effect
    spellCount = 3, -- Number of projectiles to shoot
    cooldown = 200, -- Cooldown in milliseconds
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, config.combatEffect)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

function onGetFormulaValues(player, skill, attack, factor)
    local magic = player:getMagicLevel()
    local power = magic * attack
    local level = player:getLevel()
    

    local min = ((level / 5) + (power * 0.08) + (attack * 3) + 200) / 3
    local max = ((level / 5) + (power * 0.09) + (attack * 3.5) + 250) / 2.5
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function findAery(creatureId)
    local creature = Creature(creatureId)
    if not creature then
        return nil
    end

    local summons = creature:getSummons()
    for _, summon in ipairs(summons) do
        if summon:getName() == "Aery" then
            return summon:getId()
        end
    end
    return nil
end

local function shootProjectile(creatureId, aeryId, targetId, count)
    local aery = Creature(aeryId)
    local target = Creature(targetId)
    if not aery or not target or count > config.spellCount then
        return
    end

    local aeryPos = aery:getPosition()
    local targetPos = target:getPosition()

    aeryPos:sendDistanceEffect(targetPos, config.projectileEffect)
    combat:execute(creatureId, positionToVariant(targetPos))

    addEvent(shootProjectile, config.cooldown, creatureId, aeryId, targetId, count + 1)
end

function onCastSpell(creature, var)
    local creatureId = creature:getId()
    local target = creature:getTarget()
    if not target then
        creature:sendCancelMessage("You need to target a creature to use this spell.")
        return false
    end

    local aeryId = findAery(creatureId)
    if not aeryId then
        creature:sendCancelMessage("You need to have Aery summoned to use this spell.")
        return false
    end

    shootProjectile(creatureId, aeryId, target:getId(), 1)

    return true
end
