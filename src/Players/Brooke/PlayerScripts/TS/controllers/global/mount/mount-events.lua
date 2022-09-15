-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "GenericMountMounted";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1, p2, p3, p4, p5)
	p1.player = p2;
	p1.mountType = p3;
	p1.model = p4;
	p1.character = p5;
end;
local v3 = setmetatable({}, {
	__tostring = function()
		return "GenericMountDismounted";
	end
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
function v3.constructor(p6, p7, p8)
	p6.player = p7;
	p6.mountType = p8;
end;
return {
	GenericMountMounted = v1, 
	GenericMountDismounted = v3
};
