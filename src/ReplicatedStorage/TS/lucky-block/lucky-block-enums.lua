-- Script Hash: 7c4462916b493cfc209aed50c35b6a9c1441dd68b0435777c0fec71bcdfcd4c1e2260e0e333f87bcb31878238e485a11
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local v2 = setmetatable({}, {
	__index = v1
});
v2.COMMON = 100;
v1[100] = "COMMON";
v2.UNCOMMON = 58;
v1[58] = "UNCOMMON";
v2.RARE = 30;
v1[30] = "RARE";
v2.EPIC = 10;
v1[10] = "EPIC";
v2.LEGENDARY = 3;
v1[3] = "LEGENDARY";
local v3 = {};
local v4 = setmetatable({}, {
	__index = v3
});
v4.POSITIVE = "positive";
v3.positive = "POSITIVE";
v4.NEUTRAL = "neutral";
v3.neutral = "NEUTRAL";
v4.NEGATIVE = "negative";
v3.negative = "NEGATIVE";
return {
	LuckyBlockRarity = v2, 
	LuckyBlockPolarity = v4
};
