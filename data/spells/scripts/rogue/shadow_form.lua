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


---------------------------
function onTargetCreature(creature, target)
	if target:isPlayer() then

		local magic = creature:getMagicLevel()


		local FormulaHealthMin = (creature:getMaxHealth() * (configHeal.healPercent/100) + magic * 4.3) + 3
		local FormulaHealthMax = (creature:getMaxHealth() * (configHeal.healPercent/100) + magic * 4.6) + 5
		local FinalHealth = math.random(FormulaHealthMin, FormulaHealthMax)
		local extrahealing = creature:getSpecialSkill(SPECIALSKILL_EXTRAHEALING)
		if extrahealing > 0 then
			FinalHealth = FinalHealth * (1 + (extrahealing / 100))
		end
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

  creature:getPosition():sendMagicEffect(336)
  player:attachEffectById(153, true)
  player:attachEffectById(154, true)
 
  player:sendAddBuffNotification(48, 4, 'Shadow Form', 5, 0)

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
		
		
  
	end

	return true
end
