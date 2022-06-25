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
		local function v11(p3)
			u1[p3.itemType] = p3;
		end;
		for v12, v13 in ipairs(u2) do
			v11(v13, v12 - 1, u2);
		end;
	end;
	local v14 = u1[p1];
	if p2 then
		for v15, v16 in ipairs(l__BedwarsShopOverrides__3) do
			if v16:shouldApply(p2) then
				local v17 = v16:getOverride();
				local function v18(p4)
					return p4.itemType == p1;
				end;
				local v19 = nil;
				for v20, v21 in ipairs(v17) do
					if v18(v21, v20 - 1, v17) == true then
						v19 = v21;
						break;
					end;
				end;
				if v19 then
					if v14 then
						for v22, v23 in ipairs(u4.keys(v19)) do
							v14[v23] = v19[v23];
						end;
					else
						v14 = v19;
					end;
				end;
			end;
		end;
	end;
	return v14;
end;
local l__Workspace__5 = v2.import(script, v2.getModule(script, "@rbxts", "services")).Workspace;
function v10.getShop(p5)
	local v24 = nil;
	for v25, v26 in ipairs(l__BedwarsShopOverrides__3) do
		if v26:shouldApply(p5) then
			if not v24 then
				v24 = u4.deepCopy(u2);
			end;
			local v27, v28, v29 = ipairs(v26:getOverride());
			while true do
				local v30, v31 = v27(v28, v29);
				if not v30 then
					break;
				end;
				local function v32(p6)
					return p6.itemType == v31.itemType;
				end;
				local v33 = nil;
				for v34, v35 in ipairs(v24) do
					if v32(v35, v34 - 1, v24) == true then
						v33 = v35;
						break;
					end;
				end;
				if v33 then
					for v36, v37 in ipairs(u4.keys(v31)) do
						v33[v37] = v31[v37];
					end;
				else
					table.insert(v24, v31);
				end;			
			end;
		end;
	end;
	local v38 = v24 or u2;
	local v39 = l__Workspace__5:GetAttribute("QueueType");
	if v39 then
		local function v40(p7)
			if p7.disabledInQueue and table.find(p7.disabledInQueue, v39) ~= nil then
				return false;
			end;
			return true;
		end;
		local v41 = {};
		local v42 = 0;
		for v43, v44 in ipairs(v38) do
			if v40(v44, v43 - 1, v38) == true then
				v42 = v42 + 1;
				v41[v42] = v44;
			end;
		end;
		v38 = v41;
	end;
	return v38;
end;
local l__ItemType__6 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v10.getTeamGeneratorUpgradeCost(p8)
	if p8 == 1 then
		return { {
				itemType = l__ItemType__6.DIAMOND, 
				amount = 2
			} };
	end;
	if p8 ~= 2 then
		return nil;
	end;
	return { {
			itemType = l__ItemType__6.DIAMOND, 
			amount = 4
		} };
end;
function v10.getTeamWool(p9)
	if p9 == "1" then
		return l__ItemType__6.WOOL_BLUE;
	end;
	if p9 == "2" then
		return l__ItemType__6.WOOL_RED;
	end;
	if p9 == "3" then
		return l__ItemType__6.WOOL_GREEN;
	end;
	if p9 == "4" then
		return l__ItemType__6.WOOL_YELLOW;
	end;
	if p9 == "5" then
		return l__ItemType__6.WOOL_ORANGE;
	end;
	if p9 == "6" then
		return l__ItemType__6.WOOL_PINK;
	end;
	if p9 == "7" then
		return l__ItemType__6.WOOL_CYAN;
	end;
	if p9 == "8" then
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
		itemType = l__ItemType__6.CARROT_CANNON, 
		amount = 1, 
		price = 10, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		category = l__BedwarsShopItemCategory__8.Armory, 
		additionalItems = { {
				itemType = l__ItemType__6.CARROT_ROCKET, 
				amount = 8
			} }
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
		itemType = l__ItemType__6.SNOWBALL, 
		amount = 8, 
		price = 16, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopItemCategory__8.Combat
	} };
v10.ShopItems = u2;
local v45 = {
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
local function v46(p10)
	return p10.category == l__BedwarsShopItemCategory__8.Armory;
end;
local v47 = {};
local v48 = 0;
for v49, v50 in ipairs(u2) do
	if v46(v50, v49 - 1, u2) == true then
		v48 = v48 + 1;
		v47[v48] = v50;
	end;
end;
local function v51(p11)
	return p11.itemType;
end;
local v52 = table.create(#v47);
for v53, v54 in ipairs(v47) do
	v52[v53] = v51(v54, v53 - 1, v47);
end;
v45.items = v52;
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
	}, v45 };
v10.TeamUpgrades = v55;
local function v56(p12)
	return p12.items ~= nil;
end;
local v57 = {};
local v58 = 0;
for v59, v60 in ipairs(v55) do
	if v56(v60, v59 - 1, v55) == true then
		v58 = v58 + 1;
		v57[v58] = v60;
	end;
end;
v1 = {};
local function v61(p13, p14)
	local v62 = {};
	local v63 = #v62;
	local v64 = #p13;
	table.move(p13, 1, v64, v63 + 1, v62);
	local l__items__65 = p14.items;
	table.move(l__items__65, 1, #l__items__65, v63 + v64 + 1, v62);
	return v62;
end;
for v66 = 1, #v57 do
	v1 = v61(v1, v57[v66], v66 - 1, v57);
end;
v10.UnlockableBedwarsShopItems = local v67;
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
function v10.getUpgrade(p15, p16)
	local function v68(p17)
		return p17.id == p16;
	end;
	for v69, v70 in ipairs(p15) do
		if v68(v70, v69 - 1, p15) == true then
			return v70;
		end;
	end;
	return nil;
end;
return {
	BedwarsShop = v10
};
