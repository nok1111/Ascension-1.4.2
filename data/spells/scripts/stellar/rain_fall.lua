

local config = {
	Duration = 15,
	RainEffectDuration = 13,
	Ticks_Between = 800,
	Ticks_Effect = 100,
	Effect = CONST_ME_LOSEENERGY,
	Effect2 = 326
}


local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combat:setArea(createCombatArea(AREA_CIRCLE2X2))


local function doAnimation(cid, pos)
	local creature = Creature(cid)
	if creature then
		local x, y, z = pos.x, pos.y, pos.z
		math.randomseed(os.clock()*100000000000)
		local x1, y1 = math.random(-2, 2), math.random(-2, 2)
		math.randomseed(os.clock()*100000000000)
		local x2, y2 = math.random(-1, 1), math.random(-3, 3)
		math.randomseed(os.clock()*100000000000)
		local x3, y3 = math.random(-3, 3), math.random(-1, 1)
		if pos:isSightClear(Position(x+x1, y+y1, z), true) then
			Position(x+x1, y+y1, z):sendMagicEffect(config.Effect)
			Position(x+x1, y+y1, z):sendMagicEffect(config.Effect2)
		end
		if pos:isSightClear(Position(x+x2, y+y2, z), true) then
			Position(x+x2, y+y2, z):sendMagicEffect(config.Effect)
			Position(x+x1, y+y1, z):sendMagicEffect(config.Effect2)
		end
		if pos:isSightClear(Position(x+x3, y+y3, z), true) then
			Position(x+x3, y+y3, z):sendMagicEffect(config.Effect)
			Position(x+x1, y+y1, z):sendMagicEffect(config.Effect2)
		end
	end
end

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

function onGetFormulaValues(player, skill, attack, factor)
	local level = player:getLevel()
		local magic = player:getMagicLevel()


        local min = (level / 5) + (magic * 1.0) + 2
        local max = (level / 5) + (magic * 1.1) + 3

        local RainFallHealing = player:getStorageValue(PassiveSkills.RainFallHealing) or 0
        if RainFallHealing > 0 then
            min = min * (1 + (RainFallHealing / 100))
            max = max * (1 + (RainFallHealing / 100))
        end
    
        local extrahealing = player:getSpecialSkill(SPECIALSKILL_EXTRAHEALING)
        if extrahealing > 0 then
            min = min * (1 + (extrahealing / 100))
            max = max * (1 + (extrahealing / 100))
        end
    return min, max
end


combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")



local function HealEvent(creatureId, variant)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	combat:execute(creatureId, variant)
end

local function apply_floor(creatureId, positionnube)  	
local creature = Creature(creatureId)
	if not creature then
		return
	end
	positionnube:sendMagicEffect(665)
end


function onCastSpell(creature, variant)
    local player = Player(creature)
    local cid = creature:getId()
    local pos = creature:getPosition()
    local positionnube = creature:getPosition()
    positionnube.x = creature:getPosition().x + 3
    positionnube.y = creature:getPosition().y + 3

	local RainFallDuration = player:getStorageValue(PassiveSkills.RainFallDuration) or 0
	config.Duration = config.Duration + RainFallDuration
	config.RainEffectDuration = config.RainEffectDuration + RainFallDuration

    

    for i = 0, config.Duration, 1 do
        addEvent(HealEvent, 1000*i + 500, creature:getId(), variant)
    end

    for i = 1, config.Duration * 1000 / 100 do
        addEvent(apply_floor, 100 * i, creature:getId(), positionnube)
    end
    apply_floor(creature:getId(), positionnube)

    for i = 0, (config.RainEffectDuration*1000)/config.Ticks_Effect, 1 do
        addEvent(doAnimation, config.Ticks_Effect*i, cid, pos)
    end

    return true
end