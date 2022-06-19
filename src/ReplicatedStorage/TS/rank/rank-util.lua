-- Script Hash: 5808c86d0a0ce29635ca1ee173a6c36020ae05f6ccf57b6940d336acde4197ed905c233091e0e8873d8a5a8019e6729c
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {};
local l__RANKED_S5__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-category").RankCategory.RANKED_S5;
v2.activeRankCategory = l__RANKED_S5__3;
v2.activeRankMeta = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-category-meta").RankCategoryMeta[l__RANKED_S5__3];
return {
	RankUtil = v2
};
