-- Script Hash: 792465ee1dc044c6a1d5397c8aae0025648ece21c1e7abe3c98cb6257c7e19fe7b998ababc9b183378e2ca7960515d47
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local v2 = setmetatable({}, {
	__index = v1
});
v2.HELMET = 0;
v1[0] = "HELMET";
v2.CHESTPLATE = 1;
v1[1] = "CHESTPLATE";
v2.BOOTS = 2;
v1[2] = "BOOTS";
return {
	ArmorSlot = v2, 
	AccessoriesCovered = {
		[v2.HELMET] = { "hat", "neck" }, 
		[v2.CHESTPLATE] = { "waist", "shoulder", "back", "neck" }, 
		[v2.BOOTS] = { "waist" }
	}
};
