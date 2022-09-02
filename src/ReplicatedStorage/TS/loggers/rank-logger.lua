-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__default__2 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
return {
	RankLogger = l__default__2.Create():WriteTo(l__default__2.RobloxOutput({
		Prefix = "RANKED"
	})):Create()
};
