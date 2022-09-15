-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v3 = {
	name = "Create ships", 
	priority = 200, 
	event = "Heartbeat"
};
local l__RunService__1 = v2.RunService;
local l__ReplicatedStorage__2 = v2.ReplicatedStorage;
local l__Workspace__3 = v2.Workspace;
local l__setupShipAnim__4 = v1.import(script, script.Parent.Parent, "pirate-scene", "modules", "setup-ship-anim").setupShipAnim;
local l__PirateSceneTimestamps__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;
function v3.func(p1, p2, p3)
	if p2:get("shipsMayShow") == nil or l__RunService__1:IsStudio() then
		local v4 = p1.elapsedEventTime / 3600;
		p2:set("shipsMayShow", v4 % (-3 * (v4 / (p1.totalLength / 3600)) ^ 2 + 3 + 1 + math.noise(v4 * 0.5) * 0.05) < 1);
	end;
	if p1.chainInfo == nil then
		local v5 = false;
	else
		v5 = p1.chainInfo.stageInChain > 0;
	end;
	local v6 = true;
	if v5 ~= true then
		v6 = p2:get("shipsMayShow") == true;
	end;
	local v7 = p2:get("ships");
	if v7 ~= nil then
		if v6 then
			if v7.ship1 == nil then
				local v8 = l__ReplicatedStorage__2.Assets.Misc.PirateShip:Clone();
				v8.Parent = l__Workspace__3;
				v7.ship1 = {
					instance = v8, 
					cframe = CFrame.new(), 
					timeOffset = 0, 
					seed = -837992, 
					heightOffset = 70, 
					radiusX = 1700, 
					radiusY = 2000
				};
				l__setupShipAnim__4(v8):andThen(function(p4)
					local v9 = v7;
					if v9 ~= nil then
						v9 = v9.ship1;
					end;
					if v9 then
						v9.animationTrack = p4;
						if v7 ~= nil then
							v7.ship1 = v9;
						end;
					end;
				end);
			end;
		else
			v7.ship1 = nil;
		end;
		if v5 == true then
			local v10 = p1.elapsedEventTime < l__PirateSceneTimestamps__5.ShipsDisappear;
		else
			v10 = false;
			if p1.totalLength * 0.3333333333333333 < p1.elapsedEventTime then
				v10 = v6;
			end;
		end;
		if v10 then
			if v7.ship2 == nil then
				local v11 = l__ReplicatedStorage__2.Assets.Misc.PirateShip:Clone();
				v11.Parent = l__Workspace__3;
				v7.ship2 = {
					instance = v11, 
					cframe = CFrame.new(), 
					timeOffset = 900, 
					seed = -713427, 
					heightOffset = 40, 
					radiusX = 1300, 
					radiusY = 1500
				};
				l__setupShipAnim__4(v11):andThen(function(p5)
					local v12 = v7;
					if v12 ~= nil then
						v12 = v12.ship2;
					end;
					if v12 then
						v12.animationTrack = p5;
						if v7 ~= nil then
							v7.ship2 = v12;
						end;
					end;
				end);
			end;
		else
			v7.ship2 = nil;
		end;
		if v5 == true then
			local v13 = p1.elapsedEventTime < l__PirateSceneTimestamps__5.ShipsDisappear;
		else
			v13 = false;
			if p1.totalLength * 0.7 < p1.elapsedEventTime then
				v13 = v6;
			end;
		end;
		if v13 then
			if v7.ship3 == nil then
				local v14 = l__ReplicatedStorage__2.Assets.Misc.PirateShip:Clone();
				v14.Parent = l__Workspace__3;
				v7.ship3 = {
					instance = v14, 
					cframe = CFrame.new(), 
					timeOffset = 980, 
					seed = 948074, 
					heightOffset = 0, 
					radiusX = 900, 
					radiusY = 900
				};
				l__setupShipAnim__4(v14):andThen(function(p6)
					local v15 = v7;
					if v15 ~= nil then
						v15 = v15.ship3;
					end;
					if v15 then
						v15.animationTrack = p6;
						if v7 ~= nil then
							v7.ship3 = v15;
						end;
					end;
				end);
			end;
		else
			v7.ship3 = nil;
		end;
		p2:set("ships", v7);
	end;
end;
return {
	CreateShipsBehavior = v3
};
