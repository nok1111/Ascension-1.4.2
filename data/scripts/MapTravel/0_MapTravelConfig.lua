
MapTravel = {}

MapTravel_OPCODE = 214

MapTravel.baseStorage = 244444

MapTravel.usageRange = 7

MapTravel.mapNodesConfig = {
	[1] = {
		displayName = "Islanda",
		nameId = "Islanda",
		discoverable = false,
		modulePos = {marginTop = 150, marginLeft = 202.5},
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
		discoverable = true,
		modulePos = {marginTop = 110, marginLeft = 900},
		serverPos = {1106, 419, 7},
		premium = true,
		cost = {
			gold = 300,
		},
	},
	[4] = {
		displayName = "Carlin",
		nameId = "Carlin",
		discoverable = false,
		modulePos = {marginTop = 965, marginLeft = 470},
		serverPos = {32387, 31822, 6},
		premium = true,
		cost = {
			gold = 300,
		},
	},
	[5] = {
		displayName = "Celestara",
		nameId = "Celestara",
		discoverable = true,
		modulePos = {marginTop = 1085, marginLeft = 162.5},
		serverPos = {31921, 32072, 6},
		premium = true,
		cost = {
			gold = 300,
		},
	},
	[6] = {
		displayName = "Cormaya",
		nameId = "Cormaya",
		discoverable = false,
		modulePos = {marginTop = 1137.5, marginLeft = 1490},
		serverPos = {33288, 31956, 6},
		premium = true,
		cost = {
			gold = 300,
		},
	},
	[7] = {
		displayName = "Darashia",
		nameId = "Darashia",
		discoverable = false,
		modulePos = {marginTop = 1500, marginLeft = 1447.5},
		serverPos = {33289, 32482, 6},
		premium = 300,
	},
	[8] = {
		displayName = "Edron",
		nameId = "Edron",
		discoverable = false,
		modulePos = {marginTop = 802.5, marginLeft = 1437.5},
		serverPos = {33177, 31764, 6},
		premium = true,
		cost = {
			gold = 300,
		},
	},
	[9] = {
		displayName = "Fibula",
		nameId = "Fibula",
		discoverable = true,
		modulePos = {marginTop = 1597.5, marginLeft = 362.5},
		serverPos = {1010, 1073, 7},
		premium = true,
	},
	[10] = {
		displayName = "Garona",
		nameId = "Garona",
		discoverable = true,
		modulePos = {marginTop = 150, marginLeft = 1300},
		serverPos = {33268, 31565, 6},
		premium = true,
		storagesReqs = {{id = 50002, value = 1, name = "Path to Garona"}},
		cost = {
			gold = 300,
		},
	},
	[11] = {
		displayName = "Goroma",
		nameId = "Goroma",
		discoverable = false,
		modulePos = {marginTop = 1705, marginLeft = 282.5},
		serverPos = {32161, 32556, 6},
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
	[13] = {
		displayName = "Ironforge",
		nameId = "Ironforge",
		discoverable = true,
		modulePos = {marginTop = 480, marginLeft = 832.5},
		serverPos = {32891, 31411, 6},
		premium = true,
		cost = {
			gold = 300,
		},
	},
	[14] = {
		displayName = "Kazordoon",
		nameId = "Kazordoon",
		discoverable = false,
		modulePos = {marginTop = 1055, marginLeft = 737.5},
		serverPos = {1005, 1073, 7},
		premium = true,
		cost = {
			gold = 300,
		},
	},
	[15] = {
		displayName = "Liberty Bay",
		nameId = "LibertyBay",
		discoverable = false,
		modulePos = {marginTop = 1990, marginLeft = 437.5},
		serverPos = {32285, 32890, 6},
		premium = true,
		cost = {
			gold = 300,
		},
	},
	[16] = {
		displayName = "Port Hope",
		nameId = "PortHope",
		discoverable = false,
		modulePos = {marginTop = 1847.5, marginLeft = 775},
		serverPos = {32529, 32784, 6},
		premium = true,
		cost = {
			gold = 300,
		},
	},
	[17] = {
		displayName = "Svargrond",
		nameId = "Svargrond",
		discoverable = false,
		modulePos = {marginTop = 150, marginLeft = 202.5},
		serverPos = {32341, 31108, 6},
		premium = true,
		cost = {
			gold = 300,
		},
	},
	[18] = {
		displayName = "Thais",
		nameId = "Thais",
		discoverable = false,
		modulePos = {marginTop = 1292.5, marginLeft = 480},
		serverPos = {32310, 32210, 6},
		premium = true,
		cost = {
			gold = 300,
		},
	},
	[19] = {
		displayName = "Venore",
		nameId = "Venore",
		discoverable = false,
		modulePos = {marginTop = 1147.5, marginLeft = 1145},
		serverPos = {32953, 32022, 6},
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