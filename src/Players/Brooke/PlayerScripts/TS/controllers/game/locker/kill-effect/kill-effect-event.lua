-- Script Hash: 057b80a8f84d5753ca2fe8ef348126d22c962cb0163048e9fa3fb74c88741ec009062fe5b55463cb919f173bd9539a7d
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CancellableEvent__2 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).CancellableEvent;
local v3 = setmetatable({}, {
	__tostring = function()
		return "KillEffectEvent";
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
	p1.entityInstance = p2;
	p1.fromEntity = p3;
end;
u1 = {
	KillEffectEvent = v3
};
return l__CancellableEvent__2;
