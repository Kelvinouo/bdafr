-- Script Hash: be359232cb40688d8c68b833f94eb0db717465b7599cc79994c940a3db49df055dff1a75582ba6a7548ad99e018177d1
-- Decompiled with the Synapse X Luau decompiler.

local u1 = {
	leaderboards = {}, 
	globalStats = nil, 
	queues = {}, 
	rankStats = nil
};
return {
	LeaderboardReducer = function(p1, p2)
		local v1 = nil;
		if p1 == nil then
			p1 = u1;
		end;
		local v2 = {};
		for v3, v4 in pairs(p1) do
			v2[v3] = v4;
		end;
		v1 = v2;
		local l__type__5 = p2.type;
		if l__type__5 == "UpdateAllLeaderboards" then
			v1.leaderboards = p2.leaderboards;
			return v1;
		end;
		if l__type__5 == "UpdateLeaderboard" then
			v1.leaderboards[p2.leaderboard] = p2.data;
			return v1;
		end;
		if l__type__5 ~= "SetStats" then
			return v1;
		end;
		v1.globalStats = p2.globalStats;
		v1.queues = p2.queues;
		v1.rankStats = p2.rankStats;
		return v1;
	end
};
