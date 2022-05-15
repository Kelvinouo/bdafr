
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "net").out);
return v2.Definitions.Namespace({
	RequestLeaderboardData = v2.Definitions.ServerAsyncFunction({ v2.Middleware.RateLimit({
			MaxRequestsPerMinute = 1, 
			ErrorHandler = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "net-middleware", "ratelimit")
		}) }), 
	OnLeaderboardsUpdate = v2.Definitions.ServerToClientEvent()
});

