-- Script Hash: e5f9630b1fa393c1b9c3facc05fcf40798c988517a5e44c02f9d0d9657d3a1e5f140f172cf6b2f607977102057ff2eca
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "GroundTouchEvent";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1, p2, p3)
	p1.landingBlock = p2;
	p1.velocity = p3;
end;
return {
	GroundTouchEvent = v1
};
