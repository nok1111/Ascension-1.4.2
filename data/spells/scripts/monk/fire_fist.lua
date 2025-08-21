
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)



function onGetFormulaValues(player, skill, attack, factor)
    local power = skill * attack 
    local level = player:getLevel()

    local min = ((level / 5) + (power * 0.060) + attack * 1.0) * 0.32
    local max = ((level / 5) + (power * 0.0705) + attack * 1.3) * 0.36

    -- Increases the damage of your elemental fists (Fire, Ice, Life) by 3% per level when used in combination
    local level = math.max(player:getStorageValue(PassiveSkills.ElementalHarmony) or 0, 0)
    if level > 0 then
        min = min * (1 + (level / 100))
        max = max * (1 + (level / 100))
    end
    return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")



local function arcaneDamage(playerId, variant, targetId, effectId)
    local player = Player(playerId)
    local creature = Creature(targetId)
    if not player or not creature then return true end

    local pos = creature:getPosition()
    local playerpos = player:getPosition()
    --pos:sendMagicEffect(6)
    Position(playerpos):sendDistanceEffect(pos, effectId)
     Position(pos.x + 1, pos.y + 1, pos.z):sendMagicEffect(341)
    

    --creature:attachEffectById(111, true)
    local level = player:getLevel()
    local skill = player:getEffectiveSkillLevel(SKILL_SWORD)
    local attack = getMeleeAttack(playerId)
	
    local power = skill * attack 

    local min = ((level / 8) + (power * 0.015) + 1)
    local max = ((level / 8) + (power * 0.0275) + 5)
    local base = math.random(min, max)

    local burn = Condition(CONDITION_FIRE, CONDITIONID_COMBAT)
    burn:setParameter(CONDITION_PARAM_DELAYED, true)
    burn:setParameter(CONDITION_PARAM_TICKS, 3000)
    burn:setParameter(CONDITION_PARAM_TICKINTERVAL, 1000)
    burn:setParameter(CONDITION_PARAM_PERIODICDAMAGE, -math.max(1, base))

    combat:addCondition(burn)
    combat:execute(player, variant)
    return true
end

function onCastSpell(player, variant)
    local target = player:getTarget()
    if target then
        for i = 0, 1 do
            addEvent(function()
                arcaneDamage(player:getId(), variant, target:getId(), 185 + i)
            end, i * 250)
        end
    end
    addElementalBoost(player, "fire", 1)
    return true
end