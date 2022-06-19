-- Script Hash: efbf01e6c3f66737d96b755b4074c852ffa7bbba10bfc62ef46e0cb3c11d5166aedd84349854733fd1393fcc841dfbdc
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit");
local l__BedwarsBPKits__3 = v2.BedwarsBPKits;
local l__BedwarsKit__4 = v2.BedwarsKit;
local v5 = {};
if not v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil.isProduction() then

end;
v5.FreeKits = { l__BedwarsKit__4.BOUNTY_HUNTER, l__BedwarsKit__4.MELODY, l__BedwarsKit__4.BAKER };
v5.UpdateTimeEpoch = 1656108000;
local v6 = { l__BedwarsKit__4.REGENT };
local v7 = #v6;
local l__season5__8 = l__BedwarsBPKits__3.season5;
local v9 = #l__season5__8;
table.move(l__season5__8, 1, v9, v7 + 1, v6);
local v10 = v7 + v9;
local l__season4__11 = l__BedwarsBPKits__3.season4;
local v12 = #l__season4__11;
table.move(l__season4__11, 1, v12, v10 + 1, v6);
local v13 = v10 + v12;
local l__season3__14 = l__BedwarsBPKits__3.season3;
local v15 = #l__season3__14;
table.move(l__season3__14, 1, v15, v13 + 1, v6);
local v16 = v13 + v15;
local l__season2__17 = l__BedwarsBPKits__3.season2;
local v18 = #l__season2__17;
table.move(l__season2__17, 1, v18, v16 + 1, v6);
local v19 = v16 + v18;
local l__season1__20 = l__BedwarsBPKits__3.season1;
local v21 = #l__season1__20;
table.move(l__season1__20, 1, v21, v19 + 1, v6);
local v22 = v19 + v21;
v6[v22 + 1] = l__BedwarsKit__4.EMBER;
v6[v22 + 2] = l__BedwarsKit__4.LUMEN;
v6[v22 + 3] = l__BedwarsKit__4.CYBER;
v6[v22 + 4] = l__BedwarsKit__4.MINER;
v6[v22 + 5] = l__BedwarsKit__4.DASHER;
v6[v22 + 6] = l__BedwarsKit__4.ICE_QUEEN;
v6[v22 + 7] = l__BedwarsKit__4.TRIPLE_SHOT;
v6[v22 + 8] = l__BedwarsKit__4.AXOLOTL;
v6[v22 + 9] = l__BedwarsKit__4.BARBARIAN;
v6[v22 + 10] = l__BedwarsKit__4.ANGEL;
v6[v22 + 11] = l__BedwarsKit__4.VULCAN;
v6[v22 + 12] = l__BedwarsKit__4.WIZARD;
v6[v22 + 13] = l__BedwarsKit__4.GRIM_REAPER;
v6[v22 + 14] = l__BedwarsKit__4.COWGIRL;
v6[v22 + 15] = l__BedwarsKit__4.BIGMAN;
v6[v22 + 16] = l__BedwarsKit__4.DAVEY;
v6[v22 + 17] = l__BedwarsKit__4.FARMER_CLETUS;
v6[v22 + 18] = l__BedwarsKit__4.MELODY;
v6[v22 + 19] = l__BedwarsKit__4.ARCHER;
v6[v22 + 20] = l__BedwarsKit__4.SHIELDER;
v6[v22 + 21] = l__BedwarsKit__4.BAKER;
v6[v22 + 22] = l__BedwarsKit__4.BUILDER;
v5.ShopKits = v6;
v5.FeaturedKits = { l__BedwarsKit__4.CYBER, l__BedwarsKit__4.COWGIRL, l__BedwarsKit__4.DASHER, l__BedwarsKit__4.AXOLOTL };
v5.BattlePassPodiumKits = l__BedwarsBPKits__3.season5;
return {
	BedwarsKitShop = v5
};
