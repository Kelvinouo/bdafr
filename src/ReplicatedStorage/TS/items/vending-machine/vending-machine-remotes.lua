-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "net").out);
return v2.Definitions.Namespace({
	OpenVendingMachine = v2.Definitions.ServerFunction(), 
	VendingMachineOpened = v2.Definitions.ServerToClientEvent(), 
	VendingMachineSelfDestruct = v2.Definitions.ServerToClientEvent()
});
