-- Script Hash: 8bc1e6ee8236228be4cef158b0b62fd0ace18f6a65d19f979c7c4170fb7ec0f2ed25bd7dcafc865b20959987eb38ba3f
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CancellableEvent__2 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).CancellableEvent;
local v3 = setmetatable({}, {
	__tostring = function()
		return "MobileSwordButtonPressedEvent";
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
	p1.state = p2;
end;
u1 = {
	MobileSwordButtonPressedEvent = v3
};
return l__CancellableEvent__2;
