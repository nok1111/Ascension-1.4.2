if not RandomDungeonSystem then
	RandomDungeonSystem = {}
end

RandomDungeonSystem.dungeons = {
	[1] = { ---NORTH MAIN LAND
		portals = {
			[1] = {
				portalItems = { -------- DONE--------
                                        {position = Position(1608, 3096, 11), id = 27716}, -- portal position and its id
				},
				itemsToCreate = {
					{id = 34308, position = Position(1606, 3096, 11)},
					{id = 34308, position = Position(1610, 3096, 11)},					-- used for the flames, you can specify all details here
				},
				text = {msg = "Dungeon Active", position = Position(1608, 3096, 11), delay = 1},
                        }
			
		},
		dungeonPositions = { -- as many as you like.
                        {position = Position(4384, 3760, 6), bossPosition = Position(4362, 3758, 9), bossName = "Gurzul, The Merciless",
                         dungeonExtraData = {
                             background = "1",
                             missionName = "Blackrock Caverns", missionObjectives = "Find and Kill Gurzul, The Merciless", difficulty = "Normal",
                             level = 15, reqPlayers = "2-4", coins = 50, fame = 50, exp = 20400, reqItems = {
                                    [1] = {
                                        reqCnt = 2,
                                        sid = 37795,
                                        cid = 33714 --client id, to show proper item image on client sid
                                    },
                                }
                            }
                        }
                }
        },
        [2] = { ---NORTH MAIN LAND
                portals = {
                        [1] = {
                                portalItems = { -------- DONE--------
                                        {position = Position(1761, 3277, 7), id = 27716}, -- portal position and its id
                                },
                                itemsToCreate = {
                                        {id = 34308, position = Position(1760, 3277, 7)},
                                        {id = 34308, position = Position(1762, 3277, 7)},					-- used for the flames, you can specify all details here
                                },
                                text = {msg = "Caverns of Betrayal", position = Position(1761, 3277, 7), delay = 1},
                        }

                },
                dungeonPositions = { -- as many as you like.
                        {position = Position(1852, 3076, 8), bossPosition = Position(1928, 2997, 14), bossName = "Lucella Nightmare",
                         dungeonExtraData = {
                             background = "2",
                             missionName = "Caverns of Betrayal", missionObjectives = "Find and kill lucella, The witch.", difficulty = "Easy",
                             level = 65, reqPlayers = "1+", coins = 50, fame = 50, exp = 6000, reqItems = {
                                     [1] = {
                                        reqCnt = 2,
                                        sid = 37795,
                                        cid = 33714 --client id, to show proper item image on client sid
                                    },
                                }
                            }
                        }
                }
        },
	[3] = { ---NORTH MAIN LAND
                portals = {
                        [1] = {
                                portalItems = { -------- DONE--------
                                        {position = Position(1440, 3226, 7), id = 27716}, -- portal position and its id
                                },
                                itemsToCreate = {
                                        {id = 34308, position = Position(1440, 3225, 7)},
                                        {id = 34308, position = Position(1440, 3227, 7)},					-- used for the flames, you can specify all details here
                                },
                                text = {msg = "Forgotten Labs", position = Position(1440, 3226, 7), delay = 1},
                        }

                },
                dungeonPositions = { -- as many as you like.
                        {position = Position(4198, 4120, 6), bossPosition = Position(4157, 4072, 6), bossName = "Doctor Pomelo",
                         dungeonExtraData = {
                             background = "3",
                             missionName = "Forgotten Labs", missionObjectives = "Find and kill Doctor Pomelo.", difficulty = "Medium",
                             level = 40, reqPlayers = "2+", coins = 65, fame = 65, exp = 7000, reqItems = {
                                     [1] = {
                                        reqCnt = 2,
                                        sid = 37795,
                                        cid = 33714 --client id, to show proper item image on client sid
                                    },
                                }
                            }
                        }
                }
        },
		
		[4] = { ---NORTH MAIN LAND
                portals = {
                        [1] = {
                                portalItems = { -------- DONE--------
                                        {position = Position(3128, 4611, 7), id = 27716}, -- portal position and its id
                                },
                                itemsToCreate = {
                                        {id = 24618, position = Position(3131, 4610, 4)},
                                        {id = 24618, position = Position(3131, 4613, 4)},					-- used for the flames, you can specify all details here
                                },
                                text = {msg = "The Aquarium", position = Position(3128, 4611, 7), delay = 1},
                        }

                },
                dungeonPositions = { -- as many as you like.
                        {position = Position(4505, 4186, 5), bossPosition = Position(4463, 4177, 4), bossName = "Lady Undine",
                         dungeonExtraData = {
                             background = "4",
                             missionName = "The Aquarium", missionObjectives = "Find and kill Lady Undine.", difficulty = "Medium",
                             level = 90, reqPlayers = "3+", coins = 5, fame = 100, exp = 35000, reqItems = {
                                     [1] = {
                                        reqCnt = 4,
                                        sid = 37793,
                                        cid = 33712 --client id, to show proper item image on client sid
                                    },
                                }
                            }
                        }
                }
        },
		
		[5] = { ---NORTH MAIN LAND
                portals = {
                        [1] = {
                                portalItems = { -------- DONE--------
                                        {position = Position(2098, 3445, 5), id = 27716}, -- portal position and its id
                                },
                                itemsToCreate = {
                                       -- {id = 34308, position = Position(2035, 3363, 5)},
                                      --  {id = 34308, position = Position(2035, 3365, 5)},					-- used for the flames, you can specify all details here
                                },
                                text = {msg = "Garona's Nightmare", position = Position(2098, 3445, 5), delay = 1},
                        }

                },
                dungeonPositions = { -- as many as you like.
                        {position = Position(3444, 5466, 5), bossPosition = Position(3427, 5510, 7), bossName = "Garona Nightmarized",
                         dungeonExtraData = {
                             background = "5",
                             missionName = "Garona Madness", missionObjectives = "Find and kill Garona Madness.", difficulty = "Medium",
                             level = 75, reqPlayers = "2+", coins = 110, fame = 120, exp = 45000, reqItems = {
                                     [1] = {
                                        reqCnt = 5,
                                        sid = 37795,
                                        cid = 33714 --client id, to show proper item image on client sid
                                    },
                                }
                            }
                        }
                }
        },
		
		[6] = { ---corrypted prison
                portals = {
                        [1] = {
                                portalItems = { -------- DONE--------
                                        {position = Position(2771, 4332, 7), id = 27716}, -- portal position and its id
                                },
                                itemsToCreate = {
                                        {id = 34308, position = Position(2771, 4330, 6)},
                                        {id = 34308, position = Position(2771, 4334, 6)},					-- used for the flames, you can specify all details here
                                },
                                text = {msg = "Blackmist Prison", position = Position(2771, 4332, 7), delay = 1},
                        }

                },
                dungeonPositions = { -- as many as you like.
                        {position = Position(3507, 3869, 5), bossPosition = Position(3478, 3794, 4), bossName = "Fordraz",
                         dungeonExtraData = {
                             background = "6",
                             missionName = "Blackmist Prison", missionObjectives = "Defeat Fordraz the jailer at the end of Blackmist Prison.", difficulty = "Medium",
                             level = 110, reqPlayers = "3-4", coins = 150, fame = 120, exp = 45000, reqItems = {
                                     [1] = {
                                        reqCnt = 2,
                                        sid = 37792,
                                        cid = 33711 --client id, to show proper item image on client sid
                                    },
                                }
                            }
                        }
                }
        },
		[7] = { ---corrypted prison
                portals = {
                        [1] = {
                                portalItems = { -------- DONE--------
                                        {position = Position(2099, 3463, 5), id = 27716}, -- portal position and its id
                                },
                                itemsToCreate = {
                                      					-- used for the flames, you can specify all details here
                                },
                                text = {msg = "Rotten Ruins", position = Position(2099, 3463, 5), delay = 1},
                        }

                },
                dungeonPositions = { -- as many as you like.
                        {position = Position(4151, 5516, 7), bossPosition = Position(4167, 5447, 6), bossName = "Lord Hamelin",
                         dungeonExtraData = {
                             background = "7",
                             missionName = "Rotten Ruins", missionObjectives = "Defeat Lord Hamelin at the Rotten ruins.", difficulty = "Medium",
                             level = 130, reqPlayers = "3-4", coins = 150, fame = 100, exp = 38000, reqItems = {
                                     [1] = {
                                        reqCnt = 4,
                                        sid = 37793,
                                        cid = 33712 --client id, to show proper item image on client sid
                                    },
                                }
                            }
                        }
                }
        },
		[8] = { ---corrypted prison
                portals = {
                        [1] = {
                                portalItems = { -------- DONE--------
                                        {position = Position(3023, 4303, 5), id = 27716}, -- portal position and its id
                                },
                                itemsToCreate = {
                                        {id = 34308, position = Position(3022, 4303, 5)},
                                        {id = 34308, position = Position(3024, 4303, 5)},					-- used for the flames, you can specify all details here
                                },
                                text = {msg = "Sandstorm Colliseum", position = Position(3023, 4303, 5), delay = 1},
                        }

                },
                dungeonPositions = { -- as many as you like.
                        {position = Position(3036, 4288, 7), bossPosition = Position(3017, 4289, 7), bossName = "Colliseum Champion Garuda",
                         dungeonExtraData = {
                             background = "8",
                             missionName = "Sandstorm Colliseum", missionObjectives = "Defeat the colliseum champion to claim victory!.", difficulty = "Medium",
                             level = 160, reqPlayers = "1+", coins = 50, fame = 100, exp = 38000, reqItems = {
                                     [1] = {
                                        reqCnt = 2,
                                        sid = 37792,
                                        cid = 33711 --client id, to show proper item image on client sid
                                    },
                                }
                            }
                        }
                }
        },
		[9] = { ---corrypted prison
                portals = {
                        [1] = {
                                portalItems = { -------- DONE--------
                                        {position = Position(2885, 4590, 8), id = 27716}, -- portal position and its id
                                },
                                itemsToCreate = {
                                        {id = 34308, position = Position(2885, 4589, 8)},
                                        {id = 34308, position = Position(2885, 4591, 8)},					-- used for the flames, you can specify all details here
                                },
                                text = {msg = "The Verdant Runehold", position = Position(2885, 4590, 8), delay = 1},
                        }

                },
                dungeonPositions = { -- as many as you like.
                        {position = Position(2892, 4590, 8), bossPosition = Position(2965, 4574, 10), bossName = "Shelleon the Eternal Guardian",
                         dungeonExtraData = {
                             background = "9",
                             missionName = "The Verdant Runehold", missionObjectives = "Enter The Verdant Runehold, an ancient and overgrown dungeon. Defeat the final boss, Shelleon the Eternal Guardian, while keeping an eye out for hidden chambers and powerful bosses. Good luck!.", difficulty = "Hard",
                             level = 100, reqPlayers = "4+", coins = 220, fame = 100, exp = 38000, reqItems = {
                                     [1] = {
                                        reqCnt = 4,
                                        sid = 37793,
                                        cid = 33712 --client id, to show proper item image on client sid
                                    },
                                }
                            }
                        }
                }
        },
		
		[10] = { ---tier 5 Desolation Keep
                portals = {
                        [1] = {
                                portalItems = { -------- DONE--------
                                        {position = Position(2643, 4731, 7), id = 27716}, -- portal position and its id
                                },
                                itemsToCreate = {
                                        {id = 34308, position = Position(2641, 4731, 5)},
                                        {id = 34308, position = Position(2646, 4731, 5)},					-- used for the flames, you can specify all details here
                                },
                                text = {msg = "Desolation Keep", position = Position(2643, 4731, 7), delay = 1},
                        }

                },
                dungeonPositions = { -- as many as you like.
                        {position = Position(2642, 4727, 7), bossPosition = Position(2643, 4713, 4), bossName = "Malgorth the Devourer",
                         dungeonExtraData = {
                             background = "10",
                             missionName = "Desolation Keep", missionObjectives = "Challenge the Desolation Keep, now consumed by darkness. Ascend through shadows, face traps and minions, and confront Malgorth the Devourer at its pinnacle. Vanquish chaos, restore light, and claim victory in this forsaken fortress.", difficulty = "Hard",
                             level = 250, reqPlayers = "4+", coins = 300, fame = 120, exp = 60000, reqItems = {
                                     [1] = {
                                        reqCnt = 4,
                                        sid = 37794,
                                        cid = 33712 --client id, to show proper item image on client sid
                                    },
                                }
                            }
                        }
                }
        },
		[11] = { ---tier 5 Ashborne Deeps
                portals = {
                        [1] = {
                                portalItems = { -------- DONE--------
                                        {position = Position(2485, 4797, 1), id = 27716}, -- portal position and its id
                                },
                                itemsToCreate = {
                                        {id = 34308, position = Position(2483, 4796, 0)},
                                        {id = 34308, position = Position(2487, 4796, 0)},					-- used for the flames, you can specify all details here
                                },
                                text = {msg = "Ashborne Deeps", position = Position(2485, 4797, 1), delay = 1},
                        }

                },
                dungeonPositions = { -- as many as you like.
                        {position = Position(4241, 4695, 3), bossPosition = Position(4234, 4713, 3), bossName = "Uzulaz",
                         dungeonExtraData = {
                             background = "11",
                             missionName = "Ashborne Deeps", missionObjectives = "Venture into the depths of Ashborne, where danger lurks at every turn. Face the ultimate challenge in the form of Uzulaz, a formidable adversary who wields the powers of flame and fury. As you journey deeper into the abyss, prepare to confront this fiery menace and prove your mettle as a true hero. Your destiny awaits in the heart of Ashborne Deeps.", difficulty = "Medium",
                             level = 250, reqPlayers = "2+", coins = 300, fame = 120, exp = 60000, reqItems = {
                                     [1] = {
                                        reqCnt = 4,
                                        sid = 37794,
                                        cid = 33712 --client id, to show proper item image on client sid
                                    },
                                }
                            }
                        }
                }
        },
		
		
		[12] = { ---t4 Frozen Heart
                portals = {
                        [1] = {
                                portalItems = { -------- DONE--------
                                        {position = Position(2128, 3445, 5), id = 27716}, -- portal position and its id
                                },
                                itemsToCreate = {
                                        {id = 34308, position = Position(2102, 3351, 5)},
                                        {id = 34308, position = Position(2102, 3353, 5)},					-- used for the flames, you can specify all details here
                                },
                                text = {msg = "Frozen Heart", position = Position(2128, 3445, 5), delay = 1},
                        }

                },
                dungeonPositions = { -- as many as you like.
                        {position = Position(3256, 3638, 6), bossPosition = Position(3326, 3494, 6), bossName = "Shawn The Dragon",
                         dungeonExtraData = {
                             background = "12",
                             missionName = "Frozen Heart", missionObjectives = "Your journey through this frost-bitten land leads you to a formidable adversary .. Shawn the Dragon, known as the Frostlord among the Vrykul.", difficulty = "Medium",
                             level = 200, reqPlayers = "2+", coins = 300, fame = 120, exp = 60000, reqItems = {
                                     [1] = {
                                        reqCnt = 5,
                                        sid = 37793,
                                        cid = 33712 --client id, to show proper item image on client sid
                                    },
                                }
                            }
                        }
                }
        },
		
		[13] = { ---t4 Santa's Workshop
                portals = {
                        [1] = {
                                portalItems = { -------- DONE--------
                                        {position = Position(2353, 4413, 5), id = 27716}, -- portal position and its id
                                },
                                itemsToCreate = {
                                        {id = 34308, position = Position(2351, 4413, 4)},
                                        {id = 34308, position = Position(2355, 4413, 4)},					-- used for the flames, you can specify all details here
                                },
                                text = {msg = "Santa's Workshop", position = Position(2353, 4413, 5), delay = 1},
                        }

                },
                dungeonPositions = { -- as many as you like.
                        {position = Position(3143, 3573, 5), bossPosition = Position(3164, 3523, 3), bossName = "Santa Claus",
                         dungeonExtraData = {
                             background = "13",
                             missionName = "Santa's Workshop", missionObjectives = "Step into the enchanting realm of Santa's Workshop, where holiday magic is woven into every corner.With a sack full of surprises and holiday cheer, Santa guards the workshop's secrets.", difficulty = "easy",
                             level = 170, reqPlayers = "1+", coins = 300, fame = 120, exp = 60000, reqItems = {
                                     [1] = {
                                        reqCnt = 5,
                                        sid = 37791,
                                        cid = 33712 --client id, to show proper item image on client sid
                                    },
                                }
                            }
                        }
                }
        },
		
		[14] = { ---Neuronal Enclave ENDGAME DREAMSOUL
                portals = {
                        [1] = {
                                portalItems = { -------- DONE--------
                                        {position = Position(2791, 3143, 7), id = 27720}, -- portal position and its id
                                },
                                itemsToCreate = {
                                        {id = 34308, position = Position(2789, 3143, 7)},
                                        {id = 34308, position = Position(2793, 3143, 7)},					-- used for the flames, you can specify all details here
                                },
                                text = {msg = "Neuronal Enclave", position = Position(2791, 3143, 7), delay = 1},
                        }

                },
                dungeonPositions = { -- as many as you like.
                        {position = Position(3661, 4053, 5), bossPosition = Position(3747, 4098, 5), bossName = "The Administrator",
                         dungeonExtraData = {
                             background = "14",
                             missionName = "Neuronal Enclave", missionObjectives = "Centuries ago, an ancient civilization harnessed the mystical energies of the DreamSoul Forest to create a hidden sanctuary known as the Neuronal Enclave. They fused the essence of nature with advanced technology, creating a living, breathing network.", difficulty = "Normal",
                             level = 400, reqPlayers = "2+", coins = 300, fame = 120, exp = 60000, reqItems = {
                                     [1] = {
                                        reqCnt = 5,
                                        sid = 37791,
                                        cid = 33712 --client id, to show proper item image on client sid
                                    },
                                }
                            }
                        }
                }
        },
		
		[15] = { ---Dread Abyss ENDGAME DREAMSOUL
                portals = {
                        [1] = {
                                portalItems = { -------- DONE--------
                                        {position = Position(2552, 3166, 7), id = 27716}, -- portal position and its id
                                },
                                itemsToCreate = {
                                        {id = 34308, position = Position(2550, 3169, 7)},
                                        {id = 34308, position = Position(2555, 3169, 7)},					-- used for the flames, you can specify all details here
                                },
                                text = {msg = "Dread Abyss", position = Position(2552, 3167, 7), delay = 1},
                        }

                },
                dungeonPositions = { -- as many as you like.
                        {position = Position(4102, 4247, 4), bossPosition = Position(3951, 4263, 4), bossName = "Zrull, The Invader",
                         dungeonExtraData = {
                             background = "15",
                             missionName = "Dread Abyss", missionObjectives = "The Dread Abyss, a rift in the DreamSoul Forest, links to a nightmarish void. Its origin, a result of ancient magic gone wrong, leaks dark energy, spawning nightmares. Adventurers brave the abyss to unravel its mysteries and suppress the encroaching darkness.", difficulty = "Normal",
                             level = 400, reqPlayers = "2+", coins = 300, fame = 120, exp = 60000, reqItems = {
                                     [1] = {
                                        reqCnt = 5,
                                        sid = 37791,
                                        cid = 33712 --client id, to show proper item image on client sid
                                    },
                                }
                            }
                        }
                }
        },
		
		[16] = { ---Emerald Palace ENDGAME DREAMSOUL
                portals = {
                        [1] = {
                                portalItems = { -------- DONE--------
                                        {position = Position(3100, 4142, 3), id = 27718}, -- portal position and its id
                                },
                                itemsToCreate = {
                                        {id = 34308, position = Position(3098, 4142, 2)},
                                        {id = 34308, position = Position(3102, 4142, 2)},					-- used for the flames, you can specify all details here
                                },
                                text = {msg = "Emerald Palace", position = Position(3100, 4142, 3), delay = 1},
                        }

                },
                dungeonPositions = { -- as many as you like.
                        {position = Position(3625, 3821, 2), bossPosition = Position(3703, 3870, 2), bossName = "Vorloth, The Emerald Blight",
                         dungeonExtraData = {
                             background = "16",
                             missionName = "Emerald Palace", missionObjectives = "This place is twisted spires reaching towards the sky like gnarled fingers of a malevolent giant. As you approach its foreboding gates, a sense of dread washes over you, chilling you to the bone.", 
							 difficulty = "Hard",
                             level = 400, reqPlayers = "5+", coins = 300, fame = 120, exp = 60000, reqItems = {
                                     [1] = {
                                        reqCnt = 5,
                                        sid = 37791,
                                        cid = 33712 --client id, to show proper item image on client sid
                                    },
                                }
                            }
                        }
                }
        },
		
		--]]
		
		
	
}

RandomDungeonSystem.eventInterval = 10 -- in seconds, 1h 3600

if not RandomDungeonSystem.spawnedPortals then
	RandomDungeonSystem.spawnedPortals = {}
end

function RandomDungeonSystem:cyclePortals()
	-- create new portals
	for index, tab in ipairs(self.dungeons) do
            local portalIndex = self:findNonUsedPortal(index)
           if portalIndex ~= -1 then
                self:spawnPortal(index, portalIndex)
                
            end
           
	end

    self.event = addEvent(self.cyclePortals, RandomDungeonSystem.eventInterval * 1000, self)
end

function RandomDungeonSystem:spawnPortal(arrayIndex, portalIndex)
    local portal = self.dungeons[arrayIndex] and self.dungeons[arrayIndex].portals[portalIndex] or nil
    if not portal then
            return false
    end

    local randomDungeonPos = self:getRandomDungeon(arrayIndex)
    if not randomDungeonPos then
            return false
    end

    local newlyCreatedPortal = {portalItems = {}, normalItems = {}}

    newlyCreatedPortal.dungeonPos = randomDungeonPos.position
    newlyCreatedPortal.dungeonData = randomDungeonPos.dungeonExtraData
    newlyCreatedPortal.text = portal.text

    for _, portalTab in ipairs(portal.portalItems) do
            local portalItem = Game.createItem(portalTab.id, 1, portalTab.position)
            if portalItem then
                    table.insert(newlyCreatedPortal.portalItems, {portalTab.id, portalTab.position})
            end
    end

    for _, item in ipairs(portal.itemsToCreate) do
            local realItem = Game.createItem(item.id, 1, item.position)
            if realItem then
                    table.insert(newlyCreatedPortal.normalItems, {item.id, item.position})
            end
    end

    -- spawn the boss
    local boss = Game.createMonster(randomDungeonPos.bossName, randomDungeonPos.bossPosition)
    if boss then
            boss:registerEvent("RandomDungeonDeath")
            newlyCreatedPortal.cid = boss:getId()
    end

    if not self.spawnedPortals[arrayIndex] then
            self.spawnedPortals[arrayIndex] = {}
    end

    self.spawnedPortals[arrayIndex][portalIndex] = newlyCreatedPortal
    self:sendMessageEvent(arrayIndex, portalIndex)
    return true
end

function RandomDungeonSystem:prepareExOpcodeMessage(player, dungeonData)
    local msgBuffer = ""
    msgBuffer = msgBuffer .. "|" .. tostring(dungeonData.missionName) .. "|" .. tostring(dungeonData.missionObjectives) .. "|" .. tostring(dungeonData.difficulty)
    msgBuffer = msgBuffer .. "|" .. tostring(dungeonData.level) .. "|" .. tostring(dungeonData.reqPlayers)
    msgBuffer = msgBuffer .. "|" .. tostring(dungeonData.coins) .. "|" .. tostring(dungeonData.fame) .. "|" .. tostring(dungeonData.exp) .. "|"
    if dungeonData.reqItems and #dungeonData.reqItems > 0 then --required items cnt
        for j = 1, #dungeonData.reqItems do
            msgBuffer = msgBuffer .. tostring(dungeonData.reqItems[j].cid) .. ":"
            local itemCnt = player:getItemCount(dungeonData.reqItems[j].sid)
            msgBuffer = msgBuffer .. tostring(itemCnt) .. "/" .. tostring(dungeonData.reqItems[j].reqCnt) .. ":"
        end
    end
    msgBuffer = msgBuffer .. "|" .. tostring(dungeonData.background) .. "|"
    return msgBuffer
end

function RandomDungeonSystem:findDungeonByPortalPosition(portalPosition)
    for arrayIndex, portals in pairs(self.spawnedPortals) do
        for spawnedIndex, spawnedPortal in pairs(portals) do
            if spawnedPortal.portalItems[1][2] == portalPosition then
                return spawnedPortal
            end
        end
    end
    return nil
end

function RandomDungeonSystem:getRandomDungeon(index)
        local randDung = self.dungeons[index].dungeonPositions[1]
        if self:findUsedDugeonByPos(index, randDung.position) == nil then
            return randDung
        else
            return nil
        end
end

function RandomDungeonSystem:findUsedDugeonByPos(index, position)
	if not self.spawnedPortals[index] then
		return nil
	end
	
	for _, activePortal in pairs(self.spawnedPortals[index]) do
		if activePortal.dungeonPos == position then
			return activePortal
		end
	end
	return nil
end

function RandomDungeonSystem:findNonUsedPortal(arrayIndex)
        local randIndex = 1
        local exist = self.spawnedPortals[arrayIndex] and self.spawnedPortals[arrayIndex][randIndex] or false
        if exist then
            return -1
        else
            return randIndex
        end
end



function RandomDungeonSystem:handleDeath(creature, player)
	-- close the portal monster is in.
	local cid = creature:getId()
	for arrayIndex, portals in pairs(self.spawnedPortals) do
		for spawnedIndex, spawnedPortal in pairs(portals) do
			if spawnedPortal.cid == cid then
				-- we found it!
				self:deactivatePortal(arrayIndex, spawnedIndex)
				 local killers = {}
					for uid, info in pairs(creature:getDamageMap()) do
						local player = Player(uid)
						if player then
							killers[#killers +1] = player
						end
					end
					
				
					for k, member in pairs(killers) do
				
									member:addExperience(spawnedPortal.dungeonData.exp, true)
                                    member:addItem(2148, spawnedPortal.dungeonData.coins)
                                    FameSystem:addPoints(member, spawnedPortal.dungeonData.fame)
                                    Game.sendAnimatedText('+ Fame Points!', member:getPosition(), TEXTCOLOR_ORANGE)
					end    
								
				return true
			end
		end
	end
	return true
end

function RandomDungeonSystem:deactivatePortal(index, portalIndex)
	local activePortalTab = self.spawnedPortals[index] and self.spawnedPortals[index][portalIndex] or nil
	if not activePortalTab then
		return false
	end

	-- remove portals
	for _, portalItem in ipairs(activePortalTab.portalItems) do
		local tile = Tile(portalItem[2])
		if tile then
			local tileItem = tile:getItemById(portalItem[1])
			if tileItem then
				tileItem:remove()
				portalItem[2]:sendMagicEffect(CONST_ME_POFF)
			end
		end
	end

	-- remove spawned items
	for _, normalItem in ipairs(activePortalTab.normalItems) do
		local tile = Tile(normalItem[2])
		if tile then
			local tileItem = tile:getItemById(normalItem[1])
			if tileItem then
				tileItem:remove()
				normalItem[2]:sendMagicEffect(CONST_ME_POFF)
			end
		end
	end

	-- remove the entry
	self.spawnedPortals[index][portalIndex] = nil
	return true
end

function RandomDungeonSystem:sendMessageEvent(index, portalIndex)
	local activePortalTab = self.spawnedPortals[index] and self.spawnedPortals[index][portalIndex] or nil
	if not activePortalTab then
		return false
	end

	local monster = Creature(activePortalTab.cid)
	if monster then
		--monster:say(activePortalTab.text.msg, TALKTYPE_MONSTER_SAY, false, nil, activePortalTab.text.position)
		Game.sendAnimatedText(activePortalTab.text.msg, activePortalTab.text.position, TEXTCOLOR_RED)
		--pos, TEXTCOLOR_YELLOW
	end

	addEvent(self.sendMessageEvent, activePortalTab.text.delay * 1000, self, index, portalIndex)
end

if not RandomDungeonSystem.event then
	RandomDungeonSystem.event = addEvent(RandomDungeonSystem.cyclePortals, RandomDungeonSystem.eventInterval * 1000, RandomDungeonSystem)
end
