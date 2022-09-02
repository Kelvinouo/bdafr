-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__QueueType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata");
local l__EventCurrencyType__5 = v4.EventCurrencyType;
local l__EventShopItem__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-shop", "event-shop-item").EventShopItem;
return {
	EventMeta = {
		[v4.EventType.PIRATE_EVENT_2022] = {
			name = "Pirate Event 2022", 
			active = true, 
			currencies = { l__EventCurrencyType__5.DOUBLOONS }, 
			startDate = 1661616000, 
			endDate = 1663365600, 
			collectionTag = "EventNPC", 
			shops = { {
					name = "Pirate Event Shop", 
					items = { l__EventShopItem__6.PIRATE_TITLE_1, l__EventShopItem__6.PIRATE_TITLE_2, l__EventShopItem__6.PIRATE_TITLE_3, l__EventShopItem__6.PIRATE_EMOTE_1, l__EventShopItem__6.PIRATE_EMOTE_2, l__EventShopItem__6.PIRATE_EMOTE_3, l__EventShopItem__6.PIRATE_EMOTE_4, l__EventShopItem__6.PIRATE_EMOTE_5, l__EventShopItem__6.PIRATE_EMOTE_6, l__EventShopItem__6.PIRATE_EMOTE_7, l__EventShopItem__6.PIRATE_EMOTE_8, l__EventShopItem__6.PIRATE_EMOTE_9, l__EventShopItem__6.PIRATE_ANIMATED_EMOTE_1, l__EventShopItem__6.PIRATE_ANIMATED_EMOTE_2, l__EventShopItem__6.PIRATE_ATTACK_KILL_EFFECT, l__EventShopItem__6.PIRATE_LOBBY_GADGET_1, l__EventShopItem__6.PIRATE_DAVEY_GHOST_SKIN }
				} }, 
			missions = { {
					id = "1", 
					name = "Play 6 games of TNT Wars", 
					stages = { {
							type = "GamePlay", 
							progress = 6, 
							queueType = l__QueueType__2.TNT_WARS
						} }, 
					rewardAmount = 2000, 
					reward = l__EventCurrencyType__5.DOUBLOONS
				}, {
					id = "2", 
					name = "Win 2 games of TNT Wars", 
					stages = { {
							type = "GameWin", 
							progress = 2, 
							queueType = l__QueueType__2.TNT_WARS
						} }, 
					rewardAmount = 2000, 
					reward = l__EventCurrencyType__5.DOUBLOONS
				}, {
					id = "3", 
					name = "Kill 8 players in TNT Wars", 
					stages = { {
							type = "PlayerKill", 
							progress = 8, 
							queueType = l__QueueType__2.TNT_WARS
						} }, 
					rewardAmount = 2000, 
					reward = l__EventCurrencyType__5.DOUBLOONS
				}, {
					id = "4", 
					name = "Explode 3000 blocks in TNT Wars", 
					stages = { {
							type = "ExplodeBlockBreak", 
							progress = 3000, 
							queueType = l__QueueType__2.TNT_WARS
						} }, 
					rewardAmount = 2000, 
					reward = l__EventCurrencyType__5.DOUBLOONS
				}, {
					id = "5", 
					name = "Spend 20 Emeralds in TNT Wars", 
					stages = { {
							type = "SpendResource", 
							progress = 20, 
							resource = l__ItemType__3.EMERALD, 
							queueType = l__QueueType__2.TNT_WARS
						} }, 
					rewardAmount = 1000, 
					reward = l__EventCurrencyType__5.DOUBLOONS
				}, {
					id = "6", 
					name = "Purchase Auto Cannon 4 Times", 
					stages = { {
							type = "ShopPurchase", 
							progress = 4, 
							resource = l__ItemType__3.AUTO_CANNON, 
							queueType = l__QueueType__2.TNT_WARS
						} }, 
					rewardAmount = 1000, 
					reward = l__EventCurrencyType__5.DOUBLOONS
				}, {
					id = "7", 
					name = "Purchase Spread Cannon 4 Times", 
					stages = { {
							type = "ShopPurchase", 
							progress = 4, 
							resource = l__ItemType__3.SPREAD_CANNON, 
							queueType = l__QueueType__2.TNT_WARS
						} }, 
					rewardAmount = 1000, 
					reward = l__EventCurrencyType__5.DOUBLOONS
				}, {
					id = "8", 
					name = "Play 15 matches", 
					stages = { {
							type = "GamePlay", 
							progress = 15
						} }, 
					rewardAmount = 3000, 
					reward = l__EventCurrencyType__5.DOUBLOONS
				}, {
					id = "9", 
					name = "Deal 10,000 damage to other players", 
					stages = { {
							type = "PlayerDamage", 
							progress = 10000
						} }, 
					rewardAmount = 5000, 
					reward = l__EventCurrencyType__5.DOUBLOONS
				}, {
					id = "10", 
					name = "Kill 30 other players", 
					stages = { {
							type = "PlayerKill", 
							progress = 30
						} }, 
					rewardAmount = 3000, 
					reward = l__EventCurrencyType__5.DOUBLOONS
				}, {
					id = "11", 
					name = "Win 20 Games", 
					stages = { {
							type = "GameWin", 
							progress = 20
						} }, 
					rewardAmount = 5000, 
					reward = l__EventCurrencyType__5.DOUBLOONS
				}, {
					id = "12", 
					name = "Earn 21,600 points from time spent playing games", 
					stages = { {
							type = "GamePlayTime", 
							progress = 21600
						} }, 
					rewardAmount = 10000, 
					reward = l__EventCurrencyType__5.DOUBLOONS
				} }
		}
	}
};
