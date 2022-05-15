
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__GreedyBlockHandler__2 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).GreedyBlockHandler;
local v3 = setmetatable({}, {
	__tostring = function()
		return "GrassBlockHandler";
	end, 
	__index = l__GreedyBlockHandler__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__GreedyBlockHandler__2;
function v3.constructor(p1, ...)
	u1.constructor(p1, ...);
end;
function v3.createFace(p2, p3, p4, p5)
	return u1.createFace(p2, p3, p4, p5);
end;
u1 = {
	GrassBlockHandler = v3
};
return l__GreedyBlockHandler__2;

