local doorRequirements = {
    [3000] = {storage = 40037, value = TASK_REWARD_RECEIVED, message = "The door remains locked."},
    [3001] = {storage = 5002, value = 2, message = "You lack the required authority to pass."},
    [3002] = {storage = 5003, value = 1, message = "A magical force prevents you from opening this door."},
    [3003] = {storage = false, value = 1, message = "A magical force prevents you from opening this door."},

}

local restrictedDoor = Action()

function restrictedDoor.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local requirement = doorRequirements[item.actionid]
    if requirement then

        if not requirement.storage then
             player:sendTextMessage(MESSAGE_EVENT_ADVANCE, requirement.message)
            return false
        end


        if player:getStorageValue(requirement.storage) < requirement.value then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, requirement.message)
            return false
        end
    end
    return true
end

for actionId, _ in pairs(doorRequirements) do
    restrictedDoor:aid(actionId)
end

restrictedDoor:register()
