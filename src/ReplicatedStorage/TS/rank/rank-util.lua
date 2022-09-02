-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {};
local l__RANKED_S5__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-category").RankCategory.RANKED_S5;
v2.activeRankCategory = l__RANKED_S5__3;
v2.activeRankMeta = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-category-meta").RankCategoryMeta[l__RANKED_S5__3];
return {
	RankUtil = v2
};
