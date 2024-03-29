-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BedwarsKitSkin__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local l__BedwarsKit__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__EmoteType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local l__KillEffectType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType;
local l__LobbyGadgetType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType;
local l__TitleType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType;
local l__DevProduct__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "devproduct").DevProduct;
local l__Gamepass__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "gamepass").Gamepass;
local l__BundleType__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-type").BundleType;
return {
	BundleMeta = {
		[l__BundleType__10.HOLIDAY_BUNDLE_2021] = {
			name = "Holiday Bundle 2021", 
			price = 1499, 
			image = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "emote", "emote-assets").EmoteAssets[l__EmoteType__4.LUCKY_GIFT], 
			gamepassId = l__Gamepass__9.HOLIDAY_BUNDLE_2021, 
			devProductId = l__DevProduct__8.HOLIDAY_BUNDLE_2021_GIFT, 
			rewards = {
				kits = { l__BedwarsKit__3.AXOLOTL, l__BedwarsKit__3.BARBARIAN, l__BedwarsKit__3.REGENT }, 
				kitSkins = { l__BedwarsKitSkin__2.AXOLOTL_REINDEER, l__BedwarsKitSkin__2.BARBARIAN_DEEP_VOID }, 
				killEffects = { l__KillEffectType__5.ABDUCTION, l__KillEffectType__5.COFFIN }, 
				lobbyGadgets = { l__LobbyGadgetType__6.HANG_GLIDER }
			}
		}, 
		[l__BundleType__10.LUNAR_BUNDLE_2022] = {
			name = "Lunar Bundle 2022", 
			price = 999, 
			image = "rbxassetid://8666432622", 
			gamepassId = l__Gamepass__9.LUNAR_BUNDLE_2022, 
			devProductId = l__DevProduct__8.LUNAR_NEW_YEAR_BUNDLE_2022_GIFT, 
			rewards = {
				titles = { l__TitleType__7.YEAR_OF_THE_TIGER, l__TitleType__7.SPRING_FESTIVAL, l__TitleType__7.LUNAR_NEW_YEAR }, 
				killEffects = { l__KillEffectType__5.LANTERN }, 
				emotes = { l__EmoteType__4.LUNAR_TIGER_BUILDER, l__EmoteType__4.VULCAN_LANTERN, l__EmoteType__4.LNY_2022, l__EmoteType__4.RED_ENVELOPE }, 
				kits = { l__BedwarsKit__3.DASHER }, 
				kitSkins = { l__BedwarsKitSkin__2.DASHER_TIGER }
			}
		}, 
		[l__BundleType__10.MINER_BUNDLE] = {
			name = "Miner Bundle", 
			price = 899, 
			image = "rbxassetid://8936489137", 
			gamepassId = l__Gamepass__9.MINER_BUNDLE, 
			devProductId = l__DevProduct__8.MINER_BUNDLE_GIFT, 
			rewards = {
				titles = { l__TitleType__7.MINERS_OF_THE_GALAXY, l__TitleType__7.PICKAXE, l__TitleType__7.MINING_AWAY }, 
				kitSkins = { l__BedwarsKitSkin__2.MINER_SPACE }, 
				kits = { l__BedwarsKit__3.MINER }
			}
		}, 
		[l__BundleType__10.EMBER_LUMEN_KIT_BUNDLE] = {
			name = "Ember & Lumen Kit Bundle", 
			price = 999, 
			image = "rbxassetid://9630018755", 
			gamepassId = l__Gamepass__9.EMBER_LUMEN_KIT_BUNDLE, 
			devProductId = l__DevProduct__8.EMBER_LUMEN_KIT_BUNDLE, 
			rewards = {
				kits = { l__BedwarsKit__3.EMBER, l__BedwarsKit__3.LUMEN }, 
				titles = { l__TitleType__7.Infernal, l__TitleType__7.LIGHT }, 
				lobbyGadgets = { l__LobbyGadgetType__6.INFERNAL_SABER, l__LobbyGadgetType__6.LIGHT_SWORD }
			}, 
			limitedTime = true, 
			kitShopBundle = {
				name = "Ember & Lumen Kit Bundle", 
				image = "rbxassetid://9630018755", 
				description = "Purchase this limited time bundle to unlock the following:\n\226\152\128\239\184\143\194\160<b>LUMEN (Kit)</b>\n\240\159\148\165\194\160<b>EMBER (Kit)</b>\n- Unlocks limited lobby titles: <font color=\"rgb(140, 5, 56)\"><b>Infernal \240\159\148\165</b></font> & <font color=\"rgb(242, 209, 0)\"><b>Light \240\159\148\133</b></font>\n- Unlocks limited time lobby gadgets: Infernal Saber & Light Sword\n", 
				disabled = true
			}
		}, 
		[l__BundleType__10.EMBER_LUMEN_KIT_BUNDLE_PERM] = {
			name = "Ember & Lumen Kit Bundle", 
			price = 799, 
			image = "rbxassetid://9630018755", 
			gamepassId = l__Gamepass__9.EMBER_LUMEN_KIT_BUNDLE_PERM, 
			devProductId = l__DevProduct__8.EMBER_LUMEN_KIT_BUNDLE_PERM, 
			rewards = {
				kits = { l__BedwarsKit__3.EMBER, l__BedwarsKit__3.LUMEN }
			}, 
			kitShopBundle = {
				name = "Ember & Lumen Kit Bundle", 
				image = "rbxassetid://9630018755", 
				description = "This bundle unlocks the following:\n\226\152\128\239\184\143\194\160<b>LUMEN (Kit)</b>\n\240\159\148\165\194\160<b>EMBER (Kit)</b>"
			}
		}, 
		[l__BundleType__10.EVELYNN_BUNDLE] = {
			name = "Evelynn Bundle", 
			price = 999, 
			image = "rbxassetid://10406984466", 
			gamepassId = l__Gamepass__9.EVELYNN_BUNDLE, 
			devProductId = l__DevProduct__8.EVELYNN_BUNDLE, 
			rewards = {
				kits = { l__BedwarsKit__3.SPIRIT_ASSASSIN }, 
				kitSkins = { l__BedwarsKitSkin__2.SPIRIT_ASSASSIN_PRISMATIC }
			}, 
			limitedTime = true, 
			kitShopBundle = {
				name = "Evelynn Bundle", 
				image = "rbxassetid://10406984466", 
				description = "This bundle unlocks the following:\n\240\159\151\161\239\184\143\194\160<b>Evelynn (Kit)</b>\n\240\159\140\136\194\160<b>Prismatic Evelynn (Kit Skin)</b>", 
				disabled = true
			}
		}, 
		[l__BundleType__10.HANNAH_BUNDLE] = {
			name = "Hannah Bundle", 
			price = 999, 
			image = "rbxassetid://10726577232", 
			gamepassId = l__Gamepass__9.HANNAH_BUNDLE, 
			devProductId = l__DevProduct__8.HANNAH_BUNDLE, 
			rewards = {
				kits = { l__BedwarsKit__3.HANNAH }, 
				kitSkins = { l__BedwarsKitSkin__2.HANNAH_GHOST }, 
				lobbyGadgets = { l__LobbyGadgetType__6.CUTLASS_GHOST }, 
				titles = { l__TitleType__7.CORSAIR }, 
				emotes = { l__EmoteType__4.HANNAH_GHOSTED }
			}, 
			limitedTime = true, 
			kitShopBundle = {
				name = "Hannah Bundle", 
				image = "rbxassetid://10726577232", 
				description = "This bundle unlocks the following:\n\240\159\143\180\226\128\141\226\152\160\239\184\143\194\160<b>Hannah (Kit)</b>\n\240\159\145\187\194\160<b>Ghost Hannah (Kit Skin)</b>\n\240\159\143\180\226\128\141\226\152\160\239\184\143\194\160<b>Corsair (Title)</b>\n\240\159\151\161\239\184\143\194\160<b>Ghost Cutlass (Lobby Gadget)</b>\n\240\159\151\161\239\184\143\194\160<b>Ghosted Hannah (Emote)</b>", 
				disabled = true
			}
		}
	}
};
