-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ProdAnimations__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "definitions", "prod-animations").ProdAnimations;
local l__getEmoteAsset__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "emote", "emote-assets").getEmoteAsset;
local l__BedwarsKitSkin__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local l__BedwarsKitSkinMeta__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local l__EmoteMeta__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local l__EmoteType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local l__LobbyGadgetMeta__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-meta").LobbyGadgetMeta;
local l__LobbyGadgetType__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType;
local l__TitleMeta__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta").TitleMeta;
local l__TitleType__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType;
local l__EventCurrencyType__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventCurrencyType;
local l__EventShopItem__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-shop", "event-shop-item").EventShopItem;
return {
	EventShopItemMeta = {
		[l__EventShopItem__13.PIRATE_TITLE_1] = {
			name = l__TitleMeta__10[l__TitleType__11.ARRGH].text .. " Title", 
			textImage = l__TitleMeta__10[l__TitleType__11.ARRGH].text, 
			price = 1000, 
			currency = l__EventCurrencyType__12.DOUBLOONS, 
			items = {
				titles = { l__TitleType__11.ARRGH }
			}
		}, 
		[l__EventShopItem__13.PIRATE_TITLE_2] = {
			name = l__TitleMeta__10[l__TitleType__11.PIRATE].text .. " Title", 
			textImage = l__TitleMeta__10[l__TitleType__11.PIRATE].text, 
			price = 2000, 
			currency = l__EventCurrencyType__12.DOUBLOONS, 
			items = {
				titles = { l__TitleType__11.PIRATE }
			}
		}, 
		[l__EventShopItem__13.PIRATE_TITLE_3] = {
			name = l__TitleMeta__10[l__TitleType__11.CAPTAIN].text .. " Title", 
			textImage = l__TitleMeta__10[l__TitleType__11.CAPTAIN].text, 
			price = 7000, 
			currency = l__EventCurrencyType__12.DOUBLOONS, 
			items = {
				titles = { l__TitleType__11.CAPTAIN }
			}
		}, 
		[l__EventShopItem__13.PIRATE_ATTACK_KILL_EFFECT] = {
			name = "Pirate Attack Kill Effect", 
			image = "rbxassetid://10730677916", 
			price = 10000, 
			currency = l__EventCurrencyType__12.DOUBLOONS, 
			items = {
				killEffects = { v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType.PIRATE_SHIP_ATTACK }
			}
		}, 
		[l__EventShopItem__13.PIRATE_EMOTE_1] = {
			name = l__EmoteMeta__6[l__EmoteType__7.HANNAH_GHOST_MOMENT].name .. " Emote", 
			image = l__getEmoteAsset__3(l__EmoteType__7.HANNAH_GHOST_MOMENT), 
			price = 2000, 
			currency = l__EventCurrencyType__12.DOUBLOONS, 
			items = {
				emotes = { l__EmoteType__7.HANNAH_GHOST_MOMENT }
			}
		}, 
		[l__EventShopItem__13.PIRATE_EMOTE_2] = {
			name = l__EmoteMeta__6[l__EmoteType__7.HANNAH_SORRY_NOT].name .. " Emote", 
			image = l__getEmoteAsset__3(l__EmoteType__7.HANNAH_SORRY_NOT), 
			price = 2000, 
			currency = l__EventCurrencyType__12.DOUBLOONS, 
			items = {
				emotes = { l__EmoteType__7.HANNAH_SORRY_NOT }
			}
		}, 
		[l__EventShopItem__13.PIRATE_EMOTE_3] = {
			name = l__EmoteMeta__6[l__EmoteType__7.SMOKE_AGAIN].name .. " Emote", 
			image = l__getEmoteAsset__3(l__EmoteType__7.SMOKE_AGAIN), 
			price = 2000, 
			currency = l__EventCurrencyType__12.DOUBLOONS, 
			items = {
				emotes = { l__EmoteType__7.SMOKE_AGAIN }
			}
		}, 
		[l__EventShopItem__13.PIRATE_EMOTE_4] = {
			name = l__EmoteMeta__6[l__EmoteType__7.ZEPHYR_BEGONE].name .. " Emote", 
			image = l__getEmoteAsset__3(l__EmoteType__7.ZEPHYR_BEGONE), 
			price = 2000, 
			currency = l__EventCurrencyType__12.DOUBLOONS, 
			items = {
				emotes = { l__EmoteType__7.ZEPHYR_BEGONE }
			}
		}, 
		[l__EventShopItem__13.PIRATE_EMOTE_5] = {
			name = l__EmoteMeta__6[l__EmoteType__7.ZEPHYR_GOING_FAST].name .. " Emote", 
			image = l__getEmoteAsset__3(l__EmoteType__7.ZEPHYR_GOING_FAST), 
			price = 2000, 
			currency = l__EventCurrencyType__12.DOUBLOONS, 
			items = {
				emotes = { l__EmoteType__7.ZEPHYR_GOING_FAST }
			}
		}, 
		[l__EventShopItem__13.PIRATE_EMOTE_6] = {
			name = l__EmoteMeta__6[l__EmoteType__7.HANNAH_FIRED_UP].name .. " Emote", 
			image = l__getEmoteAsset__3(l__EmoteType__7.HANNAH_FIRED_UP), 
			price = 4000, 
			currency = l__EventCurrencyType__12.DOUBLOONS, 
			items = {
				emotes = { l__EmoteType__7.HANNAH_FIRED_UP }
			}
		}, 
		[l__EventShopItem__13.PIRATE_EMOTE_7] = {
			name = l__EmoteMeta__6[l__EmoteType__7.HANNAH_FEAR].name .. " Emote", 
			image = l__getEmoteAsset__3(l__EmoteType__7.HANNAH_FEAR), 
			price = 2000, 
			currency = l__EventCurrencyType__12.DOUBLOONS, 
			items = {
				emotes = { l__EmoteType__7.HANNAH_FEAR }
			}
		}, 
		[l__EventShopItem__13.PIRATE_EMOTE_8] = {
			name = l__EmoteMeta__6[l__EmoteType__7.SMOKE_DUDE].name .. " Emote", 
			image = l__getEmoteAsset__3(l__EmoteType__7.SMOKE_DUDE), 
			price = 4000, 
			currency = l__EventCurrencyType__12.DOUBLOONS, 
			items = {
				emotes = { l__EmoteType__7.SMOKE_DUDE }
			}
		}, 
		[l__EventShopItem__13.PIRATE_EMOTE_9] = {
			name = l__EmoteMeta__6[l__EmoteType__7.GHOST_DAVEY].name .. " Emote", 
			image = l__getEmoteAsset__3(l__EmoteType__7.GHOST_DAVEY), 
			price = 4000, 
			currency = l__EventCurrencyType__12.DOUBLOONS, 
			items = {
				emotes = { l__EmoteType__7.GHOST_DAVEY }
			}
		}, 
		[l__EventShopItem__13.PIRATE_ANIMATED_EMOTE_1] = {
			name = l__EmoteMeta__6[l__EmoteType__7.SEARCHING_FAR_AWAY].name .. " Emote", 
			animation = l__ProdAnimations__2[l__EmoteMeta__6[l__EmoteType__7.SEARCHING_FAR_AWAY].animation.type], 
			price = 5000, 
			currency = l__EventCurrencyType__12.DOUBLOONS, 
			items = {
				emotes = { l__EmoteType__7.SEARCHING_FAR_AWAY }
			}
		}, 
		[l__EventShopItem__13.PIRATE_ANIMATED_EMOTE_2] = {
			name = l__EmoteMeta__6[l__EmoteType__7.PIRATES_GOODBYE].name .. " Emote", 
			animation = l__ProdAnimations__2[l__EmoteMeta__6[l__EmoteType__7.PIRATES_GOODBYE].animation.type], 
			price = 5000, 
			currency = l__EventCurrencyType__12.DOUBLOONS, 
			items = {
				emotes = { l__EmoteType__7.PIRATES_GOODBYE }
			}
		}, 
		[l__EventShopItem__13.PIRATE_DAVEY_GHOST_SKIN] = {
			name = l__BedwarsKitSkinMeta__5[l__BedwarsKitSkin__4.DAVEY_GHOST].name .. " Kit Skin", 
			image = l__BedwarsKitSkinMeta__5[l__BedwarsKitSkin__4.DAVEY_GHOST].renderImage, 
			price = 10000, 
			currency = l__EventCurrencyType__12.DOUBLOONS, 
			items = {
				kitSkins = { l__BedwarsKitSkin__4.DAVEY_GHOST }
			}
		}, 
		[l__EventShopItem__13.PIRATE_LOBBY_GADGET_1] = {
			name = l__LobbyGadgetMeta__8[l__LobbyGadgetType__9.BLUNDERBUSS].name .. " Lobby Gadget", 
			image = l__LobbyGadgetMeta__8[l__LobbyGadgetType__9.BLUNDERBUSS].image, 
			price = 7000, 
			currency = l__EventCurrencyType__12.DOUBLOONS, 
			items = {
				lobbyGadgets = { l__LobbyGadgetType__9.BLUNDERBUSS }
			}
		}
	}
};
