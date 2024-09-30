function onUse(player, item, fromPosition, itemEx, toPosition)
if ProfessionSystem:getProfessionId(player) == 1 then
        return Crafting:sendOpenCraftingWindow(player, SKILL_BLACKSMITH)
	else
						player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "This is just available for Blacksmiths.")
						player:getPosition():sendMagicEffect(CONST_ME_POFF)
    end
    return false

end