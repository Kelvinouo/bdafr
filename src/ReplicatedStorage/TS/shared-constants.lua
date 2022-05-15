
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
return {
	IS_DEV = v1.import(script, v1.getModule(script, "@rbxts", "services")).RunService:IsStudio(), 
	PingConstants = {
		PING_COOLDOWN = 2, 
		PING_LIFETIME = 6
	}
};

