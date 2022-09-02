-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__QueueType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local l__RankCategory__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-category").RankCategory;
return {
	RankCategoryMeta = {
		[l__RankCategory__3.RANKED_S5] = {
			queueType = l__QueueType__2.BEDWARS_RANKED_S5, 
			leaderboard = "RankPoints_S5"
		}, 
		[l__RankCategory__3.RANKED_S4] = {
			queueType = l__QueueType__2.BEDWARS_RANKED_S5, 
			leaderboard = "RankPoints_S5"
		}, 
		[l__RankCategory__3.RANKED_BETA] = {
			queueType = l__QueueType__2.BEDWARS_RANKED_S5, 
			leaderboard = "RankPoints_S5"
		}
	}
};
