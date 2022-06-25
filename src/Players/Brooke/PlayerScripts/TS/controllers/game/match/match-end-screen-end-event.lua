-- Script Hash: eb8fb039ec75ca06897a8bca5045e5fca45ece518647c7cb32927078b6df6f84135e7b333a438be0967a21683a890a19
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "MatchEndScreenEndEvent";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1, p2)
	p1.matchEndScreenType = p2;
end;
return {
	MatchEndScreenEndEvent = v1
};
