
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 231)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:setArea(createCombatArea(AREA_SQUARE1X1))



function onGetFormulaValues(player, skill, attack, factor)
    local sword = player:getEffectiveSkillLevel(SKILL_SWORD)
    local power = sword * attack
    local level = player:getLevel()
    local min = (level / 5) + (power * 0.025) + attack
    local max = (level / 5) + (power * 0.035) + attack * 1.5

    -- Increases the damage of your elemental fists (Fire, Ice, Life) by 3% per level when used in combination
    local level = math.max(player:getStorageValue(PassiveSkills.ElementalHarmony) or 0, 0)
    if level > 0 then
        min = min * (1 + (level / 100))
        max = max * (1 + (level / 100))
    end
    return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")



local function mysticPunch(playerId, variant, targetId)
    local player = Player(playerId)
    local creature = Creature(targetId)
    if not player or not creature then return true end

    local pos = creature:getPosition()
    local playerpos = player:getPosition()
    --pos:sendMagicEffect(6)
    -- Position(pos.x + 1, pos.y + 1, pos.z):sendMagicEffect(341)
    combat:execute(player, variant)

    creature:attachEffectById(113, true)
    return true
end

function onCastSpell(player, variant)

    local orb1, orb2 = getActiveOrbs(player)
    if not orb1 or not orb2 then
        player:sendCancelMessage("You need two orbs to use this spell.")
        return false
    end

    local target = player:getTarget()
    if target then
        mysticPunch(player:getId(), variant, target:getId())
        -- Remove the spent orbs from the player's boosters
        ClearBooster(player)
        updatePlayerEffects(player)
    end
    
    return true
end