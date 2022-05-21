-- Script Hash: bb8c3df023ead3ed3734afe368de678d92bbd77614424f90c24345d0509a1334c26fafaa3bd322bbffab52e4dddc51e5
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CancellableEvent__2 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).CancellableEvent;
local v3 = setmetatable({}, {
	__tostring = function()
		return "SwordSwingEvent";
	end, 
	__index = l__CancellableEvent__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__CancellableEvent__2;
function v3.constructor(p1, ...)
	u1.constructor(p1, ...);
end;
u1 = {
	SwordSwingEvent = v3
};
return l__CancellableEvent__2;
