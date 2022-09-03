-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ImageId__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ImageId;
local l__QueueType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local l__BedwarsArmorSet__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-armor-set").BedwarsArmorSet;
local l__BedwarsKit__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__FlamethrowerUpgrade__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "pyro", "flamethrower-upgrade").FlamethrowerUpgrade;
local l__TeamUpgradeId__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").TeamUpgradeId;
local l__BedwarsShopCategoryMeta__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-meta").BedwarsShopCategoryMeta;
local l__BedwarsShopCategory__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory;
local v10 = {
	RepairEnchantTablePrice = 8
};
local u1 = nil;
local u2 = nil;
local l__BedwarsShopOverrides__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-override").BedwarsShopOverrides;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
function v10.getShopItem(p1, p2)
	if not u1 then
		u1 = {};
		local v11, v12, v13 = ipairs(u2);
		while true do
			v11(v12, v13);
			if not v11 then
				break;
			end;
			v13 = v11;
			u1[v12.itemType] = v12;		
		end;
	end;
	local v14 = u1[p1];
	if p2 then
		local v15, v16, v17 = ipairs(l__BedwarsShopOverrides__3);
		while true do
			v15(v16, v17);
			if not v15 then
				break;
			end;
			v17 = v15;
			if v16:shouldApply(p2) then
				local v18 = nil;
				local v19, v20, v21 = ipairs((v16:getOverride()));
				while true do
					v19(v20, v21);
					if not v19 then
						break;
					end;
					v21 = v19;
					if v20.itemType == p1 == true then
						v18 = v20;
						break;
					end;				
				end;
				if v18 then
					if v14 then
						local v22, v23, v24 = ipairs(u4.keys(v18));
						while true do
							v22(v23, v24);
							if not v22 then
								break;
							end;
							v24 = v22;
							v14[v23] = v18[v23];						
						end;
					else
						v14 = v18;
					end;
				end;
			end;		
		end;
	end;
	return v14;
end;
local l__Workspace__5 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
function v10.getShop(p3)
	local v25 = nil;
	if p3 then
		local v26, v27, v28 = ipairs(l__BedwarsShopOverrides__3);
		while true do
			v26(v27, v28);
			if not v26 then
				break;
			end;
			v28 = v26;
			if v27:shouldApply(p3) then
				if not v25 then
					v25 = u4.deepCopy(u2);
				end;
				local v29, v30, v31 = ipairs(v27:getOverride());
				while true do
					v29(v30, v31);
					if not v29 then
						break;
					end;
					local v32 = nil;
					local v33, v34, v35 = ipairs(v25);
					while true do
						v33(v34, v35);
						if not v33 then
							break;
						end;
						v35 = v33;
						if v34.itemType == v30.itemType == true then
							v32 = v34;
							break;
						end;					
					end;
					if v32 then
						local v36, v37, v38 = ipairs(u4.keys(v30));
						while true do
							v36(v37, v38);
							if not v36 then
								break;
							end;
							v38 = v36;
							v32[v37] = v30[v37];						
						end;
					else
						table.insert(v25, v30);
					end;				
				end;
			end;		
		end;
	end;
	local v39 = v25 or u2;
	local v40 = l__Workspace__5:GetAttribute("QueueType");
	if v40 then
		local v41 = {};
		local v42 = 0;
		local v43, v44, v45 = ipairs(v39);
		while true do
			v43(v44, v45);
			if not v43 then
				break;
			end;
			if v44.disabledInQueue and table.find(v44.disabledInQueue, v40) ~= nil then
				local v46 = false;
			elseif v44.enabledOnlyInQueue and table.find(v44.enabledOnlyInQueue, v40) == nil then
				v46 = false;
			else
				v46 = true;
			end;
			if v46 == true then
				v42 = v42 + 1;
				v41[v42] = v44;
			end;		
		end;
		v39 = v41;
	end;
	return v39;
end;
local l__ItemType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v10.getTeamGeneratorUpgradeCost(p4)
	if p4 == 1 then
		return { {
				itemType = l__ItemType__6.DIAMOND, 
				amount = 2
			} };
	end;
	if p4 ~= 2 then
		return nil;
	end;
	return { {
			itemType = l__ItemType__6.DIAMOND, 
			amount = 4
		} };
end;
function v10.getTeamWool(p5)
	if p5 == "1" then
		return l__ItemType__6.WOOL_BLUE;
	end;
	if p5 == "2" then
		return l__ItemType__6.WOOL_RED;
	end;
	if p5 == "3" then
		return l__ItemType__6.WOOL_GREEN;
	end;
	if p5 == "4" then
		return l__ItemType__6.WOOL_YELLOW;
	end;
	if p5 == "5" then
		return l__ItemType__6.WOOL_ORANGE;
	end;
	if p5 == "6" then
		return l__ItemType__6.WOOL_PINK;
	end;
	if p5 == "7" then
		return l__ItemType__6.WOOL_CYAN;
	end;
	if p5 == "8" then
		return l__ItemType__6.WOOL_PURPLE;
	end;
	return l__ItemType__6.WOOL_WHITE;
end;
v10.Pickaxes = { l__ItemType__6.WOOD_PICKAXE, l__ItemType__6.STONE_PICKAXE, l__ItemType__6.IRON_PICKAXE, l__ItemType__6.DIAMOND_PICKAXE };
v10.Axes = { l__ItemType__6.WOOD_AXE, l__ItemType__6.STONE_AXE, l__ItemType__6.IRON_AXE, l__ItemType__6.DIAMOND_AXE };
u2 = { {
		itemType = l__ItemType__6.WOOL_WHITE, 
		amount = 16, 
		price = 8, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopCategory__9.Blocks
	}, {
		itemType = l__ItemType__6.STONE_BRICK, 
		amount = 16, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopCategory__9.Blocks
	}, {
		itemType = l__ItemType__6.WOOD_PLANK_OAK, 
		amount = 16, 
		price = 34, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopCategory__9.Blocks
	}, {
		itemType = l__ItemType__6.BLASTPROOF_CERAMIC, 
		amount = 4, 
		price = 18, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopCategory__9.Blocks, 
		disabledInQueue = { l__QueueType__3.TNT_WARS }
	}, {
		itemType = l__ItemType__6.OBSIDIAN, 
		amount = 4, 
		price = 4, 
		currency = l__ItemType__6.EMERALD, 
		category = l__BedwarsShopCategory__9.Blocks, 
		disabledInQueue = { l__QueueType__3.TNT_WARS }
	}, {
		itemType = l__ItemType__6.STONE_SWORD, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		ignoredByKit = { l__BedwarsKit__5.BARBARIAN, l__BedwarsKit__5.DASHER }, 
		category = l__BedwarsShopCategory__9.Combat, 
		disabledInQueue = { l__QueueType__3.TNT_WARS }
	}, {
		itemType = l__ItemType__6.IRON_SWORD, 
		amount = 1, 
		price = 70, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		ignoredByKit = { l__BedwarsKit__5.BARBARIAN, l__BedwarsKit__5.DASHER }, 
		category = l__BedwarsShopCategory__9.Combat, 
		disabledInQueue = { l__QueueType__3.TNT_WARS }
	}, {
		itemType = l__ItemType__6.DIAMOND_SWORD, 
		amount = 1, 
		price = 4, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		ignoredByKit = { l__BedwarsKit__5.BARBARIAN, l__BedwarsKit__5.DASHER, l__BedwarsKit__5.EMBER, l__BedwarsKit__5.LUMEN }, 
		category = l__BedwarsShopCategory__9.Armory, 
		disabledInQueue = { l__QueueType__3.TNT_WARS }
	}, {
		itemType = l__ItemType__6.EMERALD_SWORD, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		ignoredByKit = { l__BedwarsKit__5.BARBARIAN, l__BedwarsKit__5.ICE_QUEEN, l__BedwarsKit__5.DASHER, l__BedwarsKit__5.EMBER, l__BedwarsKit__5.LUMEN }, 
		category = l__BedwarsShopCategory__9.Armory, 
		disabledInQueue = { l__QueueType__3.TNT_WARS }
	}, {
		itemType = l__ItemType__6.ROCKET_BELT, 
		amount = 1, 
		price = 4, 
		currency = l__ItemType__6.EMERALD, 
		category = l__BedwarsShopCategory__9.Armory
	}, {
		itemType = l__ItemType__6.TURTLE_BACKPACK, 
		amount = 1, 
		price = 4, 
		currency = l__ItemType__6.EMERALD, 
		category = l__BedwarsShopCategory__9.Armory
	}, {
		itemType = l__ItemType__6.HEALING_BACKPACK, 
		amount = 1, 
		price = 4, 
		currency = l__ItemType__6.EMERALD, 
		category = l__BedwarsShopCategory__9.Armory
	}, {
		itemType = l__ItemType__6.VOID_SWORD, 
		amount = 1, 
		price = 10, 
		currency = l__ItemType__6.VOID_CRYSTAL, 
		lockAfterPurchase = true, 
		ignoredByKit = { l__BedwarsKit__5.BARBARIAN, l__BedwarsKit__5.DASHER }, 
		category = l__BedwarsShopCategory__9.Void
	}, {
		itemType = l__ItemType__6.ICE_SWORD, 
		amount = 1, 
		price = 6, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.ICE_QUEEN }, 
		category = l__BedwarsShopCategory__9.Armory
	}, {
		itemType = l__ItemType__6.HELL_SABER, 
		amount = 1, 
		price = 4, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.EMBER }, 
		category = l__BedwarsShopCategory__9.Armory
	}, {
		itemType = l__ItemType__6.HEAVENLY_SWORD, 
		amount = 1, 
		price = 4, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.LUMEN }, 
		category = l__BedwarsShopCategory__9.Armory
	}, {
		itemType = l__ItemType__6.PINATA, 
		amount = 1, 
		price = 35, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.PINATA }, 
		category = l__BedwarsShopCategory__9.Blocks
	}, {
		itemType = l__ItemType__6.STONE_DAO, 
		amount = 1, 
		price = 28, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.DASHER }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.IRON_DAO, 
		amount = 1, 
		price = 85, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.DASHER }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.DIAMOND_DAO, 
		amount = 1, 
		price = 5, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.DASHER }, 
		category = l__BedwarsShopCategory__9.Armory
	}, {
		itemType = l__ItemType__6.EMERALD_DAO, 
		amount = 1, 
		price = 24, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.DASHER }, 
		category = l__BedwarsShopCategory__9.Armory
	}, {
		itemType = l__ItemType__6.LEATHER_CHESTPLATE, 
		customDisplayName = "Leather Armor", 
		amount = 1, 
		price = 50, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		spawnWithItems = l__BedwarsArmorSet__4.LEATHER, 
		nextTier = l__ItemType__6.IRON_CHESTPLATE, 
		ignoredByKit = { l__BedwarsKit__5.BIGMAN }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.IRON_CHESTPLATE, 
		customDisplayName = "Iron Armor", 
		amount = 1, 
		price = 120, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		spawnWithItems = l__BedwarsArmorSet__4.IRON, 
		tiered = true, 
		prevTier = l__ItemType__6.LEATHER_CHESTPLATE, 
		nextTier = l__ItemType__6.DIAMOND_CHESTPLATE, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.DIAMOND_CHESTPLATE, 
		customDisplayName = "Diamond Armor", 
		amount = 1, 
		price = 8, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		spawnWithItems = l__BedwarsArmorSet__4.DIAMOND, 
		tiered = true, 
		prevTier = l__ItemType__6.IRON_CHESTPLATE, 
		nextTier = l__ItemType__6.EMERALD_CHESTPLATE, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.EMERALD_CHESTPLATE, 
		customDisplayName = "Emerald Armor", 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		spawnWithItems = l__BedwarsArmorSet__4.EMERALD, 
		tiered = true, 
		prevTier = l__ItemType__6.DIAMOND_CHESTPLATE, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.VOID_CHESTPLATE, 
		customDisplayName = "Void Armor", 
		amount = 1, 
		price = 18, 
		currency = l__ItemType__6.VOID_CRYSTAL, 
		lockAfterPurchase = true, 
		spawnWithItems = l__BedwarsArmorSet__4.VOID, 
		category = l__BedwarsShopCategory__9.Void, 
		nextTier = l__ItemType__6.EMERALD_CHESTPLATE, 
		ignoredByKit = { l__BedwarsKit__5.BIGMAN }
	}, {
		itemType = l__ItemType__6.VOID_TURRET, 
		customDisplayName = "Void Turret", 
		amount = 1, 
		price = 3, 
		currency = l__ItemType__6.VOID_CRYSTAL, 
		category = l__BedwarsShopCategory__9.Void, 
		spawnWithItems = { l__ItemType__6.VOID_TURRET_TABLET }
	}, {
		itemType = l__ItemType__6.PIRATE_FLAG, 
		customDisplayName = "Pirate Flag", 
		amount = 1, 
		price = 30, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopCategory__9.Pirate
	}, {
		itemType = l__ItemType__6.PIRATE_SHOVEL, 
		customDisplayName = "Pirate Shovel", 
		amount = 1, 
		price = 100, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopCategory__9.Pirate
	}, {
		itemType = l__ItemType__6.PIRATE_TELESCOPE, 
		customDisplayName = "Pirate Telescope", 
		amount = 1, 
		price = 100, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopCategory__9.Pirate
	}, {
		itemType = l__ItemType__6.CARROT_SEEDS, 
		amount = 1, 
		price = 70, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.FARMER_CLETUS }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.MELON_SEEDS, 
		amount = 1, 
		price = 3, 
		currency = l__ItemType__6.EMERALD, 
		requiresKit = { l__BedwarsKit__5.FARMER_CLETUS }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.APPLE, 
		amount = 1, 
		price = 30, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.BAKER }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.PIE, 
		amount = 1, 
		price = 2, 
		currency = l__ItemType__6.EMERALD, 
		requiresKit = { l__BedwarsKit__5.BAKER }, 
		disabledInQueue = { l__QueueType__3.SURVIVAL }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.GUITAR, 
		amount = 1, 
		price = 16, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.MELODY }, 
		spawnWithItems = { l__ItemType__6.GUITAR }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.CANNON, 
		amount = 1, 
		price = 30, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.DAVEY }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.SMOKE_BOMB, 
		amount = 1, 
		price = 25, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.SMOKE }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.SMOKE_BLOCK, 
		amount = 8, 
		price = 15, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.SMOKE }, 
		category = l__BedwarsShopCategory__9.Blocks
	}, {
		itemType = l__ItemType__6.LASSO, 
		amount = 1, 
		price = 30, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.COWGIRL }, 
		spawnWithItems = { l__ItemType__6.LASSO }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.WIZARD_STAFF, 
		amount = 1, 
		price = 3, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.WIZARD }, 
		spawnWithItems = { l__ItemType__6.WIZARD_STAFF }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.CAMERA_TURRET, 
		amount = 1, 
		price = 1, 
		currency = l__ItemType__6.EMERALD, 
		requiresKit = { l__BedwarsKit__5.VULCAN }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.DRONE, 
		amount = 1, 
		price = 50, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.CYBER }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.DAMAGE_BANNER, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.CONQUEROR }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.DEFENSE_BANNER, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.CONQUEROR }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.HEAL_BANNER, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.CONQUEROR }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.DINO_DEPLOY, 
		amount = 1, 
		price = 32, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.DINO_TAMER }, 
		disabledInQueue = { l__QueueType__3.SURVIVAL }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.FLAMETHROWER, 
		amount = 1, 
		price = 2, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.PYRO }, 
		spawnWithItems = { l__ItemType__6.FLAMETHROWER }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.RAVEN, 
		amount = 1, 
		price = 1, 
		currency = l__ItemType__6.EMERALD, 
		requiresKit = { l__BedwarsKit__5.RAVEN }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.JADE_HAMMER, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.JADE }, 
		spawnWithItems = { l__ItemType__6.JADE_HAMMER }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.VOID_AXE, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.REGENT }, 
		spawnWithItems = { l__ItemType__6.VOID_AXE }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.BEEHIVE, 
		amount = 1, 
		price = 60, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.BEEKEEPER }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.SPIRIT, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.SPIRIT_CATCHER }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.SHIELD_AXOLOTL, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		nextTier = l__ItemType__6.DAMAGE_AXOLOTL, 
		dontGiveItem = true, 
		requiresKit = { l__BedwarsKit__5.AXOLOTL }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.DAMAGE_AXOLOTL, 
		amount = 1, 
		price = 50, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		tiered = true, 
		prevTier = l__ItemType__6.SHIELD_AXOLOTL, 
		nextTier = l__ItemType__6.BREAK_SPEED_AXOLOTL, 
		dontGiveItem = true, 
		requiresKit = { l__BedwarsKit__5.AXOLOTL }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.BREAK_SPEED_AXOLOTL, 
		amount = 1, 
		price = 3, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		tiered = true, 
		prevTier = l__ItemType__6.DAMAGE_AXOLOTL, 
		nextTier = l__ItemType__6.HEALTH_REGEN_AXOLOTL, 
		dontGiveItem = true, 
		requiresKit = { l__BedwarsKit__5.AXOLOTL }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.HEALTH_REGEN_AXOLOTL, 
		amount = 1, 
		price = 6, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		tiered = true, 
		prevTier = l__ItemType__6.BREAK_SPEED_AXOLOTL, 
		dontGiveItem = true, 
		requiresKit = { l__BedwarsKit__5.AXOLOTL }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.SNAP_TRAP, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.TRAPPER }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.OIL_CONSUMABLE, 
		amount = 1, 
		price = 1, 
		currency = l__ItemType__6.EMERALD, 
		requiresKit = { l__BedwarsKit__5.OIL_MAN }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.SPEAR, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.SPEARMAN }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.FISHING_ROD, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.FISHERMAN }, 
		spawnWithItems = { l__ItemType__6.FISHING_ROD }, 
		category = l__BedwarsShopCategory__9.Tools
	}, {
		itemType = l__ItemType__6.VACUUM, 
		amount = 1, 
		price = 60, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.GHOST_CATCHER }, 
		spawnWithItems = { l__ItemType__6.VACUUM }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.GUMDROP_BOUNCE_PAD, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.GINGERBREAD_MAN }, 
		category = l__BedwarsShopCategory__9.Blocks
	}, {
		itemType = l__ItemType__6.BREWING_CAULDRON, 
		amount = 1, 
		price = 15, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.ALCHEMIST }, 
		category = l__BedwarsShopCategory__9.Blocks
	}, {
		itemType = l__ItemType__6.WOOD_BOW, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		spawnWithItems = { l__ItemType__6.WOOD_BOW }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.WOOD_CROSSBOW, 
		amount = 1, 
		price = 7, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		spawnWithItems = { l__ItemType__6.WOOD_CROSSBOW }, 
		category = l__BedwarsShopCategory__9.Armory, 
		ignoredByKit = { l__BedwarsKit__5.ARCHER }, 
		disabledInQueue = { l__QueueType__3.TNT_WARS }
	}, {
		itemType = l__ItemType__6.TACTICAL_CROSSBOW, 
		amount = 1, 
		price = 6, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		spawnWithItems = { l__ItemType__6.TACTICAL_CROSSBOW }, 
		requiresKit = { l__BedwarsKit__5.ARCHER }, 
		category = l__BedwarsShopCategory__9.Armory, 
		disabledInQueue = { l__QueueType__3.TNT_WARS }
	}, {
		itemType = l__ItemType__6.DETONATED_BOMB, 
		amount = 1, 
		price = 1, 
		currency = l__ItemType__6.EMERALD, 
		category = l__BedwarsShopCategory__9.Armory
	}, {
		itemType = l__ItemType__6.ARROW, 
		amount = 8, 
		price = 16, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.FIREBALL, 
		amount = 1, 
		price = 75, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.TELEPEARL, 
		amount = 1, 
		price = 1, 
		currency = l__ItemType__6.EMERALD, 
		category = l__BedwarsShopCategory__9.Combat, 
		disabledInQueue = { l__QueueType__3.TNT_WARS }
	}, {
		itemType = l__ItemType__6.SANTA_BOMB, 
		amount = 1, 
		price = 70, 
		currency = l__ItemType__6.IRON, 
		disabledInQueue = { l__QueueType__3.SURVIVAL }, 
		requiresKit = { l__BedwarsKit__5.SANTA }, 
		category = l__BedwarsShopCategory__9.Combat
	}, {
		itemType = l__ItemType__6.SHEARS, 
		amount = 1, 
		price = 30, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		spawnWithItems = { l__ItemType__6.SHEARS }, 
		category = l__BedwarsShopCategory__9.Tools, 
		disabledInQueue = { l__QueueType__3.TNT_WARS }
	}, {
		itemType = l__ItemType__6.STONE_PICKAXE, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		prevTier = l__ItemType__6.WOOD_PICKAXE, 
		nextTier = l__ItemType__6.IRON_PICKAXE, 
		spawnWithItems = { l__ItemType__6.STONE_PICKAXE }, 
		category = l__BedwarsShopCategory__9.Tools
	}, {
		itemType = l__ItemType__6.IRON_PICKAXE, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		tiered = true, 
		prevTier = l__ItemType__6.STONE_PICKAXE, 
		nextTier = l__ItemType__6.DIAMOND_PICKAXE, 
		spawnWithItems = { l__ItemType__6.IRON_PICKAXE }, 
		category = l__BedwarsShopCategory__9.Tools
	}, {
		itemType = l__ItemType__6.DIAMOND_PICKAXE, 
		amount = 1, 
		price = 60, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		tiered = true, 
		prevTier = l__ItemType__6.IRON_PICKAXE, 
		spawnWithItems = { l__ItemType__6.DIAMOND_PICKAXE }, 
		category = l__BedwarsShopCategory__9.Tools
	}, {
		itemType = l__ItemType__6.WOOD_AXE, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		nextTier = l__ItemType__6.STONE_AXE, 
		spawnWithItems = { l__ItemType__6.WOOD_AXE }, 
		category = l__BedwarsShopCategory__9.Tools, 
		ignoredByKit = { l__BedwarsKit__5.MINER }, 
		disabledInQueue = { l__QueueType__3.TNT_WARS }
	}, {
		itemType = l__ItemType__6.STONE_AXE, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		tiered = true, 
		prevTier = l__ItemType__6.WOOD_AXE, 
		nextTier = l__ItemType__6.IRON_AXE, 
		spawnWithItems = { l__ItemType__6.STONE_AXE }, 
		category = l__BedwarsShopCategory__9.Tools, 
		ignoredByKit = { l__BedwarsKit__5.MINER }, 
		disabledInQueue = { l__QueueType__3.TNT_WARS }
	}, {
		itemType = l__ItemType__6.IRON_AXE, 
		amount = 1, 
		price = 30, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		tiered = true, 
		prevTier = l__ItemType__6.STONE_AXE, 
		nextTier = l__ItemType__6.DIAMOND_AXE, 
		spawnWithItems = { l__ItemType__6.IRON_AXE }, 
		category = l__BedwarsShopCategory__9.Tools, 
		ignoredByKit = { l__BedwarsKit__5.MINER }, 
		disabledInQueue = { l__QueueType__3.TNT_WARS }
	}, {
		itemType = l__ItemType__6.DIAMOND_AXE, 
		amount = 1, 
		price = 60, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		tiered = true, 
		prevTier = l__ItemType__6.IRON_AXE, 
		spawnWithItems = { l__ItemType__6.DIAMOND_AXE }, 
		category = l__BedwarsShopCategory__9.Tools, 
		ignoredByKit = { l__BedwarsKit__5.MINER }, 
		disabledInQueue = { l__QueueType__3.TNT_WARS }
	}, {
		itemType = l__ItemType__6.HAMMER, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.BUILDER }, 
		spawnWithItems = { l__ItemType__6.HAMMER }, 
		disabledInQueue = { l__QueueType__3.SURVIVAL }, 
		lockAfterPurchase = true, 
		category = l__BedwarsShopCategory__9.Tools
	}, {
		itemType = l__ItemType__6.TNT, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopCategory__9.Blocks
	}, {
		itemType = l__ItemType__6.VOID_BLOCK, 
		amount = 16, 
		price = 1, 
		currency = l__ItemType__6.VOID_CRYSTAL, 
		category = l__BedwarsShopCategory__9.Void
	}, {
		itemType = l__ItemType__6.BALLOON, 
		amount = 3, 
		price = 2, 
		currency = l__ItemType__6.EMERALD, 
		category = l__BedwarsShopCategory__9.Combat, 
		disabledInQueue = { l__QueueType__3.FLAG_CAPTURE }
	}, {
		itemType = l__ItemType__6.TESLA_TRAP, 
		amount = 1, 
		price = 60, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopCategory__9.Blocks, 
		disabledInQueue = { l__QueueType__3.SURVIVAL, l__QueueType__3.TNT_WARS }
	}, {
		itemType = l__ItemType__6.STOPWATCH, 
		amount = 1, 
		price = 2, 
		currency = l__ItemType__6.EMERALD, 
		category = l__BedwarsShopCategory__9.Combat, 
		disabledInQueue = { l__QueueType__3.TNT_WARS }
	}, {
		itemType = l__ItemType__6.SNOWBALL, 
		amount = 8, 
		price = 16, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopCategory__9.Combat, 
		disabledInQueue = { l__QueueType__3.TNT_WARS }
	}, {
		itemType = l__ItemType__6.TEAM_DOOR, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopCategory__9.Blocks, 
		enabledOnlyInQueue = { l__QueueType__3.SURVIVAL }
	}, {
		itemType = l__ItemType__6.SPIKE_TRAP, 
		amount = 8, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopCategory__9.Blocks, 
		enabledOnlyInQueue = { l__QueueType__3.SURVIVAL }
	}, {
		itemType = l__ItemType__6.AUTO_TURRET, 
		amount = 1, 
		price = 2, 
		currency = l__ItemType__6.EMERALD, 
		category = l__BedwarsShopCategory__9.Blocks, 
		enabledOnlyInQueue = { l__QueueType__3.SURVIVAL }
	} };
v10.ShopItems = u2;
local v47 = {
	id = l__TeamUpgradeId__7.ARMORY, 
	name = "Armory"
};
local v48 = l__BedwarsShopCategoryMeta__8[l__BedwarsShopCategory__9.Armory].icon;
if v48 == nil then
	v48 = "";
end;
v47.image = v48;
v47.menuPosition = "itemshop";
local v49 = {
	name = "Unlocks upgraded gear in the <b>Item Shop</b>"
};
local v50 = l__BedwarsShopCategoryMeta__8[l__BedwarsShopCategory__9.Armory].purchase;
if v50 ~= nil then
	v50 = v50.price;
end;
local v51 = v50;
if v51 == nil then
	v51 = 4;
end;
v49.price = v51;
v49.values = { 1 };
local v52 = l__BedwarsShopCategoryMeta__8[l__BedwarsShopCategory__9.Armory].purchase;
if v52 ~= nil then
	v52 = v52.currency;
end;
local v53 = v52;
if v53 == nil then
	v53 = l__ItemType__6.DIAMOND;
end;
v49.currency = v53;
v47.tiers = { v49 };
local v54 = {};
local v55 = 0;
local v56, v57, v58 = ipairs(u2);
while true do
	v56(v57, v58);
	if not v56 then
		break;
	end;
	if v57.category == l__BedwarsShopCategory__9.Armory == true then
		v55 = v55 + 1;
		v54[v55] = v57;
	end;
end;
local v59 = table.create(#v54);
local v60, v61, v62 = ipairs(v54);
while true do
	v60(v61, v62);
	if not v60 then
		break;
	end;
	v62 = v60;
	v59[v60] = v61.itemType;
end;
v47.items = v59;
v10.TeamUpgrades = { {
		id = l__TeamUpgradeId__7.GENERATOR, 
		name = "Team Generator", 
		image = "rbxassetid://6821007175", 
		menuPosition = "main", 
		tiers = { {
				name = "Tier I: +50% Speed", 
				price = 4, 
				values = {}, 
				currency = l__ItemType__6.DIAMOND
			}, {
				name = "Tier II: +100% Speed", 
				price = 8, 
				values = {}, 
				currency = l__ItemType__6.DIAMOND
			}, {
				name = "Tier III: Spawn Emeralds", 
				price = 12, 
				values = {}, 
				currency = l__ItemType__6.DIAMOND, 
				disabledInQueue = { l__QueueType__3.SURVIVAL }
			} }
	}, {
		id = l__TeamUpgradeId__7.ARMOR, 
		name = "Armor Protection", 
		image = l__ImageId__2.SHIELD, 
		menuPosition = "main", 
		tiers = { {
				name = "Tier I: +20% Armor Bonus", 
				price = 4, 
				values = { 20 }, 
				currency = l__ItemType__6.DIAMOND
			}, {
				name = "Tier II: +40% Armor Bonus", 
				price = 8, 
				values = { 40 }, 
				currency = l__ItemType__6.DIAMOND
			}, {
				name = "Tier III: +60% Armor Bonus", 
				price = 20, 
				values = { 60 }, 
				currency = l__ItemType__6.DIAMOND
			} }
	}, {
		id = l__TeamUpgradeId__7.DAMAGE, 
		name = "Damage", 
		image = "rbxassetid://6822443250", 
		menuPosition = "main", 
		tiers = { {
				name = "Tier I: +20% Damage", 
				price = 6, 
				values = { 20 }, 
				currency = l__ItemType__6.DIAMOND
			}, {
				name = "Tier II: +35% Damage", 
				price = 12, 
				values = { 35 }, 
				currency = l__ItemType__6.DIAMOND
			}, {
				name = "Tier III: +50% Damage", 
				price = 22, 
				values = { 50 }, 
				currency = l__ItemType__6.DIAMOND
			} }
	}, {
		id = l__TeamUpgradeId__7.BREAK, 
		name = "Break Speed", 
		image = "rbxassetid://6822443323", 
		menuPosition = "main", 
		tiers = { {
				name = "Tier I: +30% Break Damage", 
				price = 3, 
				values = { 15 }, 
				currency = l__ItemType__6.DIAMOND
			}, {
				name = "Tier II: +60% Break Damage", 
				price = 6, 
				values = { 60 }, 
				currency = l__ItemType__6.DIAMOND
			}, {
				name = "Tier II: +100% Break Damage", 
				price = 10, 
				values = { 100 }, 
				currency = l__ItemType__6.DIAMOND
			} }
	}, {
		id = l__TeamUpgradeId__7.DIAMOND_GENERATOR, 
		name = "Diamond Generator", 
		image = l__ImageId__2.GEM_SOLID, 
		menuPosition = "main", 
		tiers = { {
				name = "Tier I: Spawn Diamonds", 
				price = 4, 
				values = {}, 
				currency = l__ItemType__6.DIAMOND
			}, {
				name = "Tier II: +100% Speed", 
				price = 8, 
				values = {}, 
				currency = l__ItemType__6.DIAMOND
			}, {
				name = "Tier III: +200% Speed", 
				price = 12, 
				values = {}, 
				currency = l__ItemType__6.DIAMOND
			} }
	}, {
		id = l__TeamUpgradeId__7.ALARM, 
		name = "Bed Alarm", 
		image = "rbxassetid://7392155479", 
		menuPosition = "bottom", 
		tiers = { {
				name = "Bed Alarm", 
				price = 2, 
				values = { 1 }, 
				currency = l__ItemType__6.DIAMOND
			} }
	}, v47 };
v10.FlamethrowerUpgrades = { {
		id = l__FlamethrowerUpgrade__6.HEAT, 
		name = "Heat", 
		tiers = { {
				name = "+100% Fire Damage", 
				values = { 100 }, 
				price = 1, 
				currency = l__ItemType__6.EMBER
			}, {
				name = "+180% Fire Damage", 
				values = { 180 }, 
				price = 2, 
				currency = l__ItemType__6.EMBER
			}, {
				name = "+250% Fire Damage", 
				values = { 250 }, 
				price = 3, 
				currency = l__ItemType__6.EMBER
			}, {
				name = "50% Fire Armor Penetration", 
				values = { 250, 50 }, 
				price = 6, 
				currency = l__ItemType__6.EMBER
			} }
	}, {
		id = l__FlamethrowerUpgrade__6.POWER, 
		name = "Power", 
		tiers = { {
				name = "+30% Brittle Attack Damage", 
				values = { 30 }, 
				price = 1, 
				currency = l__ItemType__6.EMBER
			}, {
				name = "+50% Brittle Attack Damage", 
				values = { 50 }, 
				price = 2, 
				currency = l__ItemType__6.EMBER
			}, {
				name = "+80% Brittle Attack Damage", 
				values = { 80 }, 
				price = 3, 
				currency = l__ItemType__6.EMBER
			}, {
				name = "Flames Push Enemies", 
				values = { 80, 0.65 }, 
				price = 8, 
				currency = l__ItemType__6.EMBER
			} }
	}, {
		id = l__FlamethrowerUpgrade__6.RANGE, 
		name = "Range", 
		tiers = { {
				name = "+25% Flame Range", 
				values = { 25 }, 
				price = 1, 
				currency = l__ItemType__6.EMBER
			}, {
				name = "+50% Flame Range", 
				values = { 50 }, 
				price = 2, 
				currency = l__ItemType__6.EMBER
			}, {
				name = "+75% Flame Range", 
				values = { 75 }, 
				price = 3, 
				currency = l__ItemType__6.EMBER
			}, {
				name = "Fire Burns Flamable Blocks", 
				values = { 75, 1 }, 
				price = 4, 
				currency = l__ItemType__6.EMBER
			} }
	} };
function v10.getUpgrade(p6, p7)
	local v63, v64, v65 = ipairs(p6);
	while true do
		v63(v64, v65);
		if not v63 then
			break;
		end;
		v65 = v63;
		if v64.id == p7 == true then
			return v64;
		end;	
	end;
	return nil;
end;
return {
	BedwarsShop = v10
};
