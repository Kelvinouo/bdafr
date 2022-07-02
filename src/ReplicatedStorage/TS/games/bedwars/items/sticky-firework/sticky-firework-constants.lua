-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "StickyFireworkConstants";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1)

end;
v1.TIME_TO_LAUNCH_SEC = 0.2;
v1.LAUNCH_DURATION_SEC = 1.5;
v1.FIREWORK_VERTICAL_FORCE = 280;
return {
	StickyFireworkConstants = v1
};
