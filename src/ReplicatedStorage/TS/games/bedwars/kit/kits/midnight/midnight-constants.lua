-- Script Hash: 87e501fbb9c4838f5b64f5b24ae588ca327855787f5c6391a3d7522e84d9164c61f1df9c51d63033fa09915ee4786ca5
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "MidnightConstants";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1)

end;
v1.MIDNIGHT_DURATION = 14;
return {
	MidnightConstants = v1
};
