-- Script Hash: fb0001e9beec699ab1b688d39f10c89899b38c6131b9b70881915551a6c1ce67e61f043556c209a51e2c22dbb30c154c
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CancellableEvent__2 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).CancellableEvent;
local v3 = setmetatable({}, {
	__tostring = function()
		return "BeginProjectileTargetingEvent";
	end, 
	__index = l__CancellableEvent__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__CancellableEvent__2;
function v3.constructor(p1, p2)
	u1.constructor(p1);
	p1.handItem = p2;
end;
u1 = {
	BeginProjectileTargetingEvent = v3
};
return l__CancellableEvent__2;
