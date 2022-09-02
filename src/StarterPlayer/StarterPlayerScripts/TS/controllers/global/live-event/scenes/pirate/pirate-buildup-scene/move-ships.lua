-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {
	name = "Move ships", 
	event = "Heartbeat"
};
local l__DeviceUtil__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).DeviceUtil;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__PlaceUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
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
	if l__PlaceUtil__3.isGameServer() then
		local v6 = 150;
	else
		v6 = 500;
	end;
	local v7 = Vector3.new(v3.X, v6, v3.Z);
	local v8 = p2:get("ships");
	if v8 == nil then
		return nil;
	end;
	if p1.chainInfo ~= nil then
		local v9 = p1.chainInfo.stageInChain;
	else
		v9 = 0;
	end;
	for v10, v11 in pairs(v8) do
		if v9 > 0 then
			local v12 = p1.chainInfo;
			if v12 ~= nil then
				v12 = v12.length1;
			end;
			local v13 = v12;
			if v13 == nil then
				v13 = 0;
			end;
			local v14 = v13 + p1.elapsedEventTime;
		else
			v14 = p1.elapsedEventTime;
		end;
		local v15 = v14 + v11.timeOffset;
		local l__seed__16 = v11.seed;
		local v17 = CFrame.new(math.noise(v15 / 15, 0, l__seed__16) * 3, math.noise(v15 / 15, 0, -l__seed__16) * 10, 0);
		local v18 = v11.radiusX + math.noise(v15 / 40, l__seed__16) * 8;
		local v19 = v11.radiusY + math.noise(v15 / 40, -l__seed__16 + -l__seed__16) * 8;
		v11.cframe = CFrame.lookAt(v7 + Vector3.new(math.cos(v15 / 60) * v18, v11.heightOffset, math.sin(v15 / 60) * v19), CFrame.new(v7 + Vector3.new(math.cos((v15 + 1) / 60) * v18, v11.heightOffset, math.sin((v15 + 1) / 60) * v19)).Position) * v17 * CFrame.Angles(math.noise(v15 / 15, 0, -l__seed__16) * 0.1 + math.sin(v15 / 1.8) * 0.05, math.noise(v15 / 15, 0, l__seed__16) * 1, math.noise(v15 / 15, 0, l__seed__16) * 0.4);
	end;
	p2:set("ships", v8);
end;
return {
	MoveShipsBehavior = v2
};
