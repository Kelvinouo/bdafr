-- Script Hash: 703c67e603a0798217952e33377d122d6ee7d39d3d90974bc3cc9020d67ac3380e17f4f53648858977bd03896a824221
-- Decompiled with the Synapse X Luau decompiler.

local l__MapType__1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-type").MapType;
local v2 = {
	[l__MapType__1.SKYWARS] = { "sw_Cistern", "sw_Wasteland", "sw_Volatile", "sw_Tundra", "sw_Glade", "sw_Bamboo-Garden", "sw_Bloom" }, 
	[l__MapType__1.SKYWARS_SQUADS] = { "sw4_Wasteland", "sw4_Volatile", "sw4_Tundra", "sw4_Glade", "sw4_Cistern", "sw4_BambooGarden" }
};
local v3 = {
	[l__MapType__1.BEDWARS_SQUADS] = { "to4_Aztec", "to4_Blossom", "to4_Forest", "to4_Glacier", "to4_Sand-Temple", "to4_Pinefall", "to4_Construction", "to4_Airship", "to4_Mini-Golf", "to4_Crypt", "to4_Football-Field", "to4_Highschool", "to4_Bank", "to4_Candyland", "to4_Military-Base", "to4_Swamp", "to4_Shrine", "to4_Oriental", "to4_Pond", "to4_Mystic", "to4_Citadel", "to4_Quarry", "to4_Western", "to4_Colosseum", "to4_Dome", "to4_Windfall", "to4_Irongate", "to4_Coast", "to4_Grotto", "to4_Sanctum", "to4_Sanctum", "to4_Sanctum", "to4_Sanctum", "to4_Sanctum" }, 
	[l__MapType__1.BEDWARS_DOUBLES] = { "to2_Sandstorm", "to2_Park", "to2_Dome", "to2_Blossom", "to2_Glacier", "to2_Sand-Temple", "to2_Autumn", "to2_Pinefall", "to2_Mini-Golf", "to2_Plaza", "to2_Crypt", "to2_Arch", "to2_Candyland", "to2_Swamp", "to2_Shrine", "to2_Oriental", "to2_Pond", "to2_Mystic", "to2_Citadel", "to2_Mineshaft", "to2_Western", "to2_Windfall", "to2_Coast", "to2_Grotto", "to2_Sanctum", "to2_Sanctum", "to2_Sanctum", "to2_Sanctum", "to2_Sanctum" }, 
	[l__MapType__1.BEDWARS_DUELS] = { "duels_Volatile", "duels_Ruins", "duels_Glacier", "duels_Blossom", "duels_Sand-Temple", "duels_Glade", "duels_Canyon" }, 
	[l__MapType__1.BEDWARS_THIRTY_VS_THIRTY] = { "to30_Aztec", "to30_Castle", "to30_Campsite", "to30_Fortress", "to30_Ships-Ahoy", "to30_Reservoir", "to30_Spring" }
};
local v4 = {
	[l__MapType__1.FLAG_CAPTURE_MAP_TYPE] = { "to30_Campsite", "to30_Ships-Ahoy", "to30_Reservoir", "to30_Castle", "to30_Fortress", "to30_Fortress" }
};
local v5 = {};
for v6, v7 in pairs(v3) do
	v5[v6] = v7;
end;
for v8, v9 in pairs(v2) do
	v5[v8] = v9;
end;
for v10, v11 in pairs(v4) do
	v5[v10] = v11;
end;
v5[l__MapType__1.ROYALE] = { "royale_Mega-Plains", "royale_Mega-Tundra", "royale_Gorge" };
v5[l__MapType__1.INFECTED] = { "infected_Industry", "infected_Frost-Site" };
v5[l__MapType__1.PVE] = { "pve_Iceberg" };
v5[l__MapType__1.GUN_GAME] = { "gg_siege", "gg_ruins", "gg_treetop" };
return {
	SkywarsMaps = v2, 
	BedwarsMaps = v3, 
	FlagCaptureMaps = v4, 
	Maps = v5
};
