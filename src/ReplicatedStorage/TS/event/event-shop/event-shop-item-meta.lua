-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ProdAnimations__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "definitions", "prod-animations").ProdAnimations;
local l__BedwarsKitSkin__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local l__BedwarsKitSkinMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local l__EmoteMeta__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local l__EmoteType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local l__KillEffectMeta__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-meta").KillEffectMeta;
local l__KillEffectType__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType;
local l__LobbyGadgetMeta__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-meta").LobbyGadgetMeta;
local l__LobbyGadgetType__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType;
local l__TitleMeta__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta").TitleMeta;
local l__TitleType__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType;
local l__EventCurrencyType__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventCurrencyType;
local l__EventShopItem__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-shop", "event-shop-item").EventShopItem;
return {
	EventShopItemMeta = {
		[l__EventShopItem__14.PIRATE_TITLE_1] = {
			name = l__TitleMeta__11[l__TitleType__12.ARRGH].text .. " Title", 
			textImage = l__TitleMeta__11[l__TitleType__12.ARRGH].text, 
			price = 1000, 
			currency = l__EventCurrencyType__13.DOUBLOONS, 
			items = {
				titles = { l__TitleType__12.ARRGH }
			}
		}, 
		[l__EventShopItem__14.PIRATE_TITLE_2] = {
			name = l__TitleMeta__11[l__TitleType__12.PIRATE].text .. " Title", 
			textImage = l__TitleMeta__11[l__TitleType__12.PIRATE].text, 
			price = 2000, 
			currency = l__EventCurrencyType__13.DOUBLOONS, 
			items = {
				titles = { l__TitleType__12.PIRATE }
			}
		}, 
		[l__EventShopItem__14.PIRATE_TITLE_3] = {
			name = l__TitleMeta__11[l__TitleType__12.CAPTAIN].text .. " Title", 
			textImage = l__TitleMeta__11[l__TitleType__12.CAPTAIN].text, 
			price = 7000, 
			currency = l__EventCurrencyType__13.DOUBLOONS, 
			items = {
				titles = { l__TitleType__12.CAPTAIN }
			}
		}, 
		[l__EventShopItem__14.PIRATE_TITLE_4] = {
			name = l__TitleMeta__11[l__TitleType__12.QUARTERMASTER].text .. " Title", 
			textImage = l__TitleMeta__11[l__TitleType__12.QUARTERMASTER].text, 
			price = 5000, 
			currency = l__EventCurrencyType__13.DOUBLOONS, 
			items = {
				titles = { l__TitleType__12.QUARTERMASTER }
			}
		}, 
		[l__EventShopItem__14.PIRATE_TITLE_5] = {
			name = l__TitleMeta__11[l__TitleType__12.FIRST_MATE].text .. " Title", 
			textImage = l__TitleMeta__11[l__TitleType__12.FIRST_MATE].text, 
			price = 5000, 
			currency = l__EventCurrencyType__13.DOUBLOONS, 
			items = {
				titles = { l__TitleType__12.FIRST_MATE }
			}
		}, 
		[l__EventShopItem__14.PIRATE_TITLE_6] = {
			name = l__TitleMeta__11[l__TitleType__12.SAILOR].text .. " Title", 
			textImage = l__TitleMeta__11[l__TitleType__12.SAILOR].text, 
			price = 2500, 
			currency = l__EventCurrencyType__13.DOUBLOONS, 
			items = {
				titles = { l__TitleType__12.SAILOR }
			}
		}, 
		[l__EventShopItem__14.PIRATE_ATTACK_KILL_EFFECT] = {
			name = "Pirate Attack Kill Effect", 
			image = l__KillEffectMeta__7[l__KillEffectType__8.PIRATE_SHIP_ATTACK].image, 
			price = 10000, 
			currency = l__EventCurrencyType__13.DOUBLOONS, 
			items = {
				killEffects = { l__KillEffectType__8.PIRATE_SHIP_ATTACK }
			}
		}, 
		[l__EventShopItem__14.PIRATE_GHOST_KILL_EFFECT] = {
			name = "Pirate Ghost Kill Effect", 
			image = l__KillEffectMeta__7[l__KillEffectType__8.GHOST].image, 
			price = 13337, 
			currency = l__EventCurrencyType__13.DOUBLOONS, 
			items = {
				killEffects = { l__KillEffectType__8.GHOST }
			}
		}, 
		[l__EventShopItem__14.PIRATE_EMOTE_1] = {
			name = l__EmoteMeta__5[l__EmoteType__6.HANNAH_GHOST_MOMENT].name .. " Emote", 
			image = l__EmoteMeta__5[l__EmoteType__6.HANNAH_GHOST_MOMENT].image, 
			price = 2000, 
			currency = l__EventCurrencyType__13.DOUBLOONS, 
			items = {
				emotes = { l__EmoteType__6.HANNAH_GHOST_MOMENT }
			}
		}, 
		[l__EventShopItem__14.PIRATE_EMOTE_2] = {
			name = l__EmoteMeta__5[l__EmoteType__6.HANNAH_SORRY_NOT].name .. " Emote", 
			image = l__EmoteMeta__5[l__EmoteType__6.HANNAH_SORRY_NOT].image, 
			price = 2000, 
			currency = l__EventCurrencyType__13.DOUBLOONS, 
			items = {
				emotes = { l__EmoteType__6.HANNAH_SORRY_NOT }
			}
		}, 
		[l__EventShopItem__14.PIRATE_EMOTE_3] = {
			name = l__EmoteMeta__5[l__EmoteType__6.SMOKE_AGAIN].name .. " Emote", 
			image = l__EmoteMeta__5[l__EmoteType__6.SMOKE_AGAIN].image, 
			price = 2000, 
			currency = l__EventCurrencyType__13.DOUBLOONS, 
			items = {
				emotes = { l__EmoteType__6.SMOKE_AGAIN }
			}
		}, 
		[l__EventShopItem__14.PIRATE_EMOTE_4] = {
			name = l__EmoteMeta__5[l__EmoteType__6.ZEPHYR_BEGONE].name .. " Emote", 
			image = l__EmoteMeta__5[l__EmoteType__6.ZEPHYR_BEGONE].image, 
			price = 2000, 
			currency = l__EventCurrencyType__13.DOUBLOONS, 
			items = {
				emotes = { l__EmoteType__6.ZEPHYR_BEGONE }
			}
		}, 
		[l__EventShopItem__14.PIRATE_EMOTE_5] = {
			name = l__EmoteMeta__5[l__EmoteType__6.ZEPHYR_GOING_FAST].name .. " Emote", 
			image = l__EmoteMeta__5[l__EmoteType__6.ZEPHYR_GOING_FAST].image, 
			price = 2000, 
			currency = l__EventCurrencyType__13.DOUBLOONS, 
			items = {
				emotes = { l__EmoteType__6.ZEPHYR_GOING_FAST }
			}
		}, 
		[l__EventShopItem__14.PIRATE_EMOTE_6] = {
			name = l__EmoteMeta__5[l__EmoteType__6.HANNAH_FIRED_UP].name .. " Emote", 
			image = l__EmoteMeta__5[l__EmoteType__6.HANNAH_FIRED_UP].image, 
			price = 4000, 
			currency = l__EventCurrencyType__13.DOUBLOONS, 
			items = {
				emotes = { l__EmoteType__6.HANNAH_FIRED_UP }
			}
		}, 
		[l__EventShopItem__14.PIRATE_EMOTE_7] = {
			name = l__EmoteMeta__5[l__EmoteType__6.HANNAH_FEAR].name .. " Emote", 
			image = l__EmoteMeta__5[l__EmoteType__6.HANNAH_FEAR].image, 
			price = 2000, 
			currency = l__EventCurrencyType__13.DOUBLOONS, 
			items = {
				emotes = { l__EmoteType__6.HANNAH_FEAR }
			}
		}, 
		[l__EventShopItem__14.PIRATE_EMOTE_8] = {
			name = l__EmoteMeta__5[l__EmoteType__6.SMOKE_DUDE].name .. " Emote", 
			image = l__EmoteMeta__5[l__EmoteType__6.SMOKE_DUDE].image, 
			price = 4000, 
			currency = l__EventCurrencyType__13.DOUBLOONS, 
			items = {
				emotes = { l__EmoteType__6.SMOKE_DUDE }
			}
		}, 
		[l__EventShopItem__14.PIRATE_EMOTE_9] = {
			name = l__EmoteMeta__5[l__EmoteType__6.GHOST_DAVEY].name .. " Emote", 
			image = l__EmoteMeta__5[l__EmoteType__6.GHOST_DAVEY].image, 
			price = 4000, 
			currency = l__EventCurrencyType__13.DOUBLOONS, 
			items = {
				emotes = { l__EmoteType__6.GHOST_DAVEY }
			}
		}, 
		[l__EventShopItem__14.PIRATE_ANIMATED_EMOTE_1] = {
			name = l__EmoteMeta__5[l__EmoteType__6.SEARCHING_FAR_AWAY].name .. " Emote", 
			animation = l__ProdAnimations__2[l__EmoteMeta__5[l__EmoteType__6.SEARCHING_FAR_AWAY].animation.type], 
			price = 5000, 
			currency = l__EventCurrencyType__13.DOUBLOONS, 
			items = {
				emotes = { l__EmoteType__6.SEARCHING_FAR_AWAY }
			}
		}, 
		[l__EventShopItem__14.PIRATE_ANIMATED_EMOTE_2] = {
			name = l__EmoteMeta__5[l__EmoteType__6.PIRATES_GOODBYE].name .. " Emote", 
			animation = l__ProdAnimations__2[l__EmoteMeta__5[l__EmoteType__6.PIRATES_GOODBYE].animation.type], 
			price = 5000, 
			currency = l__EventCurrencyType__13.DOUBLOONS, 
			items = {
				emotes = { l__EmoteType__6.PIRATES_GOODBYE }
			}
		}, 
		[l__EventShopItem__14.PIRATE_ANIMATED_EMOTE_3] = {
			name = l__EmoteMeta__5[l__EmoteType__6.COIN_TOSS].name .. " Emote", 
			animation = l__ProdAnimations__2[l__EmoteMeta__5[l__EmoteType__6.COIN_TOSS].animation.type], 
			price = 10000, 
			currency = l__EventCurrencyType__13.DOUBLOONS, 
			items = {
				emotes = { l__EmoteType__6.COIN_TOSS }
			}
		}, 
		[l__EventShopItem__14.PIRATE_DAVEY_GHOST_SKIN] = {
			name = l__BedwarsKitSkinMeta__4[l__BedwarsKitSkin__3.DAVEY_GHOST].name .. " Kit Skin", 
			image = l__BedwarsKitSkinMeta__4[l__BedwarsKitSkin__3.DAVEY_GHOST].renderImage, 
			price = 10000, 
			currency = l__EventCurrencyType__13.DOUBLOONS, 
			items = {
				kitSkins = { l__BedwarsKitSkin__3.DAVEY_GHOST }
			}
		}, 
		[l__EventShopItem__14.PIRATE_LOBBY_GADGET_1] = {
			name = l__LobbyGadgetMeta__9[l__LobbyGadgetType__10.BLUNDERBUSS].name .. " Lobby Gadget", 
			image = l__LobbyGadgetMeta__9[l__LobbyGadgetType__10.BLUNDERBUSS].image, 
			price = 7000, 
			currency = l__EventCurrencyType__13.DOUBLOONS, 
			items = {
				lobbyGadgets = { l__LobbyGadgetType__10.BLUNDERBUSS }
			}
		}
	}
};
