local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 1)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)

local AREA_SHAPE = {
    {0, 0, 0, 0, 0},
    {0, 1, 1, 1, 0},
    {0, 1, 3, 1, 0},
	{0, 1, 0, 1, 0},
}

local area = createCombatArea(AREA_SHAPE)
combat:setArea(area)

function onGetFormulaValues(player, skill, attack, factor)
	local power = skill * attack 
    local level = player:getLevel()

    local min = ((level / 5) + (power * 0.060) + attack) * 1.6
    local max = ((level / 5) + (power * 0.0705) + attack * 1.3) * 1.75
	return min, max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(player, variant)


    local center = player:getPosition()
    local dir = player:getDirection()


    -- Attach effect at tip
    local tip
    if dir == DIRECTION_NORTH then
        tip = 226
    elseif dir == DIRECTION_EAST then
        tip = 227
    elseif dir == DIRECTION_SOUTH then
        tip = 228
    elseif dir == DIRECTION_WEST then
        tip = 225
    end
    if tip then
        player:attachEffectById(tip, true) -- Attach the effect
    end
    return combat:execute(player, variant)
end
