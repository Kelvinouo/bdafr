-- Decompiled with the Synapse X Luau decompiler.

local v1 = nil;
local v2 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v3 = v2.import(script, v2.getModule(script, "@rbxts", "object-utils"));
local l__BattlePassSeason__4 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-seasons").BattlePassSeason;
local l__ItemType__5 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__PlaceUtil__6 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__BedwarsKitSkin__7 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local l__BedwarsKit__8 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__BedwarsClass__9 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class").BedwarsClass;
local v10 = {
	[l__BedwarsKit__8.NONE] = {
		name = "None", 
		description = "", 
		notGiftable = true, 
		renderImage = "", 
		kitClass = nil
	}
};
local v11 = {};
if l__PlaceUtil__6.isProduction() then
	local v12 = 18876495;
else
	v12 = 18875964;
end;
v11.gamepassId = v12;
v11.priceRobux = 399;
v11.name = "Farmer Cletus";
v11.description = "As a master of the farmland, Cletus grows crops that yield diamonds and emeralds.";
v11.previewItems = { l__ItemType__5.WATERING_CAN };
v11.renderImage = "rbxassetid://9155466936";
v11.skins = { l__BedwarsKitSkin__7.FARMER_CLETUS_SPIRIT };
v11.kitClass = l__BedwarsClass__9.ECONOMY;
v10[l__BedwarsKit__8.FARMER_CLETUS] = v11;
local v13 = {};
if l__PlaceUtil__6.isProduction() then
	local v14 = 19551065;
else
	v14 = 19551065;
end;
v13.gamepassId = v14;
v13.priceRobux = 399;
v13.name = "Barbarian";
v13.description = "Build rage by damaging enemies. Instead of buying swords, your sword is upgraded upon reaching max rage. You lose half your rage upon death. Emerald Sword is replaced by the Rageblade.";
v13.previewItems = { l__ItemType__5.RAGEBLADE };
v13.skins = { l__BedwarsKitSkin__7.BARBARIAN_DEEP_VOID, l__BedwarsKitSkin__7.BARBARIAN_VICTORIOUS };
v13.renderImage = "rbxassetid://9166207628";
v13.kitClass = l__BedwarsClass__9.FIGHTER;
v10[l__BedwarsKit__8.BARBARIAN] = v13;
local v15 = {};
if l__PlaceUtil__6.isProduction() then
	local v16 = 19088340;
else
	v16 = 19088340;
end;
v15.gamepassId = v16;
v15.priceRobux = 399;
v15.name = "Builder";
v15.description = "Fortify blocks with extra health and blast protection using the Builder's hammer. Purchase the Hammer from the Item Shop.";
v15.renderImage = "rbxassetid://9155463708";
v15.previewItems = { l__ItemType__5.HAMMER };
v15.kitClass = l__BedwarsClass__9.DEFENDER;
v10[l__BedwarsKit__8.BUILDER] = v15;
local v17 = {};
if l__PlaceUtil__6.isProduction() then
	local v18 = 19086951;
else
	v18 = 19088230;
end;
v17.gamepassId = v18;
v17.priceRobux = 399;
v17.name = "Baker";
v17.description = "Gain access to health-gain apples and speed-boost cakes.";
v17.renderImage = "rbxassetid://9155463919";
v17.skins = { l__BedwarsKitSkin__7.BAKER_SPIRIT };
v17.previewItems = { l__ItemType__5.PIE };
v17.kitClass = l__BedwarsClass__9.SUPPORT;
v10[l__BedwarsKit__8.BAKER] = v17;
local v19 = {};
if l__PlaceUtil__6.isProduction() then
	local v20 = 19275795;
else
	v20 = 19088230;
end;
v19.gamepassId = v20;
v19.priceRobux = 399;
v19.name = "Archer";
v19.description = "+15% projectile damage and access to the Tactical Crossbow in Item Shop.";
v19.previewItems = { l__ItemType__5.TACTICAL_CROSSBOW };
v19.renderImage = "rbxassetid://9224796984";
v19.kitClass = l__BedwarsClass__9.FIGHTER;
v10[l__BedwarsKit__8.ARCHER] = v19;
local v21 = {};
if l__PlaceUtil__6.isProduction() then
	local v22 = 19546564;
else
	v22 = 19546564;
end;
v21.gamepassId = v22;
v21.priceRobux = 399;
v21.name = "Infernal Shielder";
v21.description = "Spawn with a massive shield that can deflect damage + projectile knockback.";
v21.renderImage = "rbxassetid://9155464114";
v21.previewItems = { l__ItemType__5.INFERNAL_SHIELD };
v21.kitClass = l__BedwarsClass__9.TANK;
v10[l__BedwarsKit__8.SHIELDER] = v21;
local v23 = {};
if l__PlaceUtil__6.isProduction() then
	local v24 = 19722364;
else
	v24 = 19722364;
end;
v23.gamepassId = v24;
v23.priceRobux = 399;
v23.name = "Melody";
v23.description = "Use a guitar and the power of music to heal nearby teammates. Heal yourself for 20% of heal given.";
v23.renderImage = "rbxassetid://9155464915";
v23.previewItems = { l__ItemType__5.GUITAR };
v23.skins = { l__BedwarsKitSkin__7.MELODY_ROCKSTAR };
v23.kitClass = l__BedwarsClass__9.SUPPORT;
v10[l__BedwarsKit__8.MELODY] = v23;
local v25 = {};
if l__PlaceUtil__6.isProduction() then
	local v26 = 20030035;
else
	v26 = 20030035;
end;
v25.gamepassId = v26;
v25.priceRobux = 399;
v25.name = "Pirate Davey";
v25.description = "Use a TNT Cannon to bombard your enemies.";
v25.renderImage = "rbxassetid://9155464612";
v25.kitClass = l__BedwarsClass__9.DESTROYER;
v10[l__BedwarsKit__8.DAVEY] = v25;
local v27 = {};
if l__PlaceUtil__6.isProduction() then
	local v28 = 20245233;
else
	v28 = 20245233;
end;
v27.gamepassId = v28;
v27.priceRobux = 399;
v27.name = "Eldertree";
v27.description = "Collect tree orbs around the map to increase size and max HP. Cannot buy armor.";
v27.renderImage = "rbxassetid://9155467211";
v27.forceSkin = true;
v27.kitClass = l__BedwarsClass__9.TANK;
v10[l__BedwarsKit__8.BIGMAN] = v27;
local v29 = {};
if l__PlaceUtil__6.isProduction() then
	local v30 = 20645574;
else
	v30 = 20245233;
end;
v29.gamepassId = v30;
v29.priceRobux = 399;
v29.name = "Lassy";
v29.description = "Wrangle enemies towards you using a lasso.";
v29.renderImage = "rbxassetid://9155462968";
v29.previewItems = { l__ItemType__5.LASSO };
v29.kitClass = l__BedwarsClass__9.FIGHTER;
v10[l__BedwarsKit__8.COWGIRL] = v29;
v10[l__BedwarsKit__8.GRIM_REAPER] = {
	gamepassId = 20872871, 
	priceRobux = 399, 
	name = "Grim Reaper", 
	description = "Consuming enemy souls grants health regen, movespeed and invulnerability for 2.5s. Combat is disabled while consuming.", 
	renderImage = "rbxassetid://9155467410", 
	previewItems = {}, 
	kitClass = l__BedwarsClass__9.FIGHTER
};
v10[l__BedwarsKit__8.WIZARD] = {
	gamepassId = 21261740, 
	priceRobux = 399, 
	name = "Wizard", 
	description = "Use a magical staff to cast lightning strikes and electricity orbs.", 
	previewItems = { l__ItemType__5.WIZARD_STAFF }, 
	renderImage = "rbxassetid://9166207809", 
	kitClass = l__BedwarsClass__9.FIGHTER
};
v10[l__BedwarsKit__8.VULCAN] = {
	gamepassId = 21421966, 
	priceRobux = 399, 
	name = "Vulcan", 
	description = "Use a high tech tablet to control camera turrets across the map.", 
	renderImage = "rbxassetid://9155465543", 
	previewItems = { l__ItemType__5.TABLET }, 
	skins = { l__BedwarsKitSkin__7.VULCAN_LUNAR }, 
	kitClass = l__BedwarsClass__9.DEFENDER
};
v10[l__BedwarsKit__8.PYRO] = {
	name = "Pyro", 
	description = "Use your flamethrower to spray fire, making enemies brittle and taking more damage from attacks. Killing brittle enemies gives ember which you can use to upgrade your flamethrower.", 
	previewItems = { l__ItemType__5.FLAMETHROWER }, 
	unlockedInBattlePass = true, 
	renderImage = "rbxassetid://9155464770", 
	lobbyAnimation = {
		primary = "rbxassetid://7303855489"
	}, 
	battlepassSeason = l__BattlePassSeason__4.season1, 
	kitClass = l__BedwarsClass__9.FIGHTER
};
v10[l__BedwarsKit__8.RAVEN] = {
	name = "Raven", 
	description = "Buy ravens and fly at enemies to deliver deadly doses of poison.", 
	previewItems = { l__ItemType__5.RAVEN }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season1, 
	renderImage = "rbxassetid://9166206554", 
	kitClass = l__BedwarsClass__9.FIGHTER
};
v10[l__BedwarsKit__8.BEEKEEPER] = {
	name = "Beekeeper Beatrix", 
	description = "Catch bees around the map to upgrade your Bee Hive. Upgrading your Bee Hive will return additional iron and emeralds.", 
	previewItems = { l__ItemType__5.BEE_NET }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season1, 
	renderImage = "rbxassetid://9312831285", 
	kitClass = l__BedwarsClass__9.ECONOMY
};
v10[l__BedwarsKit__8.JADE] = {
	name = "Jade", 
	description = "Jade carries a giant war hammer that can knockup nearby enemies.", 
	previewItems = { l__ItemType__5.JADE_HAMMER }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season1, 
	renderImage = "rbxassetid://9166306816", 
	kitClass = l__BedwarsClass__9.MOVEMENT
};
v10[l__BedwarsKit__8.WARRIOR] = {
	name = "Warrior", 
	description = "Armor is slightly cheaper and you can buy powerful warrior armor.", 
	previewItems = {}, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season1, 
	renderImage = "rbxassetid://9166207008", 
	kitClass = l__BedwarsClass__9.TANK
};
v10[l__BedwarsKit__8.BOUNTY_HUNTER] = {
	name = "Bounty Hunter", 
	description = "Get assigned bounties for killing certain players in the match. Completing a bounty rewards a random amount of resources.", 
	previewItems = {}, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season1, 
	renderImage = "rbxassetid://9166208649", 
	kitClass = l__BedwarsClass__9.ECONOMY
};
v10[l__BedwarsKit__8.SPIRIT_CATCHER] = {
	name = "Spirit Catcher", 
	description = "Purchase spirits from the Item Shop and place them around the map. Spirits will chase down and explode nearby enemies.", 
	previewItems = { l__ItemType__5.SPIRIT }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season1, 
	renderImage = "rbxassetid://9166207943", 
	kitClass = l__BedwarsClass__9.FIGHTER
};
local v31 = {
	name = "Trinity", 
	description = "Upon reaching three kills, choose between a Light and Void transformation. As the Light Angel, heal nearby teammates when damaging enemies. As the Void Angel, attacks will life steal.", 
	previewItems = {}, 
	priceRobux = 399
};
if l__PlaceUtil__6.isProduction() then
	local v32 = 1207029649;
else
	v32 = 1206777428;
end;
v31.devProductId = v32;
v31.renderImage = "rbxassetid://9166208240";
v31.kitClass = l__BedwarsClass__9.SUPPORT;
v10[l__BedwarsKit__8.ANGEL] = v31;
v10[l__BedwarsKit__8.AXOLOTL] = {
	name = "Axolotl Amy", 
	description = "Use your pet axolotls to empower yourself and nearby teammates with shields, increased attack damage, faster break speed and health regen.", 
	priceRobux = 399, 
	gamepassId = 24393543, 
	renderImage = "rbxassetid://9155466713", 
	skins = { l__BedwarsKitSkin__7.AXOLOTL_REINDEER, l__BedwarsKitSkin__7.AXOLOTL_EASTER_BUNNY }, 
	kitClass = l__BedwarsClass__9.SUPPORT
};
v10[l__BedwarsKit__8.TRAPPER] = {
	name = "Trapper", 
	description = "Place Snap Traps to stun unexpecting enemies. Damaging a recently trapped enemy will consume a mark dealing extra damage.", 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season2, 
	previewItems = { l__ItemType__5.SNAP_TRAP }, 
	renderImage = "rbxassetid://9166206875", 
	kitClass = l__BedwarsClass__9.DEFENDER
};
v10[l__BedwarsKit__8.FISHERMAN] = {
	name = "Fisherman", 
	description = "Why fight when you can fish?", 
	previewItems = { l__ItemType__5.FISHING_ROD }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season2, 
	renderImage = "rbxassetid://9166208359", 
	kitClass = l__BedwarsClass__9.ECONOMY
};
v10[l__BedwarsKit__8.GHOST_CATCHER] = {
	name = "Gompy", 
	description = "Gompy the Ghost Hunter! Find ghosts around the map, vacuum them and fire them across the map.", 
	previewItems = {}, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season2, 
	renderImage = "rbxassetid://9224802656", 
	kitClass = l__BedwarsClass__9.FIGHTER
};
v10[l__BedwarsKit__8.OIL_MAN] = {
	name = "Jack", 
	description = "Lob bundles of poisonous pumpkin oil across the map.", 
	previewItems = { l__ItemType__5.OIL_CONSUMABLE }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season2, 
	renderImage = "rbxassetid://9166206259", 
	kitClass = l__BedwarsClass__9.MISC
};
v10[l__BedwarsKit__8.SPEARMAN] = {
	name = "Ares", 
	description = "A powerful ancient warrior that uses electric-charged throwing spears to destroy his enemies.", 
	previewItems = { l__ItemType__5.SPEAR }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season2, 
	renderImage = "rbxassetid://9166207341", 
	kitClass = l__BedwarsClass__9.FIGHTER
};
v10[l__BedwarsKit__8.TRIPLE_SHOT] = {
	name = "Vanessa", 
	description = "Super charge your bow to perform a triple shot.", 
	previewItems = { l__ItemType__5.FEATHER_BOW }, 
	priceRobux = 399, 
	gamepassId = 24913310, 
	skins = { l__BedwarsKitSkin__7.TRIPLE_SHOT_DEMON_EMPRESS }, 
	renderImage = "rbxassetid://9166208149", 
	kitClass = l__BedwarsClass__9.FIGHTER
};
v10[l__BedwarsKit__8.INFECTED] = {
	name = "Infected", 
	description = "\240\159\167\159\226\128\141\226\153\130\239\184\143", 
	renderImage = "", 
	kitClass = l__BedwarsClass__9.FIGHTER
};
v10[l__BedwarsKit__8.SUPER_INFECTED] = {
	name = "Super Infected", 
	description = "\240\159\145\145\240\159\167\159", 
	renderImage = "", 
	kitClass = l__BedwarsClass__9.FIGHTER
};
v10[l__BedwarsKit__8.ICE_QUEEN] = {
	name = "Freiya", 
	description = "Damage enemies to unlock your Frost passive. Once unlocked, dealing damage will apply stacks of Frost. At four stacks Frost is consumed and slows the target. Emerald Sword is replaced by the Ice Sword which amplifies Frost.", 
	priceRobux = 399, 
	gamepassId = 25647124, 
	renderImage = "rbxassetid://9155466204", 
	previewItems = { l__ItemType__5.ICE_SWORD }, 
	skins = { l__BedwarsKitSkin__7.FREIYA_TIGER_BRAWLER }, 
	kitClass = l__BedwarsClass__9.FIGHTER
};
v10[l__BedwarsKit__8.AERY] = {
	name = "Aery", 
	description = "Killing enemies adds to your collection of spirit butterflies. Each spirit butterfly amplifies sword damage. Aery's base health is reduced to 90hp.", 
	renderImage = "rbxassetid://9155463221", 
	battlepassSeason = l__BattlePassSeason__4.season3, 
	unlockedInBattlePass = true, 
	skins = { l__BedwarsKitSkin__7.ACADEMY_AERY }, 
	kitClass = l__BedwarsClass__9.FIGHTER
};
v10[l__BedwarsKit__8.YETI] = {
	name = "Yeti", 
	description = "Let out a Glacial Roar to temporarily freeze nearby blocks. Frozen blocks can be destroyed extremely fast.", 
	battlepassSeason = l__BattlePassSeason__4.season3, 
	unlockedInBattlePass = true, 
	renderImage = "rbxassetid://9166205917", 
	kitClass = l__BedwarsClass__9.DESTROYER
};
v10[l__BedwarsKit__8.GINGERBREAD_MAN] = {
	name = "Gingerbread Man", 
	description = "Place gumdrops bounce pads for extreme movement. Using a gumdrop bounce pad negates all fall damage and grants a shield.", 
	previewItems = {}, 
	unlockedInBattlePass = true, 
	renderImage = "rbxassetid://9155464364", 
	battlepassSeason = l__BattlePassSeason__4.season3, 
	kitClass = l__BedwarsClass__9.SUPPORT
};
v10[l__BedwarsKit__8.SANTA] = {
	name = "Santa", 
	description = "Play as Santa and call in high-explosive sleigh strafe runs!", 
	previewItems = { l__ItemType__5.SANTA_BOMB }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season3, 
	renderImage = "rbxassetid://9166206101", 
	kitClass = l__BedwarsClass__9.DESTROYER
};
v10[l__BedwarsKit__8.FROSTY] = {
	name = "Frosty", 
	description = "Passively create Frosted Snowballs for free. Frosted Snowballs are larger and faster.", 
	previewItems = { l__ItemType__5.FROSTED_SNOWBALL }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season3, 
	renderImage = "rbxassetid://9166208762", 
	kitClass = l__BedwarsClass__9.MISC
};
v10[l__BedwarsKit__8.REGENT] = {
	name = "Void Regent", 
	description = "Use a Void Axe to dash forward while slashing at enemies. Regent heals for a portion of damage dealt by Void Axe.\n\n<i>(Part of the Holiday 2021 Bundle)</i>", 
	previewItems = { l__ItemType__5.VOID_AXE }, 
	notGiftable = true, 
	limitedTime = true, 
	renderImage = "rbxassetid://9166208904", 
	kitClass = l__BedwarsClass__9.MOVEMENT
};
v10[l__BedwarsKit__8.SMOKE] = {
	name = "Smoke", 
	description = "A stealth-focused kit that uses smoke charges to grant invisibility.", 
	renderImage = "rbxassetid://9155462247", 
	previewItems = { l__ItemType__5.SMOKE_BOMB }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season3, 
	kitClass = l__BedwarsClass__9.DESTROYER
};
v10[l__BedwarsKit__8.DASHER] = {
	name = "Yuzi", 
	description = "Swords are replaced by traditional Dao Swords. Hold attack to execute a forward dash AOE attack.", 
	previewItems = { l__ItemType__5.EMERALD_DAO }, 
	priceRobux = 399, 
	gamepassId = 28594502, 
	renderImage = "rbxassetid://9155467645", 
	skins = { l__BedwarsKitSkin__7.DASHER_TIGER, l__BedwarsKitSkin__7.YUZI_VICTORIOUS }, 
	kitClass = l__BedwarsClass__9.MOVEMENT
};
v10[l__BedwarsKit__8.ALCHEMIST] = {
	name = "Alchemist", 
	description = "Use a cauldron to brew powerful potions from foraged wild ingredients. 5 unique potions.", 
	renderImage = "rbxassetid://9155462512", 
	previewItems = { l__ItemType__5.INVISIBILITY_POTION }, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season4, 
	kitClass = l__BedwarsClass__9.SUPPORT
};
v10[l__BedwarsKit__8.MINER] = {
	name = "Miner", 
	description = "Killing enemies turns them into stone. The Miner can then break down the stone for valuables resources (scaled by price of enemy's armor + sword). Unable to purchase Axes.", 
	previewItems = { l__ItemType__5.MINER_PICKAXE }, 
	renderImage = "rbxassetid://9166208461", 
	skins = { l__BedwarsKitSkin__7.MINER_SPACE }, 
	priceRobux = 399, 
	gamepassId = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "gamepass").Gamepass.MINER, 
	kitClass = l__BedwarsClass__9.ECONOMY
};
v10[l__BedwarsKit__8.MIDNIGHT] = {
	name = "Nyx", 
	description = "Trigger the darkness of Midnight to deal ramping increased damage and armor pen.", 
	renderImage = "rbxassetid://9155462763", 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season4, 
	kitClass = l__BedwarsClass__9.FIGHTER
};
v10[l__BedwarsKit__8.SHEEP_HERDER] = {
	name = "Sheep Herder", 
	description = "Find and tame wild sheep around the map. Each tamed sheep amplifies your damage.", 
	renderImage = "rbxassetid://9155465730", 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season4, 
	previewItems = { l__ItemType__5.CROOK }, 
	kitClass = l__BedwarsClass__9.FIGHTER
};
v10[l__BedwarsKit__8.BEAST] = {
	name = "Crocowolf", 
	description = "Losing your bed transforms you into the Crocowolf Beast and empowers your movespeed + knockback.", 
	renderImage = "rbxassetid://9155465124", 
	forceSkin = true, 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season4, 
	kitClass = l__BedwarsClass__9.FIGHTER
};
v10[l__BedwarsKit__8.METAL_DETECTOR] = {
	name = "Metal Detector", 
	description = "Use a Metal Detector to find treasure around the map.", 
	renderImage = "rbxassetid://9378298061", 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season4, 
	kitClass = l__BedwarsClass__9.ECONOMY
};
v10[l__BedwarsKit__8.CONQUEROR] = {
	name = "Conqueror", 
	description = "Place banners to empower nearby allies.", 
	renderImage = "rbxassetid://9568930198", 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season4, 
	kitClass = l__BedwarsClass__9.SUPPORT
};
v10[l__BedwarsKit__8.CYBER] = {
	name = "Cyber", 
	description = "Deploy and control drones to pickup resources from around the map. Drones can also airdrop primed TNT.", 
	renderImage = "rbxassetid://9507126891", 
	priceRobux = 399, 
	gamepassId = 42490369, 
	skins = { l__BedwarsKitSkin__7.CYBER_DJ }, 
	kitClass = l__BedwarsClass__9.ECONOMY
};
v10[l__BedwarsKit__8.EMBER] = {
	name = "Ember", 
	description = "Charge the Blade of Fire to ignite in a deadly spin! Striking enemies OR killing Lumen will upgrade your ability to a much more powerful spin.", 
	renderImage = "rbxassetid://9630017904", 
	hiddenInShopTillUnlocked = true, 
	notGiftable = true, 
	kitClass = l__BedwarsClass__9.FIGHTER
};
v10[l__BedwarsKit__8.LUMEN] = {
	name = "Lumen", 
	description = "Charge the Sword of Light to shoot powerful waves at enemies! Hitting light waves OR killing Ember will upgrade your ability to shoot many powerful beams at once.", 
	renderImage = "rbxassetid://9630018371", 
	hiddenInShopTillUnlocked = true, 
	notGiftable = true, 
	kitClass = l__BedwarsClass__9.FIGHTER
};
v10[l__BedwarsKit__8.MERCHANT] = {
	name = "Merchant Marco", 
	description = "Get resources back on certain item shop purchases! This refund is randomized each game!", 
	renderImage = "rbxassetid://9872356790", 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season5, 
	kitClass = l__BedwarsClass__9.ECONOMY
};
v10[l__BedwarsKit__8.DINO_TAMER] = {
	name = "Dino Tamer Dom", 
	description = "Can purchase a Dino mount. Charge into defenses to knock them down!", 
	renderImage = "rbxassetid://9872357009", 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season5, 
	kitClass = l__BedwarsClass__9.DESTROYER
};
v10[l__BedwarsKit__8.WIND_WALKER] = {
	name = "Zephyr", 
	description = "Killing enemies gives you a stack of wind, decaying a short while after. Each stack of wind gives you more speed and adds a second wind strike to your attack. At 5 stacks you can double jump!", 
	renderImage = "rbxassetid://9872355499", 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season5, 
	kitClass = l__BedwarsClass__9.MOVEMENT
};
v10[l__BedwarsKit__8.STAR_COLLECTOR] = {
	name = "Star Collector Stella", 
	description = "Pick up floating stars around the map. Consume them while near teammates to share permanent Max Health and Critical Strike chance!", 
	renderImage = "rbxassetid://9872356516", 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season5, 
	kitClass = l__BedwarsClass__9.SUPPORT
};
v10[l__BedwarsKit__8.PINATA] = {
	name = "Luc\195\173a", 
	description = "Use the candy you get from damaging players to fill up your pi\195\177ata. When you're ready, smash it for lots of loot!", 
	renderImage = "rbxassetid://10011261147", 
	unlockedInBattlePass = true, 
	battlepassSeason = l__BattlePassSeason__4.season5, 
	kitClass = l__BedwarsClass__9.ECONOMY
};
local v33 = v3.values(l__BattlePassSeason__4);
v1 = {};
local function v34(p1, p2)
	local v35 = {};
	local v36 = 0;
	local v37, v38, v39 = ipairs((v3.entries(v10)));
	while true do
		local v40, v41 = v37(v38, v39);
		if not v40 then
			break;
		end;
		local v42 = v41[2];
		if v42.battlepassSeason and v42.battlepassSeason == p2 then
			local v43 = v41[1];
		else
			v43 = nil;
		end;
		if v43 ~= nil then
			v36 = v36 + 1;
			v35[v36] = v43;
		end;	
	end;
	p1[p2] = v35;
	return p1;
end;
for v44 = 1, #v33 do
	v1 = v34(v1, v33[v44], v44 - 1, v33);
end;
return {
	getBedwarsKitMeta = function(p3)
		return v10[p3];
	end, 
	BedwarsKitMeta = v10, 
	BedwarsBPKits = local v45
};
