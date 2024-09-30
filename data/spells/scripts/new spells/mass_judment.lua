local config = {
    cloud_duration = 800, -- duration in milliseconds
    cloud_delay = 800, -- delay between magic effects in milliseconds
	cloud_effect = 649,
	sword_effect = 664,
	ground_effect = 646,
    range = 7 -- range to check for nearby targets
}


local function applyMagicEffect(position, effect)
    position:sendMagicEffect(effect)
end

local function applyDamage(creatureId, position)
	local creature = Creature(creatureId)
	if not creature then
		return
	end
	
	if not position then
		return
	end
	
    local min = (creature:getLevel() / 5) + (creature:getMagicLevel() * 4.8) + 10
    local max = (creature:getLevel() / 5) + (creature:getMagicLevel() * 6.2) + 35
	
   doAreaCombatHealth(creature, COMBAT_ENERGYDAMAGE, position, AREA_SQUARE1X1, -min, -max, CONST_ME_NONE)
end

function onCastSpell(creature, variant)
    local centerPosition = creature:getPosition()
    local spectators = Game.getSpectators(centerPosition, false, false, config.range, config.range, config.range, config.range)
    
    for _, target in ipairs(spectators) do
        if target:isPlayer() or target:isMonster() then
            local position = target:getPosition()
			
			position:sendMagicEffect(config.cloud_effect)
            
            -- Apply cloud effect
            for i = 1, config.cloud_duration / config.cloud_delay do
                addEvent(applyMagicEffect, config.cloud_delay * i, position, config.cloud_effect)
            end
            
            -- Apply sword and ground effects
            local swordPosition = target:getPosition()
            swordPosition.x = target:getPosition().x + 1
            swordPosition.y = target:getPosition().y + 1
            
            addEvent(applyMagicEffect, 650, swordPosition, config.sword_effect)
            addEvent(applyMagicEffect, 1200, swordPosition, config.ground_effect)
            
            -- Apply damage
            addEvent(applyDamage, 1200, creature:getId(), position)
        end
    end
    
    return true
end
