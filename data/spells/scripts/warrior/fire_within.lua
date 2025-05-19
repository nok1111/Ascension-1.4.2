local config = {
    initialExplosionRadius = 1, -- Initial radius of the explosion
    maxExplosionRadius = 4, -- Maximum radius of the explosion
    explosionEffect = 540, -- Effect for the explosions
    damageType = COMBAT_FIREDAMAGE, -- Damage type
    explosionCount = 5, -- Number of explosions
    explosionInterval = 500, -- Interval between explosions in milliseconds
    burnEffect = CONST_ME_FIREAREA, -- Effect for burning condition
    burnDuration = 5000, -- Duration of the burning condition in milliseconds
    burnInterval = 1000, -- Interval for burning damage in milliseconds
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, config.damageType)
combat:setParameter(COMBAT_PARAM_EFFECT, config.explosionEffect)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)

function onGetFormulaValues(player, skill, attack, factor)
    local power = skill * attack 
    local level = player:getLevel()
    local magic = player:getMagicLevel()

    local min = ((level / 5) + (power * 0.08) + (attack * 3) + 185) / 4.2
    local max = ((level / 5) + (power * 0.09) + (attack * 3.5) + 200) / 3.5
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function isExcludedTarget(creature, target)
    if not creature or not target then
        return true
    end

    -- Exclude party members and their summons
    if creature:isPlayer() and target:isPlayer() then
        local creatureParty = creature:getParty()
        local targetParty = target:getParty()
        if creatureParty and targetParty and creatureParty == targetParty then
            return true
        end
    end
    if target:isMonster() and target:getMaster() then
        local master = target:getMaster()
        if master:isPlayer() and creature:getParty() and master:getParty() == creature:getParty() then
            return true
        end
    end

    -- Secure mode check to exclude non-party players and their summons
    local player = creature:isPlayer() and creature or creature:getMaster()
    if player and player:hasSecureMode() then
        if target:isPlayer() or (target:isMonster() and target:getMaster() and target:getMaster():isPlayer()) then
            return true
        end
    end
    
    return false
end


local function applyExplosionDamage(creature, position, radius)
    local spectators = Game.getSpectators(position, false, false, radius, radius, radius, radius)
    
    for _, target in ipairs(spectators) do
        if target and target:isCreature() and target:getId() ~= creature:getId() and not isExcludedTarget(creature, target) then
            combat:execute(creature, positionToVariant(target:getPosition()))
			--target:attachEffectById(12, true)

        end
    end
end

local function createExplosions(creatureId, remainingExplosions, currentRadius)
    local creature = Creature(creatureId)
    if not creature or remainingExplosions <= 0 then
        return
    end

    local position = creature:getPosition()
    position:sendMagicEffect(config.explosionEffect)
    applyExplosionDamage(creature, position, currentRadius)

    local nextRadius = math.min(currentRadius + 1, config.maxExplosionRadius)
    addEvent(createExplosions, config.explosionInterval, creatureId, remainingExplosions - 1, nextRadius)
end

function onCastSpell(creature, variant)
    createExplosions(creature:getId(), config.explosionCount, config.initialExplosionRadius)
	
		local positionnube = creature:getPosition()
		positionnube.x = creature:getPosition().x + 3
		positionnube.y = creature:getPosition().y + 3
        positionnube:sendMagicEffect(654)
		
		local positionnube2 = creature:getPosition()
		positionnube2.x = creature:getPosition().x + 3
		positionnube2.y = creature:getPosition().y + 3
        positionnube2:sendMagicEffect(655)
	
    return true
end
