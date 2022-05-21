-- Script Hash: 4d6159c92747f05d98d6b8b0a4868dc4bd3037469a701bd23782b1fcfd36abb81cb50dd70ca4a91bba6d47f5ad276f85
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
return {
	IS_DEV = v1.import(script, v1.getModule(script, "@rbxts", "services")).RunService:IsStudio(), 
	PingConstants = {
		PING_COOLDOWN = 2, 
		PING_LIFETIME = 6
	}
};
