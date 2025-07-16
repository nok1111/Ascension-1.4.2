-- Frames (1 = Area, 2 = Player, 3 = Player + Self Damaging)
local combat = Combat()
local combat2 = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, 648)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat2:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

local arr = {
        {0, 1, 1, 1, 0},
        {1, 1, 1, 1, 1},
        {1, 1, 3, 1, 1},
        {1, 1, 1, 1, 1},
        {0, 1, 1, 1, 0}
}

local area = createCombatArea(arr)
    combat:setArea(area)
    combat2:setArea(area)

function onGetFormulaValues(player, skill, attack, factor)
    local magic = player:getMagicLevel()
    local power = magic * attack 
    local level = player:getLevel()

    local min = (level / 5) + (power * 0.10) + (attack * 4.0) + 300
    local max = (level / 5) + (power * 0.11) + (attack * 4.1) + 350

    local forceofnature = player:getStorageValue(PassiveSkills.ForceOfNature)
    if forceofnature > 0 then
        min = min + (min * forceofnature / 100)
        max = max + (max * forceofnature / 100)
    end
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onGetFormulaValues2(player, skill, attack, factor)
    local magic = player:getMagicLevel()
    local power = magic * attack 
    local level = player:getLevel()

    local min = (level / 5) + (power * 0.10) + (attack * 4.0) + 300
    local max = (level / 5) + (power * 0.11) + (attack * 4.1) + 350

    local doublemin = min * 2
    local doublemax  = max * 2

    local forceofnature = player:getStorageValue(PassiveSkills.ForceOfNature)
    if forceofnature > 0 then
        doublemin = doublemin + (doublemin * forceofnature / 100)
        doublemax = doublemax + (doublemax * forceofnature / 100)
    end
    return -doublemin, -doublemax
end

combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")

local function animation(pos, playerpos)

        -- This is only applicable for directional spells
        --if Position(pos):isSightClear(playerpos) then
        Position(pos):sendMagicEffect(453)
        Position(pos):sendMagicEffect(437)
        --end

end


local function castSpell(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	if checkChainBoosters(creature, "terra", "energy") then
        combat2:execute(creature, variant)
        ClearBooster(creature)
        creature:say("boosted")
    else
        combat:execute(creature, variant)
    end
    
end

function onCastSpell(creature, variant)

    local animationarea = arr
    local creaturepos = creature:getPosition()
    local playerpos = Position(creaturepos)
    local targeted = true -- is this a targettable spell? (strike or gfb-like spell etc)
    local delay = 100
 
    if targeted then
        creaturepos = creature:getTarget():getPosition()
    end
 
    local centre = {}
    local damagearea = {}
    for k,v in ipairs(animationarea) do
        for i = 1, #v do
            if v[i] == 3 or v[i] == 2 then
                centre.Row = k
                centre.Column = i
                table.insert(damagearea, centre)
            elseif v[i] == 1 then
                local darea = {}
                darea.Row = k
                darea.Column = i
                table.insert(damagearea, darea)
            end
        end
    end

    for i = 1,#damagearea do
        -- adjust delay randomizer here, different animations have different "sweet-spot" delays
        local animationDelay = math.random(1,6) * delay
        local modifierx = damagearea[i].Column - centre.Column
        local modifiery = damagearea[i].Row - centre.Row
        local damagepos = Position(creaturepos)
        damagepos.x = damagepos.x + modifierx
        damagepos.y = damagepos.y + modifiery
        addEvent(animation, animationDelay, damagepos, playerpos)
    end
	addEvent(castSpell, 1250, creature:getId(), variant)
    return true
end