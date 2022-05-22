-- Script Hash: a17784d43b686ae6889f16a02c1429086f62fff25da801f003ebf92f6ecb655df4c0d7a2998e960429bb93c3b9f0bc15
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "ViewModelItemAddedEvent";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1, p2, p3)
	p1.item = p2;
	p1.heldItemMaid = p3;
end;
return {
	ViewModelItemAddedEvent = v1
};
