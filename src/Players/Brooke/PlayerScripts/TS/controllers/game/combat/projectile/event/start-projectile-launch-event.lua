-- Script Hash: 7b1da8477311b0ea6c27c7a7845a6981a5bd1be3b068a03f6bf4d35ee621913eb106cd4045c8fa1253d2bb8365b51677
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CancellableEvent__2 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).CancellableEvent;
local v3 = setmetatable({}, {
	__tostring = function()
		return "StartProjectileLaunchEvent";
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
	p1.projectileSource = p3;
end;
u1 = {
	StartProjectileLaunchEvent = v3
};
return l__CancellableEvent__2;
