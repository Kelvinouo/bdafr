-- Script Hash: 9c69b9006868c3716bcce3e5c385287590c8a6993bf8dd04328b48af3958827c1ff6b1526fc3452096c053a2eb8b64e9
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {
	RANKED_PASS = 1218049163, 
	HOLIDAY_BUNDLE_2021_GIFT = 1230143476, 
	LUNAR_NEW_YEAR_BUNDLE_2022_GIFT = 1235011367, 
	KIT_GIFT = 1208321617, 
	TRIPLE_SHOT_DEMON_EMPRESS = 1232887468, 
	LUNAR_VULCAN_SKIN = 1235979393, 
	MINER_BUNDLE_GIFT = 1240863955, 
	ACADEMY_AERY = 1247092922, 
	ROCKSTAR_MELODY = 1253504762, 
	EASTER_BUNNY_AMY = 1257514970, 
	FARMER_CLETUS_SPIRIT_SKIN = 1258333858, 
	CYBER_DJ = 1267371973, 
	EMBER_LUMEN_KIT_BUNDLE = 1263740791, 
	EMBER_LUMEN_KIT_BUNDLE_PERM = 1267394254
};
if require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil.isProduction() then
	v1.HOLIDAY_BUNDLE_2021_GIFT = 1230368615;
	v1.LUNAR_NEW_YEAR_BUNDLE_2022_GIFT = 1235079279;
	v1.KIT_GIFT = 1208319971;
	v1.TRIPLE_SHOT_DEMON_EMPRESS = 1233305315;
	v1.LUNAR_VULCAN_SKIN = 1235979645;
	v1.MINER_BUNDLE_GIFT = 1240859867;
	v1.ACADEMY_AERY = 1247092544;
	v1.CYBER_DJ = 1267371973;
	v1.EMBER_LUMEN_KIT_BUNDLE = 1263740791;
	v1.EMBER_LUMEN_KIT_BUNDLE_PERM = 1267394254;
end;
return {
	DevProduct = v1
};