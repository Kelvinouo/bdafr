-- Script Hash: 80e335020ea20450667c0d73854e69f5615a361a8e303870e691596e782732535f3efe96c87576f9e77703a0c21f8d5c
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CancellableEvent__2 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).CancellableEvent;
local v3 = setmetatable({}, {
	__tostring = function()
		return "PerformCombatEvent";
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
	PerformCombatEvent = v3
};
return l__CancellableEvent__2;
