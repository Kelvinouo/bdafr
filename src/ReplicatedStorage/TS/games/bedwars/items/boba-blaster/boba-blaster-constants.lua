-- Script Hash: 0c6df97675ef4139cd47b0b6727a9b21859c149e1f4fa91dab2d26c8fbd2dd0adfc9a25c14da420868d8c0c022cda8af
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "BobaBlasterConstants";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1)

end;
v1.EXPLOSION_TIME_SECONDS = 3;
return {
	BobaBlasterConstants = v1
};
