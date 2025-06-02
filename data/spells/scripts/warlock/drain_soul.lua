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
    local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
    local power = sword * attack
    local level = player:getLevel()
    local magic = player:getMagicLevel()

    local min = ((level / 5) + (power * 0.10) + (attack * 4.0) + 300) / 13.25
    local max = ((level / 5) + (power * 0.11) + (attack * 4.5) + 400) / 13.15
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
            local min = ((creature:getLevel() / 5) + (creature:getMagicLevel() * 6.0) + 20) / 3.2
			local max = ((creature:getLevel() / 5) + (creature:getMagicLevel() * 6.5) + 25) / 3.1
			creature:addHealth(math.random(min, max))
            creature:getPosition():sendMagicEffect(config.mfx)
            victim:getPosition():sendDistanceEffect(creature:getPosition(), config.dfx)
            combat:execute(creature, numberToVariant(victim:getId()))
        end
    end
end

function onCastSpell(creature, variant)
    local cid = creature:getId()
    if not creature then
        return false
    end

    local specs = Game.getSpectators(creature:getPosition(), false, false, config.xradius, config.xradius, config.yradius, config.yradius)
    local victims = {}
    for _, spec in ipairs(specs) do
        if spec:isMonster() and spec ~= creature then
            table.insert(victims, spec)
        end
    end
    table.sort(victims, function(a, b) return a:getPosition():getDistance(creature:getPosition()) < b:getPosition():getDistance(creature:getPosition()) end)

    if #victims == 0 then
        creature:sendCancelMessage("There are no valid targets for this spell.")
        return false
    end

    castNextSpell(cid, victims, 1) 
    for i = 1, 10 do
        addEvent(castNextSpell, i * (math.random(config.speed, config.speed * 1.15)), cid, victims)
    end
    return true
end
