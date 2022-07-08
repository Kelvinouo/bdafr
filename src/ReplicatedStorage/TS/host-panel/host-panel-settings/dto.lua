-- Decompiled with the Synapse X Luau decompiler.

local l__ItemType__1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local v2 = {};
local v3 = setmetatable({}, {
	__index = v2
});
v3.TeamOverflow = 0;
v2[0] = "TeamOverflow";
v3.TeamSwitching = 1;
v2[1] = "TeamSwitching";
v3.HideAllNametags = 2;
v2[2] = "HideAllNametags";
v3.BypassPlacementLimits = 3;
v2[3] = "BypassPlacementLimits";
v3.LockServer = 4;
v2[4] = "LockServer";
v3.PvP = 5;
v2[5] = "PvP";
v3.BedBreaking = 6;
v2[6] = "BedBreaking";
v3.BlockBreaking = 7;
v2[7] = "BlockBreaking";
local v4 = {};
local v5 = setmetatable({}, {
	__index = v4
});
v5.ON = "on";
v4.on = "ON";
v5.OFF = "off";
v4.off = "OFF";
v5.HOST_ONLY = "host_only";
v4.host_only = "HOST_ONLY";
return {
	HostPanelGeneralToggle = v3, 
	HostPanelToggleValue = v5, 
	starterHostPanelSettings = {
		teamGenerators = {}, 
		globalGenerators = {
			[l__ItemType__1.EMERALD] = 1, 
			[l__ItemType__1.DIAMOND] = 1
		}, 
		deathmatchTime = 1200, 
		serverMaxPlayers = 1000, 
		generalToggles = {
			[v3.TeamOverflow] = v5.OFF, 
			[v3.TeamSwitching] = v5.ON, 
			[v3.HideAllNametags] = v5.OFF, 
			[v3.BypassPlacementLimits] = v5.OFF, 
			[v3.LockServer] = v5.OFF, 
			[v3.PvP] = v5.ON, 
			[v3.BedBreaking] = v5.ON, 
			[v3.BlockBreaking] = v5.ON
		}, 
		disabledKits = {}, 
		disabledItems = {}
	}
};
