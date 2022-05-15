
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local v2 = setmetatable({}, {
	__index = v1
});
v2.standby = "STANDBY";
v1.STANDBY = "standby";
v2.validate = "VALIDATE";
v1.VALIDATE = "validate";
v2.crafting = "CRAFTING";
v1.CRAFTING = "crafting";
v2.finished = "FINISHED";
v1.FINISHED = "finished";
return {
	CraftingStatus = v2
};

