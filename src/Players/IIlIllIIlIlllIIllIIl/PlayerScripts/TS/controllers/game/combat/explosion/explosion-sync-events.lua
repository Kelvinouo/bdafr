-- Script Hash: 23c8ecea6bd10e7e804bb1b0683a15ffe3adb2b423509c057d67e7b0deb9c2661f504f9de5234e825ccccf40c51d0fd4
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "ExplosionEffectEvent";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1, p2, p3)
	p1.position = p2;
	p1.explosionType = p3;
end;
return {
	ExplosionEffectEvent = v1
};
