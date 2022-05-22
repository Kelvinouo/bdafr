-- Script Hash: 5e0db19c61b73d6b79029adb52f73ea238e38165e9a76678172f326737b6c30bff448591e8dba6010ca71d48301b4c25
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "LaunchPadUsedEvent";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1, p2)
	p1.launchpad = p2;
end;
return {
	LaunchPadUsedEvent = v1
};
