-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BattlePassUtils__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local l__BedwarsKit__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__BedwarsBPKits__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsBPKits;
local v5 = {};
if not v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil.isProduction() then

end;
v5.FreeKits = { l__BedwarsKit__3.BOUNTY_HUNTER, l__BedwarsKit__3.MELODY, l__BedwarsKit__3.BAKER };
v5.UpdateTimeEpoch = 1656108000;
local v6 = { l__BedwarsKit__3.REGENT };
local v7 = #v6;
local l__season5__8 = l__BedwarsBPKits__4.season5;
local v9 = #l__season5__8;
table.move(l__season5__8, 1, v9, v7 + 1, v6);
local v10 = v7 + v9;
local l__season4__11 = l__BedwarsBPKits__4.season4;
local v12 = #l__season4__11;
table.move(l__season4__11, 1, v12, v10 + 1, v6);
local v13 = v10 + v12;
local l__season3__14 = l__BedwarsBPKits__4.season3;
local v15 = #l__season3__14;
table.move(l__season3__14, 1, v15, v13 + 1, v6);
local v16 = v13 + v15;
local l__season2__17 = l__BedwarsBPKits__4.season2;
local v18 = #l__season2__17;
table.move(l__season2__17, 1, v18, v16 + 1, v6);
local v19 = v16 + v18;
local l__season1__20 = l__BedwarsBPKits__4.season1;
local v21 = #l__season1__20;
table.move(l__season1__20, 1, v21, v19 + 1, v6);
local v22 = v19 + v21;
v6[v22 + 1] = l__BedwarsKit__3.EMBER;
v6[v22 + 2] = l__BedwarsKit__3.LUMEN;
v6[v22 + 3] = l__BedwarsKit__3.CYBER;
v6[v22 + 4] = l__BedwarsKit__3.MINER;
v6[v22 + 5] = l__BedwarsKit__3.DASHER;
v6[v22 + 6] = l__BedwarsKit__3.ICE_QUEEN;
v6[v22 + 7] = l__BedwarsKit__3.TRIPLE_SHOT;
v6[v22 + 8] = l__BedwarsKit__3.AXOLOTL;
v6[v22 + 9] = l__BedwarsKit__3.BARBARIAN;
v6[v22 + 10] = l__BedwarsKit__3.ANGEL;
v6[v22 + 11] = l__BedwarsKit__3.VULCAN;
v6[v22 + 12] = l__BedwarsKit__3.WIZARD;
v6[v22 + 13] = l__BedwarsKit__3.GRIM_REAPER;
v6[v22 + 14] = l__BedwarsKit__3.COWGIRL;
v6[v22 + 15] = l__BedwarsKit__3.BIGMAN;
v6[v22 + 16] = l__BedwarsKit__3.DAVEY;
v6[v22 + 17] = l__BedwarsKit__3.FARMER_CLETUS;
v6[v22 + 18] = l__BedwarsKit__3.MELODY;
v6[v22 + 19] = l__BedwarsKit__3.ARCHER;
v6[v22 + 20] = l__BedwarsKit__3.SHIELDER;
v6[v22 + 21] = l__BedwarsKit__3.BAKER;
v6[v22 + 22] = l__BedwarsKit__3.BUILDER;
v5.ShopKits = v6;
v5.FeaturedKits = { l__BedwarsKit__3.CYBER, l__BedwarsKit__3.COWGIRL, l__BedwarsKit__3.DASHER, l__BedwarsKit__3.AXOLOTL };
v5.BattlePassPodiumKits = l__BedwarsBPKits__4[l__BattlePassUtils__2.BATTLE_PASS_SEASON];
return {
	BedwarsKitShop = v5
};
