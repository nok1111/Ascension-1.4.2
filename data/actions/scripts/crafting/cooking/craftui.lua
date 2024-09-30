function onUse(player, item, fromPosition, itemEx, toPosition)
if ProfessionSystem:getProfessionId(player) == 3 then
        return Crafting:sendOpenCraftingWindow(player, SKILL_COOKING)
		else
						player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "This is just available for Chefs.")
						player:getPosition():sendMagicEffect(CONST_ME_POFF)
    end
    return false

end