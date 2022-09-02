-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out);
local l__PrefabBlockHandler__3 = v2.PrefabBlockHandler;
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v5 = setmetatable({}, {
	__tostring = function()
		return "CameraTurretBlockHandler";
	end, 
	__index = l__PrefabBlockHandler__3
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
function v5.constructor(p1, ...)
	l__PrefabBlockHandler__3.constructor(p1, ...);
end;
local l__ReplicatedStorage__1 = v4.ReplicatedStorage;
local l__RunService__2 = v4.RunService;
local l__PhysicsService__3 = v4.PhysicsService;
function v5.createNewInstance(p2, p3)
	if p3 == 1 then
		local v7 = l__ReplicatedStorage__1.Assets.Blocks:FindFirstChild("camera_turret_lunar");
		if v7 ~= nil then
			v7 = v7:FindFirstChild("Root");
			if v7 ~= nil then
				v7 = v7:Clone();
			end;
		end;
		if v7 then
			v7.Name = p2:getBlockType();
			if l__RunService__2:IsServer() and l__RunService__2:IsRunning() then
				l__PhysicsService__3:SetPartCollisionGroup(v7, "Blocks");
			end;
			return v7;
		end;
	end;
	return l__PrefabBlockHandler__3.createNewInstance(p2, p3);
end;
function v5.getPlacementPositions(p4, p5, p6)
	return { p5, p5 + Vector3.new(0, 1, 0) };
end;
local l__BlockEngine__4 = v2.BlockEngine;
function v5.getContainedPositions(p7, p8)
	local v8 = l__BlockEngine__4:getBlockPosition(p8.Position);
	return { v8, v8 + Vector3.new(0, 1, 0) };
end;
return {
	CameraTurretBlockHandler = v5
};
