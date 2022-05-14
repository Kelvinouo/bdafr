-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__UILayers__3 = v2.UILayers;
local l__BedwarsAppIds__4 = v1.import(script, script.Parent, "types", "app-config").BedwarsAppIds;
local v5 = {
	INVENTORY = {
		app = v1.import(script, script.Parent.Parent, "controllers", "global", "inventory", "character", "ui", "inventory-app").InventoryApp, 
		appId = l__BedwarsAppIds__4.INVENTORY, 
		layer = l__UILayers__3.MAIN
	}, 
	BEDWARS_UPGRADE_SHOP = {
		app = v1.import(script, script.Parent.Parent, "controllers", "games", "bedwars", "generator-upgrade", "ui", "bedwars-team-upgrade-app").BedwarsTeamUpgradeApp, 
		appId = l__BedwarsAppIds__4.BEDWARS_UPGRADE_SHOP, 
		layer = l__UILayers__3.MAIN
	}, 
	BEDWARS_ITEM_SHOP = {
		app = v1.import(script, script.Parent.Parent, "controllers", "games", "bedwars", "shop", "ui", "item-shop", "bedwars-item-shop-app").BedwarsItemShopApp, 
		appId = l__BedwarsAppIds__4.BEDWARS_ITEM_SHOP, 
		layer = l__UILayers__3.MAIN
	}, 
	KIT_SHOP = {
		app = v1.import(script, script.Parent.Parent, "controllers", "global", "kit-shop", "ui", "kit-shop", "kit-shop-app").KitShopApp, 
		appId = l__BedwarsAppIds__4.KIT_SHOP, 
		layer = l__UILayers__3.MAIN
	}, 
	LOCKER = {
		app = v1.import(script, script.Parent.Parent, "controllers", "lobby", "locker", "ui", "locker-app").LockerApp, 
		appId = l__BedwarsAppIds__4.LOCKER, 
		layer = l__UILayers__3.MAIN
	}, 
	MISSIONS = {
		app = v1.import(script, script.Parent.Parent, "controllers", "lobby", "missions", "ui", "missions-app").MissionsApp, 
		appId = l__BedwarsAppIds__4.MISSIONS, 
		layer = l__UILayers__3.MAIN
	}, 
	BATTLEPASS = {
		app = v1.import(script, script.Parent.Parent, "controllers", "global", "battle-pass", "ui", "battle-pass-app").BattlePassApp, 
		appId = l__BedwarsAppIds__4.BATTLEPASS, 
		layer = l__UILayers__3.MAIN
	}, 
	TAB_LIST = {
		app = v1.import(script, script.Parent.Parent, "controllers", "games", "bedwars", "tab-list", "ui", "tab-list-app").TabListApp, 
		appId = l__BedwarsAppIds__4.TAB_LIST, 
		layer = l__UILayers__3.OVERLAY
	}, 
	CUSTOM_MATCHES = {
		app = v1.import(script, script.Parent.Parent, "controllers", "lobby", "custom-matches", "ui", "custom-matches-app").CustomMatchesApp, 
		appId = l__BedwarsAppIds__4.CUSTOM_MATCHES, 
		layer = l__UILayers__3.MAIN
	}, 
	FLAMETHROWER_UPGRADES = {
		app = v1.import(script, script.Parent.Parent, "controllers", "games", "bedwars", "kit", "kits", "pyro", "ui", "flamethrower-app").FlamethrowerUpgradeApp, 
		appId = l__BedwarsAppIds__4.FLAMETHROWER_UPGRADES, 
		layer = l__UILayers__3.MAIN
	}, 
	GIFTING = {
		app = v1.import(script, script.Parent.Parent, "controllers", "global", "gift", "ui", "gifting", "gifting-app").GiftingApp, 
		appId = l__BedwarsAppIds__4.GIFTING, 
		layer = l__UILayers__3.MAIN
	}, 
	GIFTED = {
		app = v1.import(script, script.Parent.Parent, "controllers", "global", "gift", "ui", "gifted", "gifted-app").GiftedApp, 
		appId = l__BedwarsAppIds__4.GIFTED, 
		layer = l__UILayers__3.MAIN
	}, 
	SOCIAL_CONNECTIONS = {
		app = v1.import(script, script.Parent.Parent, "controllers", "lobby", "social-connections", "ui", "social-connections-app").SocialConnectionsApp, 
		appId = l__BedwarsAppIds__4.SOCIAL_CONNECTIONS, 
		layer = l__UILayers__3.MAIN
	}, 
	GAME_UPDATES = {
		app = v1.import(script, script.Parent.Parent, "controllers", "global", "update", "ui", "game-updates-app").GameUpdatesApp, 
		appId = l__BedwarsAppIds__4.GAME_UPDATES, 
		layer = l__UILayers__3.MAIN
	}, 
	RANKED_PAID_RESTRICTION = {
		app = v1.import(script, script.Parent.Parent, "controllers", "global", "paid-player-player", "ui", "paid-player-restriction-app").PaidPlayerRestrictionApp, 
		appId = l__BedwarsAppIds__4.RANKED_PAID_RESTRICTION
	}, 
	RANKED_PROGRESS_BAR = {
		app = v1.import(script, script.Parent.Parent, "controllers", "games", "bedwars", "ranked-progress-bar", "ui", "ranked-progress-bar-app").RankedProgressBarApp, 
		appId = l__BedwarsAppIds__4.RANKED_PROGRESS_BAR
	}, 
	RANKED_PROVISIONAL_PROGRESS_BAR = {
		app = v1.import(script, script.Parent.Parent, "controllers", "games", "bedwars", "ranked-progress-bar", "ui", "provisional-progress-bar-app").ProvisionalProgressBarApp, 
		appId = l__BedwarsAppIds__4.RANKED_PROVISIONAL_PROGRESS_BAR
	}, 
	CHEST_INVENTORY = {
		app = v1.import(script, script.Parent.Parent, "controllers", "global", "inventory", "chest", "ui", "chest-inventory-app").ChestInventoryApp, 
		appId = l__BedwarsAppIds__4.CHEST_INVENTORY, 
		layer = l__UILayers__3.MAIN
	}, 
	ENCHANT_TABLE = {
		app = v1.import(script, script.Parent.Parent, "controllers", "game", "enchant-table", "ui", "enchant-app").EnchantApp, 
		appId = l__BedwarsAppIds__4.ENCHANT_TABLE, 
		layer = l__UILayers__3.MAIN
	}, 
	QUEUE_SELECTION = {
		app = v1.import(script, script.Parent.Parent, "controllers", "lobby", "queue-selection", "ui", "queue-selection-app").QueueSelectionApp, 
		appId = l__BedwarsAppIds__4.QUEUE_SELECTION, 
		layer = l__UILayers__3.MAIN
	}, 
	CUSTOM_MATCH_HOST_PANEL = {
		app = v1.import(script, script.Parent.Parent, "controllers", "global", "hotbar", "ui", "custom-match", "host-panel", "custom-match-host-panel-app").CustomMatchHostPanelApp, 
		appId = l__BedwarsAppIds__4.CUSTOM_MATCH_HOST_PANEL, 
		layer = l__UILayers__3.MAIN
	}, 
	CLAN_MENU = {
		app = v1.import(script, script.Parent.Parent, "controllers", "lobby", "clan", "ui", "clan-menu", "clan-menu-base").ClanMenuApp, 
		appId = l__BedwarsAppIds__4.CLAN_MENU, 
		layer = l__UILayers__3.MAIN
	}, 
	CLAN_PROFILE = {
		app = v1.import(script, script.Parent.Parent, "controllers", "lobby", "clan", "ui", "profile", "clan-profile-base").ClanProfileApp, 
		appId = l__BedwarsAppIds__4.CLAN_PROFILE, 
		layer = l__UILayers__3.MAIN
	}, 
	CONFIRMATION_MODAL = {
		app = v1.import(script, script.Parent.Parent, "controllers", "lobby", "clan", "ui", "profile", "confirmation-modal", "confirmation-modal-base").ConfirmationModalApp, 
		appId = l__BedwarsAppIds__4.CONFIRMATION_MODAL, 
		layer = l__UILayers__3.OVERLAY
	}
};
for v6, v7 in pairs(v1.import(script, v1.getModule(script, "@easy-games", "lobby").out).LobbyDefaultAppConfiguration) do
	v5[v6] = v7;
end;
for v8, v9 in pairs(v2.GameCoreDefaultAppConfiguration) do
	v5[v8] = v9;
end;
return {
	AppConfiguration = v5
};
