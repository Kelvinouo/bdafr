-- Script Hash: ab234868f4f3062dc974e1688a2aac7262e092eaae8fb4063ce8e3165943bc0b91bfee213de123303e036e5f44eb3673
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "LocalProjectileImpactEvent";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1, p2, p3, p4, p5)
	p1.projectile = p2;
	p1.hitPosition = p3;
	p1.hitEntity = p4;
	p1.hitPart = p5;
end;
return {
	LocalProjectileImpactEvent = v1
};
