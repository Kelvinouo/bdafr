-- Script Hash: 0fccc50f1262646578a5f996b550edeb7d0594545599e6e67a820f965c84951669213fc13c1636142a4260c618e46805
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "AeryKit";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1)

end;
return {
	AeryKit = v1
};
