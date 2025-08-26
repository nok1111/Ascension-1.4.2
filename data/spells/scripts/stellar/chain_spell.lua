local config = {
    speed = 150, -- time between each target
    mfx = 48, -- magic effect
    mfx2 = 571, -- magic effect
    dfx = 165, -- distance effect
    element = COMBAT_HOLYDAMAGE,
    xradius = 2, -- choose your size <->
    yradius = 2 -- choose your size ^ V
}

-- Define the combat object with the custom parameters and callback
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

function onGetFormulaValues(player, skill, attack, factor)
    local magic = player:getMagicLevel()
    local power = skill * attack
    local magicpower = magic * attack
    local level = player:getLevel()
    

    local min = (((level / 5) + (power * 0.045) + (magicpower * 0.12) + 8) * 0.60) + 2
    local max = (((level / 5) + (power * 0.055) + (magicpower * 0.13) + 12) * 0.65) + 3


    local AstralCommandLevel = math.max(player:getStorageValue(PassiveSkills.AstralCommand) or 0, 0)
    local damageMultiplier = 1 + ( AstralCommandLevel / 100)
    min = min * damageMultiplier
    max = max * damageMultiplier

    return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function sendAery(creatureId)
    local creature = Creature(creatureId)
    if not creature then
        return false
    end

    -- Check if Aery is already summoned
    local summons = creature:getSummons()
    for _, summon in pairs(summons) do
        if summon:getName() == "Aery" then
            return false -- Aery is already summoned
        end
    end

    -- Companion
    local playerPosition = creature:getPosition()
    local companion = Game.createMonster("Aery", Position(playerPosition.x + 1, playerPosition.y, playerPosition.z), false, true)
    if companion then
        creature:addSummon(companion)
        companion:say("Master I'm back!", TALKTYPE_MONSTER_SAY)
        companion:getPosition():sendMagicEffect(184)
    end

    return true
end


local function isExcludedTarget(creature, target)
    if not creature or not target then
        return true
    end

    if target:isNpc() then
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

local function AerychainAttack(creatureId, currentPos, chainCount, hitTargets)
    local creature = Creature(creatureId)
    if not creature or not currentPos then
        return
    end

    local specs = Game.getSpectators(currentPos, false, false, config.searchRadius, config.searchRadius, config.searchRadius, config.searchRadius)
    local nextVictims = {}

    for _, spec in ipairs(specs) do
        if not isExcludedTarget(creature, spec) and not hitTargets[spec:getId()] then
            table.insert(nextVictims, spec)
        end
    end

    table.sort(nextVictims, function(a, b)
        return a:getPosition():getDistance(currentPos) < b:getPosition():getDistance(currentPos)
    end)

    local nextTarget = nextVictims[1]
    if nextTarget then
        local nextTargetPos = nextTarget:getPosition()
        currentPos:sendDistanceEffect(nextTargetPos, config.chainEffect)
        hitTargets[nextTarget:getId()] = true
        addEvent(AerychainAttack, config.speed, creatureId, nextTargetPos, chainCount + 1, hitTargets)
        combat:execute(creature, positionToVariant(nextTargetPos))
        nextTarget:attachEffectById(88, true)
        
    else
        currentPos:sendDistanceEffect(creature:getPosition(), config.dfx)
        sendAery(creatureId)
    end
end

function onCastSpell(creature, variant)
    local target = creature:getTarget()
    if not target then
        return false
    end

    if creature then
        local total = #creature:getSummons()
        if total >= 1 then
            for _, summon in pairs(creature:getSummons()) do
                if summon:getName() == "Aery" then
                    local player = Player(creature)
                    local summonCreature = Creature(summon)
                    local pos = summonCreature:getPosition()
                    summonCreature:unregisterEvent("curarspirit")
                    summonCreature:remove()
                    player:say("Go Aery!", TALKTYPE_MONSTER_SAY)
                end
            end
        end
    end

    combat:execute(creature, positionToVariant(target:getPosition()))
    target:attachEffectById(88, true)
    local targetPos = target:getPosition()
    local hitTargets = {}
    hitTargets[target:getId()] = true
    addEvent(AerychainAttack, config.speed, creature:getId(), targetPos, 1, hitTargets)
    
	
	-- Send a distance effect from the creature's position to the target's position
    creature:getPosition():sendDistanceEffect(target:getPosition(), config.dfx)
	
    return true
end
