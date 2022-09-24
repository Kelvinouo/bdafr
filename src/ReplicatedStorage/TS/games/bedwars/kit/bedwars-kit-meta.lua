-- Decompiled with the Synapse X Luau decompiler.

local v1 = nil;
local v2 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v3 = v2.import(script, v2.getModule(script, "@rbxts", "object-utils"));
local l__BattlePassSeason__4 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-seasons").BattlePassSeason;
local l__BedwarsImageId__5 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__ItemType__6 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__Gamepass__7 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "gamepass").Gamepass;
local l__PlaceUtil__8 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__BedwarsKitSkin__9 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local l__BedwarsKit__10 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__BedwarsClass__11 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class").BedwarsClass;
local v12 = {
	[l__BedwarsKit__10.NONE] = {
		name = "None", 
		description = "", 
		notGiftable = true, 
		renderImage = "", 
		kitClass = nil
	}
};
local v13 = {};
if l__PlaceUtil__8.isProduction() then
	local v14 = 18876495;
else
	v14 = 18875964;
end;
v13.gamepassId = v14;
v13.priceRobux = 399;
v13.name = "Farmer Cletus";
v13.description = "As a master of the farmland, Cletus grows crops that yield diamonds and emeralds.";
v13.previewItems = { l__ItemType__6.WATERING_CAN };
v13.renderImage = "rbxassetid://9155466936";
v13.skins = { l__BedwarsKitSkin__9.FARMER_CLETUS_SPIRIT };
v13.kitClass = l__BedwarsClass__11.ECONOMY;
v12[l__BedwarsKit__10.FARMER_CLETUS] = v13;
local v15 = {};
if l__PlaceUtil__8.isProduction() then
	local v16 = 19551065;
else
	v16 = 19551065;
end;
v15.gamepassId = v16;
v15.priceRobux = 399;
v15.name = "Barbarian";
v15.description = "Build rage by damaging enemies. Instead of buying swords, your sword is upgraded upon reaching max rage. You lose half your rage upon death. Emerald Sword is replaced by the Rageblade.";
v15.previewItems = { l__ItemType__6.RAGEBLADE };
v15.skins = { l__BedwarsKitSkin__9.BARBARIAN_DEEP_VOID, l__BedwarsKitSkin__9.BARBARIAN_VICTORIOUS };
v15.renderImage = "rbxassetid://9166207628";
v15.kitClass = l__BedwarsClass__11.FIGHTER;
v12[l__BedwarsKit__10.BARBARIAN] = v15;
local v17 = {};
if l__PlaceUtil__8.isProduction() then
	local v18 = 19088340;
else
	v18 = 19088340;
end;
v17.gamepassId = v18;
v17.priceRobux = 399;
v17.name = "Builder";
v17.description = "Fortify blocks with extra health and blast protection using the Builder's hammer. Purchase the Hammer from the Item Shop.";
v17.renderImage = "rbxassetid://9155463708";
v17.previewItems = { l__ItemType__6.HAMMER };
v17.kitClass = l__BedwarsClass__11.DEFENDER;
v12[l__BedwarsKit__10.BUILDER] = v17;
local v19 = {};
if l__PlaceUtil__8.isProduction() then
	local v20 = 19086951;
else
	v20 = 19088230;
end;
v19.gamepassId = v20;
v19.priceRobux = 399;
v19.name = "Baker";
v19.description = "Gain access to health-gain apples and speed-boost cakes.";
v19.renderImage = "rbxassetid://9155463919";
v19.skins = { l__BedwarsKitSkin__9.BAKER_SPIRIT };
v19.previewItems = { l__ItemType__6.PIE };
v19.kitClass = l__BedwarsClass__11.SUPPORT;
v12[l__BedwarsKit__10.BAKER] = v19;
local v21 = {};
if l__PlaceUtil__8.isProduction() then
	local v22 = 19275795;
else
	v22 = 19088230;
end;
v21.gamepassId = v22;
v21.priceRobux = 399;
v21.name = "Archer";
v21.description = "+15% projectile damage and access to the Tactical Crossbow in Item Shop.";
v21.previewItems = { l__ItemType__6.TACTICAL_CROSSBOW };
v21.renderImage = "rbxassetid://9224796984";
v21.kitClass = l__BedwarsClass__11.FIGHTER;
v12[l__BedwarsKit__10.ARCHER] = v21;
local v23 = {};
if l__PlaceUtil__8.isProduction() then
	local v24 = 19546564;
else
	v24 = 19546564;
end;
v23.gamepassId = v24;
v23.priceRobux = 399;
v23.name = "Infernal Shielder";
v23.description = "Spawn with a massive shield that can deflect damage + projectile knockback.";
v23.renderImage = "rbxassetid://9155464114";
v23.previewItems = { l__ItemType__6.INFERNAL_SHIELD };
v23.kitClass = l__BedwarsClass__11.TANK;
v12[l__BedwarsKit__10.SHIELDER] = v23;
local v25 = {};
if l__PlaceUtil__8.isProduction() then
	local v26 = 19722364;
else
	v26 = 19722364;
end;
v25.gamepassId = v26;
v25.priceRobux = 399;
v25.name = "Melody";
v25.description = "Use a guitar and the power of music to heal nearby teammates. Heal yourself for 20% of heal given.";
v25.renderImage = "rbxassetid://9155464915";
v25.previewItems = { l__ItemType__6.GUITAR };
v25.skins = { l__BedwarsKitSkin__9.MELODY_ROCKSTAR };
v25.kitClass = l__BedwarsClass__11.SUPPORT;
v12[l__BedwarsKit__10.MELODY] = v25;
local v27 = {};
if l__PlaceUtil__8.isProduction() then
	local v28 = 20030035;
else
	v28 = 20030035;
end;
v27.gamepassId = v28;
v27.priceRobux = 399;
v27.name = "Pirate Davey";
v27.description = "Use a TNT Cannon to bombard your enemies.";
v27.renderImage = "rbxassetid://9155464612";
v27.skins = { l__BedwarsKitSkin__9.DAVEY_GHOST };
v27.kitClass = l__BedwarsClass__11.DESTROYER;
v12[l__BedwarsKit__10.DAVEY] = v27;
local v29 = {};
if l__PlaceUtil__8.isProduction() then
	local v30 = 20245233;
else
	v30 = 20245233;
end;
v29.gamepassId = v30;
v29.priceRobux = 399;
v29.name = "Eldertree";
v29.description = "Collect tree orbs around the map to increase size and max HP. Cannot buy armor.";
v29.renderImage = "rbxassetid://9155467211";
v29.forceSkin = true;
v29.skins = { l__BedwarsKitSkin__9.BIGMAN_SPIRIT };
v29.kitClass = l__BedwarsClass__11.TANK;
v12[l__BedwarsKit__10.BIGMAN] = v29;
local v31 = {};
if l__PlaceUtil__8.isProduction() then
	local v32 = 20645574;
else
	v32 = 20245233;
end;
v31.gamepassId = v32;
v31.priceRobux = 399;
v31.name = "Lassy";
v31.description = "Wrangle enemies towards you using a lasso.";
v31.renderImage = "rbxassetid://9155462968";
v31.previewItems = { l__ItemType__6.LASSO };
v31.kitClass = l__BedwarsClass__11.FIGHTER;
v12[l__BedwarsKit__10.COWGIRL] = v31;
v12[l__BedwarsKit__10.GRIM_REAPER] = {
	gamepassId = 20872871, 
	priceRobux = 399, 
	name = "Grim Reaper", 
	description = "Consuming enemy souls grants health regen, movespeed and invulnerability for 2.5s. Combat is disabled while consuming.", 
	renderImage = "rbxassetid://9155467410", 
	previewItems = {}, 
	kitClass = l__BedwarsClass__11.FIGHTER
};
v12[l__BedwarsKit__10.WIZARD] = {
	gamepassId = 21261740, 
	priceRobux = 399, 
	name = "Wizard", 
	description = "Use a magical staff to cast lightning strikes and electricity orbs.", 
	previewItems = { l__ItemType__6.WIZARD_STAFF }, 
	renderImage = "rbxassetid://9166207809", 
	kitClass = l__BedwarsClass__11.FIGHTER
};
v12[l__BedwarsKit__10.VULCAN] = {
	gamepassId = 21421966, 
	priceRobux = 399, 
	name = "Vulcan", 
	description = "Use a high tech tablet to control camera turrets across the map.", 
	renderImage = "rbxassetid://9155465543", 
	previewItems = { l__ItemType__6.TABLET }, 
	skins = { l__BedwarsKitSkin__9.VULCAN_LUNAR }, 
	kitClass = l__BedwarsClass__11.DEFENDER
};
v12[l__BedwarsKit__10.PYRO] = {
	name = "Pyro", 
	description = "Use your flamethrower to spray fire, making enemies brittle and taking more damage from attacks. Killing brittle enemies gives ember which you can use to upgrade your flamethrower.", 
	previewItems = { l__ItemType__6.FLAMETHROWER }, 
	unlockedInBattlePass = true, 
	renderImage = "rbxassetid://9155464770", 
	lobbyAnimation = {
		primary = "rbxassetid://7303855489"
	}, 
	battlepassSeason = l__BattlePassSeason__4.season1, 
	kitClass = l__BedwarsClass__11.FIGHTER
};
v12[l__BedwarsKit__10.RAVEN] = {
	name = "Raven", 
	description = "Buy ravens and fly at enemies to deliver deadly doses of poison.", 
	previewItems = { l__ItemType__6.RAVEN }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season1, 
	renderImage = "rbxassetid://9166206554", 
	kitClass = l__BedwarsClass__11.FIGHTER
};
v12[l__BedwarsKit__10.BEEKEEPER] = {
	name = "Beekeeper Beatrix", 
	description = "Catch bees around the map to upgrade your Bee Hive. Upgrading your Bee Hive will return additional iron and emeralds.", 
	previewItems = { l__ItemType__6.BEE_NET }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season1, 
	renderImage = "rbxassetid://9312831285", 
	kitClass = l__BedwarsClass__11.ECONOMY
};
v12[l__BedwarsKit__10.JADE] = {
	name = "Jade", 
	description = "Jade carries a giant war hammer that can knockup nearby enemies.", 
	previewItems = { l__ItemType__6.JADE_HAMMER }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season1, 
	renderImage = "rbxassetid://9166306816", 
	kitClass = l__BedwarsClass__11.MOVEMENT
};
v12[l__BedwarsKit__10.WARRIOR] = {
	name = "Warrior", 
	description = "Armor is slightly cheaper and you can buy powerful warrior armor.", 
	previewItems = {}, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season1, 
	renderImage = "rbxassetid://9166207008", 
	kitClass = l__BedwarsClass__11.TANK
};
v12[l__BedwarsKit__10.BOUNTY_HUNTER] = {
	name = "Bounty Hunter", 
	description = "Get assigned bounties for killing certain players in the match. Completing a bounty rewards a random amount of resources.", 
	previewItems = {}, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season1, 
	renderImage = "rbxassetid://9166208649", 
	kitClass = l__BedwarsClass__11.ECONOMY
};
v12[l__BedwarsKit__10.SPIRIT_CATCHER] = {
	name = "Spirit Catcher", 
	description = "Purchase spirits from the Item Shop and place them around the map. Spirits will chase down and explode nearby enemies.", 
	previewItems = { l__ItemType__6.SPIRIT }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season1, 
	renderImage = "rbxassetid://9166207943", 
	kitClass = l__BedwarsClass__11.FIGHTER
};
local v33 = {
	name = "Trinity", 
	description = "Upon reaching three kills, choose between a Light and Void transformation. As the Light Angel, heal nearby teammates when damaging enemies. As the Void Angel, attacks will life steal.", 
	previewItems = {}, 
	priceRobux = 399
};
if l__PlaceUtil__8.isProduction() then
	local v34 = 1207029649;
else
	v34 = 1206777428;
end;
v33.devProductId = v34;
v33.renderImage = "rbxassetid://9166208240";
v33.kitClass = l__BedwarsClass__11.SUPPORT;
v12[l__BedwarsKit__10.ANGEL] = v33;
v12[l__BedwarsKit__10.AXOLOTL] = {
	name = "Axolotl Amy", 
	description = "Use your pet axolotls to empower yourself and nearby teammates with shields, increased attack damage, faster break speed and health regen.", 
	priceRobux = 399, 
	gamepassId = 24393543, 
	renderImage = "rbxassetid://9155466713", 
	skins = { l__BedwarsKitSkin__9.AXOLOTL_REINDEER, l__BedwarsKitSkin__9.AXOLOTL_EASTER_BUNNY }, 
	kitClass = l__BedwarsClass__11.SUPPORT
};
v12[l__BedwarsKit__10.TRAPPER] = {
	name = "Trapper", 
	description = "Place Snap Traps to stun unexpecting enemies. Damaging a recently trapped enemy will consume a mark dealing extra damage.", 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season2, 
	previewItems = { l__ItemType__6.SNAP_TRAP }, 
	renderImage = "rbxassetid://9166206875", 
	kitClass = l__BedwarsClass__11.DEFENDER
};
v12[l__BedwarsKit__10.FISHERMAN] = {
	name = "Fisherman", 
	description = "Why fight when you can fish?", 
	previewItems = { l__ItemType__6.FISHING_ROD }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season2, 
	renderImage = "rbxassetid://9166208359", 
	kitClass = l__BedwarsClass__11.ECONOMY
};
v12[l__BedwarsKit__10.GHOST_CATCHER] = {
	name = "Gompy", 
	description = "Gompy the Ghost Hunter! Find ghosts around the map, vacuum them and fire them across the map.", 
	previewItems = {}, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season2, 
	renderImage = "rbxassetid://9224802656", 
	kitClass = l__BedwarsClass__11.FIGHTER
};
v12[l__BedwarsKit__10.OIL_MAN] = {
	name = "Jack", 
	description = "Lob bundles of poisonous pumpkin oil across the map.", 
	previewItems = { l__ItemType__6.OIL_CONSUMABLE }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season2, 
	renderImage = "rbxassetid://9166206259", 
	kitClass = l__BedwarsClass__11.MISC
};
v12[l__BedwarsKit__10.SPEARMAN] = {
	name = "Ares", 
	description = "A powerful ancient warrior that uses electric-charged throwing spears to destroy his enemies.", 
	previewItems = { l__ItemType__6.SPEAR }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season2, 
	renderImage = "rbxassetid://9166207341", 
	kitClass = l__BedwarsClass__11.FIGHTER
};
v12[l__BedwarsKit__10.TRIPLE_SHOT] = {
	name = "Vanessa", 
	description = "Super charge your bow to perform a triple shot.", 
	previewItems = { l__ItemType__6.FEATHER_BOW }, 
	priceRobux = 399, 
	gamepassId = 24913310, 
	skins = { l__BedwarsKitSkin__9.TRIPLE_SHOT_DEMON_EMPRESS }, 
	renderImage = "rbxassetid://9166208149", 
	kitClass = l__BedwarsClass__11.FIGHTER
};
v12[l__BedwarsKit__10.INFECTED] = {
	name = "Infected", 
	description = "\240\159\167\159\226\128\141\226\153\130\239\184\143", 
	renderImage = "", 
	kitClass = l__BedwarsClass__11.FIGHTER
};
v12[l__BedwarsKit__10.SUPER_INFECTED] = {
	name = "Super Infected", 
	description = "\240\159\145\145\240\159\167\159", 
	renderImage = "", 
	kitClass = l__BedwarsClass__11.FIGHTER
};
v12[l__BedwarsKit__10.ICE_QUEEN] = {
	name = "Freiya", 
	description = "Damage enemies to unlock your Frost passive. Once unlocked, dealing damage will apply stacks of Frost. At four stacks Frost is consumed and slows the target. Emerald Sword is replaced by the Ice Sword which amplifies Frost.", 
	priceRobux = 399, 
	gamepassId = 25647124, 
	renderImage = "rbxassetid://9155466204", 
	previewItems = { l__ItemType__6.ICE_SWORD }, 
	skins = { l__BedwarsKitSkin__9.FREIYA_TIGER_BRAWLER }, 
	kitClass = l__BedwarsClass__11.FIGHTER
};
v12[l__BedwarsKit__10.AERY] = {
	name = "Aery", 
	description = "Killing enemies adds to your collection of spirit butterflies. Each spirit butterfly amplifies sword damage. Aery's base health is reduced to 90hp.", 
	renderImage = "rbxassetid://9155463221", 
	battlepassSeason = l__BattlePassSeason__4.season3, 
	unlockedInBattlePass = true, 
	skins = { l__BedwarsKitSkin__9.ACADEMY_AERY }, 
	kitClass = l__BedwarsClass__11.FIGHTER
};
v12[l__BedwarsKit__10.YETI] = {
	name = "Yeti", 
	description = "Let out a Glacial Roar to temporarily freeze nearby blocks. Frozen blocks can be destroyed extremely fast.", 
	battlepassSeason = l__BattlePassSeason__4.season3, 
	unlockedInBattlePass = true, 
	renderImage = "rbxassetid://9166205917", 
	kitClass = l__BedwarsClass__11.DESTROYER
};
v12[l__BedwarsKit__10.GINGERBREAD_MAN] = {
	name = "Gingerbread Man", 
	description = "Place gumdrops bounce pads for extreme movement. Using a gumdrop bounce pad negates all fall damage and grants a shield.", 
	previewItems = {}, 
	unlockedInBattlePass = true, 
	renderImage = "rbxassetid://9155464364", 
	battlepassSeason = l__BattlePassSeason__4.season3, 
	kitClass = l__BedwarsClass__11.SUPPORT
};
v12[l__BedwarsKit__10.SANTA] = {
	name = "Santa", 
	description = "Play as Santa and call in high-explosive sleigh strafe runs!", 
	previewItems = { l__ItemType__6.SANTA_BOMB }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season3, 
	renderImage = "rbxassetid://9166206101", 
	kitClass = l__BedwarsClass__11.DESTROYER
};
v12[l__BedwarsKit__10.FROSTY] = {
	name = "Frosty", 
	description = "Passively create Frosted Snowballs for free. Frosted Snowballs are larger and faster.", 
	previewItems = { l__ItemType__6.FROSTED_SNOWBALL }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season3, 
	renderImage = "rbxassetid://9166208762", 
	kitClass = l__BedwarsClass__11.MISC
};
v12[l__BedwarsKit__10.REGENT] = {
	name = "Void Regent", 
	description = "Use a Void Axe to dash forward while slashing at enemies. Regent heals for a portion of damage dealt by Void Axe.\n\n<i>(Part of the Holiday 2021 Bundle)</i>", 
	previewItems = { l__ItemType__6.VOID_AXE }, 
	notGiftable = true, 
	limitedTime = true, 
	renderImage = "rbxassetid://9166208904", 
	kitClass = l__BedwarsClass__11.MOVEMENT
};
v12[l__BedwarsKit__10.SMOKE] = {
	name = "Smoke", 
	description = "A stealth-focused kit that uses smoke charges to grant invisibility.", 
	renderImage = "rbxassetid://9155462247", 
	previewItems = { l__ItemType__6.SMOKE_BOMB }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season3, 
	kitClass = l__BedwarsClass__11.DESTROYER
};
v12[l__BedwarsKit__10.DASHER] = {
	name = "Yuzi", 
	description = "Swords are replaced by traditional Dao Swords. Hold attack to execute a forward dash AOE attack.", 
	previewItems = { l__ItemType__6.EMERALD_DAO }, 
	priceRobux = 399, 
	gamepassId = 28594502, 
	renderImage = "rbxassetid://9155467645", 
	skins = { l__BedwarsKitSkin__9.DASHER_TIGER, l__BedwarsKitSkin__9.YUZI_VICTORIOUS }, 
	kitClass = l__BedwarsClass__11.MOVEMENT
};
v12[l__BedwarsKit__10.ALCHEMIST] = {
	name = "Alchemist", 
	description = "Use a cauldron to brew powerful potions from foraged wild ingredients. 5 unique potions.", 
	renderImage = "rbxassetid://9155462512", 
	previewItems = { l__ItemType__6.INVISIBILITY_POTION }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season4, 
	kitClass = l__BedwarsClass__11.SUPPORT
};
v12[l__BedwarsKit__10.MINER] = {
	name = "Miner", 
	description = "Killing enemies turns them into stone. The Miner can then break down the stone for valuables resources (scaled by price of enemy's armor + sword). Unable to purchase Axes.", 
	previewItems = { l__ItemType__6.MINER_PICKAXE }, 
	renderImage = "rbxassetid://9166208461", 
	skins = { l__BedwarsKitSkin__9.MINER_SPACE }, 
	priceRobux = 399, 
	gamepassId = l__Gamepass__7.MINER, 
	kitClass = l__BedwarsClass__11.ECONOMY
};
v12[l__BedwarsKit__10.MIDNIGHT] = {
	name = "Nyx", 
	description = "Trigger the darkness of Midnight to deal ramping increased damage and armor pen.", 
	renderImage = "rbxassetid://9155462763", 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season4, 
	kitClass = l__BedwarsClass__11.FIGHTER
};
v12[l__BedwarsKit__10.SHEEP_HERDER] = {
	name = "Sheep Herder", 
	description = "Find and tame wild sheep around the map. Each tamed sheep amplifies your damage.", 
	renderImage = "rbxassetid://9155465730", 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season4, 
	previewItems = { l__ItemType__6.CROOK }, 
	kitClass = l__BedwarsClass__11.FIGHTER
};
v12[l__BedwarsKit__10.BEAST] = {
	name = "Crocowolf", 
	description = "Losing your bed transforms you into the Crocowolf Beast and empowers your movespeed + knockback.", 
	renderImage = "rbxassetid://9155465124", 
	forceSkin = true, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season4, 
	kitClass = l__BedwarsClass__11.FIGHTER
};
v12[l__BedwarsKit__10.METAL_DETECTOR] = {
	name = "Metal Detector", 
	description = "Use a Metal Detector to find treasure around the map.", 
	renderImage = "rbxassetid://9378298061", 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season4, 
	kitClass = l__BedwarsClass__11.ECONOMY
};
v12[l__BedwarsKit__10.CONQUEROR] = {
	name = "Conqueror", 
	description = "Place banners to empower nearby allies.", 
	renderImage = "rbxassetid://9568930198", 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season4, 
	kitClass = l__BedwarsClass__11.SUPPORT
};
v12[l__BedwarsKit__10.CYBER] = {
	name = "Cyber", 
	description = "Deploy and control drones to pickup resources from around the map. Drones can also airdrop primed TNT.", 
	renderImage = "rbxassetid://9507126891", 
	priceRobux = 399, 
	gamepassId = 42490369, 
	skins = { l__BedwarsKitSkin__9.CYBER_DJ }, 
	kitClass = l__BedwarsClass__11.ECONOMY
};
v12[l__BedwarsKit__10.EMBER] = {
	name = "Ember", 
	description = "Charge the Blade of Fire to ignite in a deadly spin! Striking enemies OR killing Lumen will upgrade your ability to a much more powerful spin.", 
	renderImage = "rbxassetid://9630017904", 
	hiddenInShopTillUnlocked = true, 
	notGiftable = true, 
	kitClass = l__BedwarsClass__11.FIGHTER
};
v12[l__BedwarsKit__10.LUMEN] = {
	name = "Lumen", 
	description = "Charge the Sword of Light to shoot powerful waves at enemies! Hitting light waves OR killing Ember will upgrade your ability to shoot many powerful beams at once.", 
	renderImage = "rbxassetid://9630018371", 
	hiddenInShopTillUnlocked = true, 
	notGiftable = true, 
	kitClass = l__BedwarsClass__11.FIGHTER
};
v12[l__BedwarsKit__10.MERCHANT] = {
	name = "Merchant Marco", 
	description = "Get resources back on certain item shop purchases! This refund is randomized each game!", 
	renderImage = "rbxassetid://9872356790", 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season5, 
	kitClass = l__BedwarsClass__11.ECONOMY
};
v12[l__BedwarsKit__10.DINO_TAMER] = {
	name = "Dino Tamer Dom", 
	description = "Can purchase a Dino mount. Charge into defenses to knock them down!", 
	renderImage = "rbxassetid://9872357009", 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season5, 
	kitClass = l__BedwarsClass__11.DESTROYER
};
v12[l__BedwarsKit__10.WIND_WALKER] = {
	name = "Zephyr", 
	description = "Killing enemies gives you a stack of wind, decaying a short while after. Each stack of wind gives you more speed and adds a second wind strike to your attack. At 5 stacks you can double jump!", 
	renderImage = "rbxassetid://9872355499", 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season5, 
	kitClass = l__BedwarsClass__11.MOVEMENT
};
v12[l__BedwarsKit__10.STAR_COLLECTOR] = {
	name = "Star Collector Stella", 
	description = "Pick up floating stars around the map. Consume them while near teammates to share permanent Max Health and Critical Strike chance!", 
	renderImage = "rbxassetid://9872356516", 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season5, 
	kitClass = l__BedwarsClass__11.SUPPORT
};
v12[l__BedwarsKit__10.PINATA] = {
	name = "Luc\195\173a", 
	description = "Use the candy you get from damaging players to fill up your pi\195\177ata. When you're ready, smash it for lots of loot!", 
	renderImage = "rbxassetid://10011261147", 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season5, 
	kitClass = l__BedwarsClass__11.ECONOMY
};
v12[l__BedwarsKit__10.SPIRIT_ASSASSIN] = {
	name = "Evelynn", 
	description = "Damage enemies to attract nearby spirits. Consume spirits to instantly teleport and gain an attack buff for a short duration.", 
	renderImage = "rbxassetid://10406002412", 
	priceRobux = 399, 
	gamepassId = l__Gamepass__7.EVELYNN, 
	kitClass = l__BedwarsClass__11.FIGHTER, 
	skins = { l__BedwarsKitSkin__9.SPIRIT_ASSASSIN_PRISMATIC }, 
	featured = true
};
v12[l__BedwarsKit__10.BATTERY] = {
	name = "Cobalt", 
	description = "Every time you take damage you have a chance of dropping a battery on the ground. Once the battery activates you can pick it up for a small shield. After collecting 3 batteries you will overload, gaining movement speed and damage!", 
	renderImage = "rbxassetid://10159166528", 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season5, 
	kitClass = l__BedwarsClass__11.TANK
};
v12[l__BedwarsKit__10.HANNAH] = {
	name = "Hannah", 
	description = "Activate your Execute ability to defeat a nearby enemy with low health!", 
	renderImage = "rbxassetid://10726577232", 
	skins = { l__BedwarsKitSkin__9.HANNAH_GHOST }, 
	unlockedInBattlePass = false, 
	kitClass = l__BedwarsClass__11.FIGHTER, 
	priceRobux = 399, 
	gamepassId = 83730490
};
v12[l__BedwarsKit__10.DRAGON_SLAYER] = {
	name = "Kaliyah", 
	description = "A fearsome warrior with a fiery punch!", 
	renderImage = l__BedwarsImageId__5.DRAGON_SLAYER_RENDER, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season6, 
	kitClass = l__BedwarsClass__11.FIGHTER
};
v12[l__BedwarsKit__10.MAGE] = {
	name = "Whim", 
	description = "Master arcane secrets to unlock elemental powers. Spawn with a magic spellbook. Deal 50% reduced damage with swords and take 10% more damage from all sources.", 
	renderImage = l__BedwarsImageId__5.MAGE_RENDER, 
	unlockedInBattlePass = true, 
	previewItems = { l__ItemType__6.MAGE_SPELLBOOK }, 
	battlepassSeason = l__BattlePassSeason__4.season6, 
	kitClass = l__BedwarsClass__11.FIGHTER
};
v12[l__BedwarsKit__10.VOID_DRAGON] = {
	name = "Xu'rot", 
	description = "The abomination from the void. Temporarily transform into dragon, unlocking a decaying dragon breath and the ability to fly. Items can't be used while in dragon form and damage scales with the highest tier sword obtained.", 
	renderImage = l__BedwarsImageId__5.VOID_DRAGON_RENDER, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season6, 
	kitClass = l__BedwarsClass__11.FIGHTER, 
	forceSkin = true
};
local v35 = v3.values(l__BattlePassSeason__4);
local function v36(p1, p2)
	local v37 = {};
	local v38 = 0;
	local v39, v40, v41 = ipairs((v3.entries(v12)));
	while true do
		v39(v40, v41);
		if not v39 then
			break;
		end;
		local v42 = v40[2];
		if v42.battlepassSeason and v42.battlepassSeason == p2 then
			local v43 = v40[1];
		else
			v43 = nil;
		end;
		if v43 ~= nil then
			v38 = v38 + 1;
			v37[v38] = v43;
		end;	
	end;
	p1[p2] = v37;
	return p1;
end;
v1 = {};
for v44 = 1, #v35 do
	v1 = v36(v1, v35[v44], v44 - 1, v35);
end;
return {
	getBedwarsKitMeta = function(p3)
		return v12[p3];
	end, 
	BedwarsKitMeta = v12, 
	BedwarsBPKits = local v45
};
