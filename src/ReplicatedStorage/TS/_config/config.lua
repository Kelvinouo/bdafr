-- Script Hash: ef70a4b8db6a7ede22adde8b3fc8b1ae0b38ed553bffa4c63b3c8503e4abaae03ef87baed999ab2aa2756e9356b95af4
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {
	Lobby = false, 
	Game = false, 
	StarterItems = false, 
	Kit = "", 
	KitSkin = "", 
	Map = "", 
	DisablePlacementLimits = false, 
	CustomMatch = false, 
	DisableBattlePassTimeCheck = false, 
	SimulateLateJoin = false, 
	SimulateFinalKill = false, 
	KillEffectType = "", 
	DisableSaving = false, 
	SimulateRankPromotion = false
};
local l___config__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).ReplicatedStorage:WaitForChild("TS"):WaitForChild("_config");
return {
	getConfig = function(p1)
		return l___config__1:WaitForChild(p1).Value;
	end, 
	getConfigString = function(p2)
		return l___config__1:WaitForChild(p2).Value;
	end
};
