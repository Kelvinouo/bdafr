-- Decompiled with the Synapse X Luau decompiler.

return {
	LEADERBOARD_REFRESH_INTERVAL = 300, 
	LEADERBOARD_DEFAULT_BOARD = "RankPoints", 
	LeaderboardMeta = {
		RankPoints = {
			displayName = "Ranked Queue", 
			description = "Players with the highest Rank Points", 
			maxUsersDisplayed = 10, 
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
