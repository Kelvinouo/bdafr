-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {
	name = "music", 
	event = "Heartbeat"
};
local l__PirateSceneTimestamps__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;
local l__SoundManager__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v2.func(p1, p2, p3)
	if p1.elapsedEventTime < l__PirateSceneTimestamps__1.ShipReappears then
		return nil;
	end;
	if not p2:get("musicTrack") then
		p2:set("musicTrack", l__SoundManager__2:playSound(l__GameSound__3.PIRATE_EVENT_MUSIC));
	end;
	local v3 = p2:get("musicTrack");
	if v3 then
		local v4 = p1.elapsedEventTime - l__PirateSceneTimestamps__1.ShipReappears;
		if math.abs(v3.TimePosition - v4) > 0.25 then
			print("Syncing time position.");
			v3.TimePosition = v4;
		end;
	end;
end;
return {
	PirateMusic = v2
};
