-- Script Hash: f3262eda82c1800df0fc25ad03ce5a900673cc2fcb69b84cec896ed0dbfd505a3bbf617045241ea27ffa28102066e838
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "WindWalkerOrbUpdateEvent";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1, p2)
	p1.orbCount = p2;
end;
return {
	WindWalkerOrbUpdateEvent = v1
};
