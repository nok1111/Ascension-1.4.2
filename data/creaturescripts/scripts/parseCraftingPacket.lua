function onParsePacket(player, recvbyte, msg)
	Crafting:parseCraftRecipe(player, msg)
	msg:delete()
end