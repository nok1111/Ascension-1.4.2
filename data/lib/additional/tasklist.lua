npcTaskList = {
		["Sheriff Gordon"] = { 138, 139, 142},
        ["Grave Robber Lucas"] = { 1, 2},
        ["Mr. Simone"] = { 3, 4, 9 },
        ["Guard Leader Smith"] = { 25, 143 },
		["Farmer Saul"] = { 6, 7 },
		["Ms. Faerlina"] = { 8 },
		["Guard Thomas"] = { 10, 11, 32 },
		["Lily Spirit"] = { 13, 14, 15 },
		["Last Library Guardian"] = { 12 },
		["Explorer Gary"] = { 16, 144 },
		["Dog Tammer Alexander"] = { 17, 18, 19 },
		["Knight Panth Ertel"] = { 20, 21, 22 },
		["Dr Rosecold"] = { 24 },
		["Aylin Rosecold"] = { 23 },
		["Farmer Brayle"] = { 26, 27 },
		["Vazmol Bonetank"] = { 28, 29, 30 },
		["Astrerlun Longbrow"] = { 31 },
		["Priestess Leucelia"] = { 38 },
		["Melgrom Strongfury"] = { 33, 34, 35 },
		["Melgus Threnhug"] = { 36 },
		["Thomas Mathew"] = { 37, 140, 141, 39 },
		["Farmer Gloria Harvestly"] = { 40 },
		["Farmer Jhonson Harvestly"] = { 41 },
		
		["Naturalist sasha"] = { 45 },
		["Rut'Krall"] = { 46 },
		["Shaman Guzumhk"] = { 47 },
		["Crafter Aylin"] = { 48, 49, 50 },
		["Garona explorer"] = { 51 },
		["Explorer Melina"] = { 52 },
		["Lieutenant Sora"] = { 53 },
		["Engineer Kuboltz"] = { 54 },
		["Dragon Slayer Lumeria"] = { 55 },
		["Rune Guardian Nyce"] = { 56, 57 },
		["Romelia"] = { 58, 59, 60 },
		
		
		
		--djinns palace
		["Magic Apprentice Rulel"] = { 145 },
		["Master Zarak"] = { 147 },
		--dragonscale island
		["Dragonslayer Marilo"] = { 146 },
		
		--wildthorns
		["Slayer Selucreh"] = { 63, 64, 65, 66 },
		["Egg Collector Clara Harvestly"] = { 67, 68 },
		["Rich Boy Ricky"] = { 69 },
		["Engineer Guzlok"] = { 70 },
		["WildThorn's Commander Lizor"] = { 71, 72, 73, 74, 75 },
		
		--darklands
		["Dr Romero"] = { 148, 149 },
		
		--sandstorms
		["Sandstorm General Pretovks"] = { 76, 78 },
		["Chef Martini"] = { 81, 82 },
		["Guardian Salameth"] = { 83 },
		["Leny"] = { 84 },
		["kresh"] = { 85 },
		["Soul Guadian Iyanna Arienal"] = { 86 },
		["Disciple Tyron"] = { 77 },
		["Treasure Hunter Thom"] = { 87 },
		
		--T3 CALAMITY DESERT
		["Saren Nightshade"] = { 151, 152, 153 },
		
		--t3 treasures island
		["Shinsop"] = { 97, 98 },
		["Karota Potz"] = { 93, 96 },
		["Bamboosha"] = { 95 },
		["Neytha"] = { 94, 99 },
		["Captain Koolacha"] = { 88, 89, 90, 91, 92 },
		
		--Nemea isle
		["Golethaz"] = { 110, 119 },
		["Commander Xelth"] = { 120, 117, 121 },
		
		["Captain OFish"] = { 111, 112, 113, 118 },
		["Big Jones"] = { 114 },
		["Stinkin Pete"] = { 115 },
		
		
		["Amastan"] = { 122, 123, 107 },
		["Genseric"] = { 108, 109 },
		
		["Joanna Beauchamp"] = { 100, 101, 102 },
		["Jaijoke Grelenor"] = { 103, 104, 105 },
		["Jules Gatlin"] = { 106, 116 },
		--Swan Tears
		
		
		["Jules Gatlin"] = { 106, 116 },
		
	--	T4 SWAN TEARs
		["Commander Snow"] = { 125, 124 },
		["Orphanage Manager"] = { 132 },
		["Camile Frostribe"] = { 135 },
		["Niel Frostribe"] = { 136 },
		["Tina Frostribe"] = { 133 },
		["Prince Darnell"] = { 126},
		["Florina"] = { 127, 137 },
		["Lieutenant Dan"] = { 129, 131 },
		["Explorer Kalesia"] = { 130 },
		["Flight Master Earhart"] = { 134 },
		
	--t4 fisrt access
		["Kaiser Frost"] = { 154, 155 },
		["Leo Reno"] = { 156, 157 },
		
	--t5 firewind
	["Runemaster Zoel"] = { 158 },
	["Civilian Charlie"] = { 159 },
	["Marine Lowtail"] = { 160, 161 },
	["Captain Bulrat"] = { 162 },
	["Fisherman Holser"] = { 43 },
	["Dragon Slayer Belserion"] = { 163, 164 },
	["Soriel, The True Native"] = { 165, 166 },
	["Nar'thalas"] = { 167 },
	
	--dreamsoul forest
	["Cinetha"] = { 000 },
	["Galopet"] = { 000 },
	["Huloggy"] = { 000 },
	["Keloptos"] = { 000 },
	["Mr Cross"] = { 000 },
	["Cinetha"] = { 000 },
	["Cinetha"] = { 000 },
	["The Hero"] = { 62 },



    -- gehenna



    --rep QUESTS

}

playersTasks = {
    [1] = {
        taskNumber = 1,
        taskName = "Lost Trophy",
        taskDescription = "some rumors say that mr ludrich golden trophy is still here, do you now the value of such thing? dude, it is made of pure gold!",
        taskGoals = {
            monsters = {			                 

            },
            items = {
			[1] = {
                    name = "Golden Figurine",
                    itemId = 5799
                    }

            },
            storages = {
                --[[[1] = {
                    starageName = "Light candel",
                    starageTaskId = 12000
                }]]
            }
        },
        taskGoalCnt = 1,
        taskMinLvl = 1,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40001,
        taskStorageCnt = 40002,
        taskRewards = {
            experience = 600, --or nil
            items = {
                [1] = {
                    name = "grave robber shovel",
                    itemCid = 5710,
                    itemSid = 5710,
                    itemCnt = 1
                },
				[2] = {
                    name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 15
                },
				[3] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 2
                }
            },
            outfits = {
                --[1] = {
                  --  name = "Oriental",
                   -- lookType = 146
                }
            },
      taskZoneName = "garona north cave",
	  taskSource = "Grave Robber Lucas",
	  taskHint = "N/A"
    },
    [2] = {
        taskNumber = 2,
        taskName = "in memory of Mr. Ludrich",
        taskDescription = "i swear this damn old grandpa will haunt me in my sleeps if we dont take care of him.",
        taskGoals = {
            monsters = {
			[1] = {
                    name = "Mr. Ludrich",
                    spriteId = 1552
                }
            },
            items = {
               
            },
            storages = {
                --[[[1] = {
                    starageName = "Light candel",
                    starageTaskId = 12000
                }]]
            }
        },
        taskGoalCnt = 1,
        taskMinLvl = 3,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40003,
        taskStorageCnt = 40004,
        taskRewards = {
            experience = 450, --or nil
            items = {
                [1] = {
                    name = "blue gem",
                    itemCid = 2158,
                    itemSid = 2158,
                    itemCnt = 3
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 3
                },
				[3] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 2
                }
            },
            outfits = {
            }
        },
		taskZoneName = "garona north cave",
	  taskSource = "Grave Robber Lucas",
	  taskHint = "Use grave digger shovel"
    },
    [3] = {
        taskNumber = 3,
        taskName = "Eternal Love",
        taskDescription = "I really miss my wife in these hard days, she passed away time ago. Her name? My beautiful shelia. (Find a way to pay respects in Shelias memory).",
        taskGoals = {
            monsters = {
            },
            items = {
            },
            storages = {
                [1] = {
                    starageName = "Pay Respects",
                    starageTaskId = 12001
                }
            }
        },
        taskGoalCnt = 1,
        taskMinLvl = 25,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40005,
        taskStorageCnt = 40006,
        taskRewards = {
            experience = 22850, --or nil
            items = {
                [1] = {
                    name = "Orb of Performance",
                    itemCid = 25731,
                    itemSid = 29032,
                    itemCnt = 1
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 6
                },
				[3] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 2
                },
				[4] = {
                    name = "dream feather",
                    itemCid = 32074,
                    itemSid = 38291,
                    itemCnt = 1,
					itemRairity = 1
                },
            },
            outfits = {
            }
        },
		taskZoneName = "Garona East Camp",
	  taskSource = "Mr. Simone",
	  taskHint = "N/A"
    },
    [4] = {
        taskNumber = 4,
        taskName = "The Cursed Signet",
        taskDescription = "this ring has only brought misfortune to my family, please get rid of it, I'm afraid it was a gift from that damn witch. use the witch cauldron to destroy the ring, last time she was seen she was in a campment to the east. ",
        taskGoals = {
            monsters = {
            },
            items = {
            },
            storages = {
                [1] = {
                    starageName = "Ring Destroyed",
                    starageTaskId = 12002
                }
            }
        },
        taskGoalCnt = 1,
        taskMinLvl = 25,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40007,
        taskStorageCnt = 40008,
        taskRewards = {
            experience = 33750, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 25
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 5
                },
				[3] = {
                    name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 2
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 2
                },
				[5] = {
                    name = "dream feather",
                    itemCid = 32074,
                    itemSid = 2168,
                    itemCnt = 1,
					itemRairity = 1
                },
				
            },
            outfits = {
            }
        },
		taskZoneName = "East Witch Campment",
	  taskSource = "Mr. Simone",
	  taskHint = "Use Large Cauldron"
    },
    [5] = {
        taskNumber = 5,
        taskName = "Stay on Guard",
        taskDescription = "go find guard Smiles and guard Jhon and tell them to be on guard, I've heard some rumors that the goblins might invade us. (say 'stay on guard' to guards jhon and smiles.",
        taskGoals = {
            monsters = {
            },
            items = {
            },
            storages = {
                [1] = {
                    starageName = "Guards Warned",
                    starageTaskId = 12003
                }
            }
        },
        taskGoalCnt = 2,
        taskMinLvl = 8,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40009,
        taskStorageCnt = 40010,
        taskRewards = {
            experience = 700, --or nil
            items = {
                 [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 20
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 2
                },
            },
            outfits = {
            }
        },
		taskZoneName = "Garona City",
	  taskSource = "Guard Leader Smith",
	  taskHint = "Talk to West and north exit Guards"
    },
    [6] = {
        taskNumber = 6,
        taskName = "Gathering Wheat",
        taskDescription = "Help this old mate gather 15 bunch of wheat. my back hurts to much these days young adventurer, i will be grateful if you fullfil this task.",
        taskGoals = {
            monsters = {
               
                
            },
            items = {
			 [1] = {
                    name = "Bunch of Wheat",
                    itemId = 2694
                }
            },
            storages = {
            }
        },
        taskGoalCnt = 15,
        taskMinLvl = 30,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40011,
        taskStorageCnt = 40012,
        taskRewards = {
            experience = 65000, --or nil
            items = {
                 [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 45
                },
				[2] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 2
                },
				[3] = {
                    name = "strong mana potion",
                    itemCid = 31685,
                    itemSid = 35766,
                    itemCnt = 20
                },

            },
            outfits = {
            }
        },
		taskZoneName = "Garona East Campment",
	  taskSource = "Farmer Saul",
	  taskHint = "Use Scythe"
    },
    [7] = {
        taskNumber = 7,
        taskName = "retrieving the pigs ",
        taskDescription = "some of my pigs were stolen, dont know where to find them, can u get them back for me?",
        taskGoals = {
            monsters = {
            },
            items = {

            },
            storages = {
			    [1] = {
                    starageName = "Pigs retrievered",
                    starageTaskId = 12006
                }
            }
        },
        taskGoalCnt = 5,
        taskMinLvl = 55,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40013,
        taskStorageCnt = 40014,
        taskRewards = {
            experience = 62050, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 45
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 6
                },
				[3] = {
                    name = "Sheep Pet Egg",
                    itemCid = 33714,
                    itemSid = 37938,
                    itemCnt = 1
                },
				[4] = {
                    name = "strong health potion",
                    itemCid = 31688,
                    itemSid = 35769,
                    itemCnt = 20
                },			
            },
            outfits = {
            }
        },
		taskZoneName = "Garona East Campment",
	  taskSource = "Farmer Saul",
	  taskHint = "Goblins and thieves love pigs "
    },
    [8] = {
        taskNumber = 8,
        taskName = "Chicken Run!",
        taskDescription = "its time to feed the chickens can u catch 8 of them with this broom, why a broom? well it is easier if they are knocked out :p",
        taskGoals = {
            monsters = {
                
            },
            items = {
            },
            storages = {
			[1] = {
                    starageName = "Chickens Captured",
                    starageTaskId = 12007
                }
            }
        },
        taskGoalCnt = 10,
        taskMinLvl = 25,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40015,
        taskStorageCnt = 40016,
        taskRewards = {
            experience = 45700, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 30
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 6
                },

				[3] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 3
                },				
				[4] = {
                    name = "Vial of haste",
                    itemCid = 31694,
                    itemSid = 35775,
                    itemCnt = 5
                },
				[5] = {
                    name = "Rooster Pet",
                    itemCid = 33781,
                    itemSid = 37862,
                    itemCnt = 1
                },
				
            },
            outfits = {
            }
        },
		taskZoneName = "Garona East Campment",
	  taskSource = "Ms. Faerlina",
	  taskHint = "Use Broom from Faerlina"
    },
    [9] = {
        taskNumber = 9,
        taskName = "Lucella, The Witch [DUNGEON]",
        taskDescription = "Find and Kill the Witch, she or whatever it is, probably just a monster! that's what she is. find her at the east witches hideout.",
        taskGoals = {
            monsters = {
			[1] = {
                    name = "Lucella, The Witch",
                    spriteId = 1552
                }
            },
            items = {
            },
            storages = {
                
            }
        },
        taskGoalCnt = 1,
        taskMinLvl = 35,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40017,
        taskStorageCnt = 40018,
        taskRewards = {
            experience = 150500, --or nil
            items = {

				[1] = {
                    name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 2
                },
				[2] = {
                    name = "Orb of Performance",
                    itemCid = 25731,
                    itemSid = 29032,
                    itemCnt = 5
                },
				[3] = {
                    name = "dream feather",
                    itemCid = 32074,
                    itemSid = 2167,
                    itemCnt = 1,
					itemRairity = 1
                },

            },
            outfits = {
            }
        },
	  taskZoneName = "Garona East Campment",
	  taskSource = "Mr. Simone",
	  taskHint = "Dungeon"
    },
    [10] = {
        taskNumber = 10,
        taskName = "Gurzul, The Merciless",
        taskDescription = "Find and kill Gurzul, The Merciless. He is a goblin and it is responsable for many crimes agains our citizen. kill him and stop his people.",
        taskGoals = {
            monsters = {
                [1] = {
                    name = "Gurzul, The Merciless",
                    spriteId = 1694
                }
            },
            items = {
            },
            storages = {
            }
        },
        taskGoalCnt = 1,
        taskMinLvl = 13,
        taskMaxLvl = 22,
        taskRepeat = false,
        taskStorageId = 40019,
        taskStorageCnt = 40020,
        taskRewards = {
            experience = 320000, --or nil
            items = {
				[1] = {
                    name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 1
                },
				[2] = {
                    name = "Orb of Performance",
                    itemCid = 25731,
                    itemSid = 29032,
                    itemCnt = 2
                }
            },
            outfits = {
            }
        },
		taskZoneName = "North Garona",
	  taskSource = "Guard Thomas",
	  taskHint = "Dungeon"
    },
	 [11] = {
        taskNumber = 11,
        taskName = "Man Billy",
        taskDescription = "Find and kill the bandits leader Man billy. I heard he's hideout is in a mountain in the east of the island.",
        taskGoals = {
            monsters = {
                [1] = {
                    name = "Man Billy",
                    spriteId = 1525
                }
            },
            items = {
            },
            storages = {
            }
        },
        taskGoalCnt = 1,
        taskMinLvl = 8,
        taskMaxLvl = 22,
        taskRepeat = false,
        taskStorageId = 40021,
        taskStorageCnt = 40022,
        taskRewards = {
            experience = 1300, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 60
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 2
                },
				[3] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 3
                },
				[4] = {
                    name = "dream feather",
                    itemCid = 32074,
                    itemSid = 36359,
                    itemCnt = 1,
					itemRairity = 1
                },

            },
            outfits = {
            }
        },
		taskZoneName = "North Garona",
	  taskSource = "Guard Thomas",
	  taskHint = "Thives Campment"
    },
		 [12] = {
        taskNumber = 12,
        taskName = "Find and help lily",
        taskDescription = "Find and help lily, get a lit candelabrum and remove the flower seal on top of her wooden coffin. i heard she and her three brothers were killed by Mousthafar time ago, but her soul was sealed here.",
        taskGoals = {
            monsters = {
            },
            items = {
            },
            storages = {
			[1] = {
                    starageName = "Find and Help lily",
                    starageTaskId = 40025
                }
            }
        },
        taskGoalCnt = 1,
        taskMinLvl = 10,
        taskMaxLvl = 22,
        taskRepeat = false,
        taskStorageId = 40023,
        taskStorageCnt = 40024,
        taskRewards = {
            experience = 1111, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 25
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 5
                },
				[3] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 2
                },
				[4] = {
                    name = "armor lootbox [T1]",
                    itemCid = 32672,
                    itemSid = 36753,
                    itemCnt = 1
                },
				[5] = {
                    name = "weapon lootbox [T1]",
                    itemCid = 32673,
                    itemSid = 36754,
                    itemCnt = 1
                },
	
            },
            outfits = {
            }
        },
		taskZoneName = "Old Library",
	  taskSource = "Last Library Guardian",
	  taskHint = "Remove Lily's Seal"
    },
	 [13] = {
        taskNumber = 13,
        taskName = "Messy Library ",
        taskDescription = "how many time has passed? what is this place? is this garona's library? what happened? so many questions, lets start cleaning this mess.",
        taskGoals = {
            monsters = {
                
            },
            items = {
			 [1] = {
                    name = "Book of prayers",
                    itemId = 10563
                }
            },
            storages = {
            }
        },
        taskGoalCnt = 7,
        taskMinLvl = 25,
        taskMaxLvl = 22,
        taskRepeat = false,
        taskStorageId = 40025,
        taskStorageCnt = 40026,
        taskRewards = {
            experience = 58000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 36
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 4
                },


	
            },
            outfits = {
            }
        },
		taskZoneName = "Old Library",
	  taskSource = "Lily Spirit",
	  taskHint = "N/A"
    },
		 [14] = {
        taskNumber = 14,
        taskName = "From bones to dust",
        taskDescription = "what are those creatures? are they even alive? this was supposed to be a sacred place.",
        taskGoals = {
            monsters = {
                [1] = {
                    name = "Skeleton",
                    spriteId = 1525
                },
				[2] = {
                    name = "Ghoul",
                    spriteId = 1525
                }
            },
            items = {
			
            },
            storages = {
            }
        },
        taskGoalCnt = 30,
        taskMinLvl = 25,
        taskMaxLvl = 22,
        taskRepeat = false,
        taskStorageId = 40027,
        taskStorageCnt = 40028,
        taskRewards = {
            experience = 55900, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 40
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 4
                },
				[3] = {
                    name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 2
                },	
            },
            outfits = {
            }
        },
		taskZoneName = "Old Library",
	  taskSource = "Lily Spirit",
	  taskHint = "N/A"
    },
		 [15] = {
        taskNumber = 15,
        taskName = "Mousthafar, The Non-Living",
        taskDescription = "finally, he or whatever it is, it will go down today! are you with me. Mousthafar the beast that killed me and my brothers will perish today!.",
        taskGoals = {
            monsters = {
                [1] = {
                    name = "Mousthafar, The Non-Living",
                    spriteId = 1525
                },

            },
            items = {
			
            },
            storages = {
            }
        },
        taskGoalCnt = 1,
        taskMinLvl = 25,
        taskMaxLvl = 22,
        taskRepeat = false,
        taskStorageId = 40029,
        taskStorageCnt = 40030,
        taskRewards = {
            experience = 10500, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 50
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 5
                },

				[3] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 5
                },
				[4] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 2
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }	
            },
            outfits = {
            }
        },
		taskZoneName = "Old Library",
	  taskSource = "Lily Spirit",
	  taskHint = "N/A"
    },
	[16] = {
        taskNumber = 16,
        taskName = "A strange request",
        taskDescription = "Adventurer, I'm Explorer Gary. I left my medicine pouch in the east watch tower near my location. Can you retrieve it for me? It's important to me since this swamps are pretty dangerous, and I'll reward you for your help. Thanks!",
        taskGoals = {
            monsters = {
                
            },
            items = {
			 [1] = {
                    name = "Medicine Pouch",
                    itemId = 13506
                }
            },
            storages = {
            }
        },
        taskGoalCnt = 1,
        taskMinLvl = 25,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40031,
        taskStorageCnt = 40032,
        taskRewards = {
            experience = 45850, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 50
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }	
            },
            outfits = {
            }
        },
		taskZoneName = "West Garona",
	  taskSource = "Explorer Gary",
	  taskHint = "N/A"
    },
	[17] = {
        taskNumber = 17,
        taskName = "Find the whistle",
        taskDescription = "Hey there, I'm Alexander. I seem to have misplaced my Wooden Whistle, the tool I use to control my pack of trained dogs. Can you help me find it? I can't remember where I put it, but I know it's somewhere in or around my house. Once you find it, please bring it back to me before my next training session. My dogs are loyal to me, so be careful not to provoke them. If you help me out, I'll be sure to reward you for your troubles. Thanks!",
        taskGoals = {
            monsters = {
                
            },
            items = {
			 [1] = {
                    name = "Wooden Whistle",
                    itemId = 5786
                }
            },
            storages = {
            }
        },
        taskGoalCnt = 1,
        taskMinLvl = 35,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40033,
        taskStorageCnt = 40034,
        taskRewards = {
            experience = 79900, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 40
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 8
                },
				[3] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                },
				[4] = {
                    name = "dream feather",
                    itemCid = 32074,
                    itemSid = 2181,
                    itemCnt = 1,
					itemRairity = 1
                },
	
            },
            outfits = {
            }
        },
		taskZoneName = "West Garona",
	  taskSource = "Dog Tammer Alexander",
	  taskHint = "Find Dog Tammer Alexander house"
    },
	 [18] = {
        taskNumber = 18,
        taskName = "Dog Toys",
        taskDescription = "Dog Tammer Alexander here. My pack of dogs lost their football toys all over the swamp. Can you find and collect at least 8 of them for me? Bring them back to me and I'll reward you. Thanks!",
        taskGoals = {
            monsters = {
            },
            items = {
			 [1] = {
                    name = "Dogs Football",
                    itemId = 2109
                }
            },
            storages = {

            }
        },
        taskGoalCnt = 8,
        taskMinLvl = 40,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40035,
        taskStorageCnt = 40036,
        taskRewards = {
            experience = 95000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 60
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 10
                },
				[3] = {
                    name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 2
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 2
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }

            },
            outfits = {
            }
        },
		taskZoneName = "West Garona",
	  taskSource = "Dog Tammer Alexander",
	  taskHint = "Pick footballs"
    },
		 [19] = {
        taskNumber = 19,
        taskName = "Dog Whisperer",
        taskDescription = "Find Cookies, cookies is my precious trained dog. Last time we saw him was far west. if you find him use this pet command [cookies follow]. he will follow you for sure.",
        taskGoals = {
            monsters = {
            },
            items = {
			 
            },
            storages = {
				[1] = {
                    starageName = "Find Cookies",
                    starageTaskId = 12011
                }
            }
        },
        taskGoalCnt = 1,
        taskMinLvl = 40,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40037,
        taskStorageCnt = 40038,
        taskRewards = {
            experience = 120000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 60
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Old Dog pet",
                    itemCid = 33814,
                    itemSid = 37895,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 4
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }

            },
            outfits = {
            }
        },
		taskZoneName = "West Garona",
	  taskSource = "Dog Tammer Alexander",
	  taskHint = "N/A"
    },
	 [20] = {
        taskNumber = 20,
        taskName = "Cleansing the Toxins",
        taskDescription = "the lands are infested with these horrares, and as if that were not enough, they are now poisonous, can you believe it? poisonous!.",
        taskGoals = {
            monsters = {
                [1] = {
                    name = "Poison Skeleton",
                    spriteId = 1718
                },

            },
            items = {
			
            },
            storages = {
            }
        },
        taskGoalCnt = 25,
        taskMinLvl = 65,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40039,
        taskStorageCnt = 40040,
        taskRewards = {
            experience = 125000, --or nil
            items = {
                [1] = {
                    name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 1
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 4
                },
				[3] = {
                    name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 1
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                },
				[6] = {
                    name = "dream feather",
                    itemCid = 32074,
                    itemSid = 36242,
                    itemCnt = 1,
					itemRairity = 1
                },

            },
            outfits = {
            }
        },
		taskZoneName = "West Poison Grounds",
	  taskSource = "Knight Panth Ertel",
	  taskHint = "N/A"
    },
	 [21] = {
        taskNumber = 21,
        taskName = "Underground Task",
        taskDescription = "the living beings of these lands used to run in peace, it is sad to see what they have become, or rather, what someone has turned them into.",
        taskGoals = {
            monsters = {
                [1] = {
                    name = "Zombie",
                    spriteId = 1702
                },
				[2] = {
                    name = "Mutated Zombie",
                    spriteId = 1700
                },
				[3] = {
                    name = "Abomination Specimen",
                    spriteId = 1701
                },

            },
            items = {
			
            },
            storages = {
            }
        },
        taskGoalCnt = 50,
        taskMinLvl = 65,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40041,
        taskStorageCnt = 40042,
        taskRewards = {
            experience = 135000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 2
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 5
                },
				[3] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                },
				[4] = {
                    name = "dream feather",
                    itemCid = 32074,
                    itemSid = 36324,
                    itemCnt = 1,
					itemRairity = 1
                },
	
            },
            outfits = {
            }
        },
		taskZoneName = "West Poison Grounds",
	  taskSource = "Knight Panth Ertel",
	  taskHint = "N/A"
    },
	 [22] = {
        taskNumber = 22,
        taskName = "Abominable Crimes [DUNGEON]",
        taskDescription = "the cause of all evil is found within that tower Norwest from here, that self proclaimed doctor is the cause of these abominations.",
        taskGoals = {
            monsters = {
                [1] = {
                    name = "Doctor Pomelo",
                    spriteId = 1591
                },


            },
            items = {
			
            },
            storages = {
            }
        },
        taskGoalCnt = 1,
        taskMinLvl = 65,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40043,
        taskStorageCnt = 40044,
        taskRewards = {
            experience = 650000, --or nil
            items = {
                [1] = {
                    name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 5
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 10
                },
				[3] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 5
                },
				[4] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 4
                },
				[5] = {
                    name = "dream feather",
                    itemCid = 32074,
                    itemSid = 38294,
                    itemCnt = 1,
					itemRairity = 1
                },
            },
            outfits = {
            }
        },
		taskZoneName = "West Poison Grounds",
	  taskSource = "Knight Panth Ertel",
	  taskHint = "Dungeon - norwest garona"
    },
	[23] = {
        taskNumber = 23,
        taskName = "Eternal Spring",
        taskDescription = "nope, I will not return with dad!, you do not understand reasons? I am looking for a beautiful pink rose, the most beautiful of all!.",
        taskGoals = {
            monsters = {           
            },
            items = {
			
                
            },
            storages = {
			 [1] = {
                    starageName = "beautiful Pink Rose",
                    starageTaskId = 40553
                }
            }
        },
        taskGoalCnt = 1,
        taskMinLvl = 8,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40045,
        taskStorageCnt = 40046,
        taskRewards = {
            experience = 9000, --or nil
            items = {

				[1] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[2] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 2
                },
				[3] = {
                    name = "dream feather",
                    itemCid = 32074,
                    itemSid = 2165,
                    itemCnt = 1,
					itemRairity = 1
                },
            },
            outfits = {
            }
        },
		taskZoneName = "Garona Flower's Garden",
	  taskSource = "Aylin Rosecold",
	  taskHint = "N/A"
    },
	[24] = {
        taskNumber = 24,
        taskName = "To the rescue!",
        taskDescription = "my daughter aylin has disappeared, help me find her. I already searched all the nearby gardens. my fear is that she has gone to look for flowers in the northern mountains.",
        taskGoals = {
            monsters = {           
            },
            items = {
		
            },
            storages = {
			 [1] = {
                    starageName = "Aylin Finded",
                    starageTaskId = 40553
                }
            }
        },
        taskGoalCnt = 1,
        taskMinLvl = 8,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40047,
        taskStorageCnt = 40048,
        taskRewards = {
            experience = 10300, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 50
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 5
                },
				[3] = {
                    name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 2
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
            },
            outfits = {
            }
        },
		taskZoneName = "Garona West Mansion",
	  taskSource = "Dr Rosecold",
	  taskHint = "N/A"
    },
		[25] = {
        taskNumber = 25,
        taskName = "An assassin's task",
        taskDescription = "infiltrate the eastern witch camp, and assassinate their spy. cut her throat so that she no longer pronounces the names of our daughters with her dirty voice.",
        taskGoals = {
            monsters = {           
            },
            items = {
		
            },
            storages = {
			 [1] = {
                    starageName = "Sleeping Thieve's mastermind murdered",
                    starageTaskId = 40554
                }
            }
        },
        taskGoalCnt = 1,
        taskMinLvl = 25,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40049,
        taskStorageCnt = 40050,
        taskRewards = {
            experience = 28000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 25
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 5
                },
				[3] = {
                    name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 1
                },
				[4] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                },
				[5] = {
                    name = "dream feather",
                    itemCid = 32074,
                    itemSid = 36370,
                    itemCnt = 1,
					itemRairity = 1
                },
				
            },
            outfits = {
            }
        },
		taskZoneName = "Garona North",
	  taskSource = "Guard Leader Smith",
	  taskHint = "Use Knife on sleeping spy"
    },
	[26] = {
        taskNumber = 26,
        taskName = "Lost keys",
        taskDescription = "I have been distracted that I have lost my keys in these wheat fields, would you be so kind to help me find them?.",
        taskGoals = {
            monsters = {           
            },
			items = {
			 [1] = {
                    name = "Lost Keys",
                    itemId = 8762
                }
		
            },
            storages = {
			 
            }
        },
        taskGoalCnt = 1,
        taskMinLvl = 30,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40051,
        taskStorageCnt = 40052,
        taskRewards = {
            experience = 50700, --or nil
            items = {
				[1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 35
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 5
                },
				[3] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 5
                },
					[4] = {
                    name = "armor lootbox [T1]",
                    itemCid = 32672,
                    itemSid = 36753,
                    itemCnt = 1
                },
				[5] = {
                    name = "weapon lootbox [T1]",
                    itemCid = 32673,
                    itemSid = 36754,
                    itemCnt = 1
                },
				[6] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
            },
            outfits = {
            }
        },
		taskZoneName = "Garon South Farm",
	  taskSource = "Farmer Brayle",
	  taskHint = "use scythe"
    },
	[27] = {
        taskNumber = 27,
        taskName = "Missing Merchandise",
        taskDescription = "neither my merchants nor my horses have returned from their journey. I have not received any response? could you look for my merchandise? Of course I'm also interested in my merchants....",
        taskGoals = {
            monsters = {           
            },
            items = {
			[1] = {
                    name = "Missing merchandise recovered",
                    itemId = 32425
                }
		
            },
            storages = {
			 
            }
        },
        taskGoalCnt = 8,
        taskMinLvl = 30,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40053,
        taskStorageCnt = 40054,
        taskRewards = {
            experience = 75400, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 35
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 5
                },
				[3] = {
                    name = "Yellowfish soup dish",
                    itemCid = 31282,
                    itemSid = 35362,
                    itemCnt = 5
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 2
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }

            },
            outfits = {
            }
        },
		taskZoneName = "Garon South Farm",
	  taskSource = "Farmer Brayle",
	  taskHint = "Big area on North"
    },
	[28] = {
        taskNumber = 28,
        taskName = "Unholy Writings",
        taskDescription = "search and bring me some unholy books from inside the dark tower, this would be a good way to study your discipline and find out what is coming. you can find the tower near Darakhor city entrance following this north - east route.",
        taskGoals = {
            monsters = {           
            },
            items = {
			[1] = {
                    name = "Unholy Book",
                    itemId = 6103
                }
		
            },
            storages = {
			 
            }
        },
        taskGoalCnt = 15,
        taskMinLvl = 22,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40055,
        taskStorageCnt = 40056,
        taskRewards = {
            experience = 2500, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 25
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "small elixir of death resistance",
                    itemCid = 31697,
                    itemSid = 35778,
                    itemCnt = 3
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 2
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
            },
            outfits = {
            }
        },
		taskZoneName = "Darakhor, The Underground City",
	  taskSource = "Vazmol Bonetank",
	  taskHint = "N/A"
    },
		[29] = {
        taskNumber = 29,
        taskName = "Soulstone Expedition",
        taskDescription = "these criminals never get tired of investigating forbidden things, apparently they plan to create a soul stone! investigate the black tower fully and bring it to me!",
        taskGoals = {
            monsters = {           
            },
            items = {
			[1] = {
                    name = "Soulstone",
                    itemId = 5809
                }
		
            },
            storages = {
			 
            }
        },
        taskGoalCnt = 1,
        taskMinLvl = 22,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40057,
        taskStorageCnt = 40058,
        taskRewards = {
            experience = 3200, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 12
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 5
                },
				[3] = {
                    name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 3
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
            },
            outfits = {
            }
        },
		taskZoneName = "Darakhor, The Underground City",
	  taskSource = "Vazmol Bonetank",
	  taskHint = "N/A"
    },
	
	[30] = {
        taskNumber = 30,
        taskName = "Dismantle Black Kinght Order",
        taskDescription = "the time has come, it is time to dismantle the order of black knights. he sees the black tower and annihilate them all.",
        taskGoals = {
            monsters = {  
				[1] = {
                    name = "Black Knight",
                    spriteId = 1131
                },			
            },
            items = {
			
		
            },
            storages = {
			 
            }
        },
        taskGoalCnt = 50,
        taskMinLvl = 22,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40059,
        taskStorageCnt = 40060,
        taskRewards = {
            experience = 3300, --or nil
            items = {
                  [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 20
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 20
                },
				[3] = {
                    name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 5
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Darakhor, The Underground City",
	  taskSource = "Vazmol Bonetank",
	  taskHint = "N/A"
    },
	[31] = {
        taskNumber = 31,
        taskName = "Darakhor, The Underground City",
        taskDescription = "have you heard of the Darakhor? it is our beloved city! you can find it following the south east path!.",
        taskGoals = {
            monsters = {  
					
            },
            items = {
			
		
            },
            storages = {
			  [1] = {
                    starageName = "Enter Darakhor, The Underground City",
                    starageTaskId = 40557
                }
            }
        },
        taskGoalCnt = 1,
        taskMinLvl = 8,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40061,
        taskStorageCnt = 40062,
        taskRewards = {
            experience = 1200, --or nil
            items = {
                               
				[1] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 5
                }
            },
            outfits = {
            }
        },
		taskZoneName = "East Garona Campment",
	  taskSource = "Astrerlun Longbrow",
	  taskHint = "N/A"
    },
	[32] = {
        taskNumber = 32,
        taskName = "Plains of Terror",
        taskDescription = "a plague of goblins is devastating the city, our villagers can no longer sleep peacefully due to this calamity.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Goblin",
                    spriteId = 1692
                },
				[2] = {
                    name = "Goblin Trooper",
                    spriteId = 1692
                },
				[3] = {
                    name = "Goblin Shaman",
                    spriteId = 1692
                },
				[4] = {
                    name = "Goblin Leader",
                    spriteId = 1692
                },
				[5] = {
                    name = "Goblin Brute",
                    spriteId = 1692
                },
				[6] = {
                    name = "Goblin Escavenger",
                    spriteId = 1692
                },
				[7] = {
                    name = "Goblin Champion",
                    spriteId = 1692
                },				
					
            },
            items = {
			
		
            },
            storages = {
			  
            }
        },
        taskGoalCnt = 60,
        taskMinLvl = 50,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40063,
        taskStorageCnt = 40064,
        taskRewards = {
            experience = 950000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 15
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 10
                },
				[3] = {
                    name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 3
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                },
				[6] = {
                    name = "dream feather",
                    itemCid = 32074,
                    itemSid = 36389,
                    itemCnt = 1,
					itemRairity = 1
                },
				[7] = {
                    name = "dream feather",
                    itemCid = 32074,
                    itemSid = 38293,
                    itemCnt = 1,
					itemRairity = 1
                },

            },
            outfits = {
            }
        },
		taskZoneName = "North Garona",
	  taskSource = "Guard Thomas",
	  taskHint = "N/A"
    },
	[33] = {
        taskNumber = 33,
        taskName = "Eternal Guardians",
        taskDescription = "the souls of the old mine guardians have been corrupting the tunnels, go and give them the rest they really deserve.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Ghost Guard",
                    spriteId = 1725
                },
				
					
            },
            items = {
			
		
            },
            storages = {
			  
            }
        },
        taskGoalCnt = 40,
        taskMinLvl = 15,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40065,
        taskStorageCnt = 40066,
        taskRewards = {
            experience = 1800, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 15
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 10
                },
				[3] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 4
                },
				[4] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
            },
            outfits = {
            }
        },
		taskZoneName = "Darakhor, The Underground City",
	  taskSource = "Melgrom Strongfury",
	  taskHint = "N/A"
    },
	[34] = {
        taskNumber = 34,
        taskName = "Wagons Out Of Service",
        taskDescription = "the mineral transport wagons have been out of service, none of our engineers dares to enter the tunnels to repair them. could you take care of this task?.",
        taskGoals = {
            monsters = { 
				
            },
            items = {
			
		
            },
            storages = {
			   [1] = {
                    starageName = "Wagons Repaired",
                    starageTaskId = 40560
                }
            }
        },
        taskGoalCnt = 15,
        taskMinLvl = 15,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40067,
        taskStorageCnt = 40068,
        taskRewards = {
            experience = 1300, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 15
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 8
                },
				[3] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 3
                },
				[4] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
            },
            outfits = {
            }
        },
		taskZoneName = "Darakhor, The Underground City",
	  taskSource = "Melgrom Strongfury",
	  taskHint = "Use Hammer"
    },
	[35] = {
        taskNumber = 35,
        taskName = "The Basilisk",
        taskDescription = "the terror at the end of the mines was unearthed, it's crazy that such a creature even exists!.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Basilisk",
                    spriteId = 1727
                },
            },
            items = {
			
		
            },
            storages = {
			   
            }
        },
        taskGoalCnt = 1,
        taskMinLvl = 25,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40069,
        taskStorageCnt = 40070,
        taskRewards = {
            experience = 3500, --or nil
            items = {
                                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 50
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 5
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
            },
            outfits = {
            }
        },
		taskZoneName = "Darakhor, The Underground City",
	  taskSource = "Melgrom Strongfury",
	  taskHint = "N/A"
    },
		[36] = {
        taskNumber = 36,
        taskName = "Energizing The Circuit ",
        taskDescription = "Find a way to repair the teleportation machines inside the lab. It's the only way to connect the testing rooms.",
        taskGoals = {
            monsters = { 
				
            },
            items = {
			
		
            },
            storages = {
			   [1] = {
                    starageName = "Circuit Completed",
                    starageTaskId = 40564
                }
            }
        },
        taskGoalCnt = 1,
        taskMinLvl = 25,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40071,
        taskStorageCnt = 40072,
        taskRewards = {
            experience = 3400, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 65
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 20
                },
				[3] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 3
                },
				[4] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
            },
            outfits = {
            }
        },
		taskZoneName = "Darakhor, The Underground City",
	  taskSource = "Melgus Threnhug",
	  taskHint = "N/A"
    },
	[37] = {
        taskNumber = 37,
        taskName = "Removing Hunter Traps",
        taskDescription = "deactivate the traps that the hunters have been setting, this is a no hunting zone.",
        taskGoals = {
            monsters = { 
				
            },
            items = {
			
		
            },
            storages = {
			   [1] = {
                    starageName = "Traps",
                    starageTaskId = 40566
                }
            }
        },
        taskGoalCnt = 15,
        taskMinLvl = 15,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40073,
        taskStorageCnt = 40074,
        taskRewards = {
            experience = 22000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 30
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 20
                },
				[3] = {
                    name = "Deer pet",
                    itemCid = 33900,
                    itemSid = 37981,
                    itemCnt = 1
                },
				[4] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Redspring Village",
	  taskSource = "Thomas Mathew",
	  taskHint = "N/A"
    },
	[38] = {
        taskNumber = 38,
        taskName = "Bahumash",
        taskDescription = "We have found the cause of so many spiders, Bahumash is back. she is breeding like crazy dangerous spiders all over our sacred forest.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Bahumash",
                    spriteId = 208
                },
            },
            items = {
			
		
            },
            storages = {
			   
            }
        },
        taskGoalCnt = 1,
        taskMinLvl = 15,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40293,
        taskStorageCnt = 40294,
        taskRewards = {
            experience = 5200, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 30
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 30
                },
				[3] = {
                    name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 5
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 5
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 2
                }
            },
            outfits = {
            }
        },
		taskZoneName = "Redspring Village",
	  taskSource = "Priestess Leucelia",
	  taskHint = "N/A"
    },
	[39] = {
        taskNumber = 39,
        taskName = "Find Groma Longbeard",
        taskDescription = "after finding Bahumash, we tried to explore more than we should and my partner never came back. Please, I beg you, find him for me. I can't look for her anymore, my wounds don't allow me to continue the search.",
        taskGoals = {
            monsters = { 
				
            },
            items = {
			[1] = {
                    name = "Groma Longbeard's Report",
                    itemId = 31796
                }
		
            },
            storages = {

            }
        },
        taskGoalCnt = 1,
        taskMinLvl = 38,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40075,
        taskStorageCnt = 40076,
        taskRewards = {
            experience = 6500, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 25
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 20
                },
				[3] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Redspring Village",
	  taskSource = "Thomas Mathew",
	  taskHint = "N/A"
    },
	[40] = {
        taskNumber = 40,
        taskName = "Taking Care of the Farm",
        taskDescription = "hello, young adventurer. Could you help this poor old lady to do her chores? I can't stand my back and I still have to water the carrots on the farm. take a water can and add water multiple times.",
        taskGoals = {
            monsters = { 
				
            },
            items = {
			
		
            },
            storages = {
				[1] = {
                    starageName = "Carrots Watered",
                    starageTaskId = 40569
                }
            }
        },
        taskGoalCnt = 25,
        taskMinLvl = 14,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40077,
        taskStorageCnt = 40078,
        taskRewards = {
            experience = 1400, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 35
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 18
                },
				[3] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }

            },
            outfits = {
            }
        },
		taskZoneName = "Redspring Village",
	  taskSource = "Farmer Gloria Harvestly",
	  taskHint = "N/A"
    },
	[41] = {
        taskNumber = 41,
        taskName = "Cleaning the Farm",
        taskDescription = "Could you please help my wife with the cleaning of the farm. We just returned a few days ago since a plague of spiders invaded the house. the house is a mess other than that it is also full of spider webs.",
        taskGoals = {
            monsters = { 
				
            },
            items = {
			
		
            },
            storages = {
				[1] = {
                    starageName = "Spiderweb Cleaned",
                    starageTaskId = 40570
                }
            }
        },
        taskGoalCnt = 20,
        taskMinLvl = 14,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40079,
        taskStorageCnt = 40080,
        taskRewards = {
            experience = 1500, --or nil
            items = {
                                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 25
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 13
                },
				[3] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 5
                },
				[4] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
            },
            outfits = {
            }
        },
		taskZoneName = "Redspring Village",
	  taskSource = "Farmer Jhonson Harvestly",
	  taskHint = "Use Broom"
    },
	[42] = {
        taskNumber = 40,
        taskName = "Bakunawa, The corrupted one",
        taskDescription = "the forest and the seas cry because the spirit of that infernal beast still haunts this area. have you heard the story of bakunawa the spirit of the sea? There is a sacrificial stone within this forest where he breathed his last after being betrayed by the forest goddess. the last thing they found after his corpse along with his hatred evaporated was... a crystallized tear.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Bakunawa",
                    spriteId = 208
                },
            },
            items = {
			
		
            },
            storages = {
				
            }
        },
        taskGoalCnt = 1,
        taskMinLvl = 22,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40081,
        taskStorageCnt = 40082,
        taskRewards = {
            experience = 3800, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 65
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 25
                },
				[3] = {
                    name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 5
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
            },
            outfits = {
            }
        },
		taskZoneName = "Firewind island [T5]",
	  taskSource = "Fisherman Holser",
	  taskHint = "crystallized tear"
    },
	[43] = {
        taskNumber = 43,
        taskName = "Forgotten Fishing Rod",
        taskDescription = "The last time I went fishing I forgot my rod inside my boat to the east. Don't blame me, I had to run away after seeing those damn savages wanting my skin.",
        taskGoals = {
            monsters = { 
				
            },
            items = {
			[1] = {
                    name = "Lost Fishing Rod",
                    itemId = 32874
                }
		
            },
            storages = {
				
            }
        },
        taskGoalCnt = 1,
        taskMinLvl = 400,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40081,
        taskStorageCnt = 40082,
        taskRewards = {
            experience = 30000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 30
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 10
                },
				[3] = {
                    name = "Baby Dworc Egg",
                    itemCid = 2848,
                    itemSid = 37948,
                    itemCnt = 1
                },
				[4] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
            },
            outfits = {
            }
        },
		taskZoneName = "Firewind island [T5]",
	  taskSource = "Fisherman Holser",
	  taskHint = "N/A"
    },
	[44] = {
        taskNumber = 44,
        taskName = "Soronasty, The Beauty",
        taskDescription = "soronasty, that wretch locked me up here. I betray my people, my people, I betray myself. some managed to escape, some joined him, I just want his head before my feet.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Soronasty, The Beauty",
                    spriteId = 208
                },
            },
            items = {
			
		
            },
            storages = {
				
            }
        },
        taskGoalCnt = 1,
        taskMinLvl = 20,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40083,
        taskStorageCnt = 40084,
        taskRewards = {
            experience = 3300, --or nil
            items = {
                                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 60
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 35
                },
				[3] = {
                    name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 3
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
            },
            outfits = {
            }
        },
		taskZoneName = "zone_name_here",
	  taskSource = "Source_npc_here",
	  taskHint = "N/A"
    },
	[45] = {
        taskNumber = 45,
        taskName = "Animal Care",
        taskDescription = "those damned trolls think they can use wildlife for their cruel motives. wolves belong to nature, they must be free! Help us rescue them from their fortress.",
        taskGoals = {
            monsters = { 
				
            },
            items = {
			[1] = {
                    name = "Wolves Secured",
                    itemId = 13633
                }
		--13633
            },
            storages = {
				
            }
        },
        taskGoalCnt = 20,
        taskMinLvl = 80,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40085,
        taskStorageCnt = 40086,
        taskRewards = {
            experience = 1110750, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 42
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 1
                },
				[4] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
            },
            outfits = {
            }
        },
		taskZoneName = "North East Garona",
	  taskSource = "Naturalist sasha",
	  taskHint = "use rope"
    },
	[46] = {
        taskNumber = 46,
        taskName = "Clan Treason",
        taskDescription = "uh'rakan the former deputy commander is gathering an army. I'm just staying here with a low profile as long as he's in charge. If he continues like this, there could be a war against the humans and dwarves. We have to get rid of it as soon as possible!",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Uh'Rakan",
                    spriteId = 208
                },
            },
            items = {
					
            },
            storages = {
				
            }
        },
        taskGoalCnt = 1,
        taskMinLvl = 80,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40087,
        taskStorageCnt = 40088,
        taskRewards = {
            experience = 1130500, --or nil
            items = {
                                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 85
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 20
                },
				[3] = {
                    name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 3
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
            },
            outfits = {
            }
        },
		taskZoneName = "Troll's Campment",
	  taskSource = "Rut'Krall",
	  taskHint = "N/A"
    },
		[47] = {
        taskNumber = 47,
        taskName = "Troll Alchemy",
        taskDescription = "quest under development.",
        taskGoals = {
            monsters = { 
				
            },
            items = {
				[1] = {
                    name = "Wolf Paw",
                    itemId = 5897
                },
				[2] = {
                    name = "Cyclops Toe",
                    itemId = 10574
                },
				[3] = {
                    name = "Pig Foot",
                    itemId = 10610
                }
            },
            storages = {
				
            }
        },
        taskGoalCnt = 1,
        taskMinLvl = 15,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40089,
        taskStorageCnt = 40090,
        taskRewards = {
            experience = 1500000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 65
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
            },
            outfits = {
            }
        },
		taskZoneName = "Troll's Campment",
	  taskSource = "Shaman Guzumhk",
	  taskHint = "N/A"
    },
	[48] = {
        taskNumber = 48,
        taskName = "Tail Harvesting",
        taskDescription = "could you get me dinosaur tails? for what? do not ask. The only thing I can tell you is that there are some very interesting recipes.",
        taskGoals = {
            monsters = { 
				
            },
            items = {
				[1] = {
                    name = "Dragon Tail",
                    itemId = 12413
                },
            },
            storages = {
				
            }
        },
        taskGoalCnt = 30,
        taskMinLvl = 150,
        taskMaxLvl = 550,
        taskRepeat = false,
        taskStorageId = 40091,
        taskStorageCnt = 40092,
        taskRewards = {
            experience = 2500000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 85
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Garona Jungle Campment",
	  taskSource = "Crafter Aylin",
	  taskHint = "N/A"
    },
	[49] = {
        taskNumber = 49,
        taskName = "Green Scale Recollection",
        taskDescription = "The scales of these creatures are as resistant as metal itself, but they are more versatile when crafting objects.That is why they are so valuable.",
        taskGoals = {
            monsters = { 
				
            },
            items = {
				[1] = {
                    name = "Green Scale Leather",
                    itemId = 5877
                },
            },
            storages = {
				
            }
        },
        taskGoalCnt = 30,
        taskMinLvl = 150,
        taskMaxLvl = 550,
        taskRepeat = false,
        taskStorageId = 40093,
        taskStorageCnt = 40094,
        taskRewards = {
            experience = 2500000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 80
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
            },
            outfits = {
            }
        },
		taskZoneName = "Garona Jungle Campment",
	  taskSource = "Crafter Aylin",
	  taskHint = "N/A"
    },
		[50] = {
        taskNumber = 50,
        taskName = "Red Scale Recollection",
        taskDescription = "The scales of these creatures are as resistant as metal itself, but they are more versatile when crafting objects.That is why they are so valuable.",
        taskGoals = {
            monsters = { 
				
            },
            items = {
				[1] = {
                    name = "Red Scale Leather",
                    itemId = 5948
                },
            },
            storages = {
				
            }
        },
        taskGoalCnt = 30,
        taskMinLvl = 150,
        taskMaxLvl = 550,
        taskRepeat = false,
        taskStorageId = 40095,
        taskStorageCnt = 40096,
        taskRewards = {
            experience = 2500000, --or nil
            items = {
                                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 80
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
            },
            outfits = {
            }
        },
		taskZoneName = "Garona Jungle Campment",
	  taskSource = "Crafter Aylin",
	  taskHint = "N/A"
    },
	[51] = {
        taskNumber = 51,
        taskName = "Desert Tactics",
        taskDescription = "some seek out the materials from these beasts, but honestly they are a walking danger. we can't even supply water these days because of the danger involved in going through this jungle.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Desert Stalker",
                    spriteId = 1499
                },
				[2] = {
                    name = "Jungle Stalker",
                    spriteId = 1608
                },
            },
            items = {
				
                
            },
            storages = {
				
            }
        },
        taskGoalCnt = 50,
        taskMinLvl = 150,
        taskMaxLvl = 550,
        taskRepeat = false,
        taskStorageId = 40097,
        taskStorageCnt = 40098,
        taskRewards = {
            experience = 2900000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 50
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 25
                },
				[3] = {
                    name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 5
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
            },
            outfits = {
            }
        },
		taskZoneName = "Garona Jungle Campment",
	  taskSource = "Garona explorer",
	  taskHint = "N/A"
    },
	[52] = {
        taskNumber = 52,
        taskName = "Water Reserves",
        taskDescription = "You could help us fill our water supplies. Carry 5 empty barrels through the jungle, you will find clean water following the path to the east.",
        taskGoals = {
            monsters = { 
				
            },
            items = {
				
                
            },
            storages = {
				[1] = {
                    starageName = "Barrels stored",
                    starageTaskId = 1200
                }
            }
        },
        taskGoalCnt = 5,
        taskMinLvl = 150,
        taskMaxLvl = 550,
        taskRepeat = false,
        taskStorageId = 40099,
        taskStorageCnt = 40100,
        taskRewards = {
            experience = 3900000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 12
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 40
                },
				[3] = {
                    name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 3
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
            },
            outfits = {
            }
        },
		taskZoneName = "Garona Jungle Campment",
	  taskSource = "Explorer Melina",
	  taskHint = "Fill barrels with water"
    },
	[53] = {
        taskNumber = 53,
        taskName = "Fallen Soldiers",
        taskDescription = "we tried to recover the ruins but these reptiles have taken over it, we cannot return as it was a direct order from garona. Help our wounded soldiers by using the bandages on the table.",
        taskGoals = {
            monsters = { 
				
            },
            items = {
				
                
            },
            storages = {
				[1] = {
                    starageName = "Soldiers Healed",
                    starageTaskId = 1210
                }
            }
        },
        taskGoalCnt = 20,
        taskMinLvl = 140,
        taskMaxLvl = 550,
        taskRepeat = false,
        taskStorageId = 40101,
        taskStorageCnt = 40102,
        taskRewards = {
            experience = 3600000, --or nil
            items = {
                               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 85
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 35
                },
				[3] = {
                    name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 5
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
            },
            outfits = {
            }
        },
		taskZoneName = "Garona Lizard Ruins",
	  taskSource = "Lieutenant Sora",
	  taskHint = "Use bandages"
    },
	[54] = {
        taskNumber = 54,
        taskName = "Recollecting Energy Cores",
        taskDescription = "if you get into that laboratory, collect energy cores they are very useful when making tools it is also the main source of power for all our systems.",
        taskGoals = {
            monsters = { 
				
            },
            items = {
					[1] = {
                    name = "Condensed Energy",
                    itemId = 26157
                },
                
            },
            storages = {
				},
           
        },
        taskGoalCnt = 15,
        taskMinLvl = 25,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40103,
        taskStorageCnt = 40104,
        taskRewards = {
            experience = 2800, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 12
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 5
                },
				[3] = {
                    name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 3
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Darakhor, The Underground City",
	  taskSource = "Engineer Kuboltz",
	  taskHint = "N/A"
    },
	[55] = {
        taskNumber = 55,
        taskName = "The Revival of Syragoza",
        taskDescription = "Have you heard about the ancestral spirits? Syragoza, an ancient and wise dragon that once flew over these lands. there is a way to summon it again but you would need purified blood. Syragoza's story I believe is found in the books of the Darakhor library.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Syragoza",
                    spriteId = 1681
                },
            },
            items = {
					
                
            },
            storages = {
				
           },
        },
        taskGoalCnt = 1,
        taskMinLvl = 45,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40105,
        taskStorageCnt = 40106,
        taskRewards = {
            experience = 10000, --or nil
            items = {
                                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 100
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 50
                },
				[3] = {
                    name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 2
                }
            },
            outfits = {
            }
        },
		taskZoneName = "South Garona",
	  taskSource = "Dragon Slayer Lumeria",
	  taskHint = "Alchemy Rcepie"
    },
	[56] = {
        taskNumber = 56,
        taskName = "Neutralized Golems",
        taskDescription = "the core of the golems has gone haywire, they can't stabilize their own rune and we haven't found the reason yet. stabilize rune golems using cores.",
        taskGoals = {
            monsters = { 
				
            },
            items = {
					
                
            },
            storages = {
				[1] = {
                    starageName = "Neutralized Golems",
                    starageTaskId = 11300
                }
           },
        },
        taskGoalCnt = 15,
        taskMinLvl = 150,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40107,
        taskStorageCnt = 40108,
        taskRewards = {
            experience = 2700000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 80
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 5
                },
				[4] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                },
				[5] = {
                    name = "teleport scroll",
                    itemCid = 4061,
                    itemSid = 5952,
                    itemCnt = 5
                }
            },
            outfits = {
            }
        },
		taskZoneName = "The Verdant Runehold (T2 dungeon)",
	  taskSource = "Rune Guardian Nyce",
	  taskHint = "Use core on empowered runed golems"
    },
	[57] = {
        taskNumber = 57,
        taskName = "Restoring the prismatic pillars",
        taskDescription = "Restore the prismatic pillars to stabilize the energies coming from the underground dungeons. balance must be preserved at all costs.",
        taskGoals = {
            monsters = { 
				
            },
            items = {
					
                
            },
            storages = {
				[1] = {
                    starageName = "prismatic pillars restored",
                    starageTaskId = 40572
                }
           },
        },
        taskGoalCnt = 12,
        taskMinLvl = 150,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40109,
        taskStorageCnt = 40110,
        taskRewards = {
            experience = 2700000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 25
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "orb of performance",
                    itemCid = 33682,
                    itemSid = 29032,
                    itemCnt = 5
                },
            },
            outfits = {
            }
        },
		taskZoneName = "The Verdant Runehold (T2 dungeon)",
	  taskSource = "Rune Guardian Nyce",
	  taskHint = "N/A"
    },
	[58] = {
        taskNumber = 58,
        taskName = "Find the Romelia's Medicine",
        taskDescription = "I've had horrible nightmares, he gets into my dreams and terrifies me. I couldn't even get up because I'm afraid of him...",
        taskGoals = {
            monsters = { 
				
            },
            items = {
					[1] = {
                    name = "Romelia's Medicine",
                    itemId = 22473
                },
                
            },
            storages = {
				
           },
        },
        taskGoalCnt = 1,
        taskMinLvl = 35,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40111,
        taskStorageCnt = 40112,
        taskRewards = {
            experience = 1300, --or nil
            items = {
                                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 12
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 10
                },
				[3] = {
                    name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 1
                },
				[4] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
            },
            outfits = {
            }
        },
		taskZoneName = "South Garona Sleeping house",
	  taskSource = "Romelia",
	  taskHint = "N/A"
    },
		[59] = {
        taskNumber = 59,
        taskName = "Rotten Core",
        taskDescription = "finally, he or whatever it is, it will go down today! are you with me. Mousthafar the beast that killed me and my brothers will perish today!.",
        taskGoals = {
            monsters = { 
				
            },
            items = {
					[1] = {
                    name = "Rotten Core",
                    itemId = 32465
                },
                
            },
            storages = {
				
           },
        },
        taskGoalCnt = 10,
        taskMinLvl = 50,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40113,
        taskStorageCnt = 40114,
        taskRewards = {
            experience = 7500, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 75
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 5
                },
				[3] = {
                    name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 2
                }
            },
            outfits = {
            }
        },
		taskZoneName = "South Garona Sleeping house",
	  taskSource = "Romelia",
	  taskHint = "Find Demonic Cathedral"
    },
	[60] = {
        taskNumber = 60,
        taskName = "Mahel, The Void",
        taskDescription = "get rid of him!! please I beg you. I don't know if you believe me. but I don't think that something non-existent makes me tremble so much. please listen me, dont leave me. my bones, my skin, my soul collapse when listening to the name that whispers in my mind. Mahel.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Mahel, The Void",
                    spriteId = 1721
                },
            },
            items = {
					
                
            },
            storages = {
				
           },
        },
        taskGoalCnt = 1,
        taskMinLvl = 50,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40115,
        taskStorageCnt = 40116,
        taskRewards = {
            experience = 15000, --or nil
            items = {
                               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 100
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 25
                },
				[3] = {
                    name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 15
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 2
                }
            },
            outfits = {
            }
        },
		taskZoneName = "South Garona Sleeping house",
	  taskSource = "Romelia",
	  taskHint = "Hidden Boss"
    },
	[61] = {
        taskNumber = 61,
        taskName = "Circus Parrade",
        taskDescription = "finally, he or whatever it is, it will go down today! are you with me. Mousthafar the beast that killed me and my brothers will perish today!.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					[1] = {
                    name = "Circus Mask",
                    itemId = 27756
                },
                
            },
            storages = {
				
           },
        },
        taskGoalCnt = 1,
        taskMinLvl = 35,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40117,
        taskStorageCnt = 40118,
        taskRewards = {
            experience = 7200, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 85
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 20
                },
				[3] = {
                    name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 6
                }
            },
            outfits = {
            }
        },
		taskZoneName = "zone_name_here",
	  taskSource = "Source_npc_here",
	  taskHint = "N/A"
    },
	[62] = {
        taskNumber = 62,
        taskName = "The Last Prisoner",
        taskDescription = "we have been searching for princess lumelia for a long time, lumelia is the princess of garona. I swore to be with her always but I failed her. please her find her.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					
                
            },
            storages = {
				[1] = {
                    starageName = "Princess Lumelia Found",
                    starageTaskId = 40573
                }
           },
        },
        taskGoalCnt = 1,
        taskMinLvl = 50,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40119,
        taskStorageCnt = 40120,
        taskRewards = {
            experience = 12000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 75
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 25
                },
				[3] = {
                    name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 7
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
            },
            outfits = {
            }
        },
		taskZoneName = "Garona South West",
	  taskSource = "The Hero",
	  taskHint = "N/A"
    },
	[63] = {
        taskNumber = 63,
        taskName = "First Labor",
        taskDescription = "Are You ready for a Test?, bring me 20 hydra heads, let me know if you have all of these materials",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					[1] = {
                    name = "Hydra Head",
                    itemId = 11199
						  },
				},
            storages = {
				
						},
        },
        taskGoalCnt = 20,
        taskMinLvl = 150,
        taskMaxLvl = 300,
        taskRepeat = false,
        taskStorageId = 40121,
        taskStorageCnt = 40122,
        taskRewards = {
            experience = 2000000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 75
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Wilthorns Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37793,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 2
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
            },
            outfits = {
            }
        },
		taskZoneName = "Wilthorns Island",
	  taskSource = "Slayer Selucreh",
	  taskHint = "N/A"
    },
	[64] = {
        taskNumber = 64,
        taskName = "Second Labor",
        taskDescription = "So be it!, bring me 1 Life Crystal Fragment from your hydras hunt, those are like the essence those monster use to grow multiple heads, i want to try something tith those crystals. let me know if you have all of these materials",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					[1] = {
                    name = "Life crystal fragment",
                    itemId = 18421
						  },
				},
            storages = {
				
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 150,
        taskMaxLvl = 300,
        taskRepeat = false,
        taskStorageId = 40123,
        taskStorageCnt = 40124,
        taskRewards = {
            experience = 1500000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 75
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Wilthorns Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37793,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 4
                },
            },
            outfits = {
            }
        },
		taskZoneName = "Wilthorns Island",
	  taskSource = "Slayer Selucreh",
	  taskHint = "N/A"
    },
	[65] = {
        taskNumber = 65,
        taskName = "Third Labor",
        taskDescription = "So be it!, kill 50 amazon tigers around all wildthorns and come back to me.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Amazon Tiger",
                    spriteId = 1721
                },
            },
            items = {			
					
				},
            storages = {
				
						},
        },
        taskGoalCnt = 50,
        taskMinLvl = 150,
        taskMaxLvl = 300,
        taskRepeat = false,
        taskStorageId = 40295,
        taskStorageCnt = 40296,
        taskRewards = {
            experience = 1800000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 100
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 20
                },
				[3] = {
                    name = "Wilthorns Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 3
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 4
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
            },
            outfits = {
            }
        },
		taskZoneName = "Wilthorns Island",
	  taskSource = "Slayer Selucreh",
	  taskHint = "N/A"
    },
	[66] = {
        taskNumber = 66,
        taskName = "Fourth Labor",
        taskDescription = "So be it!, bring me 1 lion's mane, let me know if you have all of these materials",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					[1] = {
                    name = "lion's mane",
                    itemId = 10608
						  },
				},
            storages = {
				
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 150,
        taskMaxLvl = 300,
        taskRepeat = false,
        taskStorageId = 40125,
        taskStorageCnt = 40126,
        taskRewards = {
            experience = 2000000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 75
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Wilthorns Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37793,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 4
                },

            },
            outfits = {
            }
        },
		taskZoneName = "Wilthorns Island",
	  taskSource = "Slayer Selucreh",
	  taskHint = "N/A"
    },
	[67] = {
        taskNumber = 67,
        taskName = "Easter Eggs Collection Part #1",
        taskDescription = "So be it!, bring me red rapdtor eggs for my Easter Egg competition!",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					[1] = {
                    name = "red rapdtor eggs",
                    itemId = 37380
						  },
				},
            storages = {
				
						},
        },
        taskGoalCnt = 25,
        taskMinLvl = 150,
        taskMaxLvl = 300,
        taskRepeat = false,
        taskStorageId = 40127,
        taskStorageCnt = 40128,
        taskRewards = {
            experience = 1600000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 75
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Wilthorns Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37793,
                    itemCnt = 2
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 4
                },

            },
            outfits = {
            }
        },
		taskZoneName = "West Wilthorns Island",
	  taskSource = "Egg Collector Clara Harvestly",
	  taskHint = "N/A"
    },
	[68] = {
        taskNumber = 68,
        taskName = "Easter Eggs Collection Part #2",
        taskDescription = "So be it!, bring me shapphire rapdtor eggs for my Easter Egg competition!",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					[1] = {
                    name = "shapphire rapdtor eggs",
                    itemId = 37381
						  },
				},
            storages = {
				
						},
        },
        taskGoalCnt = 25,
        taskMinLvl = 150,
        taskMaxLvl = 300,
        taskRepeat = false,
        taskStorageId = 40129,
        taskStorageCnt = 40130,
        taskRewards = {
            experience = 1500000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 75
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Wilthorns Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37793,
                    itemCnt = 2
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 4
                },

            },
            outfits = {
            }
        },
		taskZoneName = "West Wilthorns Island",
	  taskSource = "Egg Collector Clara Harvestly",
	  taskHint = "N/A"
    },
	[69] = {
        taskNumber = 69,
        taskName = "Stolen Watch",
        taskDescription = "Recover Rich Boy's Watch. seems like monkeys stole his watch.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					[1] = {
                    name = "stolen watch",
                    itemId = 6091
						  },
				},
            storages = {
				
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 140,
        taskMaxLvl = 300,
        taskRepeat = false,
        taskStorageId = 40131,
        taskStorageCnt = 40132,
        taskRewards = {
            experience = 1000000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 15
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				
            },
            outfits = {
            }
        },
		taskZoneName = "Wildthorns Island",
	  taskSource = "Rich Boy Ricky",
	  taskHint = "take axe / use on moving palms"
    },
	[70] = {
        taskNumber = 70,
        taskName = "Explosive Revenge",
        taskDescription = "Destroy 50 Lizard Statues Using Engineer Guzlok's Explosives.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
				
				},
            storages = {
				[1] = {
                    starageName = "Statues Destroyed",
                    starageTaskId = 1220
                }
						},
        },
        taskGoalCnt = 50,
        taskMinLvl = 160,
        taskMaxLvl = 350,
        taskRepeat = false,
        taskStorageId = 40133,
        taskStorageCnt = 40134,
        taskRewards = {
            experience = 3000000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 150
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Wilthorns Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37793,
                    itemCnt = 2
                },
				[4] = {
                    name = "Eggsplosive Robo-Chicken Blueprint",
                    itemCid = 2848,
                    itemSid = 38679,
                    itemCnt = 1
                }
				
				
            },
            outfits = {
            }
        },
		taskZoneName = "Wildthorns Island",
	  taskSource = "Engineer Guzlok",
	  taskHint = "use Dynamites"
    },
	[71] = {
        taskNumber = 71,
        taskName = "Deep Tunnels",
        taskDescription = "Kill 45 greed Worms insife the cave near wildthorns campment exit.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Greed Worm",
                    spriteId = 1721
                },
            },
            items = {			
				
				},
            storages = {
				
						},
        },
        taskGoalCnt = 45,
        taskMinLvl = 130,
        taskMaxLvl = 300,
        taskRepeat = false,
        taskStorageId = 40135,
        taskStorageCnt = 40136,
        taskRewards = {
            experience = 1000000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 70
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Wilthorns Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37793,
                    itemCnt = 1
                },
				[4] = {
                    name = "snake pet egg",
                    itemCid = 33807,
                    itemSid = 37888,
                    itemCnt = 1
                },

				
            },
            outfits = {
            }
        },
		taskZoneName = "Wildthorns Island",
	  taskSource = "WildThorn's Commander Lizor",
	  taskHint = "N/A"
    },
	[72] = {
        taskNumber = 72,
        taskName = "Hot Streak",
        taskDescription = "Kill 75 Raptors at Ashnest Mountain near West Path.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Ember Raptor",
                    spriteId = 1721
                },
				[2] = {
                    name = "Blazing Raptor",
                    spriteId = 1721
                },
            },
            items = {			
				
				},
            storages = {
				
						},
        },
        taskGoalCnt = 75,
        taskMinLvl = 150,
        taskMaxLvl = 300,
        taskRepeat = false,
        taskStorageId = 40137,
        taskStorageCnt = 40138,
        taskRewards = {
            experience = 1700000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 2
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Wilthorns Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37793,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 4
                },
				
            },
            outfits = {
            }
        },
		taskZoneName = "Wildthorns Island",
	  taskSource = "WildThorn's Commander Lizor",
	  taskHint = "N/A"
    },
	[73] = {
        taskNumber = 73,
        taskName = "Old Age Hardens",
        taskDescription = "Kill 75 Raptors at Ashnest Mountain near West Path.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Elder Hydra",
                    spriteId = 1721
                },
            },
            items = {			
				
				},
            storages = {
				
						},
        },
        taskGoalCnt = 15,
        taskMinLvl = 155,
        taskMaxLvl = 300,
        taskRepeat = false,
        taskStorageId = 40139,
        taskStorageCnt = 40140,
        taskRewards = {
            experience = 3000000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 2
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Wilthorns Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37793,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 4
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Wildthorns Island",
	  taskSource = "WildThorn's Commander Lizor",
	  taskHint = "N/A"
    },
	[74] = {
        taskNumber = 74,
        taskName = "Champions to Fear",
        taskDescription = "Kill 10 Lizard Champions at the old city. carefull this may be dificult even for you.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Lizard Champion",
                    spriteId = 1721
                },
            },
            items = {			
				
				},
            storages = {
				
						},
        },
        taskGoalCnt = 10,
        taskMinLvl = 160,
        taskMaxLvl = 350,
        taskRepeat = false,
        taskStorageId = 40139,
        taskStorageCnt = 40140,
        taskRewards = {
            experience = 3100000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 2
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Wilthorns Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37793,
                    itemCnt = 5
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Wildthorns Island",
	  taskSource = "WildThorn's Commander Lizor",
	  taskHint = "N/A"
    },
	[75] = {
        taskNumber = 75,
        taskName = "Bloody Teeth",
        taskDescription = "Kill 25 Amazon Tigers all around wildthorn's island.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Amazon Tiger",
                    spriteId = 1721
                },
            },
            items = {			
				
				},
            storages = {
				
						},
        },
        taskGoalCnt = 25,
        taskMinLvl = 150,
        taskMaxLvl = 300,
        taskRepeat = false,
        taskStorageId = 40141,
        taskStorageCnt = 40142,
        taskRewards = {
            experience = 1000000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 75
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Wilthorns Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37793,
                    itemCnt = 3
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 4
                },
				
            },
            outfits = {
            }
        },
		taskZoneName = "Wildthorns Island",
	  taskSource = "WildThorn's Commander Lizor",
	  taskHint = "N/A"
    },
	
	--WILDTHORNS QUESTS
	[76] = {
        taskNumber = 76,
        taskName = "Protect the Walls",
        taskDescription = "Defeat the giants that resides on the north side of the island. Take the northern exit of the city to safely reach there.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Grull, The Goliath",
                    spriteId = 1721
                }
            },
            items = {			
				
				},
            storages = {
				
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 230,
        taskMaxLvl = 350,
        taskRepeat = false,
        taskStorageId = 40143,
        taskStorageCnt = 40144,
        taskRewards = {
            experience = 3000000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 150
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Rehema Dungeon Stone",
                    itemCid = 33711,
                    itemSid = 37792,
                    itemCnt = 3
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 7
                },
				
            },
            outfits = {
            }
        },
		taskZoneName = "Rehema Island",
	  taskSource = "Sandstorm General Pretovks",
	  taskHint = "N/A"
    },
		--WILDTHORNS QUESTS
	[77] = {
        taskNumber = 77,
        taskName = "Dismantling the Void",
        taskDescription = "Defeat Xyn The Shadow inside the camp near the west entrance of the city. im sure they are no good for this island.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Xyn The Shadow",
                    spriteId = 1721
                }
            },
            items = {			
				
				},
            storages = {
				
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 250,
        taskMaxLvl = 400,
        taskRepeat = false,
        taskStorageId = 40145,
        taskStorageCnt = 40146,
        taskRewards = {
            experience = 3000000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 135
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 7
                },
				[3] = {
                    name = "Rehema Dungeon Stone",
                    itemCid = 33711,
                    itemSid = 37792,
                    itemCnt = 3
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 4
                },
				
            },
            outfits = {
            }
        },
		taskZoneName = "Rehema Soul temple",
	  taskSource = "Disciple Tyron",
	  taskHint = "N/A"
    },
	
	[78] = {
        taskNumber = 78,
        taskName = "Red Wine Tragedy",
        taskDescription = "Defeat Captain RedBeard. You can find him at the northern Pirate Campment.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Captain Redbeard",
                    spriteId = 1721
                }
            },
            items = {			
				
				},
            storages = {
				
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 270,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40147,
        taskStorageCnt = 40148,
        taskRewards = {
            experience = 5000000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 120
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Rehema Dungeon Stone",
                    itemCid = 33711,
                    itemSid = 37792,
                    itemCnt = 3
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 4
                },
				
            },
            outfits = {
            }
        },
		taskZoneName = "Rehema Island",
	  taskSource = "Sandstorm General Pretovks",
	  taskHint = "N/A"
    },
	
	[79] = {
        taskNumber = 79,
        taskName = "Glory Of The Colisuem",
        taskDescription = "Defeat champion Rozak inside the colliseum. (Players: 3+).",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Coliseum Champion Rozak",
                    spriteId = 1721
                }
            },
            items = {			
				
				},
            storages = {
				
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 250,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40149,
        taskStorageCnt = 40150,
        taskRewards = {
            experience = 6000000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 500
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Rehema Dungeon Stone",
                    itemCid = 33711,
                    itemSid = 37792,
                    itemCnt = 5
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 20
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 3
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Rehema Island",
	  taskSource = "Source_npc_here",
	  taskHint = "N/A"
    },
	
	[80] = {
        taskNumber = 80,
        taskName = "Mortal Reminder",
        taskDescription = "Defeat the oposing faction that is trying to raid the town from the east.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Sandstorm Warrior",
                    spriteId = 1721
                },
				[2] = {
                    name = "Sandstorm Priestess",
                    spriteId = 1721
                },
				[3] = {
                    name = "Sandstorm Prophet",
                    spriteId = 1721
                },
            },
            items = {			
				
				},
            storages = {
				
						},
        },
        taskGoalCnt = 60,
        taskMinLvl = 255,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40151,
        taskStorageCnt = 40152,
        taskRewards = {
            experience = 3000000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 110
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Rehema Dungeon Stone",
                    itemCid = 33711,
                    itemSid = 37792,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 5
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Rehema Island",
	  taskSource = "Source_npc_here",
	  taskHint = "N/A"
    },
	
	[81] = {
        taskNumber = 81,
        taskName = "Chef Recepee #1",
        taskDescription = "I need some ingredients for some dishes 10 Sandy Legs let me know if you have all of these materials.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					[1] = {
                    name = "sandy leg",
                    itemId = 11218
						  },
				},
            storages = {
				
						},
        },
        taskGoalCnt = 10,
        taskMinLvl = 235,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40153,
        taskStorageCnt = 40154,
        taskRewards = {
            experience = 2300000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 150
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 10
                },
				
            },
            outfits = {
            }
        },
		taskZoneName = "Rehema Island",
	  taskSource = "Chef Martini",
	  taskHint = "N/A"
    },
	
	[82] = {
        taskNumber = 82,
        taskName = "Chef Recepee #2",
        taskDescription = "I need some ingredients for some dishes 5 Lobster Scythes let me know if you have all of these materials.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					[1] = {
                    name = "Lobster Scythes",
                    itemId = 11229
						  },
				},
            storages = {
				
						},
        },
        taskGoalCnt = 5,
        taskMinLvl = 235,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40155,
        taskStorageCnt = 40156,
        taskRewards = {
            experience = 2100000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 150
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 8
                },
				
            },
            outfits = {
            }
        },
		taskZoneName = "Rehema Island",
	  taskSource = "Chef Martini",
	  taskHint = "N/A"
    },
	
	[83] = {
        taskNumber = 83,
        taskName = "The Fire Call",
        taskDescription = "Use this eternal fire to light again 5 fire basins in the dragon lair.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					
				},
            storages = {
				[1] = {
                    starageName = "Fire Basins Active",
                    starageTaskId = 1260
                }
						},
        },
        taskGoalCnt = 5,
        taskMinLvl = 250,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40157,
        taskStorageCnt = 40158,
        taskRewards = {
            experience = 3000000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 145
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Rehema Dungeon Stone",
                    itemCid = 33711,
                    itemSid = 37792,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 5
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 2
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Fire Mountain Rehema Island",
	  taskSource = "Guardian Salameth",
	  taskHint = "Use torch on basins of eternal fire"
    },
	
	[84] = {
        taskNumber = 84,
        taskName = "To the Rescue",
        taskDescription = "Pirates have captured my best friend, and im so worried. can you help me? My friend kresh went to do an interview to the captain pirate but he naver came back. if you find it please help him.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					
				},
            storages = {
				[1] = {
                    starageName = "Found and Help Kresh",
                    starageTaskId = 1290
                }
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 260,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40159,
        taskStorageCnt = 40160,
        taskRewards = {
            experience = 2800000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 150
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				
            },
            outfits = {
            }
        },
		taskZoneName = "Rehema Island",
	  taskSource = "Leny",
	  taskHint = "save kresh from pirates."
    },
	
	[85] = {
        taskNumber = 85,
        taskName = "Rescue Kresh",
        taskDescription = "Find a way to free kresh from the cage.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					
				},
            storages = {
				[1] = {
                    starageName = "Kresh free",
                    starageTaskId = 1290
                }
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 260,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40161,
        taskStorageCnt = 40162,
        taskRewards = {
            experience = 2000000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 150
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Rehema Dungeon Stone",
                    itemCid = 33711,
                    itemSid = 37792,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 5
                },
				
				
            },
            outfits = {
            }
        },
		taskZoneName = "Pirate Campment Rehema Island",
	  taskSource = "Kresh",
	  taskHint = "get cage key."
    },
	[86] = {
        taskNumber = 86,
        taskName = "Walking Souls",
        taskDescription = "Wayward souls abound in the depths, could you help me collect them so that they may rest in peace? bring me  {15 suffering souls} gather some Soul orbs from the enemies inside the plague sanctum to collect the souls.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
						[1] = {
                    name = "suffering soul orbs",
                    itemId = 37416
						  },
				},
            storages = {
				
						},
        },
        taskGoalCnt = 15,
        taskMinLvl = 230,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40163,
        taskStorageCnt = 40164,
        taskRewards = {
            experience = 1900000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 100
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Rehema Dungeon Stone",
                    itemCid = 33711,
                    itemSid = 37792,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 5
                },
				
				
            },
            outfits = {
            }
        },
		taskZoneName = "Rehema soul temple",
	  taskSource = "Soul Guadian Iyanna Arienal",
	  taskHint = "Retrive suffering souls unsing soul orbs"
    },
	
	[87] = {
        taskNumber = 87,
        taskName = "Treasure Hunting",
        taskDescription = "We are humble civilians. we are not looking for someone to clean the tombs for us and get the juicy gold there. cuf cuf we are .... nevermind, can you?",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Elderbug",
                    spriteId = 1721
                },
				[2] = {
                    name = "Sandstorm Mummy",
                    spriteId = 1721
                },
				[3] = {
                    name = "Skeleton Guardian",
                    spriteId = 1721
                },
				[4] = {
                    name = "Living Corpse",
                    spriteId = 1721
                },
            },
            items = {			
					
				},
            storages = {
				
						},
        },
        taskGoalCnt = 60,
        taskMinLvl = 240,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40165,
        taskStorageCnt = 40166,
        taskRewards = {
            experience = 1900000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 105
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Rehema Dungeon Stone",
                    itemCid = 33711,
                    itemSid = 37792,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 5
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Rehema island (north)",
	  taskSource = "Treasure Hunter Thom",
	  taskHint = "N/A"
    },
	
	--pirates island sand
	[88] = {
        taskNumber = 88,
        taskName = "Connecting the pieces #1",
        taskDescription = "Help me find the missing pieces of the los treasure map that are found on this island.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					[1] = {
                    name = "lost treasure map of Bartholomew",
                    itemId = 31788
						  },
				},
            storages = {
				
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 240,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40167,
        taskStorageCnt = 40168,
        taskRewards = {
            experience = 3000000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 150
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Rehema Dungeon Stone",
                    itemCid = 33711,
                    itemSid = 37792,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 5
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Zambisa Isle",
	  taskSource = "Captain Koolacha",
	  taskHint = "N/A"
    },
	
	[89] = {
        taskNumber = 89,
        taskName = "Connecting the pieces #2",
        taskDescription = "Help me find the missing pieces of the los treasure map that are found on this island.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					[1] = {
                    name = "lost treasure map of red beard",
                    itemId = 31789
						  },
				},
            storages = {
				
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 240,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40169,
        taskStorageCnt = 40170,
        taskRewards = {
            experience = 3000000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 150
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Rehema Dungeon Stone",
                    itemCid = 33711,
                    itemSid = 37792,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 5
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Zambisa Isle",
	  taskSource = "Captain Koolacha",
	  taskHint = "N/A"
    },
	[90] = {
        taskNumber = 90,
        taskName = "Connecting the pieces #3",
        taskDescription = "Help me find the missing pieces of the los treasure map that are found on this island.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					[1] = {
                    name = "lost treasure map of Sheng Shi",
                    itemId = 31790
						  },
				},
            storages = {
				
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 250,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40171,
        taskStorageCnt = 40172,
        taskRewards = {
            experience = 3100000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 150
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Rehema Dungeon Stone",
                    itemCid = 33711,
                    itemSid = 37792,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 5
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Zambisa Isle",
	  taskSource = "Captain Koolacha",
	  taskHint = "N/A"
    },
	[91] = {
        taskNumber = 91,
        taskName = "Connecting the pieces #4",
        taskDescription = "Help me find the missing pieces of the los treasure map that are found on this island.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					[1] = {
                    name = "lost treasure map of Rackham",
                    itemId = 31791
						  },
				},
            storages = {
				
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 250,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40173,
        taskStorageCnt = 40174,
        taskRewards = {
            experience = 3300000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 150
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Rehema Dungeon Stone",
                    itemCid = 33711,
                    itemSid = 37792,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 5
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Zambisa Isle",
	  taskSource = "Captain Koolacha",
	  taskHint = "N/A"
    },
	[92] = {
        taskNumber = 92,
        taskName = "Connecting the pieces #5",
        taskDescription = "Help me find the missing pieces of the los treasure map that are found on this island.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					[1] = {
                    name = "lost treasure map of Bonny",
                    itemId = 31763
						  },
				},
            storages = {
				
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 250,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40175,
        taskStorageCnt = 40176,
        taskRewards = {
            experience = 3500000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 135
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Rehema Dungeon Stone",
                    itemCid = 33711,
                    itemSid = 37792,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 5
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Zambisa Isle",
	  taskSource = "Captain Koolacha",
	  taskHint = "N/A"
    },
	
	[93] = {
        taskNumber = 93,
        taskName = "Upholstering the Interiors",
        taskDescription = "interiors, designs is what is all about, collect some rolled-up fur carpet for me, in your mean time. i heard someone used to trade them a while ago.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					[1] = {
                    name = "rolled-up fur carpet",
                    itemId = 27087
						  },
				},
            storages = {
				
						},
        },
        taskGoalCnt = 25,
        taskMinLvl = 235,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40177,
        taskStorageCnt = 40178,
        taskRewards = {
            experience = 2600000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 120
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Rehema Dungeon Stone",
                    itemCid = 33711,
                    itemSid = 37792,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 5
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Zambisa Isle",
	  taskSource = "Karota Potz",
	  taskHint = "N/A"
    },
	[94] = {
        taskNumber = 94,
        taskName = "King of the Hill",
        taskDescription = "Adventure back and kill Commander Lyborick inside garona's greed dungeon, a bring me the war horn.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					[1] = {
                    name = "commander's horn",
                    itemId = 22727
						  },
				},
            storages = {
				
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 250,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40179,
        taskStorageCnt = 40180,
        taskRewards = {
            experience = 2900000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 150
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Rehema Dungeon Stone",
                    itemCid = 33711,
                    itemSid = 37792,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 5
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Zambisa Isle",
	  taskSource = "Neytha",
	  taskHint = "Garona's Greed Dungeon - Zambisa Isle"
    },
	[95] = {
        taskNumber = 95,
        taskName = "Stealing from Thieves",
        taskDescription = "I swear it is always about thieves, they are literally a damn plague. stole from them their precious tinder boxes in return.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					[1] = {
                    name = "tinder box",
                    itemId = 22728
						  },
				},
            storages = {
				
						},
        },
        taskGoalCnt = 15,
        taskMinLvl = 235,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40181,
        taskStorageCnt = 40182,
        taskRewards = {
            experience = 1950000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 99
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Rehema Dungeon Stone",
                    itemCid = 33711,
                    itemSid = 37792,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 5
                },
				[5] = {
                    name = "blueprint",
                    itemCid = 34535,
                    itemSid = 38616,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Zambisa Isle",
	  taskSource = "Bamboosha",
	  taskHint = "N/A"
    },
	[96] = {
        taskNumber = 96,
        taskName = "Hammelin's flute",
        taskDescription = "Bring me hammelin's flute from the Rotten Ruins Dungeon. I heard you can find it at the darklands Path.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					[1] = {
                    name = "hammelin's flute",
                    itemId = 28995
						  },
				},
            storages = {
				
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 190,
        taskMaxLvl = 350,
        taskRepeat = false,
        taskStorageId = 40183,
        taskStorageCnt = 40184,
        taskRewards = {
            experience = 5000000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 300
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Rehema Dungeon Stone",
                    itemCid = 33711,
                    itemSid = 37792,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 5
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Zambisa Isle",
	  taskSource = "Karota Potz",
	  taskHint = "Rotten Ruins Dungeon - Darklands Path"
    },
	[97] = {
        taskNumber = 97,
        taskName = "Uninvited Guest",
        taskDescription = "Slay them all, by any means possible.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Desert Bandit",
                    spriteId = 1721
                },
				[2] = {
                    name = "Desert Witch",
                    spriteId = 1721
                }
            },
            items = {			
					
				},
            storages = {
				
						},
        },
        taskGoalCnt = 50,
        taskMinLvl = 225,
        taskMaxLvl = 400,
        taskRepeat = false,
        taskStorageId = 40185,
        taskStorageCnt = 40186,
        taskRewards = {
            experience = 2600000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 160
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Rehema Dungeon Stone",
                    itemCid = 33711,
                    itemSid = 37792,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 5
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Zambisa Isle",
	  taskSource = "Shinsop",
	  taskHint = "N/A"
    },
	
	[98] = {
        taskNumber = 98,
        taskName = "Colourful Feathers",
        taskDescription = "I used to collect beautiful flowers back at garona, this ferathers reminds me of that little girl.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					[1] = {
                    name = "Colourful Feathers",
                    itemId = 12470
						  },
				},
            storages = {
				
						},
        },
        taskGoalCnt = 35,
        taskMinLvl = 230,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40187,
        taskStorageCnt = 40188,
        taskRewards = {
            experience = 2400000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 85
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Rehema Dungeon Stone",
                    itemCid = 33711,
                    itemSid = 37792,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 5
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Zambisa Isle",
	  taskSource = "Shinsop",
	  taskHint = "N/A"
    },
	
	[99] = {
        taskNumber = 99,
        taskName = "The Amber Gold",
        taskDescription = "there is something more precious than gold you know what it is.. Fossils.. i know right!.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					[1] = {
                    name = "Fossil in Amber",
                    itemId = 34500
						  },
					[2] = {
                    name = "Fossil in Amber",
                    itemId = 34501
						  },
					[3] = {
                    name = "Fossil in Amber",
                    itemId = 34502
						  },
				},
            storages = {
				
						},
        },
        taskGoalCnt = 7,
        taskMinLvl = 235,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40189,
        taskStorageCnt = 40190,
        taskRewards = {
            experience = 2500000, --or nil
            items = {
                [1] = {
                   name = "Gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 110
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "Rehema Dungeon Stone",
                    itemCid = 33711,
                    itemSid = 37792,
                    itemCnt = 1
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 5
                },
				[5] = {
                    name = "stone of wisdom",
                    itemCid = 4061,
                    itemSid = 29032,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Zambisa Isle",
	  taskSource = "Neytha",
	  taskHint = "N/A"
    },
	
	--new island 3 wars
	
	[100] = {--added
        taskNumber = 100,
        taskName = "Claws of Darkness",
        taskDescription = "We need to erase Darkness from this world, this is just our little step. Bring me dream warden claws from demonic monsters.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					[1] = {
                    name = "dream warden claw",
                    itemId = 22609
						  }
				},
            storages = {
				
						},
        },
        taskGoalCnt = 5,
        taskMinLvl = 370,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40191,
        taskStorageCnt = 40192,
        taskRewards = {
            experience = 5000000, --or nil
            items = {
                 [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 2
                },
                [3] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 2
                },
                [4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },  
                 [5] = {
                    name = "Weapon Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37434,
                    itemCnt = 1
                }, 
				
            },
            outfits = {
            }
        },
		taskZoneName = "Nemea Magic Tower",
	  taskSource = "Joanna Beauchamp",
	  taskHint = "N/A"
    },
	
	[101] = {--added
        taskNumber = 101,
        taskName = "Beancons of Hell",
        taskDescription = "Nightmare beacons can be studied in this white tower, this items are very rare and valuable.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					[1] = {
                    name = "nightmare beacon",
                    itemId = 22614
						  }
				},
            storages = {
				
						},
        },
        taskGoalCnt = 10,
        taskMinLvl = 370,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40193,
        taskStorageCnt = 40194,
        taskRewards = {
            experience = 4200000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 2
                },
                [3] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 2
                },
                [4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },  
                 [5] = {
                    name = "Armor Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37433,
                    itemCnt = 1
                }, 
				
            },
            outfits = {
            }
        },
		taskZoneName = "Nemea Magic Tower",
	  taskSource = "Joanna Beauchamp",
	  taskHint = "N/A"
    },
	[102] = {--added
        taskNumber = 102,
        taskName = "Deadly Wind",
        taskDescription = "Red Spore are made from pure blood and dust, can't imagine wich creature is the source of this calamity.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					[1] = {
                    name = "Red Spores",
                    itemId = 18221
						  }
				},
            storages = {
				
						},
        },
        taskGoalCnt = 100,
        taskMinLvl = 370,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40195,
        taskStorageCnt = 40196,
        taskRewards = {
            experience = 4720000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 250
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 2
                },
                [3] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 1
                },
				
            },
            outfits = {
            }
        },
		taskZoneName = "Nemea Magic Tower",
	  taskSource = "Joanna Beauchamp",
	  taskHint = "N/A"
    },
	[103] = {--added
        taskNumber = 103,
        taskName = "Cursed Blood",
        taskDescription = "I heard the rumor that you will find these horrible creatures deep in the ground, they may be the cause of the desease we are facing now.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Blood Spider",
                    spriteId = 1721
                },
				[2] = {
                    name = "Blood Parasyte",
                    spriteId = 1721
                }
            },
            items = {			
					
				},
            storages = {
				
						},
        },
        taskGoalCnt = 80,
        taskMinLvl = 370,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40197,
        taskStorageCnt = 40198,
        taskRewards = {
            experience = 4320000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 150
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 1
                },
                [3] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 1
                },
                [4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },  
                 [5] = {
                    name = "Armor Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37433,
                    itemCnt = 1
                }, 
				
            },
            outfits = {
            }
        },
		taskZoneName = "Nemea Magic Tower",
	  taskSource = "Jaijoke Grelenor",
	  taskHint = "N/A"
    },
	[104] = {--added
        taskNumber = 104,
        taskName = "Royal Blood",
        taskDescription = "Our higher priest are working on a cure for the red spore fever, they are using royal blood but our assault team can't handle their current numbers.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Vampire",
                    spriteId = 1721
                },
				[2] = {
                    name = "Vampire Bride",
                    spriteId = 1721
                },
				[3] = {
                    name = "Vampire Viscount",
                    spriteId = 1721
                },
            },
            items = {			
					
				},
            storages = {
				
						},
        },
        taskGoalCnt = 65,
        taskMinLvl = 380,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40199,
        taskStorageCnt = 40200,
        taskRewards = {
            experience = 5200000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 2
                },
                [3] = {
                    name = "Weapon Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37434,
                    itemCnt = 1
                }, 
				
            },
            outfits = {
            }
        },
		taskZoneName = "Nemea Magic Tower",
	  taskSource = "Jaijoke Grelenor",
	  taskHint = "N/A"
    },
	[105] = {--added
        taskNumber = 105,
        taskName = "Bringing down the Giants",
        taskDescription = "The species in this area have mutated in a terrifying way due to the blood spore fever.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Giant Brown Wolf",
                    spriteId = 1721
                },
				[2] = {
                    name = "Giant black Wolf",
                    spriteId = 1721
                },
				[3] = {
                    name = "Giant Gray Wolf",
                    spriteId = 1721
                },
				[4] = {
                    name = "Behemoth",
                    spriteId = 1721
                },
            },
            items = {			
					
				},
            storages = {
				
						},
        },
        taskGoalCnt = 40,
        taskMinLvl = 360,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40201,
        taskStorageCnt = 40202,
        taskRewards = {
            experience = 4000000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 5
                },
				
            },
            outfits = {
            }
        },
		taskZoneName = "Nemea Magic Tower",
	  taskSource = "Jaijoke Grelenor",
	  taskHint = "N/A"
    },
	
	[106] = {--added
        taskNumber = 106,
        taskName = "Demonic Pleasure",
        taskDescription = "Eliminate demons inside the sacred cathedral at north east.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Demon",
                    spriteId = 1721
                }
            },
            items = {			
					
				},
            storages = {
				
						},
        },
        taskGoalCnt = 50,
        taskMinLvl = 385,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40203,
        taskStorageCnt = 40204,
        taskRewards = {
            experience = 7200000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 4
                },
                [3] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 2
                },
                [4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },  
                 [5] = {
                    name = "Armor Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37433,
                    itemCnt = 1
                }, 
                 [6] = {
                    name = "Weapon Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37434,
                    itemCnt = 1
                }, 
            },
            outfits = {
            }
        },
		taskZoneName = "Nemea Magic Tower",
	  taskSource = "Jules Gatlin",
	  taskHint = "N/A"
    },
	[107] = {--added
        taskNumber = 107,
        taskName = "Destroying Banners",
        taskDescription = "Destroy those hairy beast banners, i swear if i see another one near our camp i will kill them all.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					
				},
            storages = {
				[1] = {
                    starageName = "Banners Destroyed",
                    starageTaskId = 11301
                }
						},
        },
        taskGoalCnt = 20,
        taskMinLvl = 360,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40205,
        taskStorageCnt = 40206,
        taskRewards = {
            experience = 3900000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 1
                },

                 [3] = {
                    name = "Armor Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37433,
                    itemCnt = 1
                }, 
                 [4] = {
                    name = "Weapon Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37434,
                    itemCnt = 1
                }, 
				
            },
            outfits = {
            }
        },
		taskZoneName = "Nemea Barbarian's Campment",
	  taskSource = "Amastan",
	  taskHint = "N/A"
    },
	[108] = {--added
        taskNumber = 108,
        taskName = "Released at last",
        taskDescription = "our comrades were captured in the previous battle against the werewolf clan, im afraid they are all dead only their remains lies in those cages. i can't let my friends even in death suffer such disgrace.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
					
				},
            storages = {
				[1] = {
                    starageName = "Prisoner bodies released",
                    starageTaskId = 11302
                }
						},
        },
        taskGoalCnt = 20,
        taskMinLvl = 360,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40205,
        taskStorageCnt = 40206,
        taskRewards = {
            experience = 3800000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 150
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 1
                },
                [3] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 2
                },
                [4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },  
                 [5] = {
                    name = "Armor Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37433,
                    itemCnt = 1
                }, 
				
            },
            outfits = {
            }
        },
		taskZoneName = "Nemea near Wolves Clan",
	  taskSource = "Genseric",
	  taskHint = "N/A"
    },
	[109] = {--added
        taskNumber = 109,
        taskName = "Time for Vengeance",
        taskDescription = "Bring me their claws, their only pride. is now time for paid back.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
				[1] = {
				name = "Giant Wolf Claw",
                itemId = 27057
					 }
				},
            storages = {
				
						},
        },
        taskGoalCnt = 20,
        taskMinLvl = 350,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40207,
        taskStorageCnt = 40208,
        taskRewards = {
            experience = 3900000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 1
                },
				
            },
            outfits = {
            }
        },
		taskZoneName = "Nemea near Wolves Clan",
	  taskSource = "Genseric",
	  taskHint = "N/A"
    },
	
	--wolves quest givers
	
	[110] = {--added
        taskNumber = 110,
        taskName = "Proof of Honor",
        taskDescription = "Those barbarians!, Kill my pack, my child, and burned our land. I seek blood, this is all about honor and they have not any left. rip out their nose rings and bring them all to me.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
				[1] = {
				name = "Nose Rings",
                itemId = 5804
					 }
				},
            storages = {
				
						},
        },
        taskGoalCnt = 40,
        taskMinLvl = 370,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40209,
        taskStorageCnt = 40210,
        taskRewards = {
            experience = 4300200, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 120
                },
                 [2] = {
                    name = "Armor Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37433,
                    itemCnt = 1
                }, 
                 [3] = {
                    name = "Weapon Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37434,
                    itemCnt = 1
                }, 
				
            },
            outfits = {
            }
        },
		taskZoneName = "Nemea Near Barbarian's Campment",
	  taskSource = "Golethaz",
	  taskHint = "N/A"
    },
	[111] = {--added
        taskNumber = 111,
        taskName = "Ship Reserves #1",
        taskDescription = "Some of those damn pirates have no fear, some of them are stealing from our cargo and reselling everything.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
				[1] = {
				name = "Cannon balls",
                itemId = 38131
					 }
				},
            storages = {
				
						},
        },
        taskGoalCnt = 50,
        taskMinLvl = 380,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40211,
        taskStorageCnt = 40212,
        taskRewards = {
            experience = 4200000, --or nil
            items = {
               [1] = {
                   name = "pirate coin",
                    itemCid = 3031,
                    itemSid = 38108,
                    itemCnt = 10
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 2
                },
                [3] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 2
                },
				
            },
            outfits = {
            }
        },
		taskZoneName = "Nemea's Pirate Bay",
	  taskSource = "Captain O’Fish",
	  taskHint = "N/A"
    },
	
	[112] = {--added
        taskNumber = 112,
        taskName = "Ship Reserves #2",
        taskDescription = "Some of those damn pirates have no fear, some of them are stealing from our cargo and reselling everything.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
				[1] = {
				name = "Powder Bomb",
                itemId = 38130
					 }
				},
            storages = {
				
						},
        },
        taskGoalCnt = 45,
        taskMinLvl = 380,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40213,
        taskStorageCnt = 40214,
        taskRewards = {
            experience = 4600000, --or nil
            items = {
                [1] = {
                   name = "Pirate Coins",
                    itemCid = 34027,
                    itemSid = 38108,
                    itemCnt = 8
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 2
                },
                 [3] = {
                    name = "Armor Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37433,
                    itemCnt = 1
                }, 
                 [4] = {
                    name = "Weapon Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37434,
                    itemCnt = 1
                }, 
				
            },
            outfits = {
            }
        },
		taskZoneName = "Nemea's Pirate Bay",
	  taskSource = "Captain O’Fish",
	  taskHint = "N/A"
    },
	
	[113] = {--added
        taskNumber = 113,
        taskName = "Ship Reserves #3",
        taskDescription = "Some of those damn pirates have no fear, some of them are stealing from our cargo and reselling everything.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
				[1] = {
				name = "Bottle of Rum",
                itemId = 38136
					 }
				},
            storages = {
				
						},
        },
        taskGoalCnt = 60,
        taskMinLvl = 380,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40215,
        taskStorageCnt = 40216,
        taskRewards = {
            experience = 4300000, --or nil
            items = {
                [1] = {
                   name = "Pirate Coins",
                    itemCid = 34027,
                    itemSid = 38108,
                    itemCnt = 8
                },
                 [2] = {
                    name = "Armor Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37433,
                    itemCnt = 1
                }, 
                 [3] = {
                    name = "Weapon Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37434,
                    itemCnt = 1
                }, 
				
            },
            outfits = {
            }
        },
		taskZoneName = "Nemea's Pirate Bay",
	  taskSource = "Captain O’Fish",
	  taskHint = "N/A"
    },
	
	[114] = {--added
        taskNumber = 114,
        taskName = "Lost Treasures",
        taskDescription = "Travel to gold beach and find the Lost Treasures Captain Blackbeard left hidden. Use the boat to get there after getting the Captain Permission.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
				[1] = {
				name = "lost treasure chest",
                itemId = 38115
					 },
				[2] = {
				name = "lost royal treasure chest",
                itemId = 38116
					 }
				},
            storages = {
				
						},
        },
        taskGoalCnt = 10,
        taskMinLvl = 380,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40217,
        taskStorageCnt = 40218,
        taskRewards = {
            experience = 3900000, --or nil
            items = {
                [1] = {
                   name = "Pirate Coins",
                    itemCid = 34027,
                    itemSid = 38108,
                    itemCnt = 8
                },

                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 2
                },
                 [3] = {
                    name = "Armor Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37433,
                    itemCnt = 1
                }, 
                 [4] = {
                    name = "Weapon Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37434,
                    itemCnt = 1
                }, 
				
            },
            outfits = {
            }
        },
		taskZoneName = "Nemea's Pirate Bay",
	  taskSource = "Big Jones",
	  taskHint = "N/A"
    },
	
	[115] = {--added
        taskNumber = 115,
        taskName = "Weapon Supply",
        taskDescription = "are you up for a trade, bring me some pirate weapons since our store stock is almost empty. sorry but this is how pirates roll.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
				[1] = {
				name = "Pirate epee",
                itemId = 38137
					 },
				[2] = {
				name = "pirate sabre",
                itemId = 38138
					 }
				},
            storages = {
				
						},
        },
        taskGoalCnt = 25,
        taskMinLvl = 380,
        taskMaxLvl = 400,
        taskRepeat = false,
        taskStorageId = 40219,
        taskStorageCnt = 40220,
        taskRewards = {
            experience = 4100000, --or nil
            items = {
                [1] = {
                   name = "Pirate Coins",
                    itemCid = 34027,
                    itemSid = 38108,
                    itemCnt = 15
                },
				
            },
            outfits = {
            }
        },
		taskZoneName = "Nemea's Pirate Bay",
	  taskSource = "Stinkin’ Pete",
	  taskHint = "N/A"
    },
	
	[116] = {--added
        taskNumber = 116,
        taskName = "The lost grail",
        taskDescription = "the lost grail was left inside the holy cathedral long time ago, please recover it for us. i know is not an easy task but ill beg you if is necessary.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
				[1] = {
				name = "blood grail",
                itemId = 38132
					 }
				},
            storages = {
				
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 380,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40221,
        taskStorageCnt = 40222,
        taskRewards = {
            experience = 6720000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 2
                },
                [3] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 2
                },
                [4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },  
                 [5] = {
                    name = "Armor Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37433,
                    itemCnt = 1
                }, 
                 [6] = {
                    name = "Weapon Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37434,
                    itemCnt = 1
                }, 
				
            },
            outfits = {
            }
        },
		taskZoneName = "Nemea Magic Tower",
	  taskSource = "Jules Gatlin",
	  taskHint = "N/A"
    },
	
	[117] = {--added
        taskNumber = 117,
        taskName = "This is War.",
        taskDescription = "If they want to hunt my people, they will have to risk their necks. this is enough.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Barbarian Bloodwalker",
                    spriteId = 1721
                },
				[2] = {
                    name = "Barbarian Brutetamer",
                    spriteId = 1721
                },
				[3] = {
                    name = "Barbarian Headsplitter",
                    spriteId = 1721
                },
				[4] = {
                    name = "Barbarian Skullhunter",
                    spriteId = 1721
                },
            },
            items = {			
				
				},
            storages = {
				
						},
        },
        taskGoalCnt = 80,
        taskMinLvl = 360,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40223,
        taskStorageCnt = 40224,
        taskRewards = {
            experience = 4500000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 2
                },
 
             [3] = {
                    name = "Armor Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37433,
                    itemCnt = 1
                }, 

				
            },
            outfits = {
            }
        },
		taskZoneName = "Nemea Wolves Campment",
	  taskSource = "Commander Xelth",
	  taskHint = "N/A"
    },
	
	[118] = {
        taskNumber = 118,
        taskName = "War Medals",
        taskDescription = "Can you belive those uncivilized barbarians stole our stocks of weapons and food, our spies saw them clearly. this is not ending well for them.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
				[1] = {
                    name = "Wimp tooth chain",
                    itemId = 20127 },
				},
            storages = {
				
						},
        },
        taskGoalCnt = 370,
        taskMinLvl = 500,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40225,
        taskStorageCnt = 40226,
        taskRewards = {
            experience = 4000000, --or nil
            items = {
                [1] = {
                   name = "Pirate Coins",
                    itemCid = 34027,
                    itemSid = 38108,
                    itemCnt = 8
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 2
                },
                [3] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 2
                },
				
            },
            outfits = {
            }
        },
		taskZoneName = "Nemea's Pirate Bay",
	  taskSource = "Captain O’Fish",
	  taskHint = "N/A"
    },
	
	
	
	--wolves and valkyries tasks (war)
	[119] = {--added
        taskNumber = 119,
        taskName = "The Magicians toys",
        taskDescription = "We can not fight them while their army has those magicians in their lines, since our people is weak to magic. get rid of them.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
				[1] = {
                    name = "Lost Husher's staff",
                    itemId = 20128
					},
				},
            storages = {
				
						},
        },
        taskGoalCnt = 10,
        taskMinLvl = 360,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40227,
        taskStorageCnt = 40228,
        taskRewards = {
            experience = 4200000, --or nil
            items = {
                 [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 2
                },
                [3] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 2
                },
                [4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },  
                 [5] = {
                    name = "Armor Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37433,
                    itemCnt = 1
                }, 
                 [6] = {
                    name = "Weapon Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37434,
                    itemCnt = 1
                }, 
				
            },
            outfits = {
            }
        },
		taskZoneName = "Nemea Near Barbarian's Campment",
	  taskSource = "Golethaz",
	  taskHint = "N/A"
    },
	
	[120] = {--added
        taskNumber = 120,
        taskName = "Hunter's skulls",
        taskDescription = "Rip their barbaric flesh if necessary and bring me their heads before me.",
        taskGoals = {
            monsters = { 
				
            },
            items = {			
				[1] = {
                    name = "Skull shatterer",
                    itemId = 20129
					},
				},
            storages = {
				
						},
        },
        taskGoalCnt = 360,
        taskMinLvl = 500,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40229,
        taskStorageCnt = 3700000,
        taskRewards = {
            experience = 5200000, --or nil
            items = {
                 [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 170
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 4
                },
				
            },
            outfits = {
            }
        },
		taskZoneName = "Nemea Wolves Campment",
	  taskSource = "Commander Xelth",
	  taskHint = "N/A"
    },
	
	[121] = {--added
        taskNumber = 121,
        taskName = "Death to Barbaria",
        taskDescription = "I heard their strongest warrior just came to the campment, kill barbaria before it's too late.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Barbaria",
                    spriteId = 1721
                },
            },
            items = {			
				
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 360,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40231,
        taskStorageCnt = 40232,
        taskRewards = {
            experience = 5200000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 2
                },
                [3] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 2
                },
                [4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },  
                 [5] = {
                    name = "Armor Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37433,
                    itemCnt = 1
                }, 
                 [6] = {
                    name = "Weapon Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37434,
                    itemCnt = 1
                }, 
				
            },
            outfits = {
            }
        },
		taskZoneName = "Nemea Wolves Campment",
	  taskSource = "Commander Xelth",
	  taskHint = "N/A"
    },
	
	--barbarian tasks (war)
	[122] = {--added
        taskNumber = 122,
        taskName = "End of the Navy",
        taskDescription = "Now the Pirates are blamming us about stealing their cargo? they better prepare for this.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Pirate",
                    spriteId = 1721
                },
				[2] = {
                    name = "Pirate Bucaneer",
                    spriteId = 1721
                },
				[3] = {
                    name = "Pirate Corsair",
                    spriteId = 1721
                },
				[4] = {
                    name = "Pirate Cutthroat",
                    spriteId = 1721
                },
				[5] = {
                    name = "Pirate Marauder",
                    spriteId = 1721
                },
				[6] = {
                    name = "Pirate Skeleton",
                    spriteId = 1721
                },
            },
            items = {			
				
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 100,
        taskMinLvl = 370,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40233,
        taskStorageCnt = 40234,
        taskRewards = {
            experience = 4300000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 2
                },
                [3] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 2
                },
                [4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },  
                 [5] = {
                    name = "Armor Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37433,
                    itemCnt = 1
                }, 
				
            },
            outfits = {
            }
        },
		taskZoneName = "Nemea Barbarian's Campment",
	  taskSource = "Amastan",
	  taskHint = "N/A"
    },
	
	[123] = {--added
        taskNumber = 123,
        taskName = "Captain Steeleye",
        taskDescription = "Kill Captain Steeleye, i heard he spend most of his time drinking.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Captain Steeleye",
                    spriteId = 1721
                },

            },
            items = {			
				
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 380,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40235,
        taskStorageCnt = 40236,
        taskRewards = {
            experience = 5100000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 250
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 5
                },
                [3] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 2
                },
                [4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },  
                 [5] = {
                    name = "Armor Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37433,
                    itemCnt = 1
                }, 
                 [6] = {
                    name = "Weapon Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37434,
                    itemCnt = 2
                }, 
				
            },
            outfits = {
            }
        },
		taskZoneName = "Nemea Barbarian's Campment",
	  taskSource = "Amastan",
	  taskHint = "N/A"
    },
	
	[124] = {--added
        taskNumber = 124,
        taskName = "Old Neighbours",
        taskDescription = "our neighbours in the other side are slaying our explorers, can u help us with this threat?.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Swan Floki",
                    spriteId = 1721
                },
				[2] = {
                    name = "Swan Helgi",
                    spriteId = 1721
                },
            },
            items = {			
				
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 60,
        taskMinLvl = 270,
        taskMaxLvl = 600,
        taskRepeat = false,
        taskStorageId = 40237,
        taskStorageCnt = 40238,
        taskRewards = {
            experience = 3300000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 165
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "SwanTears Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37791,
                    itemCnt = 2
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },
				[5] = {
                    name = "Armor Loot Box T4",
                    itemCid = 32678,
                    itemSid = 36759,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Swan Tears Island",
	  taskSource = "Commander Snow",
	  taskHint = "N/A"
    },
	[125] = {--added
        taskNumber = 125,
        taskName = "Crying Forest",
        taskDescription = "Our main resource is now being gate keeped from our people!.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Crying Ent",
                    spriteId = 1721
                },
				[2] = {
                    name = "Fenrir",
                    spriteId = 1721
                },
            },
            items = {			
				
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 60,
        taskMinLvl = 250,
        taskMaxLvl = 600,
        taskRepeat = false,
        taskStorageId = 40239,
        taskStorageCnt = 40240,
        taskRewards = {
            experience = 2900000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "SwanTears Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37791,
                    itemCnt = 2
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },
				[5] = {
                    name = "weapon Loot Box T4",
                    itemCid = 32679,
                    itemSid = 36760,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Swan Tears Island",
	  taskSource = "Commander Snow",
	  taskHint = "N/A"
    },
		[126] = {--added
        taskNumber = 126,
        taskName = "Blood Crops",
        taskDescription = "Those damn undead are now taking our warriors in their cups! can u belive it?",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Iceborne Reaper",
                    spriteId = 1721
                },
				[2] = {
                    name = "Iceborne Hunter",
                    spriteId = 1721
                },
				[3] = {
                    name = "Iceborne Mage",
                    spriteId = 1721
                },
            },
            items = {			
				
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 80,
        taskMinLvl = 270,
        taskMaxLvl = 600,
        taskRepeat = false,
        taskStorageId = 40241,
        taskStorageCnt = 40242,
        taskRewards = {
            experience = 3000000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 200
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "SwanTears Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37791,
                    itemCnt = 2
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },
				[5] = {
                    name = "armor Loot Box T4",
                    itemCid = 32678,
                    itemSid = 36759,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Swan Tears Island",
	  taskSource = "Prince Darnell",
	  taskHint = "N/A"
    },	
			[127] = {--added
        taskNumber = 127,
        taskName = "Crystal Hunt",
        taskDescription = "the core of this ancient scarabs are worth a ton, this can be usefull for our people.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Crystal Beetle",
                    spriteId = 1721
                },
				[2] = {
                    name = "Crystal Scarab",
                    spriteId = 1721
                },
				[3] = {
                    name = "Crystal Bulk Scarab",
                    spriteId = 1721
                },
            },
            items = {			
				
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 65,
        taskMinLvl = 250,
        taskMaxLvl = 600,
        taskRepeat = false,
        taskStorageId = 40243,
        taskStorageCnt = 40244,
        taskRewards = {
            experience = 2700000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 185
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "SwanTears Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37791,
                    itemCnt = 2
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },
				[5] = {
                    name = "weapon Loot Box T4",
                    itemCid = 32679,
                    itemSid = 36760,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Swan Tears Island",
	  taskSource = "Florina",
	  taskHint = "N/A"
    },	
	[128] = {--added
        taskNumber = 128,
        taskName = "Bigfoot Hunting",
        taskDescription = "I need thick yeti fur from the ice thistle yeti to start with. Will you help? You'll find them to the north.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Yeti",
                    spriteId = 1721
                },
				
            },
            items = {			
				
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 70,
        taskMinLvl = 310,
        taskMaxLvl = 600,
        taskRepeat = false,
        taskStorageId = 40245,
        taskStorageCnt = 40246,
        taskRewards = {
            experience = 5000000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 210
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "SwanTears Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37791,
                    itemCnt = 2
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },
				[5] = {
                    name = "weapon Loot Box T4",
                    itemCid = 32679,
                    itemSid = 36760,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Swan Tears Island",
	  taskSource = "Amastan",
	  taskHint = "N/A"
    },	
	[129] = {--added
        taskNumber = 129,
        taskName = "Sleeping giants",
        taskDescription = "Gather your forces and defeat these giants. We need to know just what we're up against in terms of their strength.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Jotun",
                    spriteId = 1721
                },
				[2] = {
                    name = "Jotun Marauder",
                    spriteId = 1721
                },
            },
            items = {			
				
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 60,
        taskMinLvl = 290,
        taskMaxLvl = 600,
        taskRepeat = false,
        taskStorageId = 40247,
        taskStorageCnt = 40248,
        taskRewards = {
            experience = 3500000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 225
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "SwanTears Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37791,
                    itemCnt = 2
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },
				[5] = {
                    name = "Armor Loot Box T4",
                    itemCid = 32678,
                    itemSid = 36759,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Swan Tears Island",
	  taskSource = "Lieutenant Dan",
	  taskHint = "N/A"
    },	
	[130] = {--added
        taskNumber = 130,
        taskName = "Bloodstained Snow",
        taskDescription = "those barbarians have stablished a base near our camp, help us defeat them. Kill 85 barbarians and return with me.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Artic Barbarian Bloodwalker",
                    spriteId = 1721
                },
				[2] = {
                    name = "Artic Barbarian Brutetamer",
                    spriteId = 1721
                },
				[3] = {
                    name = "Artic Barbarian Headsplitter",
                    spriteId = 1721
                },
				[4] = {
                    name = "Artic Barbarian Skullhunter",
                    spriteId = 1721
                },
            },
            items = {			
				
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 78,
        taskMinLvl = 255,
        taskMaxLvl = 600,
        taskRepeat = false,
        taskStorageId = 40249,
        taskStorageCnt = 40250,
        taskRewards = {
            experience = 42000000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 245
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "SwanTears Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37791,
                    itemCnt = 2
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },
				[5] = {
                    name = "weapon Loot Box T4",
                    itemCid = 32679,
                    itemSid = 36760,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Swan Tears Island",
	  taskSource = "Explorer Kalesia",
	  taskHint = "N/A"
    },	
	
		[131] = {--added
        taskNumber = 131,
        taskName = "Frozen Tides",
        taskDescription = "Gather your forces and defeat these savages. We need to know just what we're up against in terms of their strength.",
        taskGoals = {
            monsters = { 
				[1] = {
                    name = "Icewalker Pirate",
                    spriteId = 1721
                },
				[2] = {
                    name = "Icewalker Marauder",
                    spriteId = 1721
                },
				[3] = {
                    name = "Icewalker Powder Monkey",
                    spriteId = 1721
                }
            },
            items = {			
				
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 120,
        taskMinLvl = 310,
        taskMaxLvl = 600,
        taskRepeat = false,
        taskStorageId = 40251,
        taskStorageCnt = 40252,
        taskRewards = {
            experience = 3500000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 250
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "SwanTears Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37791,
                    itemCnt = 2
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },
				[5] = {
                    name = "weapon Loot Box T4",
                    itemCid = 32679,
                    itemSid = 36760,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Swan Tears Island",
	  taskSource = "Lieutenant Dan",
	  taskHint = "N/A"
    },	
	
	[132] = {--added
        taskNumber = 132,
        taskName = "Clothes Donation",
        taskDescription = "the winter is stronger day by day and our kids wont be able to stand it. try looking for clothes, we are not in a position to be picky so bring me 30 clothes in bad condition, we will be very grateful with you.",
        taskGoals = {
            monsters = { 
			
            },
            items = {			
				[1] = {
				name = "used clothes",
                itemId = 29045
					 }
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 30,
        taskMinLvl = 250,
        taskMaxLvl = 600,
        taskRepeat = true,
        taskStorageId = 40253,
        taskStorageCnt = 40254,
        taskRewards = {
            experience = 2700000, --or nil
            items = {
				[1] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[2] = {
                    name = "SwanTears Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37791,
                    itemCnt = 2
                },
				[3] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },
				[4] = {
                    name = "weapon Loot Box T4",
                    itemCid = 32679,
                    itemSid = 36760,
                    itemCnt = 1
                },
				
            },
            outfits = {
            }
        },
		taskZoneName = "Swan Tears Island",
	  taskSource = "Orphanage Manager",
	  taskHint = "Ice Walker Pirates"
    },	
	[133] = {--added
        taskNumber = 133,
        taskName = "Wood Donation",
        taskDescription = "winter is each time more dangerous help us get 60 piezes of Frostskin Wood. You can use this handsaw to gather the materials, let me know if you have all of these WOOD.",
        taskGoals = {
            monsters = { 
			
            },
            items = {			
				[1] = {
				name = "Frostskin Wood",
                itemId = 37420
					 }
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 50,
        taskMinLvl = 250,
        taskMaxLvl = 600,
        taskRepeat = true,
        taskStorageId = 40255,
        taskStorageCnt = 40256,
        taskRewards = {
            experience = 2500000, --or nil
            items = {
			
				[1] = {
                    name = "SwanTears Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37791,
                    itemCnt = 2
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Swan Tears Island",
	  taskSource = "Tina Frostribe",
	  taskHint = "N/A"
    },	
	[134] = {--added
        taskNumber = 134,
        taskName = "Winter Preparations",
        taskDescription = "This winter is horrible, will need to make some new clothes if this continue like it is now. The children at the town will suffer the most. Bring me some gryphon feathers before is to late.",
        taskGoals = {
            monsters = { 
			
            },
            items = {			
				[1] = {
				name = "Gryphon Feather",
                itemId = 19742
					 }
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 50,
        taskMinLvl = 320,
        taskMaxLvl = 600,
        taskRepeat = true,
        taskStorageId = 40257,
        taskStorageCnt = 40258,
        taskRewards = {
            experience = 4500000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 225
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "SwanTears Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37791,
                    itemCnt = 2
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },
				[5] = {
                    name = "weapon Loot Box T4",
                    itemCid = 32679,
                    itemSid = 36760,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Swan Tears Island",
	  taskSource = "Flight Master Earhart",
	  taskHint = "N/A"
    },	
	[135] = {--added
        taskNumber = 135,
        taskName = "Fur Donation",
        taskDescription = "Bring me 45 thick fur, I heard mammooths thick fur is the best to ratain heat, it would me nice if we could make something out if it.",
        taskGoals = {
            monsters = { 
			
            },
            items = {			
				[1] = {
				name = "Thick Fur",
                itemId = 11224
					 }
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 45,
        taskMinLvl = 250,
        taskMaxLvl = 600,
        taskRepeat = false,
        taskStorageId = 40259,
        taskStorageCnt = 40260,
        taskRewards = {
            experience = 3000000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 185
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "SwanTears Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37791,
                    itemCnt = 2
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Swan Tears Island",
	  taskSource = "Camile Frostribe",
	  taskHint = "N/A"
    },	
	[136] = {--added
        taskNumber = 136,
        taskName = "A lost Message",
        taskDescription = "I lost an old Friend of mine, we were pirates but after that damn king i lost contact with him, find a way to reach him.",
        taskGoals = {
            monsters = { 
			
            },
            items = {			
				[1] = {
				name = "Message in a Bottle",
                itemId = 5802
					 }
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 290,
        taskMaxLvl = 600,
        taskRepeat = false,
        taskStorageId = 40261,
        taskStorageCnt = 40262,
        taskRewards = {
            experience = 2000000, --or nil
            items = {
                [1] = {
                  name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 130
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "SwanTears Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37791,
                    itemCnt = 2
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },
				[5] = {
                    name = "Armor Loot Box T4",
                    itemCid = 32678,
                    itemSid = 36759,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Swan Tears Island",
	  taskSource = "Niel Frostribe",
	  taskHint = "Ice Walker Pirates"
    },	
	[137] = {--added
        taskNumber = 137,
        taskName = "Crystal Harvesting",
        taskDescription = "Bring me 35 Flawless Crystal from inside the caves, i heard crystal beatles degest them in their stomachs and the quality is really good.",
        taskGoals = {
            monsters = { 
			
            },
            items = {			
				[1] = {
				name = "Flawless Ice Crystal",
                itemId = 8300
					 }
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 35,
        taskMinLvl = 250,
        taskMaxLvl = 600,
        taskRepeat = false,
        taskStorageId = 40263,
        taskStorageCnt = 40264,
        taskRewards = {
            experience = 3100000, --or nil
            items = {
               [1] = {
                    name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 175
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
				[3] = {
                    name = "SwanTears Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37791,
                    itemCnt = 2
                },
				[4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },
				[5] = {
                    name = "Armor Loot Box T4",
                    itemCid = 32678,
                    itemSid = 36759,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Swan Tears Island",
	  taskSource = "Florina",
	  taskHint = "N/A"
    },	
	
	
	
	--NEW TUTORIAL QUESTS
	[138] = {--added
        taskNumber = 138,
        taskName = "Introduction to Crafting",
        taskDescription = "well lets start with the basics, in order to survive in this world i may suggest learning a crafting job. In order to learn a job go and talk to any carfting related instructor like [Blacksmith Sam], [Alchemist Hana], [The Great Xodet] or [Chef Sam]. You can learn more about this once you talk with them.",
        taskGoals = {
            monsters = { 
			
            },
            items = {			
				
				},
				
            storages = {
				[1] = {
                    starageName = "Learn a Crafting Job.",
                    starageTaskId = 11310
                }
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 1,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40265,
        taskStorageCnt = 40266,
        taskRewards = {
            experience = 3500, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 2
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 2
                },
				
				
				
            },
            outfits = {
            }
        },
		taskZoneName = "Starting Town [Garona][T1]",
	  taskSource = "Sheriff Gordon",
	  taskHint = "N/A"
    },	
	
		[139] = {--added
        taskNumber = 139,
        taskName = "Plague Beneath",
        taskDescription = "There's a huge problem with Rats and Slimes beneath this town help us clear it. Go and kill 25 rats & slimes. the town will be very gratefull for this.",
        taskGoals = {
            monsters = { 
			  [1] = {
                    name = "Rat",
                    spriteId = 1525
                },
				[2] = {
                    name = "Slime",
                    spriteId = 1525
                }
            },
            items = {			
				
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 25,
        taskMinLvl = 7,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40267,
        taskStorageCnt = 40268,
        taskRewards = {
            experience = 7200, --or nil
            items = {
                 [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 5
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 2
                },
				[3] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 1
                },			
            },
            outfits = {
            }
        },
		taskZoneName = "Starting Town [Garona][T1]",
	  taskSource = "Sheriff Gordon",
	  taskHint = "beneath the Town."
    },	
	[140] = {--added
        taskNumber = 140,
        taskName = "Troll Fur",
        taskDescription = "Collect some 6 Troll's Fur and bring them me, those come quite handy when it comes to hand crafting.",
        taskGoals = {
            monsters = { 
			 
            },
            items = {			
				[1] = {
                    name = "Troll Fur",
                    itemId = 5883
                }
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 6,
        taskMinLvl = 15,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40269,
        taskStorageCnt = 40270,
        taskRewards = {
            experience = 18700, --or nil
            items = {
				[1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 5
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 2
                },
				[3] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 1
                },
				[4] = {
                    name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Starting Town [Garona][T1]",
	  taskSource = "Sheriff Gordon",
	  taskHint = "Trolls Drop."
    },
	[141] = {--added
        taskNumber = 141,
        taskName = "Hunter Hunter",
        taskDescription = "Help me protect the forest and deer population by eliminating harmful hunters. Reward offered for success. Will you help?.",
        taskGoals = {
            monsters = { 
			 [1] = {
                    name = "Hunter",
                    spriteId = 1525
                }
            },
            items = {			
				
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 15,
        taskMinLvl = 15,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40271,
        taskStorageCnt = 40272,
        taskRewards = {
            experience = 25000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 2
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 2
                },
				[3] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 1
                },
				[4] = {
                    name = "Agmon Necklace",
                    itemCid = 27163,
                    itemSid = 31818,
                    itemCnt = 1,
					itemRairity = 1
                }
				
            },
            outfits = {
            }
        },
		taskZoneName = "Starting Town [Garona][T1]",
	  taskSource = "Thomas Mathew",
	  taskHint = "Kill hunters."
    },		
	[142] = {--added
        taskNumber = 142,
        taskName = "Starting Tools",
        taskDescription = "Go find a Lubo [NPC] and buy an expedition bag, ill give you afterwards all the tools you will need in your journey.",
        taskGoals = {
            monsters = { 
			 
            },
            items = {			
				[1] = {
                    name = "Expedition Bag",
                    itemId = 11242
                }
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 1,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40273,
        taskStorageCnt = 40274,
        taskRewards = {
            experience = 7200, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 4
                },				
				[2] = {
                    name = "Scythe",
                    itemCid = 3453,
                    itemSid = 2550,
                    itemCnt = 1
                },
				[3] = {
                    name = "Rope",
                    itemCid = 3003,
                    itemSid = 2120,
                    itemCnt = 1
                },
				[4] = {
                    name = "Shovel",
                    itemCid = 3457,
                    itemSid = 2554,
                    itemCnt = 1
                },
				[5] = {
                    name = "Pick",
                    itemCid = 3456,
                    itemSid = 2553,
                    itemCnt = 1
                },
				[6] = {
                    name = "Fishing Rod",
                    itemCid = 3483,
                    itemSid = 2580,
                    itemCnt = 1
                }

				
            },
            outfits = {
            }
        },
		taskZoneName = "Starting Town [Garona][T1]",
	  taskSource = "Sheriff Gordon",
	  taskHint = "Kill rats beneath the Town."
    },		
		[143] = {--added
        taskNumber = 143,
        taskName = "Witch Hunt",
        taskDescription = "Go a find any witch camp and kill 35 witches. this was assigned to me days ago but as you can see i am the only one alive...",
        taskGoals = {
            monsters = { 
			 [1] = {
                    name = "Witch Apprentice",
                    spriteId = 1525
                },
				[2] = {
                    name = "Witch",
                    spriteId = 1525
                }
            },
            items = {			
				
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 35,
        taskMinLvl = 25,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40275,
        taskStorageCnt = 40276,
        taskRewards = {
            experience = 45000, --or nil
            items = {
                  [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 25
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 5
                },
				[3] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 3
                },
				[4] = {
                   name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 2
                },
				[5] = {
                    name = "dream feather",
                    itemCid = 32074,
                    itemSid = 38323,
                    itemCnt = 1,
					itemRairity = 1
                },

				
            },
            outfits = {
            }
        },
		taskZoneName = "Main Town [Garona][T1]",
	  taskSource = "Guard Leader Smith",
	  taskHint = "Kill witches."
    },		
		[144] = {--added
        taskNumber = 144,
        taskName = "Zulema, The Undead",
        taskDescription = "Explorer Gary here. There's a zombie abomination named Zulema, The Undead causing trouble up north. I need you to take it out, along with its minions. Be careful, as it's heavily armored and dangerous. Once it's defeated, come back to me for your reward. Good luck.",
        taskGoals = {
            monsters = { 
			 [1] = {
                    name = "Zulema, The Undead",
                    spriteId = 1525
                },
				
            },
            items = {			
				
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 40,
        taskMaxLvl = 150,
        taskRepeat = false,
        taskStorageId = 40277,
        taskStorageCnt = 40278,
        taskRewards = {
            experience = 120000, --or nil
            items = {
                  [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 85
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 7
                },
				[3] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 1
                },
				[4] = {
                   name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 1
                },
				[5] = {
                    name = "dream feather",
                    itemCid = 32074,
                    itemSid = 38325,
                    itemCnt = 1,
					itemRairity = 1
                },

				
            },
            outfits = {
            }
        },
		taskZoneName = "Main Town [Garona][T1]",
	  taskSource = "Explorer Gary",
	  taskHint = "kill Zulema, The Undead, north from Explorer Gary."
    },		
	[145] = {--added
        taskNumber = 145,
        taskName = "Many many wishes",
        taskDescription = "Dear adventurer, I am an apprentice of the magical arts seeking to collect powerful 25 djinn lamps to aid in my studies. The lamps are held by the djinns in their desert lair, protected by powerful magic and fierce guardians. Your task is to infiltrate the djinn lair, defeat their guardians, and retrieve as many lamps as you can. The lamps will be well worth the risk, as they hold the power to grant great wishes and unlock powerful magic. Will you help me in my quest?",
        taskGoals = {
            monsters = { 
			
            },
            items = {			
				[1] = {
                    name = "Djinn's lamp",
                    itemId = 2359
                }
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 25,
        taskMinLvl = 120,
        taskMaxLvl = 300,
        taskRepeat = false,
        taskStorageId = 40279,
        taskStorageCnt = 40280,
        taskRewards = {
            experience = 1200000, --or nil
            items = {
                  [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 85
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 7
                },
				[3] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 1
                },
				[4] = {
                   name = "Garona Dungeon Stone",
                    itemCid = 33714,
                    itemSid = 37795,
                    itemCnt = 1
                },
				[5] = {
                    name = "dream feather",
                    itemCid = 32074,
                    itemSid = 38295,
                    itemCnt = 1,
					itemRairity = 1
                },

				
            },
            outfits = {
            }
        },
		taskZoneName = "Djinn Temple [Garona][T1]",
	  taskSource = "Magic Apprentice Rulel",
	  taskHint = "N/A"
    },
	
	[146] = {--added
        taskNumber = 146,
        taskName = "The Dragon Treasure",
        taskDescription = "Adventurers, I have a task for you that requires bravery, skill, and cunning. Legends speak of a treasure hoard hidden on the dragon island, guarded by some of the most fearsome dragons known to man. It is said that only the bravest and most skilled adventurers can hope to claim this treasure.",
        taskGoals = {
            monsters = { 
			
            },
            items = {			
				
				},
				
            storages = {
				[1] = {
                    starageName = "Find the dragon treasure.",
                    starageTaskId = 11311
                }
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 120,
        taskMaxLvl = 300,
        taskRepeat = false,
        taskStorageId = 40281,
        taskStorageCnt = 40282,
        taskRewards = {
            experience = 1500000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 85
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 2
                },
				
				
				
            },
            outfits = {
            }
        },
		taskZoneName = "Dragonscale Island [Garona][T1]",
	  taskSource = "Dragonslayer Marilo",
	  taskHint = "N/A"
    },
		
		[147] = {--added
        taskNumber = 147,
        taskName = "The Summoning of the Djinn",
        taskDescription = "Zaraq, a renowned sorcerer, has been seeking a way to summon a powerful djinn efreet to aid him in his magical studies. He has heard rumors of a rare and valuable gemed lamp that can be used to summon such a creature. However, he lacks the necessary skills and knowledge to perform the summoning ritual himself.",
        taskGoals = {
            monsters = { 
			 [1] = {
                    name = "Efreet",
                    spriteId = 1525
                },
            },
            items = {			
				
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 120,
        taskMaxLvl = 300,
        taskRepeat = false,
        taskStorageId = 40283,
        taskStorageCnt = 40284,
        taskRewards = {
            experience = 1500000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 120
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 2
                },
				
				
				
            },
            outfits = {
            }
        },
		taskZoneName = "Djinn Temple [Garona][T1]",
	  taskSource = "Master Zarak",
	  taskHint = "gemed lamp & summoning ritual"
    },
	
			[148] = {--added
        taskNumber = 148,
        taskName = "Poison Antidote",
        taskDescription = "collect ingredients to create an antidote to the venom of the hollow & willow spiders. The antidote will be used to save a group of villagers who have been poisoned by the spiders.",
        taskGoals = {
            monsters = { 
			 
            },
            items = {			
				[1] = {
                    name = "Venom Antidote",
                    itemId = 28665
                }
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 120,
        taskMaxLvl = 300,
        taskRepeat = false,
        taskStorageId = 40285,
        taskStorageCnt = 40286,
        taskRewards = {
            experience = 2500000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 120
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 2
                },
				
				
				
            },
            outfits = {
            }
        },
		taskZoneName = "Darklands Path [Wildthorns][T2]",
	  taskSource = "Dr Romero",
	  taskHint = "craft with Hermez Thal"
    },
	[149] = {--added
        taskNumber = 149,
        taskName = "The Mother of All [GROUP]",
        taskDescription = "I've discovered that the hollow spiders are being controlled by a powerful spider queen. You'll need to venture deep into the spider lair to confront the queen and defeat her. It won't be easy, as her minions will be guarding her every step of the way.",
        taskGoals = {
            monsters = { 
			  [1] = {
                    name = "The Hollow Queen",
                    spriteId = 1525
                },
            },
            items = {			
				
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 120,
        taskMaxLvl = 300,
        taskRepeat = false,
        taskStorageId = 40287,
        taskStorageCnt = 40288,
        taskRewards = {
            experience = 5500000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 120
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 2
                },
				
				
				
            },
            outfits = {
            }
        },
		taskZoneName = "Darklands Path [Wildthorns][T2]",
	  taskSource = "Dr. Romero",
	  taskHint = "find the hollow queen"
    },
		[150] = {--added
        taskNumber = 150,
        taskName = "Spider Silk Harvest",
        taskDescription = "A group of silk merchants has requested that I gather as much hollow spider silk as possible. The silk is highly valuable, but the spiders are dangerous and difficult to harvest so the better way is to harvest their eggs. You'll need to be quick and careful to avoid getting bitten.",
        taskGoals = {
            monsters = { 
			 
            },
            items = {			
				[1] = {
                    name = "spider silk",
                    itemId = 5879
                }
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 30,
        taskMinLvl = 120,
        taskMaxLvl = 300,
        taskRepeat = false,
        taskStorageId = 40299,
        taskStorageCnt = 40300,
        taskRewards = {
            experience = 2500000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 120
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 2
                },
				
				
				
            },
            outfits = {
            }
        },
		taskZoneName = "Darklands Path [Wildthorns][T2]",
	  taskSource = "Dr Romero",
	  taskHint = "spider eggs"
    },
	
	[151] = {--added
        taskNumber = 151,
        taskName = "Lord of the Elements [GROUP]",
        taskDescription = " The Lord of the Elements, a powerful being who wields control over the magic elementals of the desert, has been causing chaos and destruction throughout the region. It is up to you to put an end to their reign of terror. Journey to the heart of the magic tower, where the Lord of the Elements resides, and defeat them in combat.",
        taskGoals = {
            monsters = { 
			  [1] = {
                    name = "Lord Of The Elements",
                    spriteId = 1525
                },
            },
            items = {			
				
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 250,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40289,
        taskStorageCnt = 40290,
        taskRewards = {
            experience = 7500000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 120
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 27156,
                    itemSid = 31811,
                    itemCnt = 1,
					itemRairity = 1
                },
				[3] = {
                    name = "dream feather",
                    itemCid = 27149,
                    itemSid = 31804,
                    itemCnt = 1,
					itemRairity = 1
                },
				[4] = {
                    name = "dream feather",
                    itemCid = 11362,
                    itemSid = 12318,
                    itemCnt = 1,
					itemRairity = 1
                },
				[4] = {
                    name = "dream feather",
                    itemCid = 27840,
                    itemSid = 32715,
                    itemCnt = 1,
					itemRairity = 1
                },
				[5] = {
                    name = "dream feather",
                    itemCid = 32074,
                    itemSid = 36155,
                    itemCnt = 1,
					itemRairity = 1
                },
				
				
				
            },
            outfits = {
            }
        },
		taskZoneName = "Desert Calamity [Sandstorm][T3]",
	  taskSource = "Saren Nightshade",
	  taskHint = "Hidden"
    },
	[152] = {--added
        taskNumber = 152,
        taskName = "Pyropteron, The Arid Terror [GROUP]",
        taskDescription = "The desert is a place of many dangers, but few are as feared as Pyropteron, The Arid Terror. This enormous red scarab has made its lair deep within the desert, and it is said to be one of the most fearsome beasts in the land. As a skilled adventurer, it falls to you to hunt down and defeat Pyropteron. This will be no easy task, as the scarab is highly resistant to physical damage and is able to breathe streams of fire that can incinerate even the most powerful warriors. You will need to be prepared with powerful magical attacks and protective spells to survive this battle.",
        taskGoals = {
            monsters = { 
			  [1] = {
                    name = "Pyropteron",
                    spriteId = 1525
                },
            },
            items = {			
				
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 250,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40291,
        taskStorageCnt = 40292,
        taskRewards = {
            experience = 2500000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 120
                },
				[2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 2
                },
				
				
				
            },
            outfits = {
            }
        },
		taskZoneName = "Desert Calamity [Sandstorm][T3]",
	  taskSource = "Saren Nightshade",
	  taskHint = "Hidden"
    },
	[153] = {--added
        taskNumber = 153,
        taskName = "Elemental Infestation",
        taskDescription = "The desert has been plagued by energy elementals, creatures that are drawn to the magical energy that is said to be hidden within the sand dunes. These elementals are highly dangerous and can cause great harm to anyone who ventures too close to them.",
        taskGoals = {
            monsters = { 
			  [1] = {
                    name = "Energy Elemental",
                    spriteId = 1525
                },
				[2] = {
                    name = "Energy Overlord",
                    spriteId = 1525
                },
            },
            items = {			
				
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 55,
        taskMinLvl = 250,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40297,
        taskStorageCnt = 40298,
        taskRewards = {
            experience = 2500000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 120
                },
				
				
				
				
				
            },
            outfits = {
            }
        },
		taskZoneName = "Desert Calamity [Sandstorm][T3]",
	  taskSource = "Saren Nightshade",
	  taskHint = "N/A"
    },
		[153] = {--added
        taskNumber = 153,
        taskName = "Last Assault",
        taskDescription = "I'm Commander Sartok, and I'm reaching out to you because I need your help with a very important task. There are dangerous lizards in the old kingdom ruins, and they are putting nearby villages at risk. Furthermore, these ruins hold valuable historical artifacts that must be protected from harm.",
        taskGoals = {
            monsters = { 
			  [1] = {
                    name = "Lizard Sentinel",
                    spriteId = 1525
                },
				[2] = {
                    name = "Lizard Magistratus",
                    spriteId = 1525
                },
				[3] = {
                    name = "Lizard Legionnaire",
                    spriteId = 1525
                },
				[4] = {
                    name = "Lizard Templar",
                    spriteId = 1525
                },
				
            },
            items = {			
				
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 55,
        taskMinLvl = 250,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40301,
        taskStorageCnt = 40302,
        taskRewards = {
            experience = 2500000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 120
                },
				
				
				
				
				
            },
            outfits = {
            }
        },
		taskZoneName = "Desert Calamity [Sandstorm][T3]",
	  taskSource = "Saren Nightshade",
	  taskHint = "N/A"
    },
	
	[154] = {--added
        taskNumber = 154,
        taskName = "Chill's Salvation",
        taskDescription = "An urgent plea resonates from the heart of the frozen realm, beckoning forth those with indomitable spirit and unwavering resolve. Kaiser Frost, the benevolent ruler of these icy lands, implores your assistance in acquiring 20 precious shards of Revitalizing Ice. However, the motive behind this quest transcends mere restoration—it is a race against time to safeguard our realm from an encroaching calamity.",
        taskGoals = {
            monsters = { 
			
            },
            items = {			
				[1] = {
                    name = "Revitalizing Ice",
                    itemId = 24122
                }
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 20,
        taskMinLvl = 330,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40303,
        taskStorageCnt = 40304,
        taskRewards = {
            experience = 2500000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 120
                },
				 [2] = {
                   name = "Cold Mirror Blueprint",
                    itemCid = 3031,
                    itemSid = 38589,
                    itemCnt = 1
                },
				
				
				
				
            },
            outfits = {
            }
        },
		taskZoneName = "Perima Island [SwanTears][T4 access]",
	  taskSource = "Kaiser Frost",
	  taskHint = "N/A"
    },
		[155] = {--added
        taskNumber = 155,
        taskName = "Frozen Whims",
        taskDescription = "It appears that my illustrious presence has deemed you worthy of a task of utmost importance. Prepare yourself for an endeavor that shall test your wit and valor in ways unimaginable. Your mission, should you choose to accept it, is to embark on a journey to collect an outrageous number of snow globes. Yes, you heard it correctly. Snow globes, those whimsical trinkets that serve no purpose other than to captivate feeble minds with their miniature, encapsulated worlds. But fret not, for this quest holds a motive of unparalleled significance. You see, my illustrious collection of snow globes is in dire need of expansion. It is a matter of utmost urgency that I acquire no less than 30 new additions to adorn the shelves of my grand hall.",
        taskGoals = {
            monsters = { 
			
            },
            items = {			
				[1] = {
                    name = "Snow Globes",
                    itemId = 22646
                }
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 30,
        taskMinLvl = 285,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40305,
        taskStorageCnt = 40306,
        taskRewards = {
            experience = 3500000, --or nil
            items = {
               [1] = {
                   name = "Winter Nomad Boots",
                    itemCid = 3031,
                    itemSid = 32489,
                    itemCnt = 1
                },														
            },
            outfits = {
            }
        },
		taskZoneName = "Perima Island [SwanTears][T4 access]",
	  taskSource = "Kaiser Frost",
	  taskHint = "N/A"
    },
	[156] = {--added
        taskNumber = 156,
        taskName = "A Golden Exchange for Angler's Delight",
        taskDescription = "Now, onto the matter at hand. As a skilled angler, I possess a coveted treasure—a frost fishing rod of unparalleled craftsmanship. This remarkable tool, infused with frost magic, has the power to enhance your fishing prowess to extraordinary levels. But, as you might have guessed, acquiring it won't come without a price.",
        taskGoals = {
            monsters = { 
			
            },
            items = {			
				[1] = {
                    name = "99 Gold Coins",
                    itemId = 2148
                }
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 30,
        taskMinLvl = 285,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40307,
        taskStorageCnt = 40308,
        taskRewards = {
            experience = 2500000, --or nil
            items = {
               [1] = {
                   name = "Frost Fishing Rod",
                    itemCid = 3031,
                    itemSid = 36315,
                    itemCnt = 1
                },														
            },
            outfits = {
            }
        },
		taskZoneName = "Perima Island [SwanTears][T4 access]",
	  taskSource = "Leo Reo",
	  taskHint = "N/A"
    },
	[157] = {--added
        taskNumber = 157,
        taskName = "Something is fishy",
        taskDescription = "Leo Reno, the master angler, entrusts you with his renowned frost fishing rod. Wield its power to summon and defeat 25 water manifestations haunting the island's water vortex. Prove your prowess and return to Leo for a generous reward.",
        taskGoals = {
            monsters = { 
			 [1] = {
                    name = "Water Manifestation",
                    spriteId = 1525
                },
            },
            items = {			
				
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 25,
        taskMinLvl = 330,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40309,
        taskStorageCnt = 40310,
        taskRewards = {
            experience = 2500000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 1
                },	
                [2] = {
                   name = "Coral sea Bass",
                    itemCid = 3031,
                    itemSid = 35430,
                    itemCnt = 20
                },  													
            },
            outfits = {
            }
        },
		taskZoneName = "Perima Island [SwanTears][T4 access]",
	  taskSource = "Leo Reo",
	  taskHint = "N/A"
    },
	[158] = {--added
        taskNumber = 158,
        taskName = "The Rune Reckoning",
        taskDescription = "Hail, traveler! I am Runemaster Zoel, entrusted with guarding the arcane wisdom of our realm. A dire threat has surfaced—sixty calamity runes, sources of chaos and darkness, have been etched across our land. These malevolent symbols must be eradicated to restore balance.",
        taskGoals = {
            monsters = { 
			
            },
            items = {			
				[1] = {
                    name = "calamity runes",
                    itemId = 26226
                }
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 60,
        taskMinLvl = 330,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40311,
        taskStorageCnt = 40312,
        taskRewards = {
            experience = 3500000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },
                [2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
                [3] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 2
                },
                [4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },													
            },
            outfits = {
            }
        },
		taskZoneName = "Firewind island [T5]",
	  taskSource = "Runemaster Zoel",
	  taskHint = "requires staff from zoel"
    },
	[159] = {--added
        taskNumber = 159,
        taskName = "Razorwind hero",
        taskDescription = "Greetings! Charlie here, witnessing chaos from Firewind thugs in our city. Join forces, quell their rampage, and restore peace. With your skills and my insights, we'll bring calm to our streets. Each thug defeated is a step toward our city's safety. When the thugs are gone, you'll receive tokens of appreciation and the city's gratitude.",
        taskGoals = {
            monsters = { 
			[1] = {
                    name = "Razorwind Archer",
                    spriteId = 1525
                },
			[2] = {
                    name = "Razorwind Smasher",
                    spriteId = 1525
                },
			[3] = {
                    name = "Razorwind Assassin",
                    spriteId = 1525
                },
			[4] = {
                    name = "Razorwind Mage",
                    spriteId = 1525
                },
			[5] = {
                    name = "Razorwind Warlock",
                    spriteId = 1525
                },
            },
            items = {			
				
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 60,
        taskMinLvl = 330,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40313,
        taskStorageCnt = 40314,
        taskRewards = {
            experience = 2500000, --or nil
            items = {
                 [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },
                [2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
                [3] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 2
                },

                 [4] = {
                    name = "Weapon Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37434,
                    itemCnt = 1
                }, 													
            },
            outfits = {
            }
        },
		taskZoneName = "Firewind island [T5]",
	  taskSource = "Civilian Charlie",
	  taskHint = "N/A"
    },
	[160] = {--added
        taskNumber = 160,
        taskName = "Raccoon's Retribution",
        taskDescription = "Greetings, valiant adventurer! I am Marine Lowtail, a determined raccoon with a cause. Our once serene realm has been marred by the presence of Skylander Paladins and Skylander Druids. These once-noble beings have strayed from their virtuous ways, sowing discord and chaos instead of safeguarding the harmony of our world. Armed with my cunning and keen insight, I beseech you to aid me in this quest of Raccoon's Retribution.",
        taskGoals = {
            monsters = { 
			[1] = {
                    name = "Skylander Paladin",
                    spriteId = 1525
                },
			[2] = {
                    name = "Skylander Druid",
                    spriteId = 1525
                },
            },
            items = {			
				
				},
				
            storages = {
				
						},
        },
        taskGoalCnt = 70,
        taskMinLvl = 350,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40315,
        taskStorageCnt = 40316,
        taskRewards = {
            experience = 4000000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },
                [2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
                [3] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 2
                },
                [4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },  
                [5] = {
                    name = "Weapon Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37434,
                    itemCnt = 1
                },                                                  													
            },
            outfits = {
            }
        },
		taskZoneName = "Firewind island [T5]",
	  taskSource = "Marine Lowtail",
	  taskHint = "N/A"
    },
	[161] = {--added
        taskNumber = 161,
        taskName = "Bonds Unbound",
        taskDescription = "Greetings again! It's Marine Lowtail with a pressing plea. The Skylander Paladins and Druids have sunk low, imprisoning my friends and chaining them. Join forces with me to free them – your strength, my wits. We'll shatter these chains, restore harmony, and call this quest Unchained Allies. Venture forth, break those chains, earn gratitude, blessings, and rewards.",
        taskGoals = {
            monsters = { 
			
            },
            items = {			
				
				},
				
            storages = {
				[1] = {
                    starageName = "chains destroyed.",
                    starageTaskId = 40576
                }
						},
        },
        taskGoalCnt = 20,
        taskMinLvl = 350,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40317,
        taskStorageCnt = 40318,
        taskRewards = {
            experience = 3500000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },

                 [2] = {
                    name = "Armor Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37433,
                    itemCnt = 1
                }, 
                 [3] = {
                    name = "Weapon Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37434,
                    itemCnt = 1
                }, 													
            },
            outfits = {
            }
        },
		taskZoneName = "Firewind island [T5]",
	  taskSource = "Marine Lowtail",
	  taskHint = "N/A"
    },
	[162] = {--added
        taskNumber = 162,
        taskName = "Golem's Grasp",
        taskDescription = "Ahoy, adventurer! Captain Bulrat here, seekin' your aid. Leaf golems are runnin' wild in the island, causin' chaos. Join me in Golem's Grasp, and we'll put an end to their rampage. Hack through 'em with your blade and me experience. Once they're gone, ye'll be rewarded with me loot and the respect of a seasoned pirate.",
        taskGoals = {
            monsters = { 
			[1] = {
                    name = "Leaf Golem",
                    spriteId = 1525
                },
            },
            items = {			
				
				},
				
            storages = {
				
				
						},
        },
        taskGoalCnt = 65,
        taskMinLvl = 350,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40319,
        taskStorageCnt = 40320,
        taskRewards = {
            experience = 4100000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },
                [2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
                [3] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 2
                },
                [4] = {
                    name = "Weapon Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37434,
                    itemCnt = 1
                }, 													
            },
            outfits = {
            }
        },
		taskZoneName = "Firewind island [T5]",
	  taskSource = "Captain Bulrat",
	  taskHint = "N/A"
    },
	[163] = {--added
        taskNumber = 163,
        taskName = "Embers Extinguished",
        taskDescription = "Greetings, brave soul! Dragon Slayer Belserion here, seeking your aid. Ashborne Dragons have conjured Soul Flames threatening our land. Step upon them, douse their dark power. With my guidance, your courage, the flames shall be snuffed, and our realm safeguarded. Rewards await – insights, tokens, a talon as emblem, and valor awoken. Join me, extinguish the flames, secure our realm's future!",
        taskGoals = {
            monsters = { 
			
            },
            items = {			
				
				},
				
            storages = {
				[1] = {
                    starageName = "soul flames controlled.",
                    starageTaskId = 40577
                }
				
						},
        },
        taskGoalCnt = 100,
        taskMinLvl = 330,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40321,
        taskStorageCnt = 40322,
        taskRewards = {
            experience = 5500000, --or nil
            items = {
                [1] = {
                    name = "Firewind sword",
                    itemCid = 33682,
                    itemSid = 34079,
                    itemCnt = 1
                },
                [2] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 2
                },
													
            },
            outfits = {
            }
        },
		taskZoneName = "Firewind island [T5]",
	  taskSource = "Dragon Slayer Belserion",
	  taskHint = "step on flames"
    },
		[164] = {--added
        taskNumber = 164,
        taskName = "Inferno's End",
        taskDescription = "Greetings, brave ally! I'm Dragon Slayer Belserion, facing a dire threat. Seventy Ashborne Dragons bring chaos and fire. Join me in Inferno's End .. a mission to vanquish them all. With your might and my expertise, let's quell this inferno. Rewards await .. mastery, treasures, a badge of honor, and legendary strength.",
        taskGoals = {
            monsters = { 
			[1] = {
                    name = "Ashborn Dragon",
                    spriteId = 1525
                },
            },
            items = {			
				
				},
				
            storages = {
				
				
						},
        },
        taskGoalCnt = 75,
        taskMinLvl = 330,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40323,
        taskStorageCnt = 40324,
        taskRewards = {
            experience = 3400000, --or nil
            items = {
                [1] = {
                   name = "firewind bow",
                    itemCid = 3031,
                    itemSid = 32798,
                    itemCnt = 180
                },

                 [2] = {
                    name = "Armor Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37433,
                    itemCnt = 1
                }, 
												
            },
            outfits = {
            }
        },
		taskZoneName = "Firewind island [T5]",
	  taskSource = "Dragon Slayer Belserion",
	  taskHint = "N/A"
    },
	[165] = {--added
        taskNumber = 165,
        taskName = "Unmasking Shadows",
        taskDescription = "Greetings, seeker of truth. I am Soriel, The True Native, and I beseech your aid in a matter of utmost significance. Among us dwell those who falsely claim our heritage, tarnishing our legacy. I implore you to embark on a quest to unveil these shadows and restore honor to our name. These impostors, the Fake Native members, exploit our history for their own gain. With your discernment and my insights, let us unveil their deception in a quest I call Unmasking Shadows.",
        taskGoals = {
            monsters = { 
			[1] = {
                    name = "Native Crusher",
                    spriteId = 1525
                },
			[2] = {
                    name = "Native Defender",
                    spriteId = 1525
                },
			[3] = {
                    name = "Native Shaman",
                    spriteId = 1525
                },
            },
            items = {			
				
				},
				
            storages = {
				
				
						},
        },
        taskGoalCnt = 75,
        taskMinLvl = 370,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40325,
        taskStorageCnt = 40326,
        taskRewards = {
            experience = 4500000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 150
                },
                [2] = {
                    name = "boots",
                    itemCid = 33682,
                    itemSid = 24742,
                    itemCnt = 15
                },
                [3] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 1
                },

                 [4] = {
                    name = "Armor Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37433,
                    itemCnt = 1
                }, 
                 [5] = {
                    name = "Weapon Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37434,
                    itemCnt = 1
                }, 														
            },
            outfits = {
            }
        },
		taskZoneName = "Firewind island [T5]",
	  taskSource = "Soriel, The True Native",
	  taskHint = "N/A"
    },
	[166] = {--added
        taskNumber = 166,
        taskName = "Echoes of Ancestors",
        taskDescription = "Greetings, truth-seeker. I'm Soriel, The True Native. The Fake Native members have defiled our heritage. Collect the Wooden Totems, our true ancestors' belongings, and uphold our lineage. With my guidance, retrieve these sacred totems, proving our authentic heritage. As you gather the final totem, you'll earn the gratitude of our community and the blessings of our ancestors.",
        taskGoals = {
            monsters = { 
			
            },
            items = {			
				[1] = {
                    name = "wooden totem",
                    itemId = 37426
                }
				},
				
            storages = {
				
				
						},
        },
        taskGoalCnt = 5,
        taskMinLvl = 330,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40327,
        taskStorageCnt = 40328,
        taskRewards = {
            experience = 3500000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 140
                },
                [2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
                [3] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 1
                },													
            },
            outfits = {
            }
        },
		taskZoneName = "Firewind island [T5]",
	  taskSource = "Soriel, The True Native",
	  taskHint = "loot"
    },
	[167] = {--added
        taskNumber = 167,
        taskName = "Ogres' Bane",
        taskDescription = "Hail, kindred spirit. Nar'thalas speaks, an elf bound by duty. Our land endures darkness .. ogres disrupt our sacred balance. With heart aflame, I ask for your aid on the path of Eilathar's Reclamation. These ogres, agents of chaos, defile our realm's harmony. With your elven grace and my guiding voice, I beseech thee to undertake the quest known as Oathbreaker's Redemption.",
        taskGoals = {
            monsters = { 
			[1] = {
                    name = "Ogre",
                    spriteId = 1525
                },
			[2] = {
                    name = "Ogre Brute",
                    spriteId = 1525
                },
			[3] = {
                    name = "Ogre Savage",
                    spriteId = 1525
                },
			[4] = {
                    name = "Ogre Shaman",
                    spriteId = 1525
                },
            },
            items = {			
				
				},
				
            storages = {
				
				
						},
        },
        taskGoalCnt = 120,
        taskMinLvl = 380,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40329,
        taskStorageCnt = 40330,
        taskRewards = {
            experience = 6500000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },
                [2] = {
                    name = "dream feather",
                    itemCid = 33682,
                    itemSid = 37763,
                    itemCnt = 15
                },
                [3] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 1
                },
                [4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },  
                 [5] = {
                    name = "Armor Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37433,
                    itemCnt = 1
                }, 
                 [6] = {
                    name = "Weapon Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37434,
                    itemCnt = 1
                }, 													
            },
            outfits = {
            }
        },
		taskZoneName = "Firewind island [T5]",
	  taskSource = "Nar'thalas",
	  taskHint = "N/A"
    },
	[168] = {--added
        taskNumber = 168,
        taskName = "Corruption of the Trees",
        taskDescription = "The ancient Tree of Life, guardian of the DreamSoul Forest, is succumbing to a dark corruption. Venture into the heart of the enchanted woods travel to the north-east untill you reach the guardian. Return for further guidance once the ritual is complete.",
        taskGoals = {
            monsters = { 
			[1] = {
                    name = "Tree Corruption",
                    spriteId = 1525
                },
            },
            items = {			
				
				},
				
            storages = {
				--[1] = {
                 --   starageName = "soul flames controlled.",
                --    starageTaskId = 40578
             --   }
				
						},
        },
        taskGoalCnt = 5,
        taskMinLvl = 330,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40331,
        taskStorageCnt = 40332,
        taskRewards = {
            experience = 7500000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 2
                },

                 [3] = {
                    name = "Weapon Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37434,
                    itemCnt = 1
                }, 													
            },
            outfits = {
            }
        },
		taskZoneName = "Dream Soul Forest [T5]",
	  taskSource = "NPC HERE",
	  taskHint = "N/A"
    },
	
	[169] = {--added
        taskNumber = 169,
        taskName = "Sampling the DreamNectar",
        taskDescription = "Purchase an empty sample vial from Alaric at the Alchemical Emporium. Venture into the DreamSoul Forest to collect a sample of the elusive dream nectar from the buzzing hives. Return the precious sample to Alaric for a reward.",
        taskGoals = {
            monsters = { 
			
            },
            items = {			
						
				[1] = {
                    name = "elusive dream nectar",
                    itemId = 36401
                }
				},
				
            storages = {
				--[1] = {
                 --   starageName = "soul flames controlled.",
                --    starageTaskId = 40578
             --   }
				
						},
        },
        taskGoalCnt = 20,
        taskMinLvl = 400,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40333,
        taskStorageCnt = 40334,
        taskRewards = {
            experience = 7000000, --or nil
            items = {
                [1] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 2
                },
                [2] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 1
                },											
            },
            outfits = {
            }
        },
		taskZoneName = "Dream Soul Forest [T5]",
	  taskSource = "NPC HERE",
	  taskHint = "N/A"
    },
	
	[170] = {--added
        taskNumber = 170,
        taskName = "Luminous Gathering",
        taskDescription = "Adventurer, the alchemists of DreamSoul need your help! Collect 40 fluorescent samples from the glowing shrooms in Dreamsoul Forest. These samples are crucial for a new elixir to light our city at night. Beware the forest's dangers, and return successfully for a generous reward. Good luck!",
        taskGoals = {
            monsters = { 
			
            },
            items = {			
						
				[1] = {
                    name = "green sample",
                    itemId = 36400
                }
				},
				
            storages = {
				--[1] = {
                 --   starageName = "soul flames controlled.",
                --    starageTaskId = 40578
             --   }
				
						},
        },
        taskGoalCnt = 40,
        taskMinLvl = 400,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40335,
        taskStorageCnt = 40336,
        taskRewards = {
            experience = 7500000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 5
                },													
            },
            outfits = {
            }
        },
		taskZoneName = "Dream Soul Forest [T5]",
	  taskSource = "NPC HERE",
	  taskHint = "N/A"
    },
	[171] = {--added
        taskNumber = 171,
        taskName = "Arachnid Shadows: Clearing the Mist",
        taskDescription = "In the heart of the mist-laden forests, a formidable threat has woven its web. Reports speak of mist spiders, elusive and venomous, their presence darkening the moonlit paths. The village is on edge, and a brave adventurer is needed to face the arachnid menace.",
        taskGoals = {
            monsters = { 
			[1] = {
                    name = "Mist Spider",
                    spriteId = 1525
                },
            },
            items = {			
						
			
				},
				
            storages = {
				--[1] = {
                 --   starageName = "soul flames controlled.",
                --    starageTaskId = 40578
             --   }
				
						},
        },
        taskGoalCnt = 30,
        taskMinLvl = 400,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40337,
        taskStorageCnt = 40338,
        taskRewards = {
            experience = 6500000, --or nil
            items = {

                [1] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 2
                },

                 [2] = {
                    name = "Weapon Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37434,
                    itemCnt = 2
                }, 													
            },
            outfits = {
            }
        },
		taskZoneName = "Dream Soul Forest [T5]",
	  taskSource = "NPC HERE",
	  taskHint = "N/A"
    },
	
	[172] = {--added
        taskNumber = 172,
        taskName = "Whispers of the Ancients: Seeking the Elder's Blessing",
        taskDescription = "In the heart of the DreamSoul Forest resides the venerable Elder of the Forest, Elder Emberleaf, a wise and ancient guardian. Seek an audience with the Elder and request their benevolent blessing, for a matter of great importance awaits.",
        taskGoals = {
            monsters = { 
			--[1] = {
               --     name = "Mist Spider",
              --      spriteId = 1525
               -- },
            },
            items = {			
						
			
				},
				
            storages = {
				[1] = {
                    starageName = "Wisdom Adquired.",
                    starageTaskId = 40580
               }
				
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 400,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40339,
        taskStorageCnt = 40340,
        taskRewards = {
            experience = 2500000, --or nil
            items = {

                [1] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 2
                },
                [2] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 2
                },
 
                [3] = {
                    name = "Weapon Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37434,
                    itemCnt = 1
                }, 														
            },
            outfits = {
            }
        },
		taskZoneName = "Dream Soul Forest [T5]",
	  taskSource = "NPC HERE",
	  taskHint = "find Elder Emberleaf"
    },
	
	[173] = {--added
        taskNumber = 173,
        taskName = "Nightmare Eradication",
        taskDescription = "text desciption here",
        taskGoals = {
            monsters = { 
			[1] = {
                   name = "Nightmare",
                   spriteId = 1525
                },
            },
            items = {			
						
			
				},
				
            storages = {
				--[1] = {
               --     starageName = "Wisdom Adquired.",
                --    starageTaskId = 40580
               --}
				
						},
        },
        taskGoalCnt = 40,
        taskMinLvl = 400,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40341,
        taskStorageCnt = 40342,
        taskRewards = {
            experience = 2500000, --or nil
            items = {

                [1] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 5
                },
                [2] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 5
                },
												
            },
            outfits = {
            }
        },
		taskZoneName = "Dream Soul Forest [T5]",
	  taskSource = "NPC HERE",
	  taskHint = "N/A"
    },
	
	[173] = {--added
        taskNumber = 173,
        taskName = "The Pumpking Arena",
        taskDescription = "Complete the Pumpking Arena by defeating the Pumpking King, Its gonna be hard but i believe in you! or maybe not that much. khekhe.",
        taskGoals = {
            monsters = { 
			[1] = {
                   name = "King Pumpking",
                   spriteId = 1525
                },
            },
            items = {			
						
			
				},
				
            storages = {
				--[1] = {
               --     starageName = "Wisdom Adquired.",
                --    starageTaskId = 40580
               --}
				
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 400,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40343,
        taskStorageCnt = 40344,
        taskRewards = {
            experience = 2500000, --or nil
            items = {
                [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 10
                },
                [3] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 2
                },
                [4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },  
                 [5] = {
                    name = "Weapon Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37434,
                    itemCnt = 1
                }, 													
            },
            outfits = {
            }
        },
		taskZoneName = "Dream Soul Forest [T5]",
	  taskSource = "NPC HERE",
	  taskHint = "N/A"
    },
	
	[173] = {--added
        taskNumber = 173,
        taskName = "Retrieving the Cursed Tome",
        taskDescription = "Enter the cursed Dead Forest and navigate to the desolate village. Retrieve the malevolent Cursed Tome hidden within. Return to the village outskirts and seek guidance from the Tower Keeper to unravel the shadows binding the cursed book.",
        taskGoals = {
            monsters = { 
		--	[1] = {
         --          name = "King Pumpking",
         --          spriteId = 1525
         --       },
            },
            items = {			
						
			[1] = {
                    name = "Testimony of William Countwell",
                    itemId = 1962
                }
				},
				
            storages = {
				--[1] = {
               --     starageName = "Wisdom Adquired.",
                --    starageTaskId = 40580
               --}
				
						},
        },
        taskGoalCnt = 1,
        taskMinLvl = 400,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40345,
        taskStorageCnt = 40346,
        taskRewards = {
            experience = 2500000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 2
                },

                 [3] = {
                    name = "Armor Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37433,
                    itemCnt = 1
                }, 													
            },
            outfits = {
            }
        },
		taskZoneName = "Dream Soul Forest [T5]",
	  taskSource = "NPC HERE",
	  taskHint = "book"
    },
	
	
	
	





    --celestial reputations quests

    [174] = {--added
        taskNumber = 174,
        taskName = "Pillars of Light",
        taskDescription = "xxxxx",
        taskGoals = {
            monsters = { 
        --  [1] = {
         --          name = "King Pumpking",
         --          spriteId = 1525
         --       },
            },
            items = {           
                        
         --   [1] = {
         --           name = "Testimony of William Countwell",
        --            itemId = 1962
         --       }
                },
                
            storages = {
                [1] = {
                    starageName = "Wisdom Adquired.",
                    starageTaskId = 40581
               }
                
                        },
        },
        taskGoalCnt = 5,
        taskMinLvl = 400,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40347,
        taskStorageCnt = 40348,
        taskRewards = {
            experience = 2500000, --or nil
            items = {
              [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 2
                },
                [3] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 2
                },
                [4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },  
                 [5] = {
                    name = "Armor Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37433,
                    itemCnt = 1
                },                                                    
            },
            outfits = {
            }
        },
        taskZoneName = "Dream Soul Forest [T5]",
      taskSource = "NPC HERE",
      taskHint = "book"
    },

    [175] = {--added
        taskNumber = 175,
        taskName = "Divine Favor",
        taskDescription = "give item to x npc",
        taskGoals = {
            monsters = { 
        --  [1] = {
         --          name = "King Pumpking",
         --          spriteId = 1525
         --       },
            },
            items = {           
                        
         --   [1] = {
         --           name = "Testimony of William Countwell",
        --            itemId = 1962
         --       }
                },
                
            storages = {
                [1] = {
                    starageName = "Relic Delivered.",
                    starageTaskId = 40582
               }
                
                        },
        },
        taskGoalCnt = 1,
        taskMinLvl = 400,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40349,
        taskStorageCnt = 40350,
        taskRewards = {
            experience = 2500000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 2
                },
                [3] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 2
                },
                [4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },  
                 [5] = {
                    name = "Armor Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37433,
                    itemCnt = 1
                },                                                      
            },
            outfits = {
            }
        },
        taskZoneName = "Dream Soul Forest [T5]",
      taskSource = "NPC HERE",
      taskHint = "book"
    },
	

    [176] = {--added
        taskNumber = 176,
        taskName = "Sanctify the Dream Veil",
        taskDescription = "extinguished night flames",
        taskGoals = {
            monsters = { 
        --  [1] = {
         --          name = "King Pumpking",
         --          spriteId = 1525
         --       },
            },
            items = {           
                        
         --   [1] = {
         --           name = "Testimony of William Countwell",
        --            itemId = 1962
         --       }
                },
                
            storages = {
                [1] = {
                    starageName = "Wisdom Adquired.",
                    starageTaskId = 40583
               }
                
                        },
        },
        taskGoalCnt = 1,
        taskMinLvl = 400,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40351,
        taskStorageCnt = 40352,
        taskRewards = {
            experience = 2500000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 2
                },
                [3] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 2
                },
                [4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },  
                 [5] = {
                    name = "Armor Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37433,
                    itemCnt = 1
                },                                                       
            },
            outfits = {
            }
        },
        taskZoneName = "Dream Soul Forest [T5]",
      taskSource = "NPC HERE",
      taskHint = "book"
    },

    [177] = {--added
        taskNumber = 177,
        taskName = "Totems of Terror",
        taskDescription = "destroy totems in gehenna xxxxxx",
        taskGoals = {
            monsters = { 
          [1] = {
                   name = "Terror Totem",
                   spriteId = 1525
                },
            },
            items = {           
                        
         --   [1] = {
         --           name = "Testimony of William Countwell",
        --            itemId = 1962
         --       }
                },
                
            storages = {
          --      [1] = {
          --          starageName = "Wisdom Adquired.",
          --          starageTaskId = 40583
          --     }
                
                     },
        },
        taskGoalCnt = 20,
        taskMinLvl = 400,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40353,
        taskStorageCnt = 40354,
        taskRewards = {
            experience = 2500000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 2
                },
                [3] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 2
                },
                [4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },  
                 [5] = {
                    name = "Armor Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37433,
                    itemCnt = 1
                },                                                      
            },
            outfits = {
            }
        },
        taskZoneName = "Dream Soul Forest [T5]",
      taskSource = "NPC HERE",
      taskHint = "book"
    },

    [178] = {--added
        taskNumber = 178,
        taskName = "Celestial Conclave",
        taskDescription = "destroy totems in gehenna xxxxxx",
        taskGoals = {
            monsters = { 
         -- [1] = {
          --         name = "Terror Totem",
         --          spriteId = 1525
         --       },
            },
            items = {           
                        
         --   [1] = {
         --           name = "Testimony of William Countwell",
        --            itemId = 1962
         --       }
                },
                
            storages = {
                [1] = {
                    starageName = "diplomatic meeting.",
                    starageTaskId = 40584
               }
                
                     },
        },
        taskGoalCnt = 20,
        taskMinLvl = 400,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40355,
        taskStorageCnt = 40356,
        taskRewards = {
            experience = 2500000, --or nil
            items = {
              [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 2
                },
                [3] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 2
                },
                [4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },  
                 [5] = {
                    name = "Armor Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37433,
                    itemCnt = 1
                },                                                        
            },
            outfits = {
            }
        },
        taskZoneName = "Dream Soul Forest [T5]",
      taskSource = "NPC HERE",
      taskHint = "book"
    },
	
	[179] = {--added
        taskNumber = 179,
        taskName = "Exiled Sinner",
        taskDescription = "find npc in nemea and recover the holy tablets xxxxxx",
        taskGoals = {
            monsters = { 
         -- [1] = {
          --         name = "Terror Totem",
         --          spriteId = 1525
         --       },
            },
            items = {           
                        
         --   [1] = {
         --           name = "Testimony of William Countwell",
        --            itemId = 1962
         --       }
                },
                
            storages = {
                [1] = {
                    starageName = "Holy tablets Recovered.",
                    starageTaskId = 40585
               }
                
                     },
        },
        taskGoalCnt = 20,
        taskMinLvl = 400,
        taskMaxLvl = 500,
        taskRepeat = false,
        taskStorageId = 40355,
        taskStorageCnt = 40356,
        taskRewards = {
            experience = 2500000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemCid = 3031,
                    itemSid = 2148,
                    itemCnt = 180
                },
                [2] = {
                    name = "Recognision Isnsignia",
                    itemCid = 33682,
                    itemSid = 21399,
                    itemCnt = 2
                },
                [3] = {
                    name = "Hellstone Dungeon Stone",
                    itemCid = 33710,
                    itemSid = 37794,
                    itemCnt = 2
                },
                [4] = {
                    name = "Fame Tome",
                    itemCid = 2848,
                    itemSid = 1982,
                    itemCnt = 10
                },  
                 [5] = {
                    name = "Armor Loot Box T5",
                    itemCid = 2848,
                    itemSid = 37433,
                    itemCnt = 1
                },                                                       
            },
            outfits = {
            }
        },
        taskZoneName = "Dream Soul Forest [T5]",
      taskSource = "NPC HERE",
      taskHint = "book"
    },
    
	
	
	
	
}


