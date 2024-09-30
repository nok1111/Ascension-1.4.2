local configHeal = {
	manaPercent = 0.07,
	healPercent = 0.0075,
	timeBetweenHeals = 400,
	timeBetweeneffect = 1500,	--in miliseconds
	timer = 10,	--total time of heals
	InitMana = 1,
	InitHealth = 10
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)


----------------------------------


local condition = createConditionObject(CONDITION_OUTFIT)
setConditionParam(condition, CONDITION_PARAM_TICKS, 4000)
setConditionParam(condition, CONDITION_PARAM_SUBID, 8)
addOutfitCondition(condition, {lookType = 1565, lookHead = 114, lookBody = 95, lookLegs = 114, lookFeet = 114, lookTypeEx = 0, lookAddons = 3})

---------------------------
function onTargetCreature(creature, target)
	if target:isPlayer() then

		local magic = creature:getMagicLevel()


		local FormulaHealthMin = (creature:getMaxHealth() * (configHeal.healPercent/100) + magic * 4.3) + 3
		local FormulaHealthMax = (creature:getMaxHealth() * (configHeal.healPercent/100) + magic * 4.6) + 5
		local FinalHealth = math.random(FormulaHealthMin, FormulaHealthMax)
		creature:addHealth(FinalHealth)
		
		--target:getPosition():sendMagicEffect(336)
	end
	return true
end


local function doHealing_shadowform2(cid, variant, combat)
    local creature = Creature(cid)
	if not creature then
		return
	end
    if creature then
        creature:getPosition():sendMagicEffect(336)
    end
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local function doHealing_shadowform1(cid, variant, combat)
    local creature = Creature(cid)
    if creature then
        combat:execute(creature, variant)
    end
end

function onCastSpell(creature, variant)
 local player = Player(creature)
local aura = creature:getPosition()
        aura.x = aura.x + 1
        aura.y = aura.y + 1
		
  aura:sendMagicEffect(281)
  creature:getPosition():sendMagicEffect(336)

	local cid = creature:getId()

	for i = 0, configHeal.timer, 1 do
		addEvent(doHealing_shadowform1, configHeal.timeBetweenHeals*i, cid, variant, combat)
		addEvent(doHealing_shadowform2, 1800, cid, variant, combat)
		addEvent(doHealing_shadowform2, 3600, cid, variant, combat)
		addEvent(doHealing_shadowform2, 5400, cid, variant, combat)
		addEvent(doHealing_shadowform2, 7200, cid, variant, combat)
		addEvent(doHealing_shadowform2, 9000, cid, variant, combat)
		addEvent(doHealing_shadowform2, 10800, cid, variant, combat)
		addEvent(doHealing_shadowform2, 12600, cid, variant, combat)
		addEvent(doHealing_shadowform2, 14400, cid, variant, combat)
		creature:sendProgressbar(configHeal.timeBetweenHeals*i, false)
		creature:addCondition(condition)

    player:sendAddBuffNotification(48, 4, 'Shadow Form', 5, 0)
  
	end

	return true
end
