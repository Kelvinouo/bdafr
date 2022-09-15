-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {
	name = "Ships fly away", 
	priority = 100, 
	event = "Heartbeat"
};
local l__DeviceUtil__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).DeviceUtil;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__PirateSceneTimestamps__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;
function v2.func(p1, p2, p3)
	if l__DeviceUtil__1.isHoarceKat() then
		local v3 = Vector3.new();
	else
		local v4 = l__KnitClient__2.Controllers.MapController:getCFrameWithoutYield("center");
		if v4 ~= nil then
			v4 = v4.Position;
		end;
		local v5 = v4;
		if v5 == nil then
			v5 = Vector3.new();
		end;
		v3 = v5;
	end;
	local v6 = Vector3.new(v3.X, 150, v3.Z);
	local v7 = p2:get("ships");
	if v7 == nil then
		return nil;
	end;
	if l__PirateSceneTimestamps__3.ShipsDisappear < p1.elapsedEventTime then
		return nil;
	end;
	if p1.chainInfo ~= nil then
		local v8 = p1.chainInfo.stageInChain;
	else
		v8 = 0;
	end;
	for v9, v10 in pairs(v7) do
		if v8 > 0 then
			local v11 = p1.chainInfo;
			if v11 ~= nil then
				v11 = v11.length1;
			end;
			local v12 = v11;
			if v12 == nil then
				v12 = 0;
			end;
			local v13 = v12 + p1.elapsedEventTime;
		else
			v13 = p1.elapsedEventTime;
		end;
		local v14 = v13 + v10.timeOffset;
		local l__seed__15 = v10.seed;
		local v16 = CFrame.new(math.noise(v14 / 15, 0, l__seed__15) * 3, math.noise(v14 / 15, 0, -l__seed__15) * 10, 0);
		local v17 = v10.radiusX + math.noise(v14 / 40, l__seed__15) * 8;
		local v18 = v10.radiusY + math.noise(v14 / 40, -l__seed__15 + -l__seed__15) * 8;
		local l__Unit__19 = (v10.cframe.Position - v6).Unit;
		v10.cframe = CFrame.lookAt(v6 + Vector3.new(math.cos(v14 / 60) * v17, v10.heightOffset, math.sin(v14 / 60) * v18) + l__Unit__19 * (p1.elapsedEventTime * 100), CFrame.new(v6 + Vector3.new(math.cos((v14 + 1) / 60) * v17, v10.heightOffset, math.sin((v14 + 1) / 60) * v18) + l__Unit__19 * (p1.elapsedEventTime * 100) + l__Unit__19 * (p1.elapsedEventTime * 10)).Position) * v16 * CFrame.Angles(math.noise(v14 / 15, 0, -l__seed__15) * 0.1 + math.sin(v14 / 1.8) * 0.05, math.noise(v14 / 15, 0, l__seed__15) * 1, math.noise(v14 / 15, 0, l__seed__15) * 0.4);
	end;
	p2:set("ships", v7);
end;
return {
	ShipsFlyAwayBehavior = v2
};
