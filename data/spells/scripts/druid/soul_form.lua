local configHeal = {
	manaPercent = 0.07,
	healPercent = 0.0075,
	timeBetweenHeals = 500,
	timeBetweeneffect = 500,	--in miliseconds
	timer = 30,	--total time of heals
	InitMana = 1,
	InitHealth = 10
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)


local condition2 = Condition(CONDITION_ATTRIBUTES)
condition2:setParameter(CONDITION_PARAM_SUBID, 14)
condition2:setParameter(CONDITION_PARAM_TICKS, 15000)
condition2:setParameter(CONDITION_PARAM_STAT_MAGICPOINTSPERCENT, 135)
condition2:setParameter(CONDITION_PARAM_DISABLE_DEFENSE, true)
condition2:setParameter(CONDITION_PARAM_BUFF_SPELL, true)






----------------------------------

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_EFFECT, 13)
combat2:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local outfit = createConditionObject(CONDITION_OUTFIT)
outfit:setParameter(CONDITION_PARAM_TICKS, 15000)
outfit:setParameter(CONDITION_PARAM_SUBID, 13)
addOutfitCondition(outfit, {lookType = 2076, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0, lookTypeEx = 0, lookAddons = 0})
combat2:addCondition(outfit)





---------------------------
function onTargetCreature(creature, target)
	if target:isPlayer() then
		if  creature:getHealth() < creature:getMaxHealth() then			
		local FormulaHealthMin = (creature:getMaxHealth() * (configHeal.healPercent/100))
		local FormulaHealthMax = (creature:getMaxHealth() * (configHeal.healPercent/100))
		local FinalHealth = math.random(FormulaHealthMin, FormulaHealthMax)	
		creature:addHealth(FinalHealth)
		end
		if  creature:getMana() < creature:getMaxMana() then	
		local FormulaManaMin = (creature:getMaxMana() * (configHeal.manaPercent/100))
		local FormulaManaMax = (creature:getMaxMana() * (configHeal.manaPercent/100))
		local FinalMana = math.random(FormulaManaMin, FormulaManaMax)	
		creature:addMana(FinalMana)
		end
		--target:getPosition():sendMagicEffect(336)
	end
	return true
end



combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local function soulHealing(cid, variant, combat)
    local creature = Creature(cid)
    if creature then
        combat:execute(creature, variant)
		creature:getPosition():sendMagicEffect(336)
    end
end




function onCastSpell(creature, variant)

local player = Player(creature)
local aura = creature:getPosition()
        aura.x = aura.x + 1
        aura.y = aura.y + 1
		
  aura:sendMagicEffect(360)
 -- creature:getPosition():sendMagicEffect(336)

	local cid = creature:getId()

	for i = 0, configHeal.timer, 1 do
		addEvent(soulHealing, configHeal.timeBetweenHeals*i, cid, variant, combat)
		creature:sendProgressbar(configHeal.timeBetweenHeals*i, false)
	end

	creature:addCondition(condition2)
	combat:execute(creature, variant)
	combat2:execute(creature, variant)
	
	player:sendAddBuffNotification(72, 15, 'Soul Form', 5, 0)
  
	

	return true
end
