
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CancellableEvent__2 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).CancellableEvent;
local v3 = setmetatable({}, {
	__tostring = function()
		return "ProjectileLaunchedEvent";
	end, 
	__index = l__CancellableEvent__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__CancellableEvent__2;
function v3.constructor(p1, p2, p3, p4, p5, p6)
	u1.constructor(p1);
	p1.projectileType = p2;
	p1.projectile = p3;
	p1.launchVelocity = p4;
	p1.origin = p5;
	p1.shooter = p6;
end;
local l__Players__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function v3.isLocalShooter(p7)
	local v5 = false;
	if p7.shooter ~= nil then
		v5 = p7.shooter == l__Players__2.LocalPlayer.Character;
	end;
	return v5;
end;
u1 = {
	ProjectileLaunchedEvent = v3
};
return l__CancellableEvent__2;

