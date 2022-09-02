-- Decompiled with the Synapse X Luau decompiler.

local u1 = {
	leaderboards = {}, 
	globalStats = nil, 
	queues = {}, 
	rankStats = nil
};
return {
	LeaderboardReducer = function(p1, p2)
		if p1 == nil then
			p1 = u1;
		end;
		local v1 = {};
		for v2, v3 in pairs(p1) do
			v1[v2] = v3;
		end;
		local l__type__4 = p2.type;
		if l__type__4 == "UpdateAllLeaderboards" then
			v1.leaderboards = p2.leaderboards;
			return v1;
		end;
		if l__type__4 == "UpdateLeaderboard" then
			v1.leaderboards[p2.leaderboard] = p2.data;
			return v1;
		end;
		if l__type__4 ~= "SetStats" then
			return v1;
		end;
		v1.globalStats = p2.globalStats;
		v1.queues = p2.queues;
		v1.rankStats = p2.rankStats;
		return v1;
	end
};
