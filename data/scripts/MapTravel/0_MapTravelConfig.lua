
MapTravel = {}

MapTravel_OPCODE = 214

MapTravel.baseStorage = 244444

MapTravel.usageRange = 7

MapTravel.mapNodesConfig = {
	[1] = {
		displayName = "Islanda",
		nameId = "islanda",
		discoverable = false,
		modulePos = {marginTop = 20, marginLeft = 202.5},
		serverPos = {432, 335, 7},
		premium = true,
		cost = {
			gold = 300,
		},
	},
	[2] = {
		displayName = "Swantears",
		nameId = "swantears",
		discoverable = false,
		modulePos = {marginTop = 92, marginLeft = 760},
		serverPos = {908, 456, 5},
		premium = false,
		cost = {
			gold = 300,
		},
	},
	[3] = {
		displayName = "Heleda",
		nameId = "heleda",
		discoverable = false,
		modulePos = {marginTop = 250, marginLeft = 1020},
		serverPos = {1106, 419, 7},
		premium = true,
		cost = {
			gold = 300,
		},
	},
	[4] = {
		displayName = "Galestra City",
		nameId = "galestra",
		discoverable = false,
		modulePos = {marginTop = 410, marginLeft = 5},
		serverPos = {124, 776, 0},
		premium = false,
		cost = {
			gold = 0,
		},
	},
	[5] = {
		displayName = "Garona",
		nameId = "garona",
		discoverable = false,
		modulePos = {marginTop = 575, marginLeft = 95.5},
		serverPos = {283, 756, 7},
		premium = false,
		cost = {
			gold = 300,
		},
	},
	[6] = {
		displayName = "Vendel Pass",
		nameId = "vendel",
		discoverable = false,
		modulePos = {marginTop = 700, marginLeft = 190},
		serverPos = {442, 858, 7},
		premium = false,
		cost = {
			gold = 300,
		},
	},
	[7] = {
		displayName = "Greith Keep",
		nameId = "greith",
		discoverable = false,
		modulePos = {marginTop = 625, marginLeft = 530.5},
		serverPos = {813, 795, 7},
		premium = false,
		cost = {
			gold = 300,
		},
	},
	[8] = {
		displayName = "Ziill Keep",
		nameId = "ziill",
		discoverable = false,
		modulePos = {marginTop = 802.5, marginLeft = 510.5},
		serverPos = {692, 924, 7},
		premium = false,
		cost = {
			gold = 300,
		},
	},
	[9] = {
		displayName = "WildThorns",
		nameId = "wildthorns",
		discoverable = false,
		modulePos = {marginTop = 775.5, marginLeft = 850.5},
		serverPos = {33177, 31764, 6},
		premium = false,
		cost = {
			gold = 300,
		},
	},
	[10] = {
		displayName = "Thar'Neskar",
		nameId = "tharneskar",
		discoverable = false,
		modulePos = {marginTop = 950, marginLeft = 508},
		serverPos = {732, 1082, 7},
		premium = false,
		--storagesReqs = {{id = 50002, value = 1, name = "Path to Garona"}},
		cost = {
			gold = 300,
		},
	},
	[11] = {
		displayName = "Vhassim",
		nameId = "vhassim",
		discoverable = false,
		modulePos = {marginTop = 1055, marginLeft = 737.5},
		serverPos = {959, 1198, 6}, 
		premium = true,
		cost = {
			gold = 300,
		},
	},
	[12] = {
		displayName = "Havenhold",
		nameId = "Havenhold",
		discoverable = false,
		modulePos = {marginTop = 1497.5, marginLeft = 100},
		serverPos = {32008, 32443, 6},
		premium = true,
		cost = {
			gold = 300,
		},
	},
}

--[[
storagesReqs = {{id = 5157, value = 2, name = "finish 2nd quest from Terax"}, {id = 5158, value = 1, name = "kill X boss atleast once"}},
cost = {
	gold = 5000,
	items = {{id = 2148, name = "Tear drops", amount = 100}, {id = 2152, name = "Placeholder", amount = 50}},
	storage = {
		{value = 5151, amount = 10, name = "Task Points"},
		{value = 5152, amount = 10, name = "Rolad Points"}
	},
},
--]]