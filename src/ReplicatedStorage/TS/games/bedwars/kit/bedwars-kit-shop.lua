-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit");
local l__BedwarsBPKits__3 = v2.BedwarsBPKits;
local l__BedwarsKit__4 = v2.BedwarsKit;
local v5 = {};
if not v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil.isProduction() then

end;
v5.FreeKits = { l__BedwarsKit__4.SMOKE, l__BedwarsKit__4.BUILDER, l__BedwarsKit__4.DAVEY };
v5.UpdateTimeEpoch = 1653084000;
local v6 = { l__BedwarsKit__4.REGENT };
local v7 = #v6;
local l__season4__8 = l__BedwarsBPKits__3.season4;
local v9 = #l__season4__8;
table.move(l__season4__8, 1, v9, v7 + 1, v6);
local v10 = v7 + v9;
local l__season3__11 = l__BedwarsBPKits__3.season3;
local v12 = #l__season3__11;
table.move(l__season3__11, 1, v12, v10 + 1, v6);
local v13 = v10 + v12;
local l__season2__14 = l__BedwarsBPKits__3.season2;
local v15 = #l__season2__14;
table.move(l__season2__14, 1, v15, v13 + 1, v6);
local v16 = v13 + v15;
local l__season1__17 = l__BedwarsBPKits__3.season1;
local v18 = #l__season1__17;
table.move(l__season1__17, 1, v18, v16 + 1, v6);
local v19 = v16 + v18;
v6[v19 + 1] = l__BedwarsKit__4.EMBER;
v6[v19 + 2] = l__BedwarsKit__4.LUMEN;
v6[v19 + 3] = l__BedwarsKit__4.CYBER;
v6[v19 + 4] = l__BedwarsKit__4.MINER;
v6[v19 + 5] = l__BedwarsKit__4.DASHER;
v6[v19 + 6] = l__BedwarsKit__4.TRIPLE_SHOT;
v6[v19 + 7] = l__BedwarsKit__4.AXOLOTL;
v6[v19 + 8] = l__BedwarsKit__4.BARBARIAN;
v6[v19 + 9] = l__BedwarsKit__4.ANGEL;
v6[v19 + 10] = l__BedwarsKit__4.VULCAN;
v6[v19 + 11] = l__BedwarsKit__4.WIZARD;
v6[v19 + 12] = l__BedwarsKit__4.GRIM_REAPER;
v6[v19 + 13] = l__BedwarsKit__4.COWGIRL;
v6[v19 + 14] = l__BedwarsKit__4.BIGMAN;
v6[v19 + 15] = l__BedwarsKit__4.DAVEY;
v6[v19 + 16] = l__BedwarsKit__4.FARMER_CLETUS;
v6[v19 + 17] = l__BedwarsKit__4.MELODY;
v6[v19 + 18] = l__BedwarsKit__4.ARCHER;
v6[v19 + 19] = l__BedwarsKit__4.SHIELDER;
v6[v19 + 20] = l__BedwarsKit__4.BAKER;
v6[v19 + 21] = l__BedwarsKit__4.BUILDER;
v5.ShopKits = v6;
v5.FeaturedKits = { l__BedwarsKit__4.CYBER, l__BedwarsKit__4.MINER, l__BedwarsKit__4.DASHER, l__BedwarsKit__4.AXOLOTL };
v5.BattlePassPodiumKits = l__BedwarsBPKits__3.season4;
return {
	BedwarsKitShop = v5
};
