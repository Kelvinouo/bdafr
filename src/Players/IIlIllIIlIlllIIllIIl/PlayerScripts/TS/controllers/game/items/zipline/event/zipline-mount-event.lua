-- Script Hash: 89eb3a813fd12e723d50e2725621b6427051ccddae2072ce88b9377314b7e3b4885711928f104412fa5caca2758b0fa8
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CancellableEvent__2 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).CancellableEvent;
local v3 = setmetatable({}, {
	__tostring = function()
		return "ZiplineMountEvent";
	end, 
	__index = l__CancellableEvent__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__CancellableEvent__2;
function v3.constructor(p1)
	u1.constructor(p1);
end;
u1 = {
	ZiplineMountEvent = v3
};
return l__CancellableEvent__2;
