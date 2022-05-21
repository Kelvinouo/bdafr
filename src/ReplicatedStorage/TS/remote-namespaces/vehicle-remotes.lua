-- Script Hash: b7ddf3e7add6dc9a3823859c0fc041da176781c266b0af6c53b51fca81d5500f199e52cd8c952c124deb84279091849c
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "net").out);
return {
	VehicleRemotes = v2.Definitions.Namespace({
		SetEnginePower = v2.Definitions.ClientToServerEvent()
	})
};
