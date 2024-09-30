local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)

-- Set area
local arr = {
        {0, 0, 1, 0, 0},
        {0, 1, 1, 1, 0},
        {1, 1, 3, 1, 1}

}
 
local area = createCombatArea(arr)
combat:setArea(area)

function onGetFormulaValues(player, skill, attack, factor)
	local sword = player:getEffectiveSkillLevel(SKILL_SWORD) * 1
	local power = sword * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()

	local min = (level / 5) + (power * 0.08) + (attack * 0.2) + 100
	local max = (level / 5) + (power * 0.09) + (attack * 0.25) + 120
	return -min, -max
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

----



---
local function animation1(pos, playerpos)
    if not Tile(Position(pos)):hasProperty(CONST_PROP_BLOCKPROJECTILE) then
        if Position(pos):isSightClear(playerpos) then
		Position(pos):sendMagicEffect(435)
		Position(pos):sendMagicEffect(456)
        end
    end
end

local function animation2(pos, playerpos)
    if not Tile(Position(pos)):hasProperty(CONST_PROP_BLOCKPROJECTILE) then
        if Position(pos):isSightClear(playerpos) then
		Position(pos):sendMagicEffect(435)
		Position(pos):sendMagicEffect(457)
        end
    end
end

local function animation3(pos, playerpos)
    if not Tile(Position(pos)):hasProperty(CONST_PROP_BLOCKPROJECTILE) then
        if Position(pos):isSightClear(playerpos) then
		Position(pos):sendMagicEffect(435)
		Position(pos):sendMagicEffect(458)
        end
    end
end

local function animation4(pos, playerpos)
    if not Tile(Position(pos)):hasProperty(CONST_PROP_BLOCKPROJECTILE) then
        if Position(pos):isSightClear(playerpos) then
		Position(pos):sendMagicEffect(435)
		Position(pos):sendMagicEffect(455)
        end
    end
end



function onCastSpell(creature, var)

    local animationarea = arr
    local creaturepos = creature:getPosition()
    local playerpos = Position(creaturepos)
    local directional = true -- is spell directional?
    local directionalx = 0
    local directionaly = 0
    local delay = 150
 
    -- Rotate based on direction
    if directional then
        local direction = creature:getDirection()
        if direction == 1 then
            animationarea = rotate_CW_90(animationarea)
            directionalx = 1
        elseif direction == 2 then
            animationarea = rotate_180(animationarea)
            directionaly = 1
        elseif direction == 3 then
            animationarea = rotate_CCW_90(animationarea)
            directionalx = -1
        else
            directionaly = -1
        end
    end
 
    local centre = {}
    local damagearea = {}
    for k,v in ipairs(animationarea) do
        for i = 1, #v do
            --print(v[i])
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
    --print(centre.Column .. "," .. centre.Row)
    for i = 1,#damagearea do
        local animationDelay = delay
        --print(damagearea[i].Column .. "," .. damagearea[i].Row)
        local modifierx = damagearea[i].Column - centre.Column
        local modifiery = damagearea[i].Row - centre.Row
        --print("x " .. modifierx .. " " .. "y " .. modifiery)
        local damagepos = Position(creaturepos)
        damagepos.x = damagepos.x + modifierx + directionalx
        damagepos.y = damagepos.y + modifiery + directionaly
        --print("Damage: " .. damagepos.x .. "," .. damagepos.y .. "," .. damagepos.z)
        if directional then
            local direction = creature:getDirection()
            if direction == 1 then
                animationDelay = (modifierx + directionalx) * delay
            elseif direction == 2 then
                animationDelay = (modifiery + directionaly) * delay
            elseif direction == 3 then
                animationDelay = ((modifierx + directionalx) * -1) * delay
            else
                animationDelay = ((modifiery + directionaly) * -1) * delay
            end
            animationDelay = animationDelay - delay
            --print(animationDelay)
        end
		---directions
		local direction = creature:getDirection()
		
        if direction == 1 then
             addEvent(animation1, animationDelay, damagepos, playerpos)
        elseif direction == 2 then
              addEvent(animation2, animationDelay, damagepos, playerpos)
        elseif direction == 3 then
             addEvent(animation3, animationDelay, damagepos, playerpos)
        else
			  addEvent(animation4, animationDelay, damagepos, playerpos)
        end
		
		
		
		
        
    end
    return combat:execute(creature, var)
end