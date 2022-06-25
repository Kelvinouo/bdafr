-- Script Hash: c9811794f22881889e3248eba547ab84411131588f43ac03a2ce00a57c16e573886466119ef4a327d25e05c81f4a5f5e
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "StatusEffectActivatedHudEvent";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1, p2)
	p1.statusEffect = p2;
end;
return {
	StatusEffectActivatedHudEvent = v1
};
