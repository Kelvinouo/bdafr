-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__RankUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-util").RankUtil;
return {
	LEADERBOARD_REFRESH_INTERVAL = 300, 
	LEADERBOARD_DEFAULT_BOARD = l__RankUtil__2.activeRankMeta.leaderboard, 
	LeaderboardMeta = {
		[l__RankUtil__2.activeRankMeta.leaderboard] = {
			displayName = "Ranked Season " .. tostring(v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils.BATTLE_PASS_SEASON_NUMBER), 
			description = "Players with the highest Rank Points", 
			maxUsersDisplayed = 100, 
			metric = "RP", 
			statName = "rank"
		}, 
		Wins = {
			displayName = "Monthly Wins", 
			description = "Players with the highest number of wins this month", 
			maxUsersDisplayed = 10, 
			metric = "wins", 
			statName = "wins"
		}
	}
};
