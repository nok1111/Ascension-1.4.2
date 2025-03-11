local itemmovedquest = EventCallback

itemmovedquest.onItemMoved = function(self, item, count, fromPosition, toPosition, fromCylinder, toCylinder)


	local rose_floor = Position(1651, 3321, 7)
	local roseItem = Tile(rose_floor):getItemById(24323)
	if roseItem then
		local storrose = self:getStorageValue(1990)
		local newrose = Position(3686, 5144, 6)

		roseItem:remove()
		rose_floor:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		self:setStorageValue(12001, 1)
		self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, 'Quest: You have paid your respects .')
	end

	return RETURNVALUE_NOERROR
end

itemmovedquest:register()
