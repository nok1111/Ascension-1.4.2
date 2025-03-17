local action = Action()

function action.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local transformations = {
        [12692] = 12695,
        [12695] = 12692,
        [12701] = 12705,
        [12705] = 12701
    }

    local newItemId = transformations[item.itemid]
    if newItemId then
        item:transform(newItemId)
    end

    return true
end

action:id(12692, 12695, 12701, 12705)
action:register()
