-- Script Hash: e91925695f02875d903b2da140e473c3454579ce6cd0fe59c19c6be1092c770318f445b1b73f7251f07b2dc4c8ade051
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local v2 = setmetatable({}, {
	__index = v1
});
v2.IDLE = 0;
v1[0] = "IDLE";
v2.SWIMMING_TO_ATTACHED = 1;
v1[1] = "SWIMMING_TO_ATTACHED";
v2.ACTIVE = 2;
v1[2] = "ACTIVE";
return {
	AxolotlState = v2
};
