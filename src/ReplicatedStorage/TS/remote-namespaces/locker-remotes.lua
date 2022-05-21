-- Script Hash: 62a07903bb7a1f66049156d48d822d38e45adf0a663e0fbd1b84c49fa6e3166b62df89656f4dc2ca47f9996539a9527f
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "net").out);
return v2.Definitions.Namespace({
	SetKillEffect = v2.Definitions.ServerFunction(), 
	SetSpray = v2.Definitions.ServerFunction(), 
	SetTitle = v2.Definitions.ServerFunction(), 
	SetLobbyGadget = v2.Definitions.ServerFunction(), 
	GiveLobbyGadget = v2.Definitions.ServerFunction(), 
	RefillLobbyGadgetItem = v2.Definitions.ServerFunction(), 
	GetLocker = v2.Definitions.ServerFunction(), 
	LockerUpdate = v2.Definitions.ServerToClientEvent()
});
