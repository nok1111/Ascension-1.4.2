local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)

-- Set area
local arr = {
		{0, 1, 1, 1, 0},
		{0, 1, 1, 1, 0},
        {0, 1, 1, 1, 0},
        {0, 1, 1, 1, 0},
        {1, 1, 3, 1, 1}

}
 
local area = createCombatArea(arr)
combat:setArea(area)

function onGetFormulaValues(player, skill, attack, factor)
	local power = skill * attack 
	local level = player:getLevel()
	local magic = player:getMagicLevel()
	local vit = player:getMaxHealth()

	local min = (level / 5) + (power * 0.090) + (vit * 0.0125) + 20
	local max = (level / 5) + (power * 0.095) + (vit * 0.0135) + 38 
	
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

----



---
local function animation1(pos, playerpos)

        if Position(pos):isSightClear(playerpos) then
		Position(pos):sendMagicEffect(6)
		--Position(pos):sendMagicEffect(456)
        end

end

local function animation2(pos, playerpos)

        if Position(pos):isSightClear(playerpos) then
		Position(pos):sendMagicEffect(6)
		--Position(pos):sendMagicEffect(457)
        end

end

local function animation3(pos, playerpos)

        if Position(pos):isSightClear(playerpos) then
		Position(pos):sendMagicEffect(6)
		--Position(pos):sendMagicEffect(458)
        end

end

local function animation4(pos, playerpos)

        if Position(pos):isSightClear(playerpos) then
		Position(pos):sendMagicEffect(6)
		--Position(pos):sendMagicEffect(455)
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
		
		
		
		
		
		--match direction sprites here
        if direction == 1 then
             			 
			local position1 = creature:getPosition()
			local positioneffect1 = position1
			positioneffect1.x = position1.x + 5
			positioneffect1.y = position1.y + 1
			positioneffect1:sendMagicEffect(278)
			addEvent(animation1, animationDelay, damagepos, playerpos)
        elseif direction == 2 then
		
			local position2 = creature:getPosition()
			local positioneffect2 = position2
			positioneffect2.x = position2.x + 1
			positioneffect2.y = position2.y + 5
			positioneffect2:sendMagicEffect(276)
			
              addEvent(animation2, animationDelay, damagepos, playerpos)
        elseif direction == 3 then
		
			local position3 = creature:getPosition()
			local positioneffect3 = position3
			positioneffect3.x = position3.x - 1
			positioneffect3.y = position3.y + 1
			positioneffect3:sendMagicEffect(279)
			
             addEvent(animation3, animationDelay, damagepos, playerpos)
        else
		
			local position4 = creature:getPosition()
			local positioneffect4 = position4
			positioneffect4.x = position4.x + 1
			positioneffect4.y = position4.y - 1
			positioneffect4:sendMagicEffect(277)
			  addEvent(animation4, animationDelay, damagepos, playerpos)
        end
		
		
		
		
        
    end
    return combat:execute(creature, var)
end