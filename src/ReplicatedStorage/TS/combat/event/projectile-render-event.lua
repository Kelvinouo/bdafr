-- Script Hash: b91d1ca14294b18d07b8573e1ee072e4bc48b7b9e1a3c6cca823eb6b48e240326d38394cedc240e6e7ec13755faadf12
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "ProjectileRenderEvent";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1, p2, p3, p4, p5, p6)
	p1.projectile = p2;
	p1.projectileMeta = p3;
	p1.cframe = p4;
	p1.totalTime = p5;
	p1.deltaTime = p6;
end;
return {
	ProjectileRenderEvent = v1
};
