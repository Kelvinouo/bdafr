-- Script Hash: 375124aea65909df8de6db58434a24f5bae30c9c303d6623d06b6c2ecc25e19f28efa7976148c80321a0b8817c90a509
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CancellableEvent__2 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).CancellableEvent;
local v3 = setmetatable({}, {
	__tostring = function()
		return "SwordAttackEvent";
	end, 
	__index = l__CancellableEvent__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__CancellableEvent__2;
function v3.constructor(p1, p2, p3, p4)
	u1.constructor(p1);
	p1.fromPlayer = p2;
	p1.weapon = p3;
	p1.chargedAttack = p4;
end;
u1 = {
	SwordAttackEvent = v3
};
return l__CancellableEvent__2;
