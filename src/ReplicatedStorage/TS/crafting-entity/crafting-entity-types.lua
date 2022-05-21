-- Script Hash: dd3c164e21c9b457ee1584fbe15a259fe01e1ab02b54acfa8530b0ef9c1a6a26923f5b92a5456ebdd34cf795ce80280a
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
