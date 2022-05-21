-- Script Hash: dfb6987b1dbb61cb75bb43a15743d04fffdbe37670afd1d66a1540d62b6e027c81b7f8ad191db2171f589ceefd20976a
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out);
local l__PrefabBlockHandler__3 = v2.PrefabBlockHandler;
local v4 = setmetatable({}, {
	__tostring = function()
		return "BedBlockHandler";
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
local l__ColorUtil__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
function v4.place(p2, p3, p4)
	local v6 = u1.place(p2, p3, p4);
	v6:FindFirstChild("Covers").Color = l__ColorUtil__2.hexColor(p4);
	return v6;
end;
local l__BlockEngine__3 = v2.BlockEngine;
function v4.getContainedPositions(p5, p6)
	local v7 = l__BlockEngine__3:getBlockPosition(p6.Position);
	return { v7, v7 + Vector3.new(0, 0, 1) };
end;
u1 = {
	BedBlockHandler = v4
};
return l__PrefabBlockHandler__3;
