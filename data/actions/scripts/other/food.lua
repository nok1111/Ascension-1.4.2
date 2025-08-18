local foods = {
	--300 = 5min
	--600 = 10min
	--900 = 15min
	--1200 = 20min
	--3600 = 1hr
	[2328] = {200, 'Gulp.'}, -- egg
	[2362] = {200, 'Crunch.'}, -- carrot
	[2666] = {200, 'Munch.'}, -- meat
	[2667] = {200, 'Munch.'}, -- fish
	[2668] = {200, 'Mmmm.'}, -- salmon
	[2669] = {200, 'Munch.'}, -- northern pike
	[2670] = {200, 'Gulp.'}, -- shrimp
	[2671] = {200, 'Chomp.'}, -- ham
	[2672] = {200, 'Chomp.'}, -- dragon ham
	[2673] = {200, 'Yum.'}, -- pear
	[2674] = {200, 'Yum.'}, -- red apple
	[2675] = {200, 'Yum.'}, -- orange
	[2676] = {200, 'Yum.'}, -- banana
	[2677] = {200, 'Yum.'}, -- blueberry
	[2678] = {200, 'Slurp.'}, -- coconut
	[2679] = {200, 'Yum.'}, -- cherry
	[2680] = {200, 'Yum.'}, -- strawberry
	[2681] = {200, 'Yum.'}, -- grapes
	[2682] = {200, 'Yum.'}, -- melon
	[2683] = {200, 'Munch.'}, -- pumpkin
	[2684] = {200, 'Crunch.'}, -- carrot
	[2685] = {200, 'Munch.'}, -- tomato
	[2686] = {200, 'Crunch.'}, -- corncob
	[2687] = {200, 'Crunch.'}, -- cookie
	[2688] = {200, 'Munch.'}, -- candy cane
	[2689] = {200, 'Crunch.'}, -- bread
	[2690] = {200, 'Crunch.'}, -- roll
	[2691] = {200, 'Crunch.'}, -- brown bread
	[2696] = {120, 'Smack.'}, -- cheese
	[2787] = {200, 'Munch.'}, -- white mushroom
	[2788] = {200, 'Munch.'}, -- red mushroom
	[2789] = {200, 'Munch.'}, -- brown mushroom
	[2790] = {200, 'Munch.'}, -- orange mushroom
	[2791] = {200, 'Munch.'}, -- wood mushroom
	[2792] = {200, 'Munch.'}, -- dark mushroom
	[2793] = {200, 'Munch.'}, -- some mushrooms
	[2794] = {200, 'Munch.'}, -- some mushrooms
	[2795] = {200, 'Munch.'}, -- fire mushroom
	[2796] = {200, 'Munch.'}, -- green mushroom
	[5097] = {200, 'Yum.'}, -- mango
	[6125] = {200, 'Gulp.'}, -- tortoise egg
	[6278] = {200, 'Mmmm.'}, -- cake
	[6279] = {200, 'Mmmm.'}, -- decorated cake
	[6393] = {200, 'Mmmm.'}, -- valentine's cake
	[6394] = {200, 'Mmmm.'}, -- cream cake
	[6501] = {200, 'Mmmm.'}, -- gingerbread man
	[6541] = {200, 'Gulp.'}, -- coloured egg (yellow)
	[6542] = {200, 'Gulp.'}, -- coloured egg (red)
	[6543] = {200, 'Gulp.'}, -- coloured egg (blue)
	[6544] = {200, 'Gulp.'}, -- coloured egg (green)
	[6545] = {200, 'Gulp.'}, -- coloured egg (purple)
	[6569] = {50, 'Mmmm.'}, -- candy
	[6574] = {150, 'Mmmm.'}, -- bar of chocolate
	[7158] = {300, 'Munch.'}, -- rainbow trout
	[7159] = {200, 'Munch.'}, -- green perch
	[7372] = {200, 'Yum.'}, -- ice cream cone (crispy chocolate chips)
	[7373] = {200, 'Yum.'}, -- ice cream cone (velvet vanilla)
	[7374] = {200, 'Yum.'}, -- ice cream cone (sweet strawberry)
	[7375] = {200, 'Yum.'}, -- ice cream cone (chilly cherry)
	[7376] = {200, 'Yum.'}, -- ice cream cone (mellow melon)
	[7377] = {200, 'Yum.'}, -- ice cream cone (blue-barian)
	[7909] = {4, 'Crunch.'}, -- walnut
	[7910] = {4, 'Crunch.'}, -- peanut
	[7963] = {60, 'Munch.'}, -- marlin
	[8112] = {9, 'Urgh.'}, -- scarab cheese
	[8838] = {10, 'Gulp.'}, -- potato
	[8839] = {5, 'Yum.'}, -- plum
	[8840] = {1, 'Yum.'}, -- raspberry
	[8841] = {1, 'Urgh.'}, -- lemon
	[8842] = {7, 'Munch.'}, -- cucumber
	[8843] = {5, 'Crunch.'}, -- onion
	[8844] = {1, 'Gulp.'}, -- jalapeño pepper
	[8845] = {5, 'Munch.'}, -- beetroot
	[8847] = {11, 'Yum.'}, -- chocolate cake
	[9005] = {7, 'Slurp.'}, -- yummy gummy worm
	[9114] = {5, 'Crunch.'}, -- bulb of garlic
	[9996] = {0, 'Slurp.'}, -- banana chocolate shake
	[10454] = {0, 'Your head begins to feel better.'}, -- headache pill
	[11246] = {15, 'Yum.'}, -- rice ball
	[11370] = {3, 'Urgh.'}, -- terramite eggs
	[11429] = {10, 'Mmmm.'}, -- crocodile steak
	[12415] = {20, 'Yum.'}, -- pineapple
	[12416] = {10, 'Munch.'}, -- aubergine
	[12417] = {8, 'Crunch.'}, -- broccoli
	[12418] = {9, 'Crunch.'}, -- cauliflower
	[12637] = {55, 'Gulp.'}, -- ectoplasmic sushi
	[12638] = {18, 'Yum.'}, -- dragonfruit
	[12639] = {2, 'Munch.'}, -- peas
	[13297] = {20, 'Crunch.'}, -- haunch of boar
	[15405] = {55, 'Munch.'}, -- sandfish
	[15487] = {14, 'Urgh.'}, -- larvae
	[15488] = {15, 'Munch.'}, -- deepling filet
	[16014] = {60, 'Mmmm.'}, -- anniversary cake
	[18305] = {0, 'Gulp!'}, -- fresh mushroom beer
	[18306] = {0, 'Phew!'}, -- stale mushroom beer
	[18397] = {33, 'Munch.'}, -- mushroom pie
	[19737] = {10, 'Urgh.'}, -- insectoid eggs
	[20100] = {15, 'Smack.'}, -- soft cheese
	[20101] = {12, 'Smack.'}, -- rat cheese
	
	[35338] = {500, 'Smack.'}, -- big round cheese
	[35342] = {350, 'Smack.'}, -- slice of cheese
	[35339] = {350, 'Smack.'}, -- slice of cheese
	[35343] = {250, 'Smack.'} -- piece of cheese
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local food = foods[item.itemid]
	if not food then
		return false
	end

	local condition = player:getCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)
	if condition and math.floor(condition:getTicks() / 1000 + (food[1] * 1)) >= 3600 then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are full.')
		return true
	end
	
	if not condition then
	player:feed(food[1] * 1)
	player:say(food[2], TALKTYPE_MONSTER_SAY)
	item:remove(1)
	player:sendAddBuffNotification(20, (food[1] * 1), 'Well Fed: You feel better!', 1, 0)
	else
	player:feed(food[1] * 1)
	player:sendAddBuffNotification(20, condition:getTicks() / 1000, 'Well Fed: Mana regenerations has increased by 6 points!', 1, 0)
	player:say(food[2], TALKTYPE_MONSTER_SAY)
	item:remove(1)
	return true
	end

	
	return true
end
