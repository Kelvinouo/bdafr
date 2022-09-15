-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {
	name = "Spawn fireworks", 
	event = "Heartbeat"
};
local l__PirateSceneTimestamps__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;
local u2 = Random.new();
local l__RandomUtil__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).RandomUtil;
local l__FireworkType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
local l__KnitClient__5 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
function v2.func(p1, p2, p3)
	if l__PirateSceneTimestamps__1.CelebrationStarts < p1.elapsedEventTime and p1.elapsedEventTime < l__PirateSceneTimestamps__1.CelebrationEnds then
		local v3 = p2:get("nextFireworkLaunch");
		if v3 == nil then
			p2:set("nextFireworkLaunch", os.clock() + 0.1);
			return nil;
		end;
		if v3 < os.clock() then
			p2:set("nextFireworkLaunch", os.clock() + 0.15);
			l__KnitClient__5.Controllers.FireworkController:playFireworkEffect(Vector3.new(38, 293.05, 302) + Vector3.new(u2:NextNumber(-200, 200), 30 + u2:NextNumber(-10, 10), u2:NextNumber(-200, 200)), (l__RandomUtil__3.fromList(l__FireworkType__4.HEART, l__FireworkType__4.NORMAL, l__FireworkType__4.SPARKS)));
		end;
	end;
end;
return {
	SpawnFireworks = v2
};
