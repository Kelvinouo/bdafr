-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CancellableEvent__2 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).CancellableEvent;
local v3 = setmetatable({}, {
	__tostring = function()
		return "ProjectileHitEvent";
	end, 
	__index = l__CancellableEvent__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local l__ProjectileMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-meta").ProjectileMeta;
function v3.constructor(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11)
	l__CancellableEvent__2.constructor(p1);
	p1.shooter = p2;
	p1.projectileType = p3;
	p1.projectileModel = p4;
	p1.projectileRefId = p5;
	p1.projectileSource = p6;
	p1.hitData = p7;
	p1.hitEntity = p8;
	p1.chargePercent = p9;
	p1.projectileDamageMult = p10;
	p1.metadata = p11;
	p1.projectileMeta = l__ProjectileMeta__1[p3];
end;
return {
	ProjectileHitEvent = v3
};
