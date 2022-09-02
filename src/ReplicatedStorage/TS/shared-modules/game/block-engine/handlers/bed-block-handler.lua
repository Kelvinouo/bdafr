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
function v4.constructor(p1, ...)
	l__PrefabBlockHandler__3.constructor(p1, ...);
end;
local l__ColorUtil__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
function v4.place(p2, p3, p4)
	local v6 = l__PrefabBlockHandler__3.place(p2, p3, p4);
	v6:FindFirstChild("Covers").Color = l__ColorUtil__1.hexColor(p4);
	return v6;
end;
local l__BlockEngine__2 = v2.BlockEngine;
function v4.getContainedPositions(p5, p6)
	local v7 = l__BlockEngine__2:getBlockPosition(p6.Position);
	return { v7, v7 + Vector3.new(0, 0, 1) };
end;
return {
	BedBlockHandler = v4
};
