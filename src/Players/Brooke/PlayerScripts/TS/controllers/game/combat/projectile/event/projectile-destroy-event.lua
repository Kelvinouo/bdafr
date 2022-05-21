-- Script Hash: 495f0d7014e9f464fddb402921d918009d9450a92f996ffb092dadcccd7860fb56bd422de81e8ab5aaa71d74e3ca78e6
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CancellableEvent__2 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).CancellableEvent;
local v3 = setmetatable({}, {
	__tostring = function()
		return "ProjectileDestroyEvent";
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
	p1.projectileType = p2;
	p1.projectile = p3;
end;
u1 = {
	ProjectileDestroyEvent = v3
};
return l__CancellableEvent__2;
