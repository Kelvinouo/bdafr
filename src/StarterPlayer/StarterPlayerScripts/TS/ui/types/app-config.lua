-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "lobby").out).LobbyDefaultAppConfiguration;
return {
	BedwarsAppIds = {
		INVENTORY = "InventoryApp", 
		BEDWARS_UPGRADE_SHOP = "BedwarsTeamUpgradeApp", 
		BEDWARS_ITEM_SHOP = "BedwarsItemShopApp", 
		KIT_SHOP = "KitShopApp", 
		LOCKER = "LockerApp", 
		MISSIONS = "MissionsApp", 
		BATTLEPASS = "BattlePassApp", 
		TAB_LIST = "TabListApp", 
		CUSTOM_MATCHES = "CustomMatchesApp", 
		FLAMETHROWER_UPGRADES = "FlamethrowerApp", 
		GIFTING = "GiftingApp", 
		GIFTED = "GiftedApp", 
		SOCIAL_CONNECTIONS = "SocialConnectionsApp", 
		GAME_UPDATES = "GameUpdatesApp", 
		RANKED_PAID_RESTRICTION = "PaidPlayerRestrictionApp", 
		RANKED_PROGRESS_BAR = "RankedProgressBarApp", 
		RANKED_PROVISIONAL_PROGRESS_BAR = "ProvisionalProgressBarApp", 
		CHEST_INVENTORY = "ChestApp", 
		ENCHANT_TABLE = "EnchantTable", 
		QUEUE_SELECTION = "QueueSelection", 
		CUSTOM_MATCH_HOST_PANEL = "CustomMatchHostPanel", 
		CLAN_MENU = "ClanCreateForm", 
		CLAN_PROFILE = "ClanProfile", 
		CONFIRMATION_MODAL = "ConfirmationModal", 
		PARTY = v2.PARTY.appId, 
		PARTY_INVITES = v2.PARTY_INVITES.appId, 
		NOTIFICATIONS = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameCoreDefaultAppConfiguration.NOTIFICATIONS.appId
	}
};
