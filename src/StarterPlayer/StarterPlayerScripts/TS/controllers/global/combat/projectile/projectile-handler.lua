
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "ProjectileHandler";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1, p2, p3, p4, p5, p6, p7, p8)
	if p7 == nil then
		p7 = Vector3.new(0, 2, 0);
	end;
	if p8 == nil then
		p8 = 0;
	end;
	p1.gravityMultiplier = p2;
	p1.velocityMultiplier = p3;
	p1.projectile = p4;
	p1.inputInfo = p5;
	p1.targetPoint = p6;
	p1.fromPositionOffset = p7;
	p1.drawDurationSeconds = p8;
end;
local l__ProjectileMeta__1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-meta").ProjectileMeta;
function v1.getProjectileMeta(p9)
	return l__ProjectileMeta__1[p9.projectile];
end;
return {
	ProjectileHandler = v1
};

