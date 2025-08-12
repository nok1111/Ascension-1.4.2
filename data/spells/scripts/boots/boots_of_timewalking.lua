

local function doRewind(playerId, pos, hp, mana)
	local p = Player(playerId)
	if not p then return end
	-- Teleport effect at current position
	p:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	-- Teleport back
	p:teleportTo(pos, true)
	pos:sendMagicEffect(CONST_ME_TELEPORT)
	-- Restore HP and mana
	p:addHealth(hp - p:getHealth())
	p:addMana(mana - p:getMana())
	p:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have rewound time!")
end

function onCastSpell(creature, variant, isHotkey)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    -- Check if boots are equipped in feet slot
    local boots = player:getSlotItem(CONST_SLOT_FEET)
    if not boots or boots:getId() ~= 33378 then
        player:sendCancelMessage("You must equip the Boots of Timewalking to use this effect.")
        return false
    end

    local tile = Tile(player:getPosition())
    if not tile or tile:hasFlag(TILESTATE_BLOCKSOLID) or tile:hasFlag(TILESTATE_PROTECTIONZONE) then
        player:sendCancelMessage("You can't do this here.")
        return false
    end

    -- Save current state
    local rewindPos = player:getPosition()
    local rewindHp = player:getHealth()
    local rewindMana = player:getMana()
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Time is marked. You will rewind in 4 seconds!")
    rewindPos:sendMagicEffect(CONST_ME_TELEPORT)

    

    addEvent(doRewind, 4000, player:getId(), rewindPos, rewindHp, rewindMana)
	player:attachEffectById(172, true)

    return true
end
