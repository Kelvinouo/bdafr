-- Script Hash: 73307302d9bc0572633a40c41503c7154a641434069f7ef27885fca4fa2617c9e90df09a4f8559822a46affc34e2459b
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
return {
	HostPanelGeneralToggle = v3, 
	starterHostPanelSettings = {
		teamGenerators = {}, 
		globalGenerators = {
			[l__ItemType__1.EMERALD] = 1, 
			[l__ItemType__1.DIAMOND] = 1
		}, 
		deathmatchTime = 1200, 
		serverMaxPlayers = 1000, 
		generalToggles = {
			[v3.TeamOverflow] = false, 
			[v3.TeamSwitching] = true, 
			[v3.HideAllNametags] = false, 
			[v3.BypassPlacementLimits] = false, 
			[v3.LockServer] = false, 
			[v3.PvP] = true, 
			[v3.BedBreaking] = true
		}, 
		disabledKits = {}, 
		disabledItems = {}
	}
};
