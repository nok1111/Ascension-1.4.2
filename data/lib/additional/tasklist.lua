npcTaskList = {
		["Captain Max"] = {1},
        ["Magnus Blackwater"] = {2,3,4,5},


    -- Garona

}

playersTasks = {
    [1] = {
        taskNumber = 1,
        taskName = "Lost Trophy",
        taskDescription = "some rumors say that mr ludrich golden trophy is still here, do you now the value of such thing? dude, it is made of pure gold!",
        taskGoals = {
            monsters = {			                 
                --[[[1] = {
                    name = "Skeleton",
                    spriteId = 1525
                },
				[2] = {
                    name = "Ghoul",
                    spriteId = 1525
                }--]]
            },
            items = {
			--[[1] = {
                    name = "Golden Figurine",
                    itemId = 5799
                    }--]]

            },
            storages = {
                --[[[1] = {
                    starageName = "Light candel",
                    starageTaskId = 12000
                }]]
            }
        },
       -- preRequiredStorages = {40000}, -- The player must have storage 40000 before accepting this task
        taskGoalCnt = 1,
        taskMinLvl = 1,
        taskRepeat = false,
        taskStorageId = 40001,
        taskStorageCnt = 40002,
        taskRewards = {
            experience = 600, --or nil
            items = {
                [1] = {
                    name = "grave robber shovel",
                    itemSid = 5710,
                    itemCnt = 1
                },
				[2] = {
                    name = "gold coin",
                    itemSid = 2148,
                    itemCnt = 15
                },
				[3] = {
                    name = "Fame Tome",
                    itemSid = 1982,
                    itemCnt = 2
                },
            },
            outfits = {
                --[1] = {
                  --  name = "Oriental",
                   -- lookType = 146
                },
            },
      taskZoneName = "garona north cave",
	  taskSource = "Grave Robber Lucas",
	  taskHint = "N/A"
    },
    [2] = {
        taskNumber = 2,
        taskName = "The Path to Garona",
        taskDescription = "Find the missing pieces of an ancient map leading to Garona",
        taskGoals = {
            monsters = {			                 
                --[[[1] = {
                    name = "Skeleton",
                    spriteId = 1525
                },
                [2] = {
                    name = "Ghoul",
                    spriteId = 1525
                }--]]
            },
            items = {
			[1] = {
                    name = "pirate's fortune map",
                    itemId = 27898
                    }

            },
            storages = {
                --[[[1] = {
                    starageName = "Light candel",
                    starageTaskId = 12000
                }]]
            }
        },
        preRequiredStorages = {}, -- The player must have storage 40000 before accepting this task
        taskGoalCnt = 1,
        taskMinLvl = 45,
        taskRepeat = false,
        taskStorageId = 40003,
        taskStorageCnt = 40004,
        taskRewards = {
            experience = 12000, --or nil
            items = {
				[1] = {
                    name = "gold coin",
                    itemSid = 2148,
                    itemCnt = 85
                    },
                },
            outfits = {
                --[1] = {
                  --  name = "Oriental",
                   -- lookType = 146
                },
            },
      taskZoneName = "Any pirate hideout",
	  taskSource = "Magnus Blackwater",
	  taskHint = "You need to explore the ocean."
    },
    [3] = {
        taskNumber = 3,
        taskName = "The Vanishing Fleet",
        taskDescription = "The map shows a safe route, but every ship that took it vanished without a trace. We must check at Thornback Island north of venore for any survivors and hope for the best.",
        taskGoals = {
            monsters = {                             
                --[[[1] = {
                    name = "Skeleton",
                    spriteId = 1525
                },
                [2] = {
                    name = "Ghoul",
                    spriteId = 1525
                }--]]
            },
            items = {
             --[[ [1] = {
                    name = "pirate's fortune map",
                    itemId = 27898
                    }]]

            },
            storages = {
              [1] = {
                    starageName = "Survivors Found",
                    starageTaskId = Mainquest.survivor
                }
            }
        },
        preRequiredStorages = {40003}, -- The player must have storage 40000 before accepting this task
        taskGoalCnt = 1,
        taskMinLvl = 45,
        taskRepeat = false,
        taskStorageId = 40005,
        taskStorageCnt = 40006,
        taskRewards = {
            experience = 12000, --or nil
            items = {
                [1] = {
                    name = "gold coin",
                    itemSid = 2148,
                    itemCnt = 85
                    },
                },
            outfits = {
                --[1] = {
                  --  name = "Oriental",
                   -- lookType = 146
                },
            },
      taskZoneName = "Thornback Island",
      taskSource = "Magnus Blackwater",
      taskHint = "Sailing"
    },
    [4] = {
        taskNumber = 4,
        taskName = "The Pirate King's Bounty",
        taskDescription = "Defeat Captain Bloodbane, the leader of the Black Tide Pirates, who guards the sea route to Garona, find him to the north of Thornback Island.",
        taskGoals = {
            monsters = {                             
                [1] = {
                    name = "Captain Bloodbane",
                    spriteId = 1525
                },
            },
            items = {
             --[[ [1] = {
                    name = "pirate's fortune map",
                    itemId = 27898
                    }]]

            },
            storages = {
             --[[ [1] = {
                    starageName = "Survivors Found",
                    starageTaskId = Mainquest.survivor
                }]]
            }
        },
        preRequiredStorages = {40005}, -- The player must have storage 40000 before accepting this task
        taskGoalCnt = 1,
        taskMinLvl = 45,
        taskRepeat = false,
        taskStorageId = 40007,
        taskStorageCnt = 40008,
        taskRewards = {
            experience = 12000, --or nil
            items = {
                [1] = {
                    name = "gold coin",
                    itemSid = 2148,
                    itemCnt = 85
                    },
                },
            outfits = {
                --[1] = {
                  --  name = "Oriental",
                   -- lookType = 146
                },
            },
      taskZoneName = "Thornback Island",
      taskSource = "Magnus Blackwater",
      taskHint = "Sailing"
    },
    [5] = {
        taskNumber = 5,
        taskName = "A New Beginning in Garona",
        taskDescription = "Board Captain Bluebears ship to set sail for Garona, a new continent filled with adventure and danger.",
        taskGoals = {
            monsters = {                             
              --[[  [1] = {
                    name = "Captain Bloodbane",
                    spriteId = 1525
                },]]
            },
            items = {
             --[[ [1] = {
                    name = "pirate's fortune map",
                    itemId = 27898
                    }]]

            },
            storages = {
             [1] = {
                    starageName = "Sail to Garona",
                    starageTaskId = Mainquest.sailtogarona
                }
            }
        },
        preRequiredStorages = {40007}, -- The player must have storage 40000 before accepting this task
        taskGoalCnt = 1,
        taskMinLvl = 45,
        taskRepeat = false,
        taskStorageId = 40009,
        taskStorageCnt = 40010,
        taskRewards = {
            experience = 12000, --or nil
            items = {
                [1] = {
                    name = "gold coin",
                    itemSid = 2148,
                    itemCnt = 85
                    },
                },
            outfits = {
                --[1] = {
                  --  name = "Oriental",
                   -- lookType = 146
                },
            },
      taskZoneName = "Garona",
      taskSource = "Magnus Blackwater",
      taskHint = "N/a"
    },
}


