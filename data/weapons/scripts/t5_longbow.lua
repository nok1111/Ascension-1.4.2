

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ICELONG)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)


function onGetFormulaValues(player, skill, attack, factor)
local distancefactor = player:getEffectiveSkillLevel(SKILL_DISTANCE)


	local damage = (player:getLevel() / 5) + ((distancefactor * attack) * 0.085)
	return -damage
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")




--DEMOLITION MODE START FORMULA
local ASPECT_MODE = 50010 -- Adjust the storage value as needed
local MANA_DEDUCTION_PERCENTAGE = 6 -- Percentage of max mana to deduct
local combatDemo = Combat()
combatDemo:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combatDemo:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ICELONG)
combatDemo:setParameter(COMBAT_PARAM_EFFECT, 480)
combatDemo:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
function onGetFormulaValuesDemolition(player, skill, attack, factor)
local distancefactor = player:getEffectiveSkillLevel(SKILL_DISTANCE)
local magic = player:getMagicLevel()
	local damage = (player:getLevel() / 5) + ((distancefactor * attack) * 0.085) 
	return -(damage * 0.8)
end
combatDemo:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValuesDemolition")
local areamode = createCombatArea{
    {0, 0, 1, 0, 0},
    {0, 1, 1, 1, 0},
    {1, 1, 3, 1, 1},
    {0, 1, 1, 1, 0},
    {0, 0, 1, 0, 0}
}
combatDemo:setArea(areamode)
--DEMOLITION END FORMULA

function onUseWeapon(player, variant, creature)
	if not combat:execute(player, variant) then
		return false
	end

--DEMOLITION CHECK START
	 local currentMode = player:getStorageValue(ASPECT_MODE)	
		if currentMode == 1 then
            -- Deduct 3% of max mana if player has more than 3% mana
            local manaDeduction = math.ceil(player:getMaxMana() * (MANA_DEDUCTION_PERCENTAGE / 100))
            if player:getMana() > manaDeduction then
                player:addMana(-manaDeduction)
				combatDemo:execute(player, variant)	
                -- Apply demolition mode damage to targets in the area
               
            else
              --  player:sendCancelMessage("Not enough mana to use Demolition Mode.")
                player:getPosition():sendMagicEffect(CONST_ME_POFF)
            end
		end
	--DEMOLITION CHECK END	
	

    return true
end



