-- Script Hash: f53eea2c32e0e9bd177ea203c3d9350ab23f3b581d8e0da0931c31349b87c41e692a384ad1ff0acd276cb221eba64d58
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out);
local l__PrefabBlockHandler__3 = v2.PrefabBlockHandler;
local v4 = setmetatable({}, {
	__tostring = function()
		return "TeslaTrapBlockHandler";
	end, 
	__index = l__PrefabBlockHandler__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__PrefabBlockHandler__3;
function v4.constructor(p1, ...)
	u1.constructor(p1, ...);
end;
function v4.getPlacementPositions(p2, p3, p4)
	return { p3, p3 + Vector3.new(0, 1, 0) };
end;
local l__BlockEngine__2 = v2.BlockEngine;
function v4.getContainedPositions(p5, p6)
	local v6 = l__BlockEngine__2:getBlockPosition(p6.Position);
	return { v6, v6 + Vector3.new(0, 1, 0) };
end;
u1 = {
	TeslaTrapBlockHandler = v4
};
return l__PrefabBlockHandler__3;
