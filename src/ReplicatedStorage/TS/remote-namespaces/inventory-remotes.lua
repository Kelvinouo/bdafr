-- Script Hash: 26bc672ae0214e48b2f6d53ae7efd4097202c417f6d3e48c3eabf905b165a2de5cc9974955466a2e9d10d43851caf27f
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "net").out);
return v2.Definitions.Namespace({
	SetObservedChest = v2.Definitions.ClientToServerEvent(), 
	ChestGetItem = v2.Definitions.ServerFunction(), 
	ChestGiveItem = v2.Definitions.ServerFunction()
});
