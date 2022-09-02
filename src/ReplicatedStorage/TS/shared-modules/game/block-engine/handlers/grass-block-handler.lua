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
function v3.constructor(p1, ...)
	l__GreedyBlockHandler__2.constructor(p1, ...);
end;
function v3.createFace(p2, p3, p4, p5)
	return l__GreedyBlockHandler__2.createFace(p2, p3, p4, p5);
end;
return {
	GrassBlockHandler = v3
};
