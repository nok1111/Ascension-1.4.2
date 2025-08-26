local stunDuration = 3000
--local combat = Combat()
--
local combatnodot = Combat()
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
--effect
combat:setParameter(COMBAT_PARAM_EFFECT, 448)
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
bleedpierce:setParameter(CONDITION_PARAM_TICKINTERVAL, 1000)
 




function onGetFormulaValues(player, skill, attack, factor)
    local magic = player:getMagicLevel()
    local power = skill * attack
    local magicpower = magic * attack
    local level = player:getLevel()
    

    local min = (((level / 5) + (power * 0.045) + (magicpower * 0.12) + 8) * 1.2) + 2
    local max = (((level / 5) + (power * 0.055) + (magicpower * 0.13) + 12) * 1.3) + 3
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


function onTargetCreature(creature, target)
	if not creature or not target then
        return 
    end  
    if not target:getCondition(CONDITION_POISON) then
        return
    end

   local entanglingRoots = creature:getStorageValue(PassiveSkills.EntanglingRoots)
   if entanglingRoots > 0 then
    local random = math.random(1, 100)
        if random <= entanglingRoots then
            target:addCondition(stun)
            target:attachEffectById(116, true)	
        end
	end
	return true
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local function CastSpell(cid, var)
    local player = Player(cid)
    local skill = player:getEffectiveSkillLevel(SKILL_AXE)
    local attack = getWandAttack(player:getId())
    local magic = player:getMagicLevel()
    local power = skill * attack
    local magicpower = magic * attack
    local level = player:getLevel()
    

    local min = (((level / 5) + (power * 0.010) + (magicpower * 0.50) + level) * 0.22) + 2
    local max = (((level / 5) + (power * 0.015) + (magicpower * 0.55) + level) * 0.24) + 3
	
	
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
		
		if creature then
			
		CastSpell(creature:getId(), variant)
		end
    end
	
	
    return combat:execute(creature, var)
end