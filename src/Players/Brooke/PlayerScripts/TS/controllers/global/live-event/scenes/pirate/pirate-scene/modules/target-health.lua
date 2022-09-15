-- Decompiled with the Synapse X Luau decompiler.

local l__PirateSceneTimestamps__1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;
return {
	getPirateShipTargetHealth = function(p1)
		return 1000 * math.clamp((l__PirateSceneTimestamps__1.ShipGetShotDown - p1) / (l__PirateSceneTimestamps__1.ShipGetShotDown - l__PirateSceneTimestamps__1.PreparationEnds), 0, 1);
	end
};
