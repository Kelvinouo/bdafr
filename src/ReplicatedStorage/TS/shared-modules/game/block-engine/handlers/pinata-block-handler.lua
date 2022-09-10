-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out);
local l__PrefabBlockHandler__3 = v2.PrefabBlockHandler;
local v4 = setmetatable({}, {
	__tostring = function()
		return "PinataBlockHandler";
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
function v4.getPlacementPositions(p2, p3, p4)
	return { p3 };
end;
local l__BlockEngine__1 = v2.BlockEngine;
function v4.getContainedPositions(p5, p6)
	return { (l__BlockEngine__1:getBlockPosition(p6.Position)) };
end;
return {
	PinataBlockHandler = v4
};
