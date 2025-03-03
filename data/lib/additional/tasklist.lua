npcTaskList = {
		["Sheriff Gordon"] = {2,3},
        ["Magnus Blackwater"] = {},


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
        taskName = "Introduction to Crafting",
        taskDescription = "well lets start with the basics, in order to survive in this world i may suggest learning a crafting job. In order to learn a job go and talk to any carfting related instructor like [Blacksmith Sam], [Alchemist Hana], [The Great Xodet] or [Chef Sam]. You can learn more about this once you talk with them.",
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
		

            },
            storages = {
               [1] = {
                    starageName = "Learn a Crafting Job.",
                    starageTaskId = Mainquest.learncrafting
                }
            }
        },
        preRequiredStorages = {}, -- The player must have storage 40000 before accepting this task
        taskGoalCnt = 1,
        taskMinLvl = 1,
        taskRepeat = false,
        taskStorageId = 40003,
        taskStorageCnt = 40004,
        taskRewards = {
            experience = 12000, --or nil
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
                --[1] = {
                  --  name = "Oriental",
                   -- lookType = 146
                },
            },
      taskZoneName = "Garona",
	  taskSource = "Sheriff Gordon",
	  taskHint = "Talk to NPC."
    },
    [3] = {
        taskNumber = 3,
        taskName = "Starting Tools",
        taskDescription = "Go find a Lubo [NPC] and buy an expedition bag, ill give you afterwards all the tools you will need in your journey.",
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
                    name = "Expedition Bag",
                    itemId = 11242
                }

            },
            storages = {
             
            }
        },
        preRequiredStorages = {40003}, -- The player must have storage 40000 before accepting this task
        taskGoalCnt = 1,
        taskMinLvl = 1,
        taskRepeat = false,
        taskStorageId = 40005,
        taskStorageCnt = 40006,
        taskRewards = {
            experience = 12000, --or nil
            items = {
               [1] = {
                   name = "gold coin",
                    itemSid = 2148,
                    itemCnt = 4
                },              
                [2] = {
                    name = "Scythe",
                    itemSid = 2550,
                    itemCnt = 1
                },
                [3] = {
                    name = "Rope",
                    itemSid = 2120,
                    itemCnt = 1
                },
                [4] = {
                    name = "Shovel",
                    itemSid = 2554,
                    itemCnt = 1
                },
                [5] = {
                    name = "Pick",
                    itemSid = 2553,
                    itemCnt = 1
                },
                [6] = {
                    name = "Fishing Rod",
                    itemSid = 2580,
                    itemCnt = 1
                }
                },
            outfits = {
                --[1] = {
                  --  name = "Oriental",
                   -- lookType = 146
                },
            },
      taskZoneName = "Garona",
      taskSource = "Sheriff Gordon",
      taskHint = "N/A"
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


