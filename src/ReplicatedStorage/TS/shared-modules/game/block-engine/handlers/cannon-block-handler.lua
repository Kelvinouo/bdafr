
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out);
local l__PrefabBlockHandler__3 = v2.PrefabBlockHandler;
local v4 = setmetatable({}, {
	__tostring = function()
		return "CannonBlockHandler";
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
function v4.place(p2, p3, p4)
	local v6 = u1.place(p2, p3, p4);
	v6.CanCollide = false;
	for v7, v8 in ipairs(v6:GetDescendants()) do
		if v8:IsA("BasePart") then
			v8.CanCollide = false;
		end;
	end;
	return v6;
end;
local l__BlockEngine__2 = v2.BlockEngine;
function v4.getContainedPositions(p5, p6)
	return { (l__BlockEngine__2:getBlockPosition(p6.Position)) };
end;
u1 = {
	CannonBlockHandler = v4
};
return l__PrefabBlockHandler__3;

