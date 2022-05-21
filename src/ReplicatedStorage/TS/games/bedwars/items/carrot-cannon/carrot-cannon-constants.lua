-- Script Hash: c7b8c31f11f2e2b22ed80340968b6a6fa8ae4c3830a7d9d64433874370e4b1183fbe96caf3febaea6d6a1a6bf60fa7a8
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "CarrotCannonConstants";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1)

end;
v1.COOLDOWN = 1;
return {
	CarrotCannonConstants = v1
};
