
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

