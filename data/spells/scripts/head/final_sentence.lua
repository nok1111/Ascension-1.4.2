
local config = {
	meteor_effect = 664,
	explosion_effect = 646,
    nube_arriba = 649
}



local area = createCombatArea({
    {0, 0, 1, 0, 0},
    {0, 1, 1, 1, 0},
    {1, 1, 3, 1, 1},
    {0, 1, 1, 1, 0},
    {0, 0, 1, 0, 0}
    })





local function castSentenceDamage(creatureId, variant, targetId)
	local creature = Creature(creatureId)
	if not creature or not variant then
		return
	end

    local target = Creature(targetId)
    
    if not target then
        return
    end
    local targetPos = target:getPosition()
    local positionnube = targetPos
		positionnube.x = targetPos.x + 1
		positionnube.y = targetPos.y + 1
		positionnube:sendMagicEffect(config.explosion_effect)


    -- Area damage based on target's missing HP
    local maxHp = target:getMaxHealth()
    local currHp = target:getHealth()
    local missingPercent = (maxHp - currHp) / maxHp

    local base = (creature:getLevel() * 2) + 35
    local scale = (creature:getLevel() * 7) + 50
    local extraDamage = base + math.floor(missingPercent * scale)

    -- 3x3 area centered on target
    doAreaCombatHealth(creature:getId(), COMBAT_HOLYDAMAGE, targetPos, area, -extraDamage, -extraDamage, CONST_ME_NONE)

end

local function castSentenceEffect(creatureId, variant, targetId)
	local creature = Creature(creatureId)
	if not creature or not variant then
		return
	end

     local target = Creature(targetId)
    
    if not target then
        return
    end
    local targetPos = target:getPosition()
    local positionMeteor = targetPos
		positionMeteor.x = targetPos.x + 1
		positionMeteor.y = targetPos.y + 1
		positionMeteor:sendMagicEffect(config.meteor_effect)

end



function onCastSpell(creature, variant, isHotkey)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    -- Check if head is equipped in head slot
    local head = player:getSlotItem(CONST_SLOT_HEAD)
    if not head or head:getId() ~= 33996 then
        player:sendCancelMessage("You must equip the Final Sentence spell to use this effect.")
        return false
    end

    local playerPos = player:getPosition() 
    local target = Creature(variantToNumber(variant))
    local targetPos = target:getPosition()
    local playerId = creature:getId()
    local targetId = target:getId()

    if target == player then
        player:sendCancelMessage("You cannot use this spell on yourself.")
        return false
    end

    
		targetPos:sendMagicEffect(config.nube_arriba)
    
        addEvent(castSentenceEffect, 10, creature:getId(), variant, target:getId())
        addEvent(castSentenceDamage, 700, creature:getId(), variant, target:getId())

    return true
end
