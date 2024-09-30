local configHeal = {
	manaPercent = 0,
	healPercent = 2,
	timeBetweenHeals = 1000,	--in miliseconds
	timer = 5,	--total time of heals
	InitMana = 0,
	InitHealth = 10
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onTargetCreature(creature, target)
	if target:isPlayer() then
	
local magic = creature:getMagicLevel()


		local FormulaHealthMin = (creature:getMaxHealth() * (configHeal.healPercent/100) + magic * 10)
		local FormulaHealthMax = (creature:getMaxHealth() * (configHeal.healPercent/100) + magic * 10)
		local FinalHealth = math.random(FormulaHealthMin, FormulaHealthMax)
		creature:addHealth(FinalHealth)
		
		 local position = target:getPosition()
   -- local positioneffect = position
   -- positioneffect.x = position.x + 1
   --  positioneffect.y = position.y + 0
    position:sendMagicEffect(16)
		--target:getPosition():sendMagicEffect(CONST_ME_FIREATTACK)
	end
	return true
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local function doHealing_firesoul(cid, variant, combat)
    local creature = Creature(cid)
    if creature then
        combat:execute(creature, variant)
    end
end

function onCastSpell(creature, variant)
 local player = Player(creature)
 
	local cid = creature:getId()

	for i = 0, configHeal.timer, 1 do
		addEvent(doHealing_firesoul, configHeal.timeBetweenHeals*i, cid, variant, combat)
	    creature:sendProgressbar(configHeal.timeBetweenHeals*i, false)
		 if player then
  -------------------------------- ID IMAGE, SECONDS, TEXT, BACKGROUND
    player:sendAddBuffNotification(69, (configHeal.timeBetweenHeals*i) / 1000, 'fire Soul', 5, 0)
  end
		
	end

	return true
end
