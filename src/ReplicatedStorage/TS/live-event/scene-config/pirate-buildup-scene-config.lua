-- Decompiled with the Synapse X Luau decompiler.

return {
	pirateBuildupSceneConfig = {
		sceneName = "pirate buildup scene", 
		timeConfig = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "live-event-system").TimeConfig.betweenDates({
			startDate = DateTime.fromUniversalTime(2022, 8, 12, 2, 0, 0), 
			endDate = DateTime.fromUniversalTime(2022, 8, 26, 20, 0, 0)
		})
	}
};
