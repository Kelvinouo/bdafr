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
		local v12, v13, v14 = ipairs(u2);
		while true do
			v12(v13, v14);
			if not v12 then
				break;
			end;
			v14 = v12;
			u1[v13.itemType] = v13;		
		end;
	end;
	local v15 = u1[p1];
	if p2 then
		local v16, v17, v18 = ipairs(l__BedwarsShopOverrides__3);
		while true do
			v16(v17, v18);
			if not v16 then
				break;
			end;
			v18 = v16;
			if v17:shouldApply(p2) then
				local v19 = nil;
				local v20, v21, v22 = ipairs((v17:getOverride()));
				while true do
					v20(v21, v22);
					if not v20 then
						break;
					end;
					v22 = v20;
					if v21.itemType == p1 == true then
						v19 = v21;
						break;
					end;				
				end;
				if v19 then
					if v15 then
						local v23, v24, v25 = ipairs(u4.keys(v19));
						while true do
							v23(v24, v25);
							if not v23 then
								break;
							end;
							v25 = v23;
							v15[v24] = v19[v24];						
						end;
					else
						v15 = v19;
					end;
				end;
			end;		
		end;
	end;
	return v15;
end;
local l__Workspace__5 = v2.import(script, v2.getModule(script, "@rbxts", "services")).Workspace;
function v11.getShop(p3)
	local v26 = nil;
	local v27, v28, v29 = ipairs(l__BedwarsShopOverrides__3);
	while true do
		v27(v28, v29);
		if not v27 then
			break;
		end;
		v29 = v27;
		if v28:shouldApply(p3) then
			if not v26 then
				v26 = u4.deepCopy(u2);
			end;
			local v30, v31, v32 = ipairs(v28:getOverride());
			while true do
				v30(v31, v32);
				if not v30 then
					break;
				end;
				local v33 = nil;
				local v34, v35, v36 = ipairs(v26);
				while true do
					v34(v35, v36);
					if not v34 then
						break;
					end;
					v36 = v34;
					if v35.itemType == v31.itemType == true then
						v33 = v35;
						break;
					end;				
				end;
				if v33 then
					local v37, v38, v39 = ipairs(u4.keys(v31));
					while true do
						v37(v38, v39);
						if not v37 then
							break;
						end;
						v39 = v37;
						v33[v38] = v31[v38];					
					end;
				else
					table.insert(v26, v31);
				end;			
			end;
		end;	
	end;
	local v40 = v26 or u2;
	local v41 = l__Workspace__5:GetAttribute("QueueType");
	if v41 then
		local v42 = {};
		local v43 = 0;
		local v44, v45, v46 = ipairs(v40);
		while true do
			v44(v45, v46);
			if not v44 then
				break;
			end;
			if v45.disabledInQueue and table.find(v45.disabledInQueue, v41) ~= nil then
				local v47 = false;
			elseif v45.enabledOnlyInQueue and table.find(v45.enabledOnlyInQueue, v41) == nil then
				v47 = false;
			else
				v47 = true;
			end;
			if v47 == true then
				v43 = v43 + 1;
				v42[v43] = v45;
			end;		
		end;
		v40 = v42;
	end;
	return v40;
end;
local l__ItemType__6 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v11.getTeamGeneratorUpgradeCost(p4)
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
function v11.getTeamWool(p5)
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
		category = l__BedwarsShopItemCategory__9.Blocks, 
		disabledInQueue = { l__QueueType__4.TNT_WARS }
	}, {
		itemType = l__ItemType__6.OBSIDIAN, 
		amount = 4, 
		price = 4, 
		currency = l__ItemType__6.EMERALD, 
		category = l__BedwarsShopItemCategory__9.Blocks, 
		disabledInQueue = { l__QueueType__4.TNT_WARS }
	}, {
		itemType = l__ItemType__6.STONE_SWORD, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		ignoredByKit = { l__BedwarsKit__6.BARBARIAN, l__BedwarsKit__6.DASHER }, 
		category = l__BedwarsShopItemCategory__9.Combat, 
		disabledInQueue = { l__QueueType__4.TNT_WARS }
	}, {
		itemType = l__ItemType__6.IRON_SWORD, 
		amount = 1, 
		price = 70, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		ignoredByKit = { l__BedwarsKit__6.BARBARIAN, l__BedwarsKit__6.DASHER }, 
		category = l__BedwarsShopItemCategory__9.Combat, 
		disabledInQueue = { l__QueueType__4.TNT_WARS }
	}, {
		itemType = l__ItemType__6.DIAMOND_SWORD, 
		amount = 1, 
		price = 4, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		ignoredByKit = { l__BedwarsKit__6.BARBARIAN, l__BedwarsKit__6.DASHER, l__BedwarsKit__6.EMBER, l__BedwarsKit__6.LUMEN }, 
		category = l__BedwarsShopItemCategory__9.Armory, 
		disabledInQueue = { l__QueueType__4.TNT_WARS }
	}, {
		itemType = l__ItemType__6.EMERALD_SWORD, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		ignoredByKit = { l__BedwarsKit__6.BARBARIAN, l__BedwarsKit__6.ICE_QUEEN, l__BedwarsKit__6.DASHER, l__BedwarsKit__6.EMBER, l__BedwarsKit__6.LUMEN }, 
		category = l__BedwarsShopItemCategory__9.Armory, 
		disabledInQueue = { l__QueueType__4.TNT_WARS }
	}, {
		itemType = l__ItemType__6.ROCKET_BELT, 
		amount = 1, 
		price = 4, 
		currency = l__ItemType__6.EMERALD, 
		category = l__BedwarsShopItemCategory__9.Armory
	}, {
		itemType = l__ItemType__6.TURTLE_BACKPACK, 
		amount = 1, 
		price = 4, 
		currency = l__ItemType__6.EMERALD, 
		category = l__BedwarsShopItemCategory__9.Armory
	}, {
		itemType = l__ItemType__6.HEALING_BACKPACK, 
		amount = 1, 
		price = 4, 
		currency = l__ItemType__6.EMERALD, 
		category = l__BedwarsShopItemCategory__9.Armory
	}, {
		itemType = l__ItemType__6.VOID_SWORD, 
		amount = 1, 
		price = 10, 
		currency = l__ItemType__6.VOID_CRYSTAL, 
		lockAfterPurchase = true, 
		ignoredByKit = { l__BedwarsKit__6.BARBARIAN, l__BedwarsKit__6.DASHER }, 
		category = l__BedwarsShopItemCategory__9.Void
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
		itemType = l__ItemType__6.PINATA, 
		amount = 1, 
		price = 35, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		requiresKit = { l__BedwarsKit__6.PINATA }, 
		category = l__BedwarsShopItemCategory__9.Blocks
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
		itemType = l__ItemType__6.VOID_CHESTPLATE, 
		customDisplayName = "Void Armor", 
		amount = 1, 
		price = 18, 
		currency = l__ItemType__6.VOID_CRYSTAL, 
		lockAfterPurchase = true, 
		spawnWithItems = l__BedwarsArmorSet__5.VOID, 
		category = l__BedwarsShopItemCategory__9.Void, 
		nextTier = l__ItemType__6.EMERALD_CHESTPLATE, 
		ignoredByKit = { l__BedwarsKit__6.BIGMAN }
	}, {
		itemType = l__ItemType__6.VOID_TURRET, 
		customDisplayName = "Void Turret", 
		amount = 1, 
		price = 3, 
		currency = l__ItemType__6.VOID_CRYSTAL, 
		category = l__BedwarsShopItemCategory__9.Void, 
		spawnWithItems = { l__ItemType__6.VOID_TURRET_TABLET }
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
		disabledInQueue = { l__QueueType__4.SURVIVAL }, 
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
		price = 30, 
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
		itemType = l__ItemType__6.DINO_DEPLOY, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__6.DINO_TAMER }, 
		disabledInQueue = { l__QueueType__4.SURVIVAL }, 
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
		ignoredByKit = { l__BedwarsKit__6.ARCHER }, 
		disabledInQueue = { l__QueueType__4.TNT_WARS }
	}, {
		itemType = l__ItemType__6.TACTICAL_CROSSBOW, 
		amount = 1, 
		price = 6, 
		currency = l__ItemType__6.EMERALD, 
		lockAfterPurchase = true, 
		spawnWithItems = { l__ItemType__6.TACTICAL_CROSSBOW }, 
		requiresKit = { l__BedwarsKit__6.ARCHER }, 
		category = l__BedwarsShopItemCategory__9.Armory, 
		disabledInQueue = { l__QueueType__4.TNT_WARS }
	}, {
		itemType = l__ItemType__6.DETONATED_BOMB, 
		amount = 1, 
		price = 1, 
		currency = l__ItemType__6.EMERALD, 
		category = l__BedwarsShopItemCategory__9.Armory
	}, {
		itemType = l__ItemType__6.TENNIS_RACKET, 
		amount = 1, 
		price = 2, 
		currency = l__ItemType__6.EMERALD, 
		category = l__BedwarsShopItemCategory__9.Armory, 
		limitedTimeItem = true, 
		lockAfterPurchase = true, 
		additionalItems = { {
				itemType = l__ItemType__6.TENNIS_BALL, 
				amount = 4
			} }, 
		disabledInQueue = { l__QueueType__4.TNT_WARS }
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
		category = l__BedwarsShopItemCategory__9.Combat, 
		disabledInQueue = { l__QueueType__4.TNT_WARS }
	}, {
		itemType = l__ItemType__6.TENNIS_BALL, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopItemCategory__9.Armory, 
		limitedTimeItem = true, 
		disabledInQueue = { l__QueueType__4.TNT_WARS }
	}, {
		itemType = l__ItemType__6.SANTA_BOMB, 
		amount = 1, 
		price = 70, 
		currency = l__ItemType__6.IRON, 
		disabledInQueue = { l__QueueType__4.SURVIVAL }, 
		requiresKit = { l__BedwarsKit__6.SANTA }, 
		category = l__BedwarsShopItemCategory__9.Combat
	}, {
		itemType = l__ItemType__6.SHEARS, 
		amount = 1, 
		price = 30, 
		currency = l__ItemType__6.IRON, 
		lockAfterPurchase = true, 
		spawnWithItems = { l__ItemType__6.SHEARS }, 
		category = l__BedwarsShopItemCategory__9.Tools, 
		disabledInQueue = { l__QueueType__4.TNT_WARS }
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
		ignoredByKit = { l__BedwarsKit__6.MINER }, 
		disabledInQueue = { l__QueueType__4.TNT_WARS }
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
		ignoredByKit = { l__BedwarsKit__6.MINER }, 
		disabledInQueue = { l__QueueType__4.TNT_WARS }
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
		ignoredByKit = { l__BedwarsKit__6.MINER }, 
		disabledInQueue = { l__QueueType__4.TNT_WARS }
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
		ignoredByKit = { l__BedwarsKit__6.MINER }, 
		disabledInQueue = { l__QueueType__4.TNT_WARS }
	}, {
		itemType = l__ItemType__6.HAMMER, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.IRON, 
		requiresKit = { l__BedwarsKit__6.BUILDER }, 
		spawnWithItems = { l__ItemType__6.HAMMER }, 
		disabledInQueue = { l__QueueType__4.SURVIVAL }, 
		lockAfterPurchase = true, 
		category = l__BedwarsShopItemCategory__9.Tools
	}, {
		itemType = l__ItemType__6.TNT, 
		amount = 1, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopItemCategory__9.Blocks
	}, {
		itemType = l__ItemType__6.VOID_BLOCK, 
		amount = 16, 
		price = 1, 
		currency = l__ItemType__6.VOID_CRYSTAL, 
		category = l__BedwarsShopItemCategory__9.Void
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
		price = 60, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopItemCategory__9.Blocks, 
		disabledInQueue = { l__QueueType__4.SURVIVAL, l__QueueType__4.TNT_WARS }
	}, {
		itemType = l__ItemType__6.STOPWATCH, 
		amount = 1, 
		price = 2, 
		currency = l__ItemType__6.EMERALD, 
		category = l__BedwarsShopItemCategory__9.Combat, 
		disabledInQueue = { l__QueueType__4.TNT_WARS }
	}, {
		itemType = l__ItemType__6.SNOWBALL, 
		amount = 8, 
		price = 16, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopItemCategory__9.Combat, 
		disabledInQueue = { l__QueueType__4.TNT_WARS }
	}, {
		itemType = l__ItemType__6.TEAM_DOOR, 
		amount = 1, 
		price = 20, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopItemCategory__9.Blocks, 
		enabledOnlyInQueue = { l__QueueType__4.SURVIVAL }
	}, {
		itemType = l__ItemType__6.SPIKE_TRAP, 
		amount = 8, 
		price = 40, 
		currency = l__ItemType__6.IRON, 
		category = l__BedwarsShopItemCategory__9.Blocks, 
		enabledOnlyInQueue = { l__QueueType__4.SURVIVAL }
	}, {
		itemType = l__ItemType__6.AUTO_TURRET, 
		amount = 1, 
		price = 2, 
		currency = l__ItemType__6.EMERALD, 
		category = l__BedwarsShopItemCategory__9.Blocks, 
		enabledOnlyInQueue = { l__QueueType__4.SURVIVAL }
	}, {
		itemType = l__ItemType__6.SHOCK_WAVE_TURRET, 
		amount = 1, 
		price = 1, 
		currency = l__ItemType__6.EMERALD, 
		category = l__BedwarsShopItemCategory__9.Blocks, 
		enabledOnlyInQueue = { l__QueueType__4.SURVIVAL }
	} };
v11.ShopItems = u2;
local v48 = {
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
local v49 = {};
local v50 = 0;
local v51, v52, v53 = ipairs(u2);
while true do
	v51(v52, v53);
	if not v51 then
		break;
	end;
	if v52.category == l__BedwarsShopItemCategory__9.Armory == true then
		v50 = v50 + 1;
		v49[v50] = v52;
	end;
end;
local v54 = table.create(#v49);
local v55, v56, v57 = ipairs(v49);
while true do
	v55(v56, v57);
	if not v55 then
		break;
	end;
	v57 = v55;
	v54[v55] = v56.itemType;
end;
v48.items = v54;
local v58 = { {
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
				currency = l__ItemType__6.DIAMOND, 
				disabledInQueue = { l__QueueType__4.SURVIVAL }
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
	}, v48 };
v11.TeamUpgrades = v58;
local v59 = {};
local v60 = 0;
local v61, v62, v63 = ipairs(v58);
while true do
	v61(v62, v63);
	if not v61 then
		break;
	end;
	if v62.items ~= nil == true then
		v60 = v60 + 1;
		v59[v60] = v62;
	end;
end;
local function v64(p6, p7)
	local v65 = {};
	local v66 = #v65;
	local v67 = #p6;
	table.move(p6, 1, v67, v66 + 1, v65);
	local l__items__68 = p7.items;
	table.move(l__items__68, 1, #l__items__68, v66 + v67 + 1, v65);
	return v65;
end;
v1 = {};
for v69 = 1, #v59 do
	v1 = v64(v1, v59[v69], v69 - 1, v59);
end;
v11.UnlockableBedwarsShopItems = local v70;
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
function v11.getUpgrade(p8, p9)
	local v71, v72, v73 = ipairs(p8);
	while true do
		v71(v72, v73);
		if not v71 then
			break;
		end;
		v73 = v71;
		if v72.id == p9 == true then
			return v72;
		end;	
	end;
	return nil;
end;
return {
	BedwarsShop = v11
};
