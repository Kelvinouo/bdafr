-- Script Hash: 7f8698dd95c4decb06ca4e0b81b2fffcd541897043e5cfd79cee1ee43618335c02b3e7f13634c1bfa89eb0121a4d8d6f
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "ClientKitUnequipEvent";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1, p2, p3)
	p1.player = p2;
	p1.kit = p3;
end;
return {
	ClientKitUnequipEvent = v1
};
