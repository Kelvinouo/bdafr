-- Script Hash: 8a4906fa5d15a5b18d350df237db9df528c8da77054f351fcc752e9a8b828aa7d60fc015aef233e66d7f2136ef12469f
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
