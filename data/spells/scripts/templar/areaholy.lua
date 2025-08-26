local config = {
    duration = 10,
    ticksBetween = 1500,
    effect = 559,
    effect2 = 511
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:setArea(createCombatArea(AREA_CIRCLE2X2))


function onGetFormulaValues(player, skill, attack, factor)
	local level = player:getLevel()
		local magic = player:getMagicLevel()
		local vit = player:getMaxHealth() / 100
        local magic = player:getMagicLevel()
        local magicpower = magic * attack

        local min = (((level / 5) + (vit * 0.8) + (magicpower * 0.12) + level) * 0.22) + 2
        local max = (((level / 5) + (vit * 0.9) + (magicpower * 0.13) + level) * 0.24) + 3

    local level = player:getStorageValue(PassiveSkills.SanctifiedPower) or 0
    if level > 0 then
        min = min * (1 + (level / 100))
        max = max * (1 + (level / 100))
    end
    return -min, -max
end


combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


local function applyConsecratedProtection(areaCenter, creatureId)
    local creature = Creature(creatureId)
    if not creature then return end
    -- Define area as 5x5 centered on areaCenter (adjust as needed)
    for x = areaCenter.x - 2, areaCenter.x + 2 do
        for y = areaCenter.y - 2, areaCenter.y + 2 do
            local pos = Position(x, y, areaCenter.z)
            local tile = Tile(pos)
            if tile then
                for _, thing in ipairs(tile:getCreatures() or {}) do
                    if thing:isPlayer() then
                        local level = thing:getStorageValue(PassiveSkills.ConsecratedProtection) or 0
                        if level > 0 then
                            local cond = Condition(CONDITION_ATTRIBUTES)
                            cond:setParameter(CONDITION_PARAM_TICKS, 1000)
                            cond:setParameter(CONDITION_PARAM_SUBID, ConditionsSubIds.consecratedprotection)
                            cond:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
                            thing:addCondition(cond)
                        end
                    end
                end
            end
        end
    end
end

local function doAnimation(creatureId, pos)
    local creature = Creature(creatureId)
    if not creature then
        return
    end

    applyConsecratedProtection(pos, creatureId)

    for i = 1, 3 do
        local randomPos = Position(pos.x + math.random(-2, 2), pos.y + math.random(-2, 2), pos.z)
        if pos:isSightClear(randomPos, true) then
            randomPos:sendMagicEffect(595)
            combat:execute(creature, Variant(pos))
        end
    end
    -- Apply ConsecratedProtection to players in area
    
end

local function apply_floor(creatureId, positionnube)  	
    local creature = Creature(creatureId)
	if not creature then
		return
	end
    if not positionnube then
		return
	end
	positionnube:sendMagicEffect(616)
end

function onCastSpell(creature, variant)
    local pos = creature:getPosition()
	local positionnube = creature:getPosition()
	positionnube.x = creature:getPosition().x + 2
	positionnube.y = creature:getPosition().y + 2

    -- Schedule animation effects
    for i = 1, (config.duration * 1000) / config.ticksBetween do  -- Modified for simpler calculation
        addEvent(doAnimation, config.ticksBetween * i, creature:getId(),  pos)
    end
	for i = 1, config.duration * 1000 / 100 do
	addEvent(apply_floor, 100 * i, creature:getId(), positionnube)
	end
	apply_floor(creature:getId(), positionnube)
	creature:getPosition():sendMagicEffect(593)
    return true
end
