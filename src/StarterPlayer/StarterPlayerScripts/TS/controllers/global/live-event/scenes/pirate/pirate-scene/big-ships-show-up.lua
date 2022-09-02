-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v3 = {
	name = "Big ships show up", 
	event = "Heartbeat", 
	priority = -20
};
local l__PirateSceneTimestamps__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;
local u2 = { "bigShip1", "bigShip2", "bigShip3" };
local l__ReplicatedStorage__3 = v2.ReplicatedStorage;
local l__Workspace__4 = v2.Workspace;
local l__setupShipAnim__5 = v1.import(script, script.Parent, "modules", "setup-ship-anim").setupShipAnim;
local l__Linear__6 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).Linear;
local l__SoundManager__7 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v3.func(p1, p2, p3)
	local v4 = p2:get("ships");
	if v4 == nil then
		return nil;
	end;
	if l__PirateSceneTimestamps__1.CelebrationEnds < p1.elapsedEventTime then
		local v5 = false;
		for v6, v7 in pairs(u2) do
			local v8 = v4[v7];
			if not v8 then
				v5 = true;
				if v6 == 2 then
					local v9 = l__ReplicatedStorage__3.Assets.Misc.RoyalPirateShip:Clone();
				else
					v9 = l__ReplicatedStorage__3.Assets.Misc.PirateShip:Clone();
				end;
				v9.Parent = l__Workspace__4;
				v4[v7] = {
					instance = v9, 
					cframe = CFrame.new(), 
					timeOffset = 980, 
					seed = 948074, 
					heightOffset = 0, 
					radiusX = 900, 
					radiusY = 900
				};
				l__setupShipAnim__5(v9);
			else
				v8.cframe = CFrame.new(Vector3.new(-600 + 300 * v6, 500, (l__Linear__6(math.clamp(l__Linear__6(p1.elapsedEventTime - l__PirateSceneTimestamps__1.CelebrationEnds, 0, 1, l__PirateSceneTimestamps__1.BigShipsArrive - l__PirateSceneTimestamps__1.CelebrationEnds), 0, 1), -1200, 400, 1)))) * CFrame.Angles(0, 3.141592653589793, 0);
			end;
		end;
		if v5 then
			l__SoundManager__7:playSound(l__GameSound__8.PIRATE_EVENT_MOTHERSHIP, {
				volumeMultiplier = 3, 
				position = Vector3.new(17, 700, -1200), 
				rollOffMaxDistance = 1000000, 
				rollOffMinDistsance = 1000
			});
		end;
	else
		local v10, v11, v12 = ipairs(u2);
		while true do
			v10(v11, v12);
			if not v10 then
				break;
			end;
			v12 = v10;
			v4[v11] = nil;		
		end;
	end;
	p2:set("ships", v4);
end;
return {
	BigShipsShowUp = v3
};
