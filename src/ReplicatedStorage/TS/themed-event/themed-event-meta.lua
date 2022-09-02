-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ReplicatedStorage__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).ReplicatedStorage;
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "themed-event", "themed-event-types");
local l__EasterCollectableType__4 = v3.EasterCollectableType;
local l__ThemedEventType__5 = v3.ThemedEventType;
return {
	ThemedEventMeta = {
		[l__ThemedEventType__5.EASTER_2022] = {
			name = "\240\159\165\154\240\159\144\176 EASTER EGG EVENT", 
			description = "Easter eggs have appeared in all BedWars queues! Collect easter eggs to unlock unique rewards in this limited time event.", 
			endTime = 1650639600, 
			type = l__ThemedEventType__5.EASTER_2022, 
			active = false, 
			quests = { {
					name = "Collect \240\159\165\154 Easter Eggs (Pt. 1)", 
					collectReqs = {
						[l__EasterCollectableType__4.EASTER_EGG] = 20
					}, 
					badgeReward = {
						name = "Easter Egg Hunt 2022", 
						badgeId = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "badge").Badges.EASTER_EGG_HUNT_2022
					}
				}, {
					name = "Collect \240\159\165\154 Easter Eggs (Pt. 2)", 
					collectReqs = {
						[l__EasterCollectableType__4.EASTER_EGG] = 50
					}, 
					lockerRewards = {
						titles = { v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType.EASTER_EVENT_2022 }
					}
				}, {
					name = "Collect \240\159\165\154 Easter Eggs (Pt. 3)", 
					collectReqs = {
						[l__EasterCollectableType__4.EASTER_EGG] = 100
					}, 
					lockerRewards = {
						emotes = { v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType.EASTER_BUNNY }
					}
				} }, 
			collectables = { l__EasterCollectableType__4.EASTER_EGG }
		}
	}, 
	ThemedEventCollectableMeta = {
		[l__EasterCollectableType__4.EASTER_EGG] = {
			name = "Easter Egg", 
			models = { l__ReplicatedStorage__2:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("Easter"):WaitForChild("EggBasket"), l__ReplicatedStorage__2:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("Easter"):WaitForChild("EggFlower"), l__ReplicatedStorage__2:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("Easter"):WaitForChild("EggMonster"), l__ReplicatedStorage__2:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("Easter"):WaitForChild("EggTophat") }, 
			spawnCooldown = 60, 
			amountPerSpawn = 4, 
			spawnIterations = 15, 
			maxCollectAmount = 100, 
			despawnTime = 1200
		}
	}
};
