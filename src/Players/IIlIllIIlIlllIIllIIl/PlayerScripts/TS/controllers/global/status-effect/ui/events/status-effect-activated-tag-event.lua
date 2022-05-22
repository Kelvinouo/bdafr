-- Script Hash: 54569d570aca945ef7fac6365df9630b9d12e7782c6092760ae206077ef173f09a7e56f6815d48379ab9f7066a1a55c0
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "StatusEffectActivatedTagEvent";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1, p2, p3)
	p1.statusEffect = p2;
	p1.player = p3;
end;
return {
	StatusEffectActivatedTagEvent = v1
};
