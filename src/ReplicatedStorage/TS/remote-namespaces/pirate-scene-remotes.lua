-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "net").out);
return v2.Definitions.Namespace({
	PickupCannonball = v2.Definitions.ClientToServerEvent(), 
	InsertCannonball = v2.Definitions.ClientToServerEvent(), 
	RequestPirateSceneServerState = v2.Definitions.ServerFunction(), 
	PirateSceneServerStateChange = v2.Definitions.ServerToClientEvent()
});
