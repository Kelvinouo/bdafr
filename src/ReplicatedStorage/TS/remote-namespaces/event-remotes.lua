-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "net").out);
return {
	EventRemotes = v2.Definitions.Namespace({
		PurchaseShopItem = v2.Definitions.ServerFunction(), 
		ClaimMission = v2.Definitions.ServerFunction(), 
		EventDataUpdate = v2.Definitions.ServerToClientEvent(), 
		ActiveEventMissionsUpdate = v2.Definitions.ServerToClientEvent()
	})
};
