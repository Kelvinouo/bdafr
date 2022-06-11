-- Script Hash: 3657e2e3bf392f67074f491626d15c82fd94facdc3097e3f59c69488cc4cfb79dbd0b5d011211be2507f92bb1bc01849
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "data-structure").out);
local l__ImageId__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ImageId;
local l__BedwarsImageId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local v5 = {};
local v6 = setmetatable({}, {
	__index = v5
});
v6.Blocks = "Blocks";
v5.Blocks = "Blocks";
v6.Combat = "Combat";
v5.Combat = "Combat";
v6.Tools = "Tools";
v5.Tools = "Tools";
v6.Armory = "Armory";
v5.Armory = "Armory";
v6.Void = "Void";
v5.Void = "Void";
local v7 = {};
local v8 = setmetatable({}, {
	__index = v7
});
v8.GENERATOR = "generator";
v7.generator = "GENERATOR";
v8.ARMOR = "armor";
v7.armor = "ARMOR";
v8.DAMAGE = "damage";
v7.damage = "DAMAGE";
v8.BREAK = "break";
v7.break = "BREAK";
v8.DIAMOND_GENERATOR = "diamond_generator";
v7.diamond_generator = "DIAMOND_GENERATOR";
v8.ALARM = "alarm";
v7.alarm = "ALARM";
v8.ARMORY = "armory";
v7.armory = "ARMORY";
local v9 = {
	[v6.Armory] = v8.ARMORY
};
local v10 = {};
local v11 = {};
local v12 = #v11;
local v13 = v2.MapUtil.keys(v9);
local v14 = #v13;
table.move(v13, 1, v14, v12 + 1, v11);
v11[v12 + v14 + 1] = v6.Void;
for v15, v16 in ipairs(v11) do
	v10[v16] = true;
end;
return {
	BedwarsShopItemCategory = v6, 
	TeamUpgradeId = v8, 
	BedwarsShopUnlockableCategories = v9, 
	BedwarsShopCategoryPanels = v2.SetUtil.values(v10), 
	BedwarsShopCategoryIcons = {
		[v6.Void] = l__BedwarsImageId__4.VOID_ICON_SOLID, 
		[v6.Armory] = l__ImageId__3.HELMET_SOLID
	}, 
	BedwarsShopOverride = {
		constructor = function(p1)

		end
	}
};
