-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BedwarsKit__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__BedwarsBPKits__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsBPKits;
local v4 = {};
if not v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil.isProduction() then

end;
v4.FreeKits = { l__BedwarsKit__2.BARBARIAN, l__BedwarsKit__2.DAVEY, l__BedwarsKit__2.BUILDER };
v4.UpdateTimeEpoch = 1664575200;
local v5 = { l__BedwarsKit__2.REGENT };
local v6 = #v5;
local l__season6__7 = l__BedwarsBPKits__3.season6;
local v8 = #l__season6__7;
table.move(l__season6__7, 1, v8, v6 + 1, v5);
local v9 = v6 + v8;
local l__season5__10 = l__BedwarsBPKits__3.season5;
local v11 = #l__season5__10;
table.move(l__season5__10, 1, v11, v9 + 1, v5);
local v12 = v9 + v11;
local l__season4__13 = l__BedwarsBPKits__3.season4;
local v14 = #l__season4__13;
table.move(l__season4__13, 1, v14, v12 + 1, v5);
local v15 = v12 + v14;
local l__season3__16 = l__BedwarsBPKits__3.season3;
local v17 = #l__season3__16;
table.move(l__season3__16, 1, v17, v15 + 1, v5);
local v18 = v15 + v17;
local l__season2__19 = l__BedwarsBPKits__3.season2;
local v20 = #l__season2__19;
table.move(l__season2__19, 1, v20, v18 + 1, v5);
local v21 = v18 + v20;
local l__season1__22 = l__BedwarsBPKits__3.season1;
local v23 = #l__season1__22;
table.move(l__season1__22, 1, v23, v21 + 1, v5);
local v24 = v21 + v23;
v5[v24 + 1] = l__BedwarsKit__2.EMBER;
v5[v24 + 2] = l__BedwarsKit__2.LUMEN;
v5[v24 + 3] = l__BedwarsKit__2.CYBER;
v5[v24 + 4] = l__BedwarsKit__2.MINER;
v5[v24 + 5] = l__BedwarsKit__2.DASHER;
v5[v24 + 6] = l__BedwarsKit__2.ICE_QUEEN;
v5[v24 + 7] = l__BedwarsKit__2.TRIPLE_SHOT;
v5[v24 + 8] = l__BedwarsKit__2.AXOLOTL;
v5[v24 + 9] = l__BedwarsKit__2.BARBARIAN;
v5[v24 + 10] = l__BedwarsKit__2.ANGEL;
v5[v24 + 11] = l__BedwarsKit__2.VULCAN;
v5[v24 + 12] = l__BedwarsKit__2.WIZARD;
v5[v24 + 13] = l__BedwarsKit__2.GRIM_REAPER;
v5[v24 + 14] = l__BedwarsKit__2.COWGIRL;
v5[v24 + 15] = l__BedwarsKit__2.BIGMAN;
v5[v24 + 16] = l__BedwarsKit__2.DAVEY;
v5[v24 + 17] = l__BedwarsKit__2.FARMER_CLETUS;
v5[v24 + 18] = l__BedwarsKit__2.MELODY;
v5[v24 + 19] = l__BedwarsKit__2.ARCHER;
v5[v24 + 20] = l__BedwarsKit__2.SHIELDER;
v5[v24 + 21] = l__BedwarsKit__2.BAKER;
v5[v24 + 22] = l__BedwarsKit__2.BUILDER;
v5[v24 + 23] = l__BedwarsKit__2.SPIRIT_ASSASSIN;
v5[v24 + 24] = l__BedwarsKit__2.HANNAH;
v5[v24 + 25] = l__BedwarsKit__2.DRAGON_SLAYER;
v5[v24 + 26] = l__BedwarsKit__2.VOID_DRAGON;
v4.ShopKits = v5;
v4.FeaturedKits = { l__BedwarsKit__2.CYBER, l__BedwarsKit__2.COWGIRL, l__BedwarsKit__2.DASHER, l__BedwarsKit__2.AXOLOTL };
v4.BattlePassPodiumKits = { l__BedwarsKit__2.DRAGON_SLAYER, l__BedwarsKit__2.VOID_DRAGON, l__BedwarsKit__2.MAGE };
return {
	BedwarsKitShop = v4
};
