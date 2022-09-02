-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "net").out);
return {
	BattlePassRemotesNamespace = v2.Definitions.Namespace({
		GetBattlePass = v2.Definitions.ServerFunction(), 
		MatchExperienceEarned = v2.Definitions.ServerToClientEvent()
	})
};
