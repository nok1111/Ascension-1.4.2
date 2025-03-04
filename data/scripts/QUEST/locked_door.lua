local restrictedActionIds = {
    [123] = "This item cannot be used right now.",
    [124] = "You lack the power to use this item.",
    [125] = "This item is locked by magic.",
}

local restrictedAction = Action()

function restrictedAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local message = restrictedActionIds[item.actionid]
    if message then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, message)
        return false
    end

    return true 
end


for actionId, _ in pairs(restrictedActionIds) do
    restrictedAction:aid(actionId)
end

restrictedAction:register()