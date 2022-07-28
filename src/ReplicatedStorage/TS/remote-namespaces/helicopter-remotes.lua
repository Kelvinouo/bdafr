-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "net").out);
return {
	HelicopterRemotes = v2.Definitions.Namespace({
		FireMissile = v2.Definitions.ClientToServerEvent(), 
		ReplicateMissile = v2.Definitions.ServerToClientEvent()
	})
};
