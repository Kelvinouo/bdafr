-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__GameSound__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
return {
	pirateSceneConfig = {
		sceneName = "pirate scene", 
		timeConfig = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "live-event-system").TimeConfig.betweenDates({
			startDate = DateTime.fromUniversalTime(2022, 8, 26, 20, 0, 0), 
			endDate = DateTime.fromUniversalTime(2022, 8, 26, 20, 3, 0)
		}), 
		preload = {
			sounds = { l__GameSound__2.BLUNDERBUSS_SHOOT, l__GameSound__2.PIRATE_EVENT_FIRST_ENTRY, l__GameSound__2.PIRATE_EVENT_MOTHERSHIP, l__GameSound__2.PIRATE_EVENT_MUSIC, l__GameSound__2.PIRATE_EVENT_THUNDER, l__GameSound__2.PIRATE_EVENT_SHIP_CRASH, l__GameSound__2.PIRATE_EVENT_SHIP_CREAK }
		}
	}
};
