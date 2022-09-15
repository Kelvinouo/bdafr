-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "GuidedProjectileDetonateEvent";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1, p2, p3)
	p1.guidedProjectileType = p2;
	p1.position = p3;
end;
local v3 = setmetatable({}, {
	__tostring = function()
		return "GuidedProjectileRemovedEvent";
	end
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
function v3.constructor(p4, p5, p6)
	p4.guidedProjectileType = p5;
	p4.model = p6;
end;
local v5 = setmetatable({}, {
	__tostring = function()
		return "GuidedProjectileDisablingEvent";
	end
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
function v5.constructor(p7, p8, p9)
	p7.guidedProjectileType = p8;
	p7.model = p9;
end;
local v7 = setmetatable({}, {
	__tostring = function()
		return "GuidedProjectileEnablingEvent";
	end
});
v7.__index = v7;
function v7.new(...)
	local v8 = setmetatable({}, v7);
	return v8:constructor(...) and v8;
end;
function v7.constructor(p10, p11, p12)
	p10.guidedProjectileType = p11;
	p10.model = p12;
end;
return {
	GuidedProjectileDetonateEvent = v1, 
	GuidedProjectileRemovedEvent = v3, 
	GuidedProjectileDisablingEvent = v5, 
	GuidedProjectileEnablingEvent = v7
};
