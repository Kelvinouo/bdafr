-- Script Hash: 2cffd1d48c4c75eb2706f1a17620d9ed44459e6fd50c722aaef1fcd1bd965462377e99d7bf80ed9938cd7e02c4d35c31
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {
	VIP = 18301866, 
	BATTLE_PASS_S1 = 21693382, 
	BATTLE_PASS_S2 = 24095899, 
	BATTLE_PASS_S3 = 26144939, 
	BATTLE_PASS_S4 = 35261547, 
	BATTLE_PASS_S5 = 50948602, 
	HOLIDAY_BUNDLE_2021 = 26343736, 
	LUNAR_BUNDLE_2022 = 27969090, 
	MINER_BUNDLE = 29973548, 
	CLAN_CREATE_PASS = 32610830, 
	MINER = 33821514, 
	EMBER_LUMEN_KIT_BUNDLE = 44594629, 
	EMBER_LUMEN_KIT_BUNDLE_PERM = 47400080
};
if not require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil.isProduction() then
	v1.VIP = 18302069;
	v1.BATTLE_PASS_S1 = 21581495;
	v1.BATTLE_PASS_S4 = 35362319;
	v1.BATTLE_PASS_S5 = 50948602;
	v1.HOLIDAY_BUNDLE_2021 = 26344762;
	v1.LUNAR_BUNDLE_2022 = 27947980;
	v1.MINER_BUNDLE = 29977061;
	v1.CLAN_CREATE_PASS = 32610141;
	v1.MINER = 33821514;
	v1.EMBER_LUMEN_KIT_BUNDLE = 35362319;
	v1.EMBER_LUMEN_KIT_BUNDLE_PERM = 47400080;
end;
return {
	Gamepass = v1
};
