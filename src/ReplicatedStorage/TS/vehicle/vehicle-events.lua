-- Script Hash: dc1bffa433d3fba14e9320d3a8bf8b1b7cf529cc530f56b7e0aa7af30d8294b60c417fe53d348084268b577c9521553b
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "MountVehicleEvent";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1, p2, p3)
	p1.vehicle = p2;
	p1.player = p3;
end;
local v3 = setmetatable({}, {
	__tostring = function()
		return "DismountVehicleEvent";
	end
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
function v3.constructor(p4, p5, p6)
	p4.vehicle = p5;
	p4.player = p6;
end;
return {
	MountVehicleEvent = v1, 
	DismountVehicleEvent = v3
};
