-- Script Hash: e88eb58694091a912ed42d3d22281eb205db93d05f6de020e0b903d2c74b1e3cbc93df5d4481915baea4884e823b2ae4
-- Decompiled with the Synapse X Luau decompiler.

local v1 = nil;
local v2 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ImageId__3 = v2.import(script, v2.getModule(script, "@easy-games", "game-core").out).ImageId;
local l__QueueType__4 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local l__BedwarsArmorSet__5 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-armor-set").BedwarsArmorSet;
local l__BedwarsKit__6 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__FlamethrowerUpgrade__7 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "pyro", "flamethrower-upgrade").FlamethrowerUpgrade;
local v8 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types");
local l__BedwarsShopItemCategory__9 = v8.BedwarsShopItemCategory;
local l__TeamUpgradeId__10 = v8.TeamUpgradeId;
local v11 = {
	RepairEnchantTablePrice = 8
};
local u1 = nil;
local u2 = nil;
local l__BedwarsShopOverrides__3 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-override").BedwarsShopOverrides;
local u4 = v2.import(script, v2.getModule(script, "@rbxts", "object-utils"));
function v11.getShopItem(p1, p2)
	if not u1 then
		u1 = {};
		local function v12(p3)
			u1[p3.itemType] = p3;
		end;
		for v13, v14 in ipairs(u2) do
			v12(v14, v13 - 1, u2);
		end;
	end;
	local v15 = u1[p1];
	if p2 then
		for v16, v17 in ipairs(l__BedwarsShopOverrides__3) do
			if v17:shouldApply(p2) then
				local v18 = v17:getOverride();
				local function v19(p4)
					return p4.itemType == p1;
				end;
				local v20 = nil;
				for v21, v22 in ipairs(v18) do
					if v19(v22, v21 - 1, v18) == true then
						v20 = v22;
						break;
					end;
				end;
				if v20 then
					if v15 then
						for v23, v24 in ipairs(u4.keys(v20)) do
							v15[v24] = v20[v24];
						end;
					else
						v15 = v20;
					end;
				end;
			end;
		end;
	end;
	return v15;
end;
local l__Workspace__5 = v2.import(script, v2.getModule(script, "@rbxts", "services")).Workspace;
function v11.getShop(p5)
	local v25 = nil;
	for v26, v27 in ipairs(l__BedwarsShopOverrides__3) do
		if v27:shouldApply(p5) then
			if not v25 then
				v25 = u4.deepCopy(u2);
			end;
			local v28, v29, v30 = ipairs(v27:getOverride());
			while true do
				local v31, v32 = v28(v29, v30);
				if not v31 then
					break;
				end;
				local function v33(p6)
					return p6.itemType == v32.itemType;
				end;
				local v34 = nil;
				for v35, v36 in ipairs(v25) do
					if v33(v36, v35 - 1, v25) == true then
						v34 = v36;
						break;
					end;
				end;
				if v34 then
					for v37, v38 in ipairs(u4.keys(v32)) do
						v34[v38] = v32[v38];
					end;
				else
					table.insert(v25, v32);
				end;			
			end;
		end;
	end;
	local v39 = v25 or u2;
	local v40 = l__Workspace__5:GetAttribute("QueueType");
	if v40 then
		local function v41(p7)
			if p7.disabledInQueue and table.find(p7.disabledInQueue, v40) ~= nil then
				return false;
			end;
			return true;
		end;
		local v42 = {};
		local v43 = 0;
		for v44, v45 in ipairs(v39) do
			if v41(v45, v44 - 1, v39) == true then
				v43 = v43 + 1;
				v42[v43] = v45;
			end;
		end;
		v39 = v42;
	end;
	return v39;
end;
local l__ItemType__6 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v11.getTeamGeneratorUpgradeCost(p8)
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
function v11.getTeamWool(p9)
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
v11.Pickaxes = { l__ItemType__6.WOOD_PICKAXE, l__ItemType__6.STONE_PICKAXE, l__ItemType__6.IRON_PICKAXE, l__ItemType__6.DIAMOND_PICKAXE };
v11.Axes = { l__ItemType__6.WOOD_AXE, l__ItemType__6.STONE_AXE, l__ItemType__6.IRON_AXE, l__ItemType__6.DIAMOND_AXE };
u2 = { {
		itemType = l__ItemType__6.WOOL_WHITE, 
		amount = 16, 
		price = 8, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopItemCategory__9.Blocks
	}, {
		itemType = l__ItemType__6.STONE_BRICK, 
		amount = 16, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopItemCategory__9.Blocks
	}, {
		itemType = l__ItemType__6.WOOD_PLANK_OAK, 
		amount = 16, 
		price = 34, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopItemCategory__9.Blocks
	}, {
		itemType = l__ItemType__6.BLASTPROOF_CERAMIC, 
		amount = 4, 
		price = 18, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopItemCategory__9.Blocks
	}, {
		itemType = l__ItemType__6.OBSIDIAN, 
		amount = 4, 
		price = 4, 
		currency = l__ItemType__6.EMERALD, 
		category = l__BedwarsShopItemCategory__9.Blocks
	}, {
		itemType = l__ItemType__6.STONE_SWORD, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		ignoredByKit = { l__BedwarsKit__6.BARBARIAN, l__BedwarsKit__6.DASHER }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.IRON_SWORD, 
		amount = 1, 
		price = 70, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		ignoredByKit = { l__BedwarsKit__6.BARBARIAN, l__BedwarsKit__6.DASHER }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.DIAMOND_SWORD, 
		amount = 1, 
		price = 4, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		ignoredByKit = { l__BedwarsKit__6.BARBARIAN, l__BedwarsKit__6.DASHER, l__BedwarsKit__6.EMBER, l__BedwarsKit__6.LUMEN }, 
		category = l__BedwarsShopItemCategory__9.Armory
	}, {
		itemType = l__ItemType__6.EMERALD_SWORD, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		ignoredByKit = { l__BedwarsKit__6.BARBARIAN, l__BedwarsKit__6.ICE_QUEEN, l__BedwarsKit__6.DASHER, l__BedwarsKit__6.EMBER, l__BedwarsKit__6.LUMEN }, 
		category = l__BedwarsShopItemCategory__9.Armory
	}, {
		itemType = l__ItemType__6.ICE_SWORD, 
		amount = 1, 
		price = 6, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__6.ICE_QUEEN }, 
		category = l__BedwarsShopItemCategory__9.Armory
	}, {
		itemType = l__ItemType__6.HELL_SABER, 
		amount = 1, 
		price = 4, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__6.EMBER }, 
		category = l__BedwarsShopItemCategory__9.Armory
	}, {
		itemType = l__ItemType__6.HEAVENLY_SWORD, 
		amount = 1, 
		price = 4, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__6.LUMEN }, 
		category = l__BedwarsShopItemCategory__9.Armory
	}, {
		itemType = l__ItemType__6.STONE_DAO, 
		amount = 1, 
		price = 28, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__6.DASHER }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.IRON_DAO, 
		amount = 1, 
		price = 85, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__6.DASHER }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.DIAMOND_DAO, 
		amount = 1, 
		price = 5, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__6.DASHER }, 
		category = l__BedwarsShopItemCategory__9.Armory
	}, {
		itemType = l__ItemType__6.EMERALD_DAO, 
		amount = 1, 
		price = 24, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__6.DASHER }, 
		category = l__BedwarsShopItemCategory__9.Armory
	}, {
		itemType = l__ItemType__6.LEATHER_CHESTPLATE, 
		customDisplayName = "Leather Armor", 
		amount = 1, 
		price = 50, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		spawnWithItems = l__BedwarsArmorSet__5.LEATHER, 
		nextTier = l__ItemType__6.IRON_CHESTPLATE, 
		ignoredByKit = { l__BedwarsKit__6.BIGMAN }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.IRON_CHESTPLATE, 
		customDisplayName = "Iron Armor", 
		amount = 1, 
		price = 120, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		spawnWithItems = l__BedwarsArmorSet__5.IRON, 
		tiered = true, 
		prevTier = l__ItemType__6.LEATHER_CHESTPLATE, 
		nextTier = l__ItemType__6.DIAMOND_CHESTPLATE, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.DIAMOND_CHESTPLATE, 
		customDisplayName = "Diamond Armor", 
		amount = 1, 
		price = 8, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		spawnWithItems = l__BedwarsArmorSet__5.DIAMOND, 
		tiered = true, 
		prevTier = l__ItemType__6.IRON_CHESTPLATE, 
		nextTier = l__ItemType__6.EMERALD_CHESTPLATE, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.EMERALD_CHESTPLATE, 
		customDisplayName = "Emerald Armor", 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		spawnWithItems = l__BedwarsArmorSet__5.EMERALD, 
		tiered = true, 
		prevTier = l__ItemType__6.DIAMOND_CHESTPLATE, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.CARROT_SEEDS, 
		amount = 1, 
		price = 70, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__6.FARMER_CLETUS }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.MELON_SEEDS, 
		amount = 1, 
		price = 3, 
		currency = l__ItemType__6.EMERALD, 
		requiresKit = { l__BedwarsKit__6.FARMER_CLETUS }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.APPLE, 
		amount = 1, 
		price = 30, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__6.BAKER }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.PIE, 
		amount = 1, 
		price = 2, 
		currency = l__ItemType__6.EMERALD, 
		requiresKit = { l__BedwarsKit__6.BAKER }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.GUITAR, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__6.MELODY }, 
		spawnWithItems = { l__ItemType__6.GUITAR }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.CANNON, 
		amount = 1, 
		price = 30, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__6.DAVEY }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.SMOKE_BOMB, 
		amount = 1, 
		price = 25, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__6.SMOKE }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.SMOKE_BLOCK, 
		amount = 8, 
		price = 15, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__6.SMOKE }, 
		category = l__BedwarsShopItemCategory__9.Blocks
	}, {
		itemType = l__ItemType__6.LASSO, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__6.COWGIRL }, 
		spawnWithItems = { l__ItemType__6.LASSO }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.WIZARD_STAFF, 
		amount = 1, 
		price = 3, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__6.WIZARD }, 
		spawnWithItems = { l__ItemType__6.WIZARD_STAFF }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.CAMERA_TURRET, 
		amount = 1, 
		price = 1, 
		currency = l__ItemType__6.EMERALD, 
		requiresKit = { l__BedwarsKit__6.VULCAN }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.DRONE, 
		amount = 1, 
		price = 50, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__6.CYBER }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.DAMAGE_BANNER, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__6.CONQUEROR }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.DEFENSE_BANNER, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__6.CONQUEROR }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.HEAL_BANNER, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__6.CONQUEROR }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.FLAMETHROWER, 
		amount = 1, 
		price = 2, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__6.PYRO }, 
		spawnWithItems = { l__ItemType__6.FLAMETHROWER }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.RAVEN, 
		amount = 1, 
		price = 1, 
		currency = l__ItemType__6.EMERALD, 
		requiresKit = { l__BedwarsKit__6.RAVEN }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.JADE_HAMMER, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__6.JADE }, 
		spawnWithItems = { l__ItemType__6.JADE_HAMMER }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.VOID_AXE, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__6.REGENT }, 
		spawnWithItems = { l__ItemType__6.VOID_AXE }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.BEEHIVE, 
		amount = 1, 
		price = 60, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__6.BEEKEEPER }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.SPIRIT, 
		amount = 1, 
		price = 35, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__6.SPIRIT_CATCHER }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.SHIELD_AXOLOTL, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		nextTier = l__ItemType__6.DAMAGE_AXOLOTL, 
		dontGiveItem = true, 
		requiresKit = { l__BedwarsKit__6.AXOLOTL }, 
		category = l__BedwarsShopItemCategory__9.Combat
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
		requiresKit = { l__BedwarsKit__6.AXOLOTL }, 
		category = l__BedwarsShopItemCategory__9.Combat
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
		requiresKit = { l__BedwarsKit__6.AXOLOTL }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.HEALTH_REGEN_AXOLOTL, 
		amount = 1, 
		price = 6, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		tiered = true, 
		prevTier = l__ItemType__6.BREAK_SPEED_AXOLOTL, 
		dontGiveItem = true, 
		requiresKit = { l__BedwarsKit__6.AXOLOTL }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.SNAP_TRAP, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__6.TRAPPER }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.OIL_CONSUMABLE, 
		amount = 1, 
		price = 1, 
		currency = l__ItemType__6.EMERALD, 
		requiresKit = { l__BedwarsKit__6.OIL_MAN }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.SPEAR, 
		amount = 1, 
		price = 30, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__6.SPEARMAN }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.FISHING_ROD, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__6.FISHERMAN }, 
		spawnWithItems = { l__ItemType__6.FISHING_ROD }, 
		category = l__BedwarsShopItemCategory__9.Tools
	}, {
		itemType = l__ItemType__6.VACUUM, 
		amount = 1, 
		price = 60, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__6.GHOST_CATCHER }, 
		spawnWithItems = { l__ItemType__6.VACUUM }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.GUMDROP_BOUNCE_PAD, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__6.GINGERBREAD_MAN }, 
		category = l__BedwarsShopItemCategory__9.Blocks
	}, {
		itemType = l__ItemType__6.BREWING_CAULDRON, 
		amount = 1, 
		price = 15, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__6.ALCHEMIST }, 
		category = l__BedwarsShopItemCategory__9.Blocks
	}, {
		itemType = l__ItemType__6.WOOD_BOW, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		spawnWithItems = { l__ItemType__6.WOOD_BOW }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.WOOD_CROSSBOW, 
		amount = 1, 
		price = 7, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		spawnWithItems = { l__ItemType__6.WOOD_CROSSBOW }, 
		category = l__BedwarsShopItemCategory__9.Armory, 
		ignoredByKit = { l__BedwarsKit__6.ARCHER }
	}, {
		itemType = l__ItemType__6.TACTICAL_CROSSBOW, 
		amount = 1, 
		price = 6, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		spawnWithItems = { l__ItemType__6.TACTICAL_CROSSBOW }, 
		requiresKit = { l__BedwarsKit__6.ARCHER }, 
		category = l__BedwarsShopItemCategory__9.Armory
	}, {
		itemType = l__ItemType__6.GUIDED_MISSILE, 
		amount = 1, 
		price = 1, 
		currency = l__ItemType__6.EMERALD, 
		category = l__BedwarsShopItemCategory__9.Armory, 
		disabledInQueue = { l__QueueType__4.BEDWARS_RANKED_BETA }
	}, {
		itemType = l__ItemType__6.ARROW, 
		amount = 8, 
		price = 16, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.FIREBALL, 
		amount = 1, 
		price = 75, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.TELEPEARL, 
		amount = 1, 
		price = 1, 
		currency = l__ItemType__6.EMERALD, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.SANTA_BOMB, 
		amount = 1, 
		price = 70, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__6.SANTA }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.SHEARS, 
		amount = 1, 
		price = 30, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		spawnWithItems = { l__ItemType__6.SHEARS }, 
		category = l__BedwarsShopItemCategory__9.Tools
	}, {
		itemType = l__ItemType__6.STONE_PICKAXE, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		prevTier = l__ItemType__6.WOOD_PICKAXE, 
		nextTier = l__ItemType__6.IRON_PICKAXE, 
		spawnWithItems = { l__ItemType__6.STONE_PICKAXE }, 
		category = l__BedwarsShopItemCategory__9.Tools
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
		category = l__BedwarsShopItemCategory__9.Tools
	}, {
		itemType = l__ItemType__6.DIAMOND_PICKAXE, 
		amount = 1, 
		price = 60, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		tiered = true, 
		prevTier = l__ItemType__6.IRON_PICKAXE, 
		spawnWithItems = { l__ItemType__6.DIAMOND_PICKAXE }, 
		category = l__BedwarsShopItemCategory__9.Tools
	}, {
		itemType = l__ItemType__6.WOOD_AXE, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		nextTier = l__ItemType__6.STONE_AXE, 
		spawnWithItems = { l__ItemType__6.WOOD_AXE }, 
		category = l__BedwarsShopItemCategory__9.Tools, 
		ignoredByKit = { l__BedwarsKit__6.MINER }
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
		category = l__BedwarsShopItemCategory__9.Tools, 
		ignoredByKit = { l__BedwarsKit__6.MINER }
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
		category = l__BedwarsShopItemCategory__9.Tools, 
		ignoredByKit = { l__BedwarsKit__6.MINER }
	}, {
		itemType = l__ItemType__6.DIAMOND_AXE, 
		amount = 1, 
		price = 60, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		tiered = true, 
		prevTier = l__ItemType__6.IRON_AXE, 
		spawnWithItems = { l__ItemType__6.DIAMOND_AXE }, 
		category = l__BedwarsShopItemCategory__9.Tools, 
		ignoredByKit = { l__BedwarsKit__6.MINER }
	}, {
		itemType = l__ItemType__6.HAMMER, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__6.BUILDER }, 
		spawnWithItems = { l__ItemType__6.HAMMER }, 
		lockAfterPurchase = true, 
		category = l__BedwarsShopItemCategory__9.Tools
	}, {
		itemType = l__ItemType__6.TNT, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopItemCategory__9.Blocks
	}, {
		itemType = l__ItemType__6.ZIPLINE, 
		amount = 1, 
		price = 60, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.BALLOON, 
		amount = 3, 
		price = 2, 
		currency = l__ItemType__6.EMERALD, 
		category = l__BedwarsShopItemCategory__9.Combat, 
		disabledInQueue = { l__QueueType__4.FLAG_CAPTURE }
	}, {
		itemType = l__ItemType__6.TESLA_TRAP, 
		amount = 1, 
		price = 50, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopItemCategory__9.Blocks
	}, {
		itemType = l__ItemType__6.SNOWBALL, 
		amount = 8, 
		price = 16, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.INVISIBLE_LANDMINE, 
		amount = 1, 
		price = 65, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopItemCategory__9.Combat, 
		limitedTimeItem = true
	}, {
		itemType = l__ItemType__6.FRYING_PAN, 
		amount = 1, 
		price = 30, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.GRAPPLING_HOOK, 
		amount = 1, 
		price = 4, 
		currency = l__ItemType__6.EMERALD, 
		category = l__BedwarsShopItemCategory__9.Combat, 
		limitedTimeItem = true, 
		disabledInQueue = { l__QueueType__4.FLAG_CAPTURE }
	}, {
		itemType = l__ItemType__6.HELICOPTER_DEPLOY, 
		amount = 1, 
		price = 6, 
		currency = l__ItemType__6.EMERALD, 
		category = l__BedwarsShopItemCategory__9.Combat, 
		disabledInQueue = { l__QueueType__4.FLAG_CAPTURE }
	} };
v11.ShopItems = u2;
local v46 = {
	id = l__TeamUpgradeId__10.ARMORY, 
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
local function v47(p10)
	return p10.category == l__BedwarsShopItemCategory__9.Armory;
end;
local v48 = {};
local v49 = 0;
for v50, v51 in ipairs(u2) do
	if v47(v51, v50 - 1, u2) == true then
		v49 = v49 + 1;
		v48[v49] = v51;
	end;
end;
local function v52(p11)
	return p11.itemType;
end;
local v53 = table.create(#v48);
for v54, v55 in ipairs(v48) do
	v53[v54] = v52(v55, v54 - 1, v48);
end;
v46.items = v53;
local v56 = { {
		id = l__TeamUpgradeId__10.GENERATOR, 
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
		id = l__TeamUpgradeId__10.ARMOR, 
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
		id = l__TeamUpgradeId__10.DAMAGE, 
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
		id = l__TeamUpgradeId__10.BREAK, 
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
		id = l__TeamUpgradeId__10.DIAMOND_GENERATOR, 
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
		id = l__TeamUpgradeId__10.ALARM, 
		name = "Bed Alarm", 
		image = "rbxassetid://7392155479", 
		menuPosition = "bottom", 
		tiers = { {
				name = "Bed Alarm", 
				price = 2, 
				values = { 1 }, 
				currency = l__ItemType__6.DIAMOND
			} }
	}, v46 };
v11.TeamUpgrades = v56;
local function v57(p12)
	return p12.items ~= nil;
end;
local v58 = {};
local v59 = 0;
for v60, v61 in ipairs(v56) do
	if v57(v61, v60 - 1, v56) == true then
		v59 = v59 + 1;
		v58[v59] = v61;
	end;
end;
v1 = {};
local function v62(p13, p14)
	local v63 = {};
	local v64 = #v63;
	local v65 = #p13;
	table.move(p13, 1, v65, v64 + 1, v63);
	local l__items__66 = p14.items;
	table.move(l__items__66, 1, #l__items__66, v64 + v65 + 1, v63);
	return v63;
end;
for v67 = 1, #v58 do
	v1 = v62(v1, v58[v67], v67 - 1, v58);
end;
v11.UnlockableBedwarsShopItems = local v68;
v11.FlamethrowerUpgrades = { {
		id = l__FlamethrowerUpgrade__7.HEAT, 
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
		id = l__FlamethrowerUpgrade__7.POWER, 
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
		id = l__FlamethrowerUpgrade__7.RANGE, 
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
function v11.getUpgrade(p15, p16)
	local function v69(p17)
		return p17.id == p16;
	end;
	for v70, v71 in ipairs(p15) do
		if v69(v71, v70 - 1, p15) == true then
			return v71;
		end;
	end;
	return nil;
end;
return {
	BedwarsShop = v11
};
