-- Script Hash: 346904d0d5789049cf5d505a90e7556812eabfcacf18f79f0fd44b5bc72c41e4f23d1e2cf4eb9dbea9130865a4874049
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BattlePassSeason__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-seasons").BattlePassSeason;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__PlaceUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__BedwarsKitSkin__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local l__BedwarsKit__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local v7 = {
	[l__BedwarsKit__6.NONE] = {
		name = "None", 
		description = "", 
		notGiftable = true, 
		renderImage = ""
	}
};
local v8 = {};
if l__PlaceUtil__4.isProduction() then
	local v9 = 18876495;
else
	v9 = 18875964;
end;
v8.gamepassId = v9;
v8.priceRobux = 399;
v8.name = "Farmer Cletus";
v8.description = "As a master of the farmland, Cletus grows crops that yield diamonds and emeralds.";
v8.previewItems = { l__ItemType__3.WATERING_CAN };
v8.renderImage = "rbxassetid://9155466936";
v8.skins = { l__BedwarsKitSkin__5.FARMER_CLETUS_SPIRIT };
v7[l__BedwarsKit__6.FARMER_CLETUS] = v8;
local v10 = {};
if l__PlaceUtil__4.isProduction() then
	local v11 = 19551065;
else
	v11 = 19551065;
end;
v10.gamepassId = v11;
v10.priceRobux = 399;
v10.name = "Barbarian";
v10.description = "Build rage by damaging enemies. Instead of buying swords, your sword is upgraded upon reaching max rage. You lose half your rage upon death. Emerald Sword is replaced by the Rageblade.";
v10.previewItems = { l__ItemType__3.RAGEBLADE };
v10.skins = { l__BedwarsKitSkin__5.BARBARIAN_DEEP_VOID, l__BedwarsKitSkin__5.BARBARIAN_VICTORIOUS };
v10.renderImage = "rbxassetid://9166207628";
v7[l__BedwarsKit__6.BARBARIAN] = v10;
local v12 = {};
if l__PlaceUtil__4.isProduction() then
	local v13 = 19088340;
else
	v13 = 19088340;
end;
v12.gamepassId = v13;
v12.priceRobux = 399;
v12.name = "Builder";
v12.description = "Fortify blocks with extra health and blast protection using the Builder's hammer. Purchase the Hammer from the Item Shop.";
v12.renderImage = "rbxassetid://9155463708";
v12.previewItems = { l__ItemType__3.HAMMER };
v7[l__BedwarsKit__6.BUILDER] = v12;
local v14 = {};
if l__PlaceUtil__4.isProduction() then
	local v15 = 19086951;
else
	v15 = 19088230;
end;
v14.gamepassId = v15;
v14.priceRobux = 399;
v14.name = "Baker";
v14.description = "Gain access to health-gain apples and speed-boost cakes.";
v14.renderImage = "rbxassetid://9155463919";
v14.skins = { l__BedwarsKitSkin__5.BAKER_SPIRIT };
v14.previewItems = { l__ItemType__3.PIE };
v7[l__BedwarsKit__6.BAKER] = v14;
local v16 = {};
if l__PlaceUtil__4.isProduction() then
	local v17 = 19275795;
else
	v17 = 19088230;
end;
v16.gamepassId = v17;
v16.priceRobux = 399;
v16.name = "Archer";
v16.description = "+15% projectile damage and access to the Tactical Crossbow in Item Shop.";
v16.previewItems = { l__ItemType__3.TACTICAL_CROSSBOW };
v16.renderImage = "rbxassetid://9224796984";
v7[l__BedwarsKit__6.ARCHER] = v16;
local v18 = {};
if l__PlaceUtil__4.isProduction() then
	local v19 = 19546564;
else
	v19 = 19546564;
end;
v18.gamepassId = v19;
v18.priceRobux = 399;
v18.name = "Infernal Shielder";
v18.description = "Spawn with a massive shield that can deflect damage + projectile knockback.";
v18.renderImage = "rbxassetid://9155464114";
v18.previewItems = { l__ItemType__3.INFERNAL_SHIELD };
v7[l__BedwarsKit__6.SHIELDER] = v18;
local v20 = {};
if l__PlaceUtil__4.isProduction() then
	local v21 = 19722364;
else
	v21 = 19722364;
end;
v20.gamepassId = v21;
v20.priceRobux = 399;
v20.name = "Melody";
v20.description = "Use a guitar and the power of music to heal nearby teammates. Heal yourself for 20% of heal given.";
v20.renderImage = "rbxassetid://9155464915";
v20.previewItems = { l__ItemType__3.GUITAR };
v20.skins = { l__BedwarsKitSkin__5.MELODY_ROCKSTAR };
v7[l__BedwarsKit__6.MELODY] = v20;
local v22 = {};
if l__PlaceUtil__4.isProduction() then
	local v23 = 20030035;
else
	v23 = 20030035;
end;
v22.gamepassId = v23;
v22.priceRobux = 399;
v22.name = "Pirate Davey";
v22.description = "Use a TNT Cannon to bombard your enemies.";
v22.renderImage = "rbxassetid://9155464612";
v7[l__BedwarsKit__6.DAVEY] = v22;
local v24 = {};
if l__PlaceUtil__4.isProduction() then
	local v25 = 20245233;
else
	v25 = 20245233;
end;
v24.gamepassId = v25;
v24.priceRobux = 399;
v24.name = "Eldertree";
v24.description = "Collect tree orbs around the map to increase size and max HP. Cannot buy armor.";
v24.renderImage = "rbxassetid://9155467211";
v24.forceSkin = true;
v7[l__BedwarsKit__6.BIGMAN] = v24;
local v26 = {};
if l__PlaceUtil__4.isProduction() then
	local v27 = 20645574;
else
	v27 = 20245233;
end;
v26.gamepassId = v27;
v26.priceRobux = 399;
v26.name = "Lassy";
v26.description = "Wrangle enemies towards you using a lasso.";
v26.renderImage = "rbxassetid://9155462968";
v26.previewItems = { l__ItemType__3.LASSO };
v7[l__BedwarsKit__6.COWGIRL] = v26;
v7[l__BedwarsKit__6.GRIM_REAPER] = {
	gamepassId = 20872871, 
	priceRobux = 399, 
	name = "Grim Reaper", 
	description = "Consuming enemy souls grants health regen, movespeed and invulnerability for 2.5s. Combat is disabled while consuming.", 
	renderImage = "rbxassetid://9155467410", 
	previewItems = {}
};
v7[l__BedwarsKit__6.WIZARD] = {
	gamepassId = 21261740, 
	priceRobux = 399, 
	name = "Wizard", 
	description = "Use a magical staff to cast lightning strikes and electricity orbs.", 
	previewItems = { l__ItemType__3.WIZARD_STAFF }, 
	renderImage = "rbxassetid://9166207809"
};
v7[l__BedwarsKit__6.VULCAN] = {
	gamepassId = 21421966, 
	priceRobux = 399, 
	name = "Vulcan", 
	description = "Use a high tech tablet to control camera turrets across the map.", 
	renderImage = "rbxassetid://9155465543", 
	previewItems = { l__ItemType__3.TABLET }, 
	skins = { l__BedwarsKitSkin__5.VULCAN_LUNAR }
};
v7[l__BedwarsKit__6.PYRO] = {
	name = "Pyro", 
	description = "Use your flamethrower to spray fire, making enemies brittle and taking more damage from attacks. Killing brittle enemies gives ember which you can use to upgrade your flamethrower.", 
	previewItems = { l__ItemType__3.FLAMETHROWER }, 
	unlockedInBattlePass = true, 
	renderImage = "rbxassetid://9155464770", 
	lobbyAnimation = {
		primary = "rbxassetid://7303855489"
	}, 
	battlepassSeason = l__BattlePassSeason__2.season1
};
v7[l__BedwarsKit__6.RAVEN] = {
	name = "Raven", 
	description = "Buy ravens and fly at enemies to deliver deadly doses of poison.", 
	previewItems = { l__ItemType__3.RAVEN }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__2.season1, 
	renderImage = "rbxassetid://9166206554"
};
v7[l__BedwarsKit__6.BEEKEEPER] = {
	name = "Beekeeper Beatrix", 
	description = "Catch bees around the map to upgrade your Bee Hive. Upgrading your Bee Hive will return additional iron and emeralds.", 
	previewItems = { l__ItemType__3.BEE_NET }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__2.season1, 
	renderImage = "rbxassetid://9312831285"
};
v7[l__BedwarsKit__6.JADE] = {
	name = "Jade", 
	description = "Jade carries a giant war hammer that can knockup nearby enemies.", 
	previewItems = { l__ItemType__3.JADE_HAMMER }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__2.season1, 
	renderImage = "rbxassetid://9166306816"
};
v7[l__BedwarsKit__6.WARRIOR] = {
	name = "Warrior", 
	description = "Armor is slightly cheaper and you can buy powerful warrior armor.", 
	previewItems = {}, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__2.season1, 
	renderImage = "rbxassetid://9166207008"
};
v7[l__BedwarsKit__6.BOUNTY_HUNTER] = {
	name = "Bounty Hunter", 
	description = "Get assigned bounties for killing certain players in the match. Completing a bounty rewards a random amount of resources.", 
	previewItems = {}, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__2.season1, 
	renderImage = "rbxassetid://9166208649"
};
v7[l__BedwarsKit__6.SPIRIT_CATCHER] = {
	name = "Spirit Catcher", 
	description = "Purchase spirits from the Item Shop and place them around the map. Spirits will chase down and explode nearby enemies.", 
	previewItems = { l__ItemType__3.SPIRIT }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__2.season1, 
	renderImage = "rbxassetid://9166207943"
};
local v28 = {
	name = "Trinity", 
	description = "Upon reaching three kills, choose between a Light and Void transformation. As the Light Angel, heal nearby teammates when damaging enemies. As the Void Angel, attacks will life steal.", 
	previewItems = {}, 
	priceRobux = 399
};
if l__PlaceUtil__4.isProduction() then
	local v29 = 1207029649;
else
	v29 = 1206777428;
end;
v28.devProductId = v29;
v28.renderImage = "rbxassetid://9166208240";
v7[l__BedwarsKit__6.ANGEL] = v28;
v7[l__BedwarsKit__6.AXOLOTL] = {
	name = "Axolotl Amy", 
	description = "Use your pet axolotls to empower yourself and nearby teammates with shields, increased attack damage, faster break speed and health regen.", 
	priceRobux = 399, 
	gamepassId = 24393543, 
	renderImage = "rbxassetid://9155466713", 
	skins = { l__BedwarsKitSkin__5.AXOLOTL_REINDEER, l__BedwarsKitSkin__5.AXOLOTL_EASTER_BUNNY }
};
v7[l__BedwarsKit__6.TRAPPER] = {
	name = "Trapper", 
	description = "Place Snap Traps to stun unexpecting enemies. Damaging a recently trapped enemy will consume a mark dealing extra damage.", 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__2.season2, 
	previewItems = { l__ItemType__3.SNAP_TRAP }, 
	renderImage = "rbxassetid://9166206875"
};
v7[l__BedwarsKit__6.FISHERMAN] = {
	name = "Fisherman", 
	description = "Why fight when you can fish?", 
	previewItems = { l__ItemType__3.FISHING_ROD }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__2.season2, 
	renderImage = "rbxassetid://9166208359"
};
v7[l__BedwarsKit__6.GHOST_CATCHER] = {
	name = "Gompy", 
	description = "Gompy the Ghost Hunter! Find ghosts around the map, vacuum them and fire them across the map.", 
	previewItems = {}, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__2.season2, 
	renderImage = "rbxassetid://9224802656"
};
v7[l__BedwarsKit__6.OIL_MAN] = {
	name = "Jack", 
	description = "Lob bundles of poisonous pumpkin oil across the map.", 
	previewItems = { l__ItemType__3.OIL_CONSUMABLE }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__2.season2, 
	renderImage = "rbxassetid://9166206259"
};
v7[l__BedwarsKit__6.SPEARMAN] = {
	name = "Ares", 
	description = "A powerful ancient warrior that uses electric-charged throwing spears to destroy his enemies.", 
	previewItems = { l__ItemType__3.SPEAR }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__2.season2, 
	renderImage = "rbxassetid://9166207341"
};
v7[l__BedwarsKit__6.TRIPLE_SHOT] = {
	name = "Vanessa", 
	description = "Super charge your bow to perform a triple shot.", 
	previewItems = { l__ItemType__3.FEATHER_BOW }, 
	priceRobux = 399, 
	gamepassId = 24913310, 
	skins = { l__BedwarsKitSkin__5.TRIPLE_SHOT_DEMON_EMPRESS }, 
	renderImage = "rbxassetid://9166208149"
};
v7[l__BedwarsKit__6.INFECTED] = {
	name = "Infected", 
	description = "\240\159\167\159\226\128\141\226\153\130\239\184\143", 
	renderImage = ""
};
v7[l__BedwarsKit__6.SUPER_INFECTED] = {
	name = "Super Infected", 
	description = "\240\159\145\145\240\159\167\159", 
	renderImage = ""
};
v7[l__BedwarsKit__6.ICE_QUEEN] = {
	name = "Freiya", 
	description = "Damage enemies to unlock your Frost passive. Once unlocked, dealing damage will apply stacks of Frost. At four stacks Frost is consumed and slows the target. Emerald Sword is replaced by the Ice Sword which amplifies Frost.", 
	priceRobux = 399, 
	gamepassId = 25647124, 
	renderImage = "rbxassetid://9155466204", 
	previewItems = { l__ItemType__3.ICE_SWORD }, 
	skins = { l__BedwarsKitSkin__5.FREIYA_TIGER_BRAWLER }
};
v7[l__BedwarsKit__6.AERY] = {
	name = "Aery", 
	description = "Killing enemies adds to your collection of spirit butterflies. Each spirit butterfly amplifies sword damage. Aery's base health is reduced to 90hp.", 
	renderImage = "rbxassetid://9155463221", 
	battlepassSeason = l__BattlePassSeason__2.season3, 
	unlockedInBattlePass = true, 
	skins = { l__BedwarsKitSkin__5.ACADEMY_AERY }
};
v7[l__BedwarsKit__6.YETI] = {
	name = "Yeti", 
	description = "Let out a Glacial Roar to temporarily freeze nearby blocks. Frozen blocks can be destroyed extremely fast.", 
	battlepassSeason = l__BattlePassSeason__2.season3, 
	unlockedInBattlePass = true, 
	renderImage = "rbxassetid://9166205917"
};
v7[l__BedwarsKit__6.GINGERBREAD_MAN] = {
	name = "Gingerbread Man", 
	description = "Place gumdrops bounce pads for extreme movement. Using a gumdrop bounce pad negates all fall damage and grants a shield.", 
	previewItems = {}, 
	unlockedInBattlePass = true, 
	renderImage = "rbxassetid://9155464364", 
	battlepassSeason = l__BattlePassSeason__2.season3
};
v7[l__BedwarsKit__6.SANTA] = {
	name = "Santa", 
	description = "Play as Santa and call in high-explosive sleigh strafe runs!", 
	previewItems = { l__ItemType__3.SANTA_BOMB }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__2.season3, 
	renderImage = "rbxassetid://9166206101"
};
v7[l__BedwarsKit__6.FROSTY] = {
	name = "Frosty", 
	description = "Passively create Frosted Snowballs for free. Frosted Snowballs are larger and faster.", 
	previewItems = { l__ItemType__3.FROSTED_SNOWBALL }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__2.season3, 
	renderImage = "rbxassetid://9166208762"
};
v7[l__BedwarsKit__6.REGENT] = {
	name = "Void Regent", 
	description = "Use a Void Axe to dash forward while slashing at enemies. Regent heals for a portion of damage dealt by Void Axe.\n\n<i>(Part of the Holiday 2021 Bundle)</i>", 
	previewItems = { l__ItemType__3.VOID_AXE }, 
	notGiftable = true, 
	limitedTime = true, 
	renderImage = "rbxassetid://9166208904"
};
v7[l__BedwarsKit__6.SMOKE] = {
	name = "Smoke", 
	description = "A stealth-focused kit that uses smoke charges to grant invisibility.", 
	renderImage = "rbxassetid://9155462247", 
	previewItems = { l__ItemType__3.SMOKE_BOMB }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__2.season3
};
v7[l__BedwarsKit__6.DASHER] = {
	name = "Yuzi", 
	description = "Swords are replaced by traditional Dao Swords. Hold attack to execute a forward dash AOE attack.", 
	previewItems = { l__ItemType__3.EMERALD_DAO }, 
	priceRobux = 399, 
	gamepassId = 28594502, 
	renderImage = "rbxassetid://9155467645", 
	skins = { l__BedwarsKitSkin__5.DASHER_TIGER }
};
v7[l__BedwarsKit__6.ALCHEMIST] = {
	name = "Alchemist", 
	description = "Use a cauldron to brew powerful potions from foraged wild ingredients. 5 unique potions.", 
	renderImage = "rbxassetid://9155462512", 
	previewItems = { l__ItemType__3.INVISIBILITY_POTION }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__2.season4
};
v7[l__BedwarsKit__6.MINER] = {
	name = "Miner", 
	description = "Killing enemies turns them into stone. The Miner can then break down the stone for valuables resources (scaled by price of enemy's armor + sword). Unable to purchase Axes.", 
	previewItems = { l__ItemType__3.MINER_PICKAXE }, 
	renderImage = "rbxassetid://9166208461", 
	skins = { l__BedwarsKitSkin__5.MINER_SPACE }, 
	priceRobux = 399, 
	gamepassId = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "gamepass").Gamepass.MINER
};
v7[l__BedwarsKit__6.MIDNIGHT] = {
	name = "Nyx", 
	description = "Trigger the darkness of Midnight to deal ramping increased damage and armor pen.", 
	renderImage = "rbxassetid://9155462763", 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__2.season4
};
v7[l__BedwarsKit__6.SHEEP_HERDER] = {
	name = "Sheep Herder", 
	description = "Find and tame wild sheep around the map. Each tamed sheep amplifies your damage.", 
	renderImage = "rbxassetid://9155465730", 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__2.season4, 
	previewItems = { l__ItemType__3.CROOK }
};
v7[l__BedwarsKit__6.BEAST] = {
	name = "Crocowolf", 
	description = "Losing your bed transforms you into the Crocowolf Beast and empowers your movespeed + knockback.", 
	renderImage = "rbxassetid://9155465124", 
	forceSkin = true, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__2.season4
};
v7[l__BedwarsKit__6.METAL_DETECTOR] = {
	name = "Metal Detector", 
	description = "Use a Metal Detector to find treasure around the map.", 
	renderImage = "rbxassetid://9378298061", 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__2.season4
};
v7[l__BedwarsKit__6.CONQUEROR] = {
	name = "Conqueror", 
	description = "Place banners to empower nearby allies.", 
	renderImage = "rbxassetid://9568930198", 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__2.season4
};
v7[l__BedwarsKit__6.CYBER] = {
	name = "Cyber", 
	description = "Deploy and control drones to pickup resources from around the map. Drones can also airdrop primed TNT.", 
	renderImage = "rbxassetid://9507126891", 
	priceRobux = 399, 
	gamepassId = 42490369
};
v7[l__BedwarsKit__6.EMBER] = {
	name = "Ember", 
	description = "Charge the Blade of Fire to ignite in a deadly spin! Striking enemies OR killing Lumen will upgrade your ability to a much more powerful spin.", 
	renderImage = "rbxassetid://9630017904", 
	hiddenInShopTillUnlocked = true, 
	notGiftable = true
};
v7[l__BedwarsKit__6.LUMEN] = {
	name = "Lumen", 
	description = "Charge the Sword of Light to shoot powerful waves at enemies! Hitting light waves OR killing Ember will upgrade your ability to shoot many powerful beams at once.", 
	renderImage = "rbxassetid://9630018371", 
	hiddenInShopTillUnlocked = true, 
	notGiftable = true
};
return {
	getBedwarsKitMeta = function(p1)
		return v7[p1];
	end, 
	BedwarsKitMeta = v7
};
