-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BedwarsImageId__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__BedwarsShopCategory__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory;
return {
	BedwarsShopCategoryMeta = {
		[l__BedwarsShopCategory__4.Blocks] = {
			name = "Blocks"
		}, 
		[l__BedwarsShopCategory__4.Combat] = {
			name = "Combat"
		}, 
		[l__BedwarsShopCategory__4.Tools] = {
			name = "Tools"
		}, 
		[l__BedwarsShopCategory__4.Void] = {
			name = "Void", 
			icon = l__BedwarsImageId__2.VOID_ICON_SOLID, 
			disabled = not v1.import(script, game:GetService("ReplicatedStorage"), "TS", "world", "void", "void-world-util").VoidWorldUtil.VOID_ENABLED, 
			unlockable = true, 
			unlockedByDefault = true
		}, 
		[l__BedwarsShopCategory__4.Armory] = {
			name = "Armory", 
			icon = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ImageId.HELMET_SOLID, 
			layoutOrder = 1, 
			unlockable = true, 
			purchase = {
				price = 4, 
				currency = l__ItemType__3.DIAMOND, 
				teamUnlock = true
			}
		}, 
		[l__BedwarsShopCategory__4.Pirate] = {
			name = "Become a Pirate", 
			icon = l__BedwarsImageId__2.PIRATE_SKULL_ICON, 
			unlockable = true, 
			layoutOrder = 2, 
			purchase = {
				price = 20, 
				currency = l__ItemType__3.IRON, 
				teamUnlock = false
			}
		}
	}
};
