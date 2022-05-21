-- Script Hash: dfe570bb6141005a477c1e5028070d4349d72d98b2506aee014c35f8a41c6cdb04b23609428ea2c69e64120bc6159607
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CancellableEvent__2 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).CancellableEvent;
local v3 = setmetatable({}, {
	__tostring = function()
		return "DisasterBeganEvent";
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
	p1.disasterType = p2;
	p1.endTime = p3;
end;
u1 = {
	DisasterBeganEvent = v3
};
return l__CancellableEvent__2;
