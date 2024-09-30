local config = {
	Duration = 10,
	cross_effect = 593,
	circle_effect = 665,
	healing_effect = 15
}
local configMasRes = {
	manaPercent = 1,
	healPercent = 7.8,
	timer = 15,
	InitMana = 10,
	InitHealth = 10
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setArea(createCombatArea(AREA_CIRCLE2X2))


local function healtargets(player, target)
    -- Check if player is valid
    if not player then
        return false
    end

    -- Check if the target is the player or is nil (indicating a self-heal)
    if target == player or target == nil then
        return true
    end

    -- Check if the target is a player
    if target:isPlayer() then
        -- Check if the target is in the same party as the player's leader
        if target:getParty() and target:getParty():getLeader() == player then
            return true
        end

        -- Check if the player has secure mode enabled (always heal)
        if player:hasSecureMode() then
            return true
        end

        -- Check if the target is in the same guild as the player's guild leader
        if target:getGuild() and target:getGuild():getLeader() == player then
            return true
        end
    end

    -- Check if the target has a master (summoned creature)
    if target:getMaster()  and target:getMaster():isPlayer() then -- Check if the target has a master (summon) then
        -- Check if the target is the player's master (heal own summons)
        if target:getMaster() == player then
            return true
        end

        -- Check if the target's master is a player and is in the same party as the player
        if target:getMaster():isPlayer() and player:getParty() and player:getParty() == target:getMaster():getParty() then
            -- Heal friendly party summoned creature
            return true
        end

        -- Check if the player has secure mode enabled (always heal non-friendly summons)
        if player:hasSecureMode() then
            return true
        end
    end

    -- If none of the conditions are met, the target is not a valid heal target
    return false
end


local function Triggered(combat, pos)
	variant = positionToVariant(pos)
	combat:execute(0, variant)
end

local function apply_floor(creatureId, positionnube)  	
local creature = Creature(creatureId)
	if not creature then
		return
	end
	positionnube:sendMagicEffect(config.circle_effect)
end

function onCastSpell(creature, variant)
	local player = Player(creature)
	local cid = creature:getId()
	local pos = creature:getPosition()
	local positionnube = creature:getPosition()
	positionnube.x = creature:getPosition().x + 3
	positionnube.y = creature:getPosition().y + 3
	
	function doHeal_sacredgroun(creature, target)
    if not player then
        stopEvent(event)
        return false
    end

    if not healtargets(player, target) then
        return false
    end

    local min = (player:getLevel() / 5) +  (player:getMagicLevel() * 2.0) + 35
    local max = (player:getLevel() / 5) +  (player:getMagicLevel() * 2.5) + 45
    local FinalHealth = math.random(min, max)

    target:addHealth(FinalHealth)
    target:getPosition():sendMagicEffect(config.healing_effect)

    return true
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "doHeal_sacredgroun")


	for i = 0, configMasRes.timer, 1 do
		addEvent(Triggered, 1000*i + 500, combat, pos)
	end
	
	
	for i = 1, config.Duration * 1000 / 100 do
	addEvent(apply_floor, 100 * i, creature:getId(), positionnube)
	end
	apply_floor(creature:getId(), positionnube)
	creature:getPosition():sendMagicEffect(config.cross_effect)

	return true
end