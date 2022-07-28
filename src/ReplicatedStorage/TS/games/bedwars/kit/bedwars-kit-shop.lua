-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BedwarsKit__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__BedwarsBPKits__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsBPKits;
local v4 = {};
if not v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil.isProduction() then

end;
v4.FreeKits = { l__BedwarsKit__2.BARBARIAN, l__BedwarsKit__2.ARCHER, l__BedwarsKit__2.COWGIRL };
v4.UpdateTimeEpoch = 1659132000;
local v5 = { l__BedwarsKit__2.REGENT };
local v6 = #v5;
local l__season5__7 = l__BedwarsBPKits__3.season5;
local v8 = #l__season5__7;
table.move(l__season5__7, 1, v8, v6 + 1, v5);
local v9 = v6 + v8;
local l__season4__10 = l__BedwarsBPKits__3.season4;
local v11 = #l__season4__10;
table.move(l__season4__10, 1, v11, v9 + 1, v5);
local v12 = v9 + v11;
local l__season3__13 = l__BedwarsBPKits__3.season3;
local v14 = #l__season3__13;
table.move(l__season3__13, 1, v14, v12 + 1, v5);
local v15 = v12 + v14;
local l__season2__16 = l__BedwarsBPKits__3.season2;
local v17 = #l__season2__16;
table.move(l__season2__16, 1, v17, v15 + 1, v5);
local v18 = v15 + v17;
local l__season1__19 = l__BedwarsBPKits__3.season1;
local v20 = #l__season1__19;
table.move(l__season1__19, 1, v20, v18 + 1, v5);
local v21 = v18 + v20;
v5[v21 + 1] = l__BedwarsKit__2.EMBER;
v5[v21 + 2] = l__BedwarsKit__2.LUMEN;
v5[v21 + 3] = l__BedwarsKit__2.CYBER;
v5[v21 + 4] = l__BedwarsKit__2.MINER;
v5[v21 + 5] = l__BedwarsKit__2.DASHER;
v5[v21 + 6] = l__BedwarsKit__2.ICE_QUEEN;
v5[v21 + 7] = l__BedwarsKit__2.TRIPLE_SHOT;
v5[v21 + 8] = l__BedwarsKit__2.AXOLOTL;
v5[v21 + 9] = l__BedwarsKit__2.BARBARIAN;
v5[v21 + 10] = l__BedwarsKit__2.ANGEL;
v5[v21 + 11] = l__BedwarsKit__2.VULCAN;
v5[v21 + 12] = l__BedwarsKit__2.WIZARD;
v5[v21 + 13] = l__BedwarsKit__2.GRIM_REAPER;
v5[v21 + 14] = l__BedwarsKit__2.COWGIRL;
v5[v21 + 15] = l__BedwarsKit__2.BIGMAN;
v5[v21 + 16] = l__BedwarsKit__2.DAVEY;
v5[v21 + 17] = l__BedwarsKit__2.FARMER_CLETUS;
v5[v21 + 18] = l__BedwarsKit__2.MELODY;
v5[v21 + 19] = l__BedwarsKit__2.ARCHER;
v5[v21 + 20] = l__BedwarsKit__2.SHIELDER;
v5[v21 + 21] = l__BedwarsKit__2.BAKER;
v5[v21 + 22] = l__BedwarsKit__2.BUILDER;
v4.ShopKits = v5;
v4.FeaturedKits = { l__BedwarsKit__2.CYBER, l__BedwarsKit__2.COWGIRL, l__BedwarsKit__2.DASHER, l__BedwarsKit__2.AXOLOTL };
v4.BattlePassPodiumKits = { l__BedwarsKit__2.WIND_WALKER, l__BedwarsKit__2.STAR_COLLECTOR, l__BedwarsKit__2.BATTERY, l__BedwarsKit__2.PINATA };
return {
	BedwarsKitShop = v4
};
