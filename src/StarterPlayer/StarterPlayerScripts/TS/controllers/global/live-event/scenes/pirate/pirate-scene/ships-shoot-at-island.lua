-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {
	name = "Ships shoot at island", 
	event = "Heartbeat"
};
local l__PirateSceneTimestamps__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;
local u2 = Random.new();
local l__createCannonball__3 = v1.import(script, script.Parent, "modules", "create-cannonball").createCannonball;
function v2.func(p1, p2, p3)
	local v3 = Vector3.new(38, 293.05, 302);
	if p1.elapsedEventTime < l__PirateSceneTimestamps__1.PreparationEnds or l__PirateSceneTimestamps__1.ShipGetShotDown < p1.elapsedEventTime then
		return nil;
	end;
	local v4 = p2:get("ships");
	if v4 ~= nil then
		v4 = v4.ship1;
	end;
	if v4 == nil then
		return nil;
	end;
	if p2:get("nextFireShot") == nil then
		p2:set("nextFireShot", os.clock() + 5);
		return nil;
	end;
	if os.clock() < p2:get("nextFireShot") then
		return nil;
	end;
	p2:set("nextFireShot", os.clock() + u2:NextNumber(0, 3));
	l__createCannonball__3({
		origin = v4.cframe.Position, 
		goal = v3 + Vector3.new(u2:NextNumber(-200, 200), 0, u2:NextNumber(-200, 200))
	});
end;
return {
	ShipsShootAtIsland = v2
};
