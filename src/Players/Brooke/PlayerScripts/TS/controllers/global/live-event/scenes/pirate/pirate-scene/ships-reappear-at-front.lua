-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions"));
local v3 = {
	name = "Ships reappear at front", 
	event = "Heartbeat"
};
local l__PirateSceneTimestamps__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;
local l__CollectionService__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).CollectionService;
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "bezier");
local l__Linear__4 = v2.Linear;
local l__SoundManager__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__KnitClient__7 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "plasma").src);
local l__InQuart__9 = v2.InQuart;
function v3.func(p1, p2, p3)
	local v4 = p2:get("ships");
	if v4 == nil then
		return nil;
	end;
	if p1.elapsedEventTime < l__PirateSceneTimestamps__1.ShipReappears then
		return nil;
	end;
	if not p2:get("bezierCurve") then
		local v5 = l__CollectionService__2:GetTagged("pirate-ship-waypoint");
		table.sort(v5, function(p4, p5)
			local v6 = tonumber(p4.Name);
			if v6 == nil then
				v6 = 0;
			end;
			local v7 = tonumber(p5.Name);
			if v7 == nil then
				v7 = 0;
			end;
			return v6 < v7;
		end);
		local v8 = {};
		local v9 = 0;
		local v10, v11, v12 = ipairs(v5);
		while true do
			v10(v11, v12);
			if not v10 then
				break;
			end;
			if v11:IsA("BasePart") then
				local v13 = true;
			else
				v13 = false;
			end;
			if v13 == true then
				v9 = v9 + 1;
				v8[v9] = v11;
			end;		
		end;
		if #v8 < 2 then
			return nil;
		end;
		p2:set("bezierCurve", u3.new(unpack(v8)));
	end;
	local l__ship1__14 = v4.ship1;
	if l__ship1__14 == nil then
		return nil;
	end;
	local v15 = l__Linear__4(math.min(p1.elapsedEventTime, l__PirateSceneTimestamps__1.ShipGetShotDown), 0, 1, l__PirateSceneTimestamps__1.ShipGetShotDown + 10);
	if p1.elapsedEventTime < l__PirateSceneTimestamps__1.HouseExplodes then
		if not p2:get("bossBarMounted") then
			l__SoundManager__5:playSound(l__GameSound__6.PIRATE_EVENT_FIRST_ENTRY, {
				position = Vector3.new(17, 315.703, -300), 
				rollOffMinDistsance = 500, 
				rollOffMaxDistance = 100000
			});
			p2:set("bossBarMounted", true);
			l__KnitClient__7.Controllers.BossBarController:mountBossBar(1000, 1000);
		end;
	else
		l__KnitClient__7.Controllers.BossBarController:unmountBar();
	end;
	if l__PirateSceneTimestamps__1.ShipGetShotDown < p1.elapsedEventTime then
		local v16, v17 = u8.useState(nil);
		u8.useEffect(function()
			local v18 = {};
			local v19 = v16;
			if v19 ~= nil then
				v19 = v19.Position;
			end;
			v18.position = v19;
			v18.rollOffMaxDistance = 500;
			v18.rollOffMinDistsance = 300;
			l__SoundManager__5:playSound(l__GameSound__6.PIRATE_EVENT_SHIP_CREAK, v18);
		end);
		if v16 == nil then
			v17(l__ship1__14.cframe);
			return nil;
		end;
		local v20 = math.clamp(l__InQuart__9(p1.elapsedEventTime - l__PirateSceneTimestamps__1.ShipGetShotDown, 0, 1, l__PirateSceneTimestamps__1.HouseExplodes + 1.2 - l__PirateSceneTimestamps__1.ShipGetShotDown), 0, 1);
		if v20 < 0.88 then
			local v21 = Vector3.new(math.noise(-p1.elapsedEventTime * 50), math.noise(0, 0, p1.elapsedEventTime * 50), math.noise(0, 0, p1.elapsedEventTime * 50 + p1.elapsedEventTime * 50));
		else
			v21 = Vector3.new();
		end;
		local v22 = v16.Position:Lerp(Vector3.new(183.959, 320.427, 323.018) + v21 * 0.6, v20);
		l__ship1__14.cframe = CFrame.lookAt(v22, v22 + v16.LookVector:Lerp((Vector3.new(183.959, 345.427, 323.018) - Vector3.new(0, 30, 0) - v16.Position).Unit, v20 * 0.7));
	else
		local v23 = math.clamp(v15, 0, 1);
		local v24 = p2:get("bezierCurve"):CalculatePositionAt(v23);
		l__ship1__14.cframe = CFrame.lookAt(v24, v24 + p2:get("bezierCurve"):CalculateDerivativeAt(v23));
	end;
	p2:set("ships", v4);
end;
return {
	ShipsReappearAtFrontBehavior = v3
};
