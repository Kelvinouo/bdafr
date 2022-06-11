-- Script Hash: 94fac06eb1d8b287ea0800c1a77fb2735e9e0e9e06d8248d31c89aadb9a94b5c3db1c13e0c169bf75465e140fc3880bb
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "WorldChangeEvent";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1, p2, p3)
	p1.toWorldId = p2;
	p1.fromWorldId = p3;
end;
return {
	WorldChangeEvent = v1
};
