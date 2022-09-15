-- Decompiled with the Synapse X Luau decompiler.

local v1 = {
	name = "Ship pops up on island", 
	event = "Heartbeat", 
	priority = -30
};
local l__PirateSceneTimestamps__1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;
function v1.func(p1, p2, p3)
	if l__PirateSceneTimestamps__1.BigExplosionHit + 3 < p1.elapsedEventTime then
		local v2 = p2:get("ships");
		if v2 == nil then
			return nil;
		end;
		local l__bigShip1__3 = v2.bigShip1;
		local l__bigShip2__4 = v2.bigShip2;
		local l__bigShip3__5 = v2.bigShip3;
		if l__bigShip1__3 then
			l__bigShip1__3.cframe = CFrame.new(58.445, 395.882, 456.943) * CFrame.Angles(0, -1.3089969389957472, 0);
		end;
		if l__bigShip2__4 then
			l__bigShip2__4.cframe = CFrame.new(97.652, 388.882, 206.858) * CFrame.Angles(0, 0.7853981633974483, 0);
		end;
		if l__bigShip3__5 then
			l__bigShip3__5.cframe = CFrame.new(-141.835, 430.882, 293.584) * CFrame.Angles(0, -2.6179938779914944, 0);
		end;
		p2:set("ships", v2);
	end;
end;
return {
	ShipPopsUpOnIsland = v1
};
