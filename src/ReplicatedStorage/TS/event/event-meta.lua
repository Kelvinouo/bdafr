-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__QueueType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local l__BedwarsShopCategory__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory;
local l__ItemType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata");
local l__EventCurrencyType__6 = v5.EventCurrencyType;
local l__EventShopItem__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-shop", "event-shop-item").EventShopItem;
return {
	EventMeta = {
		[v5.EventType.PIRATE_EVENT_2022] = {
			name = "Pirate Event 2022", 
			active = false, 
			currencies = { l__EventCurrencyType__6.DOUBLOONS }, 
			startDate = 1661616000, 
			endDate = 1663365600, 
			collectionTag = "EventNPC", 
			shops = { {
					name = "Pirate Event Shop", 
					items = { l__EventShopItem__7.PIRATE_TITLE_1, l__EventShopItem__7.PIRATE_TITLE_2, l__EventShopItem__7.PIRATE_TITLE_3, l__EventShopItem__7.PIRATE_TITLE_4, l__EventShopItem__7.PIRATE_TITLE_5, l__EventShopItem__7.PIRATE_TITLE_6, l__EventShopItem__7.PIRATE_EMOTE_1, l__EventShopItem__7.PIRATE_EMOTE_2, l__EventShopItem__7.PIRATE_EMOTE_3, l__EventShopItem__7.PIRATE_EMOTE_4, l__EventShopItem__7.PIRATE_EMOTE_5, l__EventShopItem__7.PIRATE_EMOTE_6, l__EventShopItem__7.PIRATE_EMOTE_7, l__EventShopItem__7.PIRATE_EMOTE_8, l__EventShopItem__7.PIRATE_EMOTE_9, l__EventShopItem__7.PIRATE_ANIMATED_EMOTE_1, l__EventShopItem__7.PIRATE_ANIMATED_EMOTE_2, l__EventShopItem__7.PIRATE_ANIMATED_EMOTE_3, l__EventShopItem__7.PIRATE_GHOST_KILL_EFFECT, l__EventShopItem__7.PIRATE_ATTACK_KILL_EFFECT, l__EventShopItem__7.PIRATE_LOBBY_GADGET_1, l__EventShopItem__7.PIRATE_DAVEY_GHOST_SKIN }
				} }, 
			missionGenerators = { {
					id = "daily", 
					name = "Daily", 
					selectAmount = 2, 
					resetTime = {
						firstResetTime = 1661551200, 
						intervalSeconds = 86400
					}, 
					layoutOrder = 1, 
					pool = { {
							metaId = "1", 
							name = "Play 2 games of TNT Wars", 
							stages = { {
									type = "GamePlay", 
									progress = 2, 
									queueType = l__QueueType__2.TNT_WARS
								} }, 
							rewardAmount = 1000, 
							reward = l__EventCurrencyType__6.DOUBLOONS
						}, {
							metaId = "2", 
							name = "Win 1 games of TNT Wars", 
							stages = { {
									type = "GameWin", 
									progress = 1, 
									queueType = l__QueueType__2.TNT_WARS
								} }, 
							rewardAmount = 1000, 
							reward = l__EventCurrencyType__6.DOUBLOONS
						}, {
							metaId = "3", 
							name = "Kill 1 players in TNT Wars", 
							stages = { {
									type = "PlayerKill", 
									progress = 1, 
									queueType = l__QueueType__2.TNT_WARS
								} }, 
							rewardAmount = 1000, 
							reward = l__EventCurrencyType__6.DOUBLOONS
						}, {
							metaId = "4", 
							name = "Explode 2000 blocks in TNT Wars", 
							stages = { {
									type = "ExplodeBlockBreak", 
									progress = 2000, 
									queueType = l__QueueType__2.TNT_WARS
								} }, 
							rewardAmount = 1000, 
							reward = l__EventCurrencyType__6.DOUBLOONS
						}, {
							metaId = "5", 
							name = "Spend 14 Emeralds in TNT Wars", 
							stages = { {
									type = "SpendResource", 
									progress = 14, 
									resource = l__ItemType__4.EMERALD, 
									queueType = l__QueueType__2.TNT_WARS
								} }, 
							rewardAmount = 1000, 
							reward = l__EventCurrencyType__6.DOUBLOONS
						}, {
							metaId = "6", 
							name = "Purchase Auto Cannon 3 Times", 
							stages = { {
									type = "ShopPurchase", 
									progress = 3, 
									resource = l__ItemType__4.AUTO_CANNON, 
									queueType = l__QueueType__2.TNT_WARS
								} }, 
							rewardAmount = 1000, 
							reward = l__EventCurrencyType__6.DOUBLOONS
						}, {
							metaId = "7", 
							name = "Purchase Spread Cannon 2 Times", 
							stages = { {
									type = "ShopPurchase", 
									progress = 2, 
									resource = l__ItemType__4.SPREAD_CANNON, 
									queueType = l__QueueType__2.TNT_WARS
								} }, 
							rewardAmount = 1000, 
							reward = l__EventCurrencyType__6.DOUBLOONS
						}, {
							metaId = "8", 
							name = "Break 2 Beds", 
							stages = { {
									type = "BedBreak", 
									progress = 2
								} }, 
							rewardAmount = 1000, 
							reward = l__EventCurrencyType__6.DOUBLOONS
						}, {
							metaId = "9", 
							name = "Perform 2 finals kills", 
							stages = { {
									type = "FinalKill", 
									progress = 2
								} }, 
							rewardAmount = 1000, 
							reward = l__EventCurrencyType__6.DOUBLOONS
						}, {
							metaId = "10", 
							name = "Deal 1,000 damage to other players", 
							stages = { {
									type = "PlayerDamage", 
									progress = 1000
								} }, 
							rewardAmount = 1000, 
							reward = l__EventCurrencyType__6.DOUBLOONS
						}, {
							metaId = "11", 
							name = "Kill 4 other players", 
							stages = { {
									type = "PlayerKill", 
									progress = 4
								} }, 
							rewardAmount = 1000, 
							reward = l__EventCurrencyType__6.DOUBLOONS
						}, {
							metaId = "13", 
							name = "Purchase 1 Item in the Armory", 
							stages = { {
									type = "ShopPurchaseInCategory", 
									progress = 1, 
									category = l__BedwarsShopCategory__3.Armory
								} }, 
							rewardAmount = 1000, 
							reward = l__EventCurrencyType__6.DOUBLOONS
						}, {
							metaId = "14", 
							name = "Unlock Armory Team Upgrade", 
							stages = { {
									type = "PurchaseTeamUpgrade", 
									progress = 1
								} }, 
							rewardAmount = 1000, 
							reward = l__EventCurrencyType__6.DOUBLOONS
						}, {
							metaId = "15", 
							name = "Purchase 1 Item in the Pirate Category", 
							stages = { {
									type = "ShopPurchaseInCategory", 
									progress = 1, 
									category = l__BedwarsShopCategory__3.Pirate
								} }, 
							rewardAmount = 1000, 
							reward = l__EventCurrencyType__6.DOUBLOONS
						} }
				}, {
					id = "weekly", 
					name = "Weekly", 
					selectAmount = 3, 
					resetTime = {
						firstResetTime = 1661551200, 
						intervalSeconds = 604800
					}, 
					layoutOrder = 2, 
					pool = { {
							metaId = "1", 
							name = "Play 15 Games", 
							stages = { {
									type = "GamePlay", 
									progress = 15
								} }, 
							rewardAmount = 4000, 
							reward = l__EventCurrencyType__6.DOUBLOONS
						}, {
							metaId = "2", 
							name = "Spend 70 Diamonds", 
							stages = { {
									type = "SpendResource", 
									progress = 70, 
									resource = l__ItemType__4.DIAMOND
								} }, 
							rewardAmount = 4000, 
							reward = l__EventCurrencyType__6.DOUBLOONS
						}, {
							metaId = "3", 
							name = "Break 8 Beds", 
							stages = { {
									type = "BedBreak", 
									progress = 8
								} }, 
							rewardAmount = 4000, 
							reward = l__EventCurrencyType__6.DOUBLOONS
						}, {
							metaId = "4", 
							name = "Perform 15 finals kills", 
							stages = { {
									type = "FinalKill", 
									progress = 15
								} }, 
							rewardAmount = 4000, 
							reward = l__EventCurrencyType__6.DOUBLOONS
						}, {
							metaId = "5", 
							name = "Deal 12,000 damage to other players", 
							stages = { {
									type = "PlayerDamage", 
									progress = 12000
								} }, 
							rewardAmount = 4000, 
							reward = l__EventCurrencyType__6.DOUBLOONS
						}, {
							metaId = "6", 
							name = "Kill 40 other players", 
							stages = { {
									type = "PlayerKill", 
									progress = 40
								} }, 
							rewardAmount = 4000, 
							reward = l__EventCurrencyType__6.DOUBLOONS
						}, {
							metaId = "7", 
							name = "Win 12 Games", 
							stages = { {
									type = "GameWin", 
									progress = 12
								} }, 
							rewardAmount = 4000, 
							reward = l__EventCurrencyType__6.DOUBLOONS
						}, {
							metaId = "8", 
							name = "Earn 21,600 points from time spent playing games", 
							stages = { {
									type = "GamePlayTime", 
									progress = 21600
								} }, 
							rewardAmount = 5000, 
							reward = l__EventCurrencyType__6.DOUBLOONS
						}, {
							metaId = "9", 
							name = "Spend 80 Emeralds", 
							stages = { {
									type = "SpendResource", 
									progress = 80, 
									resource = l__ItemType__4.EMERALD
								} }, 
							rewardAmount = 4000, 
							reward = l__EventCurrencyType__6.DOUBLOONS
						} }
				} }
		}
	}
};
