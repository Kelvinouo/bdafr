-- Script Hash: 7f7b260d6a77835aa2ede8f1d18b0f05f0c449944e9f3175f222e255b15327bf4c7fe5340ffadb85e132742890f13f7a
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local v2 = setmetatable({}, {
	__index = v1
});
v2.Blocks = "Blocks";
v1.Blocks = "Blocks";
v2.Combat = "Combat";
v1.Combat = "Combat";
v2.Tools = "Tools";
v1.Tools = "Tools";
v2.Armory = "Armory";
v1.Armory = "Armory";
local v3 = {};
local v4 = setmetatable({}, {
	__index = v3
});
v4.GENERATOR = "generator";
v3.generator = "GENERATOR";
v4.ARMOR = "armor";
v3.armor = "ARMOR";
v4.DAMAGE = "damage";
v3.damage = "DAMAGE";
v4.BREAK = "break";
v3.break = "BREAK";
v4.DIAMOND_GENERATOR = "diamond_generator";
v3.diamond_generator = "DIAMOND_GENERATOR";
v4.ALARM = "alarm";
v3.alarm = "ALARM";
v4.ARMORY = "armory";
v3.armory = "ARMORY";
return {
	BedwarsShopItemCategory = v2, 
	TeamUpgradeId = v4, 
	BedwarsShopUnlockableCategories = {
		[v2.Armory] = v4.ARMORY
	}, 
	BedwarsShopOverride = {
		constructor = function(p1)

		end
	}
};
