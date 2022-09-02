-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
return {
	Scene = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "live-event-system", "scene").Scene, 
	SceneManager = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "live-event-system", "scene-manager").SceneManager, 
	TimeConfig = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "live-event-system", "time-config-variant").TimeConfig
};
