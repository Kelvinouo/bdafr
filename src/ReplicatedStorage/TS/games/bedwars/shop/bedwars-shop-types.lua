-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "data-structure").out);
local l__ImageId__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ImageId;
local l__BedwarsImageId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__VoidWorldUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "world", "void", "void-world-util").VoidWorldUtil;
local v6 = {};
local v7 = setmetatable({}, {
	__index = v6
});
v7.Blocks = "Blocks";
v6.Blocks = "Blocks";
v7.Combat = "Combat";
v6.Combat = "Combat";
v7.Tools = "Tools";
v6.Tools = "Tools";
v7.Armory = "Armory";
v6.Armory = "Armory";
v7.Void = "Void";
v6.Void = "Void";
local v8 = {};
local v9 = setmetatable({}, {
	__index = v8
});
v9.GENERATOR = "generator";
v8.generator = "GENERATOR";
v9.ARMOR = "armor";
v8.armor = "ARMOR";
v9.DAMAGE = "damage";
v8.damage = "DAMAGE";
v9.BREAK = "break";
v8.break = "BREAK";
v9.DIAMOND_GENERATOR = "diamond_generator";
v8.diamond_generator = "DIAMOND_GENERATOR";
v9.ALARM = "alarm";
v8.alarm = "ALARM";
v9.ARMORY = "armory";
v8.armory = "ARMORY";
local v10 = {
	[v7.Armory] = v9.ARMORY
};
local v11 = {};
local v12 = {};
local v13 = #v12;
local v14 = v2.MapUtil.keys(v10);
local v15 = #v14;
table.move(v14, 1, v15, v13 + 1, v12);
v12[v13 + v15 + 1] = v7.Void;
for v16, v17 in ipairs(v12) do
	v11[v17] = true;
end;
local v18 = v2.SetUtil.values(v11);
if not l__VoidWorldUtil__5.VOID_ENABLED then
	local v19 = (table.find(v18, v7.Void) and 0) - 1;
	if v19 >= 0 then
		table.remove(v18, v19 + 1);
	end;
end;
return {
	BedwarsShopItemCategory = v7, 
	TeamUpgradeId = v9, 
	BedwarsShopUnlockableCategories = v10, 
	BedwarsShopCategoryPanels = v18, 
	BedwarsShopCategoryIcons = {
		[v7.Void] = l__BedwarsImageId__4.VOID_ICON_SOLID, 
		[v7.Armory] = l__ImageId__3.HELMET_SOLID
	}, 
	BedwarsShopOverride = {
		constructor = function(p1)

		end
	}
};
