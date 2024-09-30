local stunDuration = 3000
--local combat = Combat()
--
local combatnodot = Combat()
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)

combatnodot:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)




-- Set area
local arr = AREA_WAVE4
 
local area = createCombatArea(arr)
combat:setArea(area)
combatnodot:setArea(area)

 local stun = Condition(CONDITION_STUN)
 stun:setParameter(COMBAT_PARAM_EFFECT, CONDITION_STUN)
 stun:setParameter(CONDITION_PARAM_TICKS, stunDuration)
stun:setParameter(CONDITION_PARAM_TICKINTERVAL, 500)

 
 local bleedpierce = Condition(CONDITION_BLEEDING)
 bleedpierce:setParameter(COMBAT_PARAM_EFFECT, 448)
bleedpierce:setTicks(3000)
bleedpierce:setParameter(CONDITION_PARAM_DELAYED, 1)
bleedpierce:setParameter(CONDITION_PARAM_TICKINTERVAL, 500)
 




function onGetFormulaValues(player, level, maglevel)
    local min = (level / 5) + (maglevel * 4.9) + 40
    local max = (level / 5) + (maglevel * 9.4) + 80
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")




local function animation(pos, playerpos)

        if Position(pos):isSightClear(playerpos) then
			Position(pos):sendMagicEffect(450)
			--Position(pos):sendMagicEffect(449)
            --Position(pos):sendMagicEffect(448)
        end

end

function onTargetCreature(creature, target)
	
    if creature:getId() and target:getMaster() and target:getMaster() == creature:getId() then
        -- attacking master summons
            return false
    end
	
	
    if creature:isPlayer() and target:isPlayer() then
    --target party protection
        local party = creature:getParty()
        if party then
            local targetParty = target:getParty()
            if targetParty and targetParty == party then
                return false
            end
        end
	end
	
target:sendProgressbar(stunDuration, true)

local position = target:getPosition()
	local positioneffect = position
    positioneffect.x = position.x + 1
    positioneffect.y = position.y + 1
    
if target:isMonster() then
--print(tostring(target:getSkull()))
	if target:getSkull() == 0 then 
		
		target:addCondition(stun)
		positioneffect:sendMagicEffect(448, "Impaled")
		
	end
elseif target:isPlayer() then
		target:addCondition(stun)
		positioneffect:sendMagicEffect(448, "Impaled")
return false
end

	return true
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local function CastSpell(cid, var)
    local player = Player(cid)
    local level = player:getLevel()
    local magic = player:getMagicLevel()
	
	min = (level / 5) + (magic * 1.4) + 22
    max = (level / 5) + (magic * 1.8) + 35 
	
	
    bleedpierce:setParameter(CONDITION_PARAM_PERIODICDAMAGE, math.random(-min,-max))
	
    combat:addCondition(bleedpierce)
end

function onCastSpell(creature, var)
	
	local creatureId = creature:getId()
	
	
    local animationarea = arr
    local creaturepos = creature:getPosition()
    local playerpos = Position(creaturepos)
    local directional = true -- is spell directional?
    local directionalx = 0
    local directionaly = 0
    local delay = 100
 
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
		
        addEvent(animation, animationDelay, damagepos, playerpos)
		 local party = creature:getParty()
		if creature then
			
		CastSpell(creature:getId(), variant)
		end
    end
	
	
    return combat:execute(creature, var)
end