-- Script Hash: 24e24b86f0ae64de975836186b59dbfa3fdc55eb729cc5985a97a35d18cee1e36980fd5e6fc40657bd29671663875258
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__default__2 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
return {
	RankLogger = l__default__2.Create():WriteTo(l__default__2.RobloxOutput({
		Prefix = "RANKED"
	})):Create()
};
