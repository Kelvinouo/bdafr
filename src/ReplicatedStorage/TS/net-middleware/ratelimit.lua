-- Script Hash: 8155c59cfbc104ca2422283b8e4b02a8181342f25727620a577edd93ee145d0c3755892e7b84b6be9ee1ce291a949c7d
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__Players__1 = v2.Players;
local l__AnalyticsService__2 = v2.AnalyticsService;
return function(p1)
	local v3 = l__Players__1:GetPlayerByUserId(p1.UserId);
	local v4 = v3;
	if v4 ~= nil then
		v4 = v4.Name;
	end;
	warn("[RateLimiter] Player " .. tostring(v4) .. " hit rate limit on remote " .. p1.RemoteId);
	l__AnalyticsService__2:FireCustomEvent(v3, "Net_Ratelimiter_Fail", {
		eventName = p1.RemoteId, 
		requestsPerMinute = p1.MaxRequestsPerMinute, 
		message = p1.Message
	});
end;
