local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 512)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)

local executeCombat = Combat()
executeCombat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
executeCombat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)

function onGetInitialDamageValues(player, skill, attack, factor)
  local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
    local power = sword * attack 
    local level = player:getLevel()
    local magic = player:getMagicLevel()

    local min = ((level / 5) + (power * 0.10) + (attack * 4.0) + 300) / 3.25
    local max = ((level / 5) + (power * 0.11) + (attack * 4.5) + 400) / 3.15
	return -min, -max
end

function onGetExecuteDamageValues(player, skill, attack, factor)
    local min = (player:getLevel() * 100) 
    local max = (player:getLevel() * 100) 
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetInitialDamageValues")
executeCombat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetExecuteDamageValues")

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

local function getLowHealthTargets(player, radius)
    local targets = {}
    local spectators = Game.getSpectators(player:getPosition(), false, false, radius, radius, radius, radius)
    for _, spectator in ipairs(spectators) do
        if not isExcludedTarget(player, spectator) then
            local healthPercent = (spectator:getHealth() / spectator:getMaxHealth()) * 100
            if (spectator:getSkull() == SKULL_NONE and healthPercent <= 35) or
               (spectator:getSkull() ~= SKULL_NONE and healthPercent <= 20) then
                table.insert(targets, spectator)
            end
        end
    end
    return targets
end

local function executeTargets(playerId, targets)
    local player = Creature(playerId)
    if not player then
        return
    end

    for _, target in ipairs(targets) do     
        -- Check if the target is below the execution threshold
        local postHealthPercent = (target:getHealth() / target:getMaxHealth()) * 100
        if (target:getSkull() == 0 and postHealthPercent <= 35) or (target:getSkull() ~= 0 and postHealthPercent <= 20) then
            executeCombat:execute(player, numberToVariant(target:getId()))
			print(target:getSkull())
        end
    end
end

local function sendDaggers(playerId, targets)
    local player = Creature(playerId)
    if not player then
        return
    end

    for _, target in ipairs(targets) do
        local playerPos = player:getPosition()
        local targetPos = target:getPosition()
        
        playerPos:sendDistanceEffect(targetPos, 174)
        local sword = targetPos
        sword.x = sword.x + 1
        sword.y = sword.y + 1
        sword:sendMagicEffect(393)
        
        -- Initial damage
        combat:execute(player, numberToVariant(target:getId()))
		
    
    end
end

function onCastSpell(player, variant)
    local radius = 7 -- Adjust the radius as needed
    local targets = getLowHealthTargets(player, radius)

    if #targets == 0 then
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:sendCancelMessage("No suitable targets found.")
        return false
    end

    -- Execute the targets after a short delay
    sendDaggers(player:getId(), targets)
    addEvent(executeTargets, 2.2 * 450, player:getId(), targets) -- Adjust the delay as needed

    return true
end
