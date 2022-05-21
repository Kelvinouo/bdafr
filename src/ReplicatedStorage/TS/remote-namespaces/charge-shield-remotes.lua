-- Script Hash: b2d54d7f344eea215329a0930e410cf22a0425e782669a9097c75344fedbb442d0fb119aaf8671bde0a577132077eea2
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "net").out);
return v2.Definitions.Namespace({
	ChargeShieldUse = v2.Definitions.ClientToServerEvent(), 
	ChargeShieldActivated = v2.Definitions.ServerToClientEvent(), 
	ChargeShieldHit = v2.Definitions.ServerToClientEvent()
});
