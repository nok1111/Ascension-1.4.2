local configHeal = {
	manaPercent = 0.5,
	healPercent = 1.2,
	timeBetweenHeals = 100,	--in miliseconds
	timer = 7,	--total time of heals
	InitMana = 0,
	InitHealth = 10
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onTargetCreature(creature, target)
	if target:isPlayer() then
		local magic = target:getMagicLevel()
		local FormulaHealthMin = (creature:getMaxHealth() * (configHeal.healPercent/100) + magic * 1.0)
		local FormulaHealthMax = (creature:getMaxHealth() * (configHeal.healPercent/100) + magic * 1.2)
		local FinalHealth = math.random(FormulaHealthMin, FormulaHealthMax)
		target:addHealth(FinalHealth)
		target:getPosition():sendMagicEffect(CONST_ME_NEWFGREENFORCE)
	end
	return true
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local function doHealing_felblood(cid, variant, combat)
    local creature = Creature(cid)
    if creature then
        combat:execute(creature, variant)
    end
end

function onCastSpell(creature, variant)
	local cid = creature:getId()
local player = Player(creature)

	for i = 0, configHeal.timer, 1 do
		addEvent(doHealing_felblood, configHeal.timeBetweenHeals*i, cid, variant, combat)
		creature:sendProgressbar(configHeal.timeBetweenHeals*i, false)
			 if player then
  -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    player:sendAddBuffNotification(10, 1, 'fel blood', 5, 0)
  end
	end

	return true
end
