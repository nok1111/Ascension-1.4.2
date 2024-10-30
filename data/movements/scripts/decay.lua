function onStepIn(creature, item, position, fromPosition, zoneid)
	item:transform(item.itemid + 1)
	item:decay()
	return true
end
