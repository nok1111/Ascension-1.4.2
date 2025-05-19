-- Frames (1 = Area, 2 = Player, 3 = Player + Self Damaging)
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)


local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat1:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 158)

local static_charge = Condition(CONDITION_ENERGY)
static_charge:setParameter(CONDITION_PARAM_DELAYED, true)
static_charge:addDamage(10, 1000, -1)
static_charge:setParameter(CONDITION_PARAM_SUBID, 25965)
combat1:addCondition(static_charge)

local arr = {
        {0, 0, 1, 0, 0},
        {0, 1, 1, 1, 0},
        {1, 1, 3, 1, 1},
        {0, 1, 1, 1, 0},
        {0, 0, 1, 0, 0}
}

local area = createCombatArea(arr)
    combat:setArea(area)
	combat1:setArea(area)

function onGetFormulaValues(player, level, maglevel)
    local min = (level / 10)  + 5
    local max = (level / 10)  + 5
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")



function onCastSpell(creature, var)

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
        
		combat1:execute(creature, var)
		
	local target = creature:getTarget()
	local position = target:getPosition()
	local positioneffect = position
    positioneffect.x = position.x + 1
    positioneffect.y = position.y + 1
	
    positioneffect:sendMagicEffect(436)
	--target:sendProgressbar(10000, false)
    end
    return combat:execute(creature, var)
end