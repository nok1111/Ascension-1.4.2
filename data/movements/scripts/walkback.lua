function onStepIn(creature, item, position, fromPosition, zoneid)
	if item.uid > 0 and item.uid <= 65535 then
		creature:teleportTo(fromPosition, false)
	end
	return true
end
