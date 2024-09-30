function onUse(player, item, fromPosition, itemEx, toPosition)
if ProfessionSystem:getProfessionId(player) == 2 then
        return Crafting:sendOpenCraftingWindow(player, SKILL_ALCHEMY)
		else
						player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "This is just available for Alchemists.")
						player:getPosition():sendMagicEffect(CONST_ME_POFF)
    end
    return false

end