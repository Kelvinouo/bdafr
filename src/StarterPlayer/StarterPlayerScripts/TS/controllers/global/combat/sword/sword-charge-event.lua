-- Script Hash: 1f90fddcd7cf47e50144a899ce5df6bacf9945ab99148dcf5bc977f5f926c2fed9e264b7204ff180da111ffb4d2d0054
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CancellableEvent__2 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).CancellableEvent;
local v3 = setmetatable({}, {
	__tostring = function()
		return "SwordChargeEvent";
	end, 
	__index = l__CancellableEvent__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__CancellableEvent__2;
function v3.constructor(p1, p2, p3)
	u1.constructor(p1);
	p1.chargeState = p2;
	p1.itemType = p3;
end;
u1 = {
	SwordChargeEvent = v3
};
return l__CancellableEvent__2;
