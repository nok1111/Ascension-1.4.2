function onUse(player, item, fromPosition, itemEx, toPosition)
if ProfessionSystem:getProfessionId(player) == 4 then
        return Crafting:sendOpenCraftingWindow(player, SKILL_ENCHANTING)
		else
						player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "This is just available for Enchanters.")
						player:getPosition():sendMagicEffect(CONST_ME_POFF)
    end
    return false

end