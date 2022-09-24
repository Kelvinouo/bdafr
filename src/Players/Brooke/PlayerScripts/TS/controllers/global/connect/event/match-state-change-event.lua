-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "MatchStateChangeEvent";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1, p2, p3, p4)
	p1.matchState = p2;
	p1.startTime = p3;
	p1.customMatch = p4;
end;
return {
	MatchStateChangeEvent = v1
};
