-- Script Hash: aae60ed02c38823339273b99962652efac0595d1c67ef66cb056fb6b05982bdc98e576be15b6a794788eb7ad9d84ed2a
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "MobileSwordButtonPressedEvent";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1, p2)
	p1.state = p2;
end;
return {
	MobileSwordButtonPressedEvent = v1
};
