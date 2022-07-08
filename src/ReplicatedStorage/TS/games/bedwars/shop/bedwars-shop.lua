-- Decompiled with the Synapse X Luau decompiler.

local v1 = nil;
local v2 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ImageId__3 = v2.import(script, v2.getModule(script, "@easy-games", "game-core").out).ImageId;
local l__BedwarsArmorSet__4 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-armor-set").BedwarsArmorSet;
local l__BedwarsKit__5 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__FlamethrowerUpgrade__6 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "pyro", "flamethrower-upgrade").FlamethrowerUpgrade;
local v7 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types");
local l__BedwarsShopItemCategory__8 = v7.BedwarsShopItemCategory;
local l__TeamUpgradeId__9 = v7.TeamUpgradeId;
local v10 = {
	RepairEnchantTablePrice = 8
};
local u1 = nil;
local u2 = nil;
local l__BedwarsShopOverrides__3 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-override").BedwarsShopOverrides;
local u4 = v2.import(script, v2.getModule(script, "@rbxts", "object-utils"));
function v10.getShopItem(p1, p2)
	if not u1 then
		u1 = {};
		for v11, v12 in ipairs(u2) do
			u1[v12.itemType] = v12;
		end;
	end;
	local v13 = u1[p1];
	if p2 then
		for v14, v15 in ipairs(l__BedwarsShopOverrides__3) do
			if v15:shouldApply(p2) then
				local v16 = nil;
				for v17, v18 in ipairs((v15:getOverride())) do
					if v18.itemType == p1 == true then
						v16 = v18;
						break;
					end;
				end;
				if v16 then
					if v13 then
						for v19, v20 in ipairs(u4.keys(v16)) do
							v13[v20] = v16[v20];
						end;
					else
						v13 = v16;
					end;
				end;
			end;
		end;
	end;
	return v13;
end;
local l__Workspace__5 = v2.import(script, v2.getModule(script, "@rbxts", "services")).Workspace;
function v10.getShop(p3)
	local v21 = nil;
	for v22, v23 in ipairs(l__BedwarsShopOverrides__3) do
		if v23:shouldApply(p3) then
			if not v21 then
				v21 = u4.deepCopy(u2);
			end;
			local v24, v25, v26 = ipairs(v23:getOverride());
			while true do
				local v27, v28 = v24(v25, v26);
				if not v27 then
					break;
				end;
				local v29 = nil;
				for v30, v31 in ipairs(v21) do
					if v31.itemType == v28.itemType == true then
						v29 = v31;
						break;
					end;
				end;
				if v29 then
					for v32, v33 in ipairs(u4.keys(v28)) do
						v29[v33] = v28[v33];
					end;
				else
					table.insert(v21, v28);
				end;			
			end;
		end;
	end;
	local v34 = v21 or u2;
	local v35 = l__Workspace__5:GetAttribute("QueueType");
	if v35 then
		local v36 = {};
		local v37 = 0;
		local v38, v39, v40 = ipairs(v34);
		while true do
			local v41, v42 = v38(v39, v40);
			if not v41 then
				break;
			end;
			if v42.disabledInQueue and table.find(v42.disabledInQueue, v35) ~= nil then
				local v43 = false;
			else
				v43 = true;
			end;
			if v43 == true then
				v37 = v37 + 1;
				v36[v37] = v42;
			end;		
		end;
		v34 = v36;
	end;
	return v34;
end;
local l__ItemType__6 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
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
		category = l__BedwarsShopItemCategory__8.Blocks
	}, {
		itemType = l__ItemType__6.STONE_BRICK, 
		amount = 16, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopItemCategory__8.Blocks
	}, {
		itemType = l__ItemType__6.WOOD_PLANK_OAK, 
		amount = 16, 
		price = 34, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopItemCategory__8.Blocks
	}, {
		itemType = l__ItemType__6.BLASTPROOF_CERAMIC, 
		amount = 4, 
		price = 18, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopItemCategory__8.Blocks
	}, {
		itemType = l__ItemType__6.OBSIDIAN, 
		amount = 4, 
		price = 4, 
		currency = l__ItemType__6.EMERALD, 
		category = l__BedwarsShopItemCategory__8.Blocks
	}, {
		itemType = l__ItemType__6.STONE_SWORD, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		ignoredByKit = { l__BedwarsKit__5.BARBARIAN, l__BedwarsKit__5.DASHER }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.IRON_SWORD, 
		amount = 1, 
		price = 70, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		ignoredByKit = { l__BedwarsKit__5.BARBARIAN, l__BedwarsKit__5.DASHER }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.DIAMOND_SWORD, 
		amount = 1, 
		price = 4, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		ignoredByKit = { l__BedwarsKit__5.BARBARIAN, l__BedwarsKit__5.DASHER, l__BedwarsKit__5.EMBER, l__BedwarsKit__5.LUMEN }, 
		category = l__BedwarsShopItemCategory__8.Armory
	}, {
		itemType = l__ItemType__6.EMERALD_SWORD, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		ignoredByKit = { l__BedwarsKit__5.BARBARIAN, l__BedwarsKit__5.ICE_QUEEN, l__BedwarsKit__5.DASHER, l__BedwarsKit__5.EMBER, l__BedwarsKit__5.LUMEN }, 
		category = l__BedwarsShopItemCategory__8.Armory
	}, {
		itemType = l__ItemType__6.VOID_SWORD, 
		amount = 1, 
		price = 10, 
		currency = l__ItemType__6.VOID_CRYSTAL, 
		lockAfterPurchase = true, 
		ignoredByKit = { l__BedwarsKit__5.BARBARIAN, l__BedwarsKit__5.DASHER }, 
		category = l__BedwarsShopItemCategory__8.Void
	}, {
		itemType = l__ItemType__6.ICE_SWORD, 
		amount = 1, 
		price = 6, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.ICE_QUEEN }, 
		category = l__BedwarsShopItemCategory__8.Armory
	}, {
		itemType = l__ItemType__6.HELL_SABER, 
		amount = 1, 
		price = 4, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.EMBER }, 
		category = l__BedwarsShopItemCategory__8.Armory
	}, {
		itemType = l__ItemType__6.HEAVENLY_SWORD, 
		amount = 1, 
		price = 4, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.LUMEN }, 
		category = l__BedwarsShopItemCategory__8.Armory
	}, {
		itemType = l__ItemType__6.PINATA, 
		amount = 1, 
		price = 35, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.PINATA }, 
		category = l__BedwarsShopItemCategory__8.Blocks
	}, {
		itemType = l__ItemType__6.STONE_DAO, 
		amount = 1, 
		price = 28, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.DASHER }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.IRON_DAO, 
		amount = 1, 
		price = 85, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.DASHER }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.DIAMOND_DAO, 
		amount = 1, 
		price = 5, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.DASHER }, 
		category = l__BedwarsShopItemCategory__8.Armory
	}, {
		itemType = l__ItemType__6.EMERALD_DAO, 
		amount = 1, 
		price = 24, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.DASHER }, 
		category = l__BedwarsShopItemCategory__8.Armory
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
		category = l__BedwarsShopItemCategory__8.Combat
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
		category = l__BedwarsShopItemCategory__8.Combat
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
		category = l__BedwarsShopItemCategory__8.Combat
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
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.VOID_CHESTPLATE, 
		customDisplayName = "Void Armor", 
		amount = 1, 
		price = 18, 
		currency = l__ItemType__6.VOID_CRYSTAL, 
		lockAfterPurchase = true, 
		spawnWithItems = l__BedwarsArmorSet__4.VOID, 
		category = l__BedwarsShopItemCategory__8.Void, 
		nextTier = l__ItemType__6.EMERALD_CHESTPLATE, 
		ignoredByKit = { l__BedwarsKit__5.BIGMAN }
	}, {
		itemType = l__ItemType__6.VOID_TURRET, 
		customDisplayName = "Void Turret", 
		amount = 1, 
		price = 3, 
		currency = l__ItemType__6.VOID_CRYSTAL, 
		category = l__BedwarsShopItemCategory__8.Void, 
		spawnWithItems = { l__ItemType__6.VOID_TURRET_TABLET }
	}, {
		itemType = l__ItemType__6.CARROT_SEEDS, 
		amount = 1, 
		price = 70, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.FARMER_CLETUS }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.MELON_SEEDS, 
		amount = 1, 
		price = 3, 
		currency = l__ItemType__6.EMERALD, 
		requiresKit = { l__BedwarsKit__5.FARMER_CLETUS }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.APPLE, 
		amount = 1, 
		price = 30, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.BAKER }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.PIE, 
		amount = 1, 
		price = 2, 
		currency = l__ItemType__6.EMERALD, 
		requiresKit = { l__BedwarsKit__5.BAKER }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.GUITAR, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.MELODY }, 
		spawnWithItems = { l__ItemType__6.GUITAR }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.CANNON, 
		amount = 1, 
		price = 30, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.DAVEY }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.SMOKE_BOMB, 
		amount = 1, 
		price = 25, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.SMOKE }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.SMOKE_BLOCK, 
		amount = 8, 
		price = 15, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.SMOKE }, 
		category = l__BedwarsShopItemCategory__8.Blocks
	}, {
		itemType = l__ItemType__6.LASSO, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.COWGIRL }, 
		spawnWithItems = { l__ItemType__6.LASSO }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.WIZARD_STAFF, 
		amount = 1, 
		price = 3, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.WIZARD }, 
		spawnWithItems = { l__ItemType__6.WIZARD_STAFF }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.CAMERA_TURRET, 
		amount = 1, 
		price = 1, 
		currency = l__ItemType__6.EMERALD, 
		requiresKit = { l__BedwarsKit__5.VULCAN }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.DRONE, 
		amount = 1, 
		price = 50, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.CYBER }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.DAMAGE_BANNER, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.CONQUEROR }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.DEFENSE_BANNER, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.CONQUEROR }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.HEAL_BANNER, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.CONQUEROR }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.DINO_DEPLOY, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.DINO_TAMER }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.FLAMETHROWER, 
		amount = 1, 
		price = 2, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.PYRO }, 
		spawnWithItems = { l__ItemType__6.FLAMETHROWER }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.RAVEN, 
		amount = 1, 
		price = 1, 
		currency = l__ItemType__6.EMERALD, 
		requiresKit = { l__BedwarsKit__5.RAVEN }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.JADE_HAMMER, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.JADE }, 
		spawnWithItems = { l__ItemType__6.JADE_HAMMER }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.VOID_AXE, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.REGENT }, 
		spawnWithItems = { l__ItemType__6.VOID_AXE }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.BEEHIVE, 
		amount = 1, 
		price = 60, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.BEEKEEPER }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.SPIRIT, 
		amount = 1, 
		price = 35, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.SPIRIT_CATCHER }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.SHIELD_AXOLOTL, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		nextTier = l__ItemType__6.DAMAGE_AXOLOTL, 
		dontGiveItem = true, 
		requiresKit = { l__BedwarsKit__5.AXOLOTL }, 
		category = l__BedwarsShopItemCategory__8.Combat
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
		category = l__BedwarsShopItemCategory__8.Combat
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
		category = l__BedwarsShopItemCategory__8.Combat
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
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.SNAP_TRAP, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.TRAPPER }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.OIL_CONSUMABLE, 
		amount = 1, 
		price = 1, 
		currency = l__ItemType__6.EMERALD, 
		requiresKit = { l__BedwarsKit__5.OIL_MAN }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.SPEAR, 
		amount = 1, 
		price = 30, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.SPEARMAN }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.FISHING_ROD, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.FISHERMAN }, 
		spawnWithItems = { l__ItemType__6.FISHING_ROD }, 
		category = l__BedwarsShopItemCategory__8.Tools
	}, {
		itemType = l__ItemType__6.VACUUM, 
		amount = 1, 
		price = 60, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__5.GHOST_CATCHER }, 
		spawnWithItems = { l__ItemType__6.VACUUM }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.GUMDROP_BOUNCE_PAD, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.GINGERBREAD_MAN }, 
		category = l__BedwarsShopItemCategory__8.Blocks
	}, {
		itemType = l__ItemType__6.BREWING_CAULDRON, 
		amount = 1, 
		price = 15, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.ALCHEMIST }, 
		category = l__BedwarsShopItemCategory__8.Blocks
	}, {
		itemType = l__ItemType__6.WOOD_BOW, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		spawnWithItems = { l__ItemType__6.WOOD_BOW }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.WOOD_CROSSBOW, 
		amount = 1, 
		price = 7, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		spawnWithItems = { l__ItemType__6.WOOD_CROSSBOW }, 
		category = l__BedwarsShopItemCategory__8.Armory, 
		ignoredByKit = { l__BedwarsKit__5.ARCHER }
	}, {
		itemType = l__ItemType__6.TACTICAL_CROSSBOW, 
		amount = 1, 
		price = 6, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		spawnWithItems = { l__ItemType__6.TACTICAL_CROSSBOW }, 
		requiresKit = { l__BedwarsKit__5.ARCHER }, 
		category = l__BedwarsShopItemCategory__8.Armory
	}, {
		itemType = l__ItemType__6.ARROW, 
		amount = 8, 
		price = 16, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.FIREBALL, 
		amount = 1, 
		price = 75, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.TELEPEARL, 
		amount = 1, 
		price = 1, 
		currency = l__ItemType__6.EMERALD, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.SANTA_BOMB, 
		amount = 1, 
		price = 70, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.SANTA }, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.SHEARS, 
		amount = 1, 
		price = 30, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		spawnWithItems = { l__ItemType__6.SHEARS }, 
		category = l__BedwarsShopItemCategory__8.Tools
	}, {
		itemType = l__ItemType__6.STONE_PICKAXE, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		prevTier = l__ItemType__6.WOOD_PICKAXE, 
		nextTier = l__ItemType__6.IRON_PICKAXE, 
		spawnWithItems = { l__ItemType__6.STONE_PICKAXE }, 
		category = l__BedwarsShopItemCategory__8.Tools
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
		category = l__BedwarsShopItemCategory__8.Tools
	}, {
		itemType = l__ItemType__6.DIAMOND_PICKAXE, 
		amount = 1, 
		price = 60, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		tiered = true, 
		prevTier = l__ItemType__6.IRON_PICKAXE, 
		spawnWithItems = { l__ItemType__6.DIAMOND_PICKAXE }, 
		category = l__BedwarsShopItemCategory__8.Tools
	}, {
		itemType = l__ItemType__6.WOOD_AXE, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		nextTier = l__ItemType__6.STONE_AXE, 
		spawnWithItems = { l__ItemType__6.WOOD_AXE }, 
		category = l__BedwarsShopItemCategory__8.Tools, 
		ignoredByKit = { l__BedwarsKit__5.MINER }
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
		category = l__BedwarsShopItemCategory__8.Tools, 
		ignoredByKit = { l__BedwarsKit__5.MINER }
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
		category = l__BedwarsShopItemCategory__8.Tools, 
		ignoredByKit = { l__BedwarsKit__5.MINER }
	}, {
		itemType = l__ItemType__6.DIAMOND_AXE, 
		amount = 1, 
		price = 60, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		tiered = true, 
		prevTier = l__ItemType__6.IRON_AXE, 
		spawnWithItems = { l__ItemType__6.DIAMOND_AXE }, 
		category = l__BedwarsShopItemCategory__8.Tools, 
		ignoredByKit = { l__BedwarsKit__5.MINER }
	}, {
		itemType = l__ItemType__6.HAMMER, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__5.BUILDER }, 
		spawnWithItems = { l__ItemType__6.HAMMER }, 
		lockAfterPurchase = true, 
		category = l__BedwarsShopItemCategory__8.Tools
	}, {
		itemType = l__ItemType__6.TNT, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopItemCategory__8.Blocks
	}, {
		itemType = l__ItemType__6.VOID_BLOCK, 
		amount = 16, 
		price = 1, 
		currency = l__ItemType__6.VOID_CRYSTAL, 
		category = l__BedwarsShopItemCategory__8.Void
	}, {
		itemType = l__ItemType__6.BALLOON, 
		amount = 3, 
		price = 2, 
		currency = l__ItemType__6.EMERALD, 
		category = l__BedwarsShopItemCategory__8.Combat, 
		disabledInQueue = { v2.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType.FLAG_CAPTURE }
	}, {
		itemType = l__ItemType__6.TESLA_TRAP, 
		amount = 1, 
		price = 50, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopItemCategory__8.Blocks
	}, {
		itemType = l__ItemType__6.STOPWATCH, 
		amount = 1, 
		price = 2, 
		currency = l__ItemType__6.EMERALD, 
		category = l__BedwarsShopItemCategory__8.Combat
	}, {
		itemType = l__ItemType__6.SNOWBALL, 
		amount = 8, 
		price = 16, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopItemCategory__8.Combat
	} };
v10.ShopItems = u2;
local v44 = {
	id = l__TeamUpgradeId__9.ARMORY, 
	name = "Armory", 
	image = l__ImageId__3.HELMET_SOLID, 
	menuPosition = "itemshop", 
	tiers = { {
			name = "Unlocks upgraded gear in the <b>Item Shop</b>", 
			price = 4, 
			values = { 1 }, 
			currency = l__ItemType__6.DIAMOND
		} }
};
local v45 = {};
local v46 = 0;
local v47, v48, v49 = ipairs(u2);
while true do
	local v50, v51 = v47(v48, v49);
	if not v50 then
		break;
	end;
	if v51.category == l__BedwarsShopItemCategory__8.Armory == true then
		v46 = v46 + 1;
		v45[v46] = v51;
	end;
end;
local v52 = table.create(#v45);
for v53, v54 in ipairs(v45) do
	v52[v53] = v54.itemType;
end;
v44.items = v52;
local v55 = { {
		id = l__TeamUpgradeId__9.GENERATOR, 
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
				currency = l__ItemType__6.DIAMOND
			} }
	}, {
		id = l__TeamUpgradeId__9.ARMOR, 
		name = "Armor Protection", 
		image = l__ImageId__3.SHIELD, 
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
		id = l__TeamUpgradeId__9.DAMAGE, 
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
		id = l__TeamUpgradeId__9.BREAK, 
		name = "Break Speed", 
		image = "rbxassetid://6822443323", 
		menuPosition = "main", 
		tiers = { {
				name = "Tier I: +15% Break Damage", 
				price = 3, 
				values = { 15 }, 
				currency = l__ItemType__6.DIAMOND
			}, {
				name = "Tier II: +40% Break Damage", 
				price = 6, 
				values = { 40 }, 
				currency = l__ItemType__6.DIAMOND
			} }
	}, {
		id = l__TeamUpgradeId__9.DIAMOND_GENERATOR, 
		name = "Diamond Generator", 
		image = l__ImageId__3.GEM_SOLID, 
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
		id = l__TeamUpgradeId__9.ALARM, 
		name = "Bed Alarm", 
		image = "rbxassetid://7392155479", 
		menuPosition = "bottom", 
		tiers = { {
				name = "Bed Alarm", 
				price = 2, 
				values = { 1 }, 
				currency = l__ItemType__6.DIAMOND
			} }
	}, v44 };
v10.TeamUpgrades = v55;
local v56 = {};
local v57 = 0;
local v58, v59, v60 = ipairs(v55);
while true do
	local v61, v62 = v58(v59, v60);
	if not v61 then
		break;
	end;
	if v62.items ~= nil == true then
		v57 = v57 + 1;
		v56[v57] = v62;
	end;
end;
v1 = {};
local function v63(p6, p7)
	local v64 = {};
	local v65 = #v64;
	local v66 = #p6;
	table.move(p6, 1, v66, v65 + 1, v64);
	local l__items__67 = p7.items;
	table.move(l__items__67, 1, #l__items__67, v65 + v66 + 1, v64);
	return v64;
end;
for v68 = 1, #v56 do
	v1 = v63(v1, v56[v68], v68 - 1, v56);
end;
v10.UnlockableBedwarsShopItems = local v69;
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
function v10.getUpgrade(p8, p9)
	for v70, v71 in ipairs(p8) do
		if v71.id == p9 == true then
			return v71;
		end;
	end;
	return nil;
end;
return {
	BedwarsShop = v10
};
