-- Script Hash: be6267d2a81d4f0788498a75a76b86d62cc601fd1a36f06b7f83f6ad720169cb5ce8ec91deebd560a8c17fd1a088f176
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local v2 = setmetatable({}, {
	__index = v1
});
v2.NONE = 0;
v1[0] = "NONE";
v2.PARTY = 1;
v1[1] = "PARTY";
v2.INVITES = 2;
v1[2] = "INVITES";
v2.INVENTORY = 3;
v1[3] = "INVENTORY";
v2.BEDWARS_UPGRADE_SHOP = 4;
v1[4] = "BEDWARS_UPGRADE_SHOP";
v2.BEDWARS_ITEM_SHOP = 5;
v1[5] = "BEDWARS_ITEM_SHOP";
v2.KIT_SHOP = 6;
v1[6] = "KIT_SHOP";
v2.LOCKER = 7;
v1[7] = "LOCKER";
v2.MISSIONS = 8;
v1[8] = "MISSIONS";
v2.BATTLEPASS = 9;
v1[9] = "BATTLEPASS";
v2.TAB_LIST = 10;
v1[10] = "TAB_LIST";
v2.CUSTOM_MATCHES = 11;
v1[11] = "CUSTOM_MATCHES";
v2.FLAMETHROWER_UPGRADES = 12;
v1[12] = "FLAMETHROWER_UPGRADES";
v2.GIFTING = 13;
v1[13] = "GIFTING";
v2.GIFTED = 14;
v1[14] = "GIFTED";
v2.SOCIAL_CONNECTIONS = 15;
v1[15] = "SOCIAL_CONNECTIONS";
v2.GAME_UPDATES = 16;
v1[16] = "GAME_UPDATES";
v2.RANKED_PAID_RESTRICTION = 17;
v1[17] = "RANKED_PAID_RESTRICTION";
v2.CUSTOM_MATCH_HOST_PANEL = 18;
v1[18] = "CUSTOM_MATCH_HOST_PANEL";
local u1 = {
	shownApp = v2.NONE, 
	showHotbarPartyControls = not require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil.isGameServer(), 
	scaleComponentValue = 0
};
return {
	AppReducer = function(p1, p2)
		if p1 == nil then
			p1 = u1;
		end;
		if p2.type == "SetShownApp" then
			local v3 = {};
			for v4, v5 in pairs(p1) do
				v3[v4] = v5;
			end;
			v3.shownApp = p2.app;
			return v3;
		end;
		if p2.type == "SetShowHotbarPartyControls" then
			local v6 = {};
			for v7, v8 in pairs(p1) do
				v6[v7] = v8;
			end;
			v6.showHotbarPartyControls = p2.value;
			return v6;
		end;
		if p2.type ~= "SetScaleComponentValue" then
			return p1;
		end;
		local v9 = {};
		for v10, v11 in pairs(p1) do
			v9[v10] = v11;
		end;
		v9.scaleComponentValue = p2.scale;
		return v9;
	end, 
	App = v2
};
