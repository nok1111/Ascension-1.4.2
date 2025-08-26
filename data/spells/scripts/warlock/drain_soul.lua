local config = {
    speed = 150,
    mfx = 230,
    dfx = 111,
    element = COMBAT_DEATHDAMAGE,
    xradius = 3,
    yradius = 3
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, config.element)
combat:setParameter(COMBAT_PARAM_EFFECT, config.mfx)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)

function onGetFormulaValues(player, skill, attack, factor)
    local magic = player:getMagicLevel()
    local power = skill * attack
    local magicpower = magic * attack
    print("magicpower: " .. magicpower)
    local level = player:getLevel()
    

    local min = (((level / 5) + (power * 0.045) + (magicpower * 0.12) + 8) * 0.33) + 2
    local max = (((level / 5) + (power * 0.055) + (magicpower * 0.13) + 12) * 0.35) + 3
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local function castNextSpell(cid, victims, count)
    local creature = Creature(cid)
    if not creature or not victims then
        return
    end

    for _, victim in ipairs(victims) do
        if not creature or not victims then
            return false
        end
        if creature:getId() and victim:getId() then
            local level = creature:getLevel()
		    local magic = creature:getMagicLevel()
		    local vit = creature:getMaxHealth() / 100
            local attack = getWandAttack(creature:getId())
            local magicpower = magic * attack

        local min = (((level / 5) + (vit * 0.3) + (magicpower * 0.12) + level) * 0.22) + 2
        local max = (((level / 5) + (vit * 0.3) + (magicpower * 0.13) + level) * 0.24) + 3

			local extrahealing = creature:getSpecialSkill(SPECIALSKILL_EXTRAHEALING)
            if extrahealing > 0 then
                min = min * (1 + (extrahealing / 100))
                max = max * (1 + (extrahealing / 100))
            end

			creature:addHealth(math.random(min, max))
            creature:getPosition():sendMagicEffect(config.mfx)
            victim:getPosition():sendDistanceEffect(creature:getPosition(), config.dfx)
            combat:execute(creature, numberToVariant(victim:getId()))
        end
    end
end

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

function onCastSpell(creature, variant)
    if not creature then
        return false
    end

    local target = creature:getTarget()
    if not target or not target:isMonster() or isExcludedTarget(creature, target) then
        creature:sendCancelMessage("You must target a valid enemy for this spell.")
        return false
    end

    -- Calculate max victims
    local soulstormLevel = math.max(creature:getStorageValue(PassiveSkills.Soulstorm) or 0, 0)
    local maxVictims = 1 + soulstormLevel

    -- Start with the selected target
    local victims = {target}

    -- Gather other valid monsters in range, excluding the caster and the selected target
    local specs = Game.getSpectators(target:getPosition(), false, false, config.xradius, config.xradius, config.yradius, config.yradius)
    for _, spec in ipairs(specs) do
        if #victims >= maxVictims then break end
        if spec ~= creature and spec ~= target and spec:isMonster() and not isExcludedTarget(creature, spec) and not spec:isNpc() then
            table.insert(victims, spec)
        end
    end

    if #victims == 0 then
        creature:sendCancelMessage("There are no valid targets for this spell.")
        return false
    end

    local cid = creature:getId()
    castNextSpell(cid, victims, 1)
    local soulstormTicks = math.max(creature:getStorageValue(PassiveSkills.SoulstormTicks) or 0, 0)
    local numTicks = 5 + soulstormTicks  -- Default 8, plus bonus from passive

    for i = 1, numTicks do
        addEvent(castNextSpell, i * (math.random(config.speed, config.speed * 1.15)), cid, victims)
    end
    return true
end
