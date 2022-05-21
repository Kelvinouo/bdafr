-- Script Hash: c61dace812ae3f3324911440fe398c1c44e74a11d4179b712361657a277bb0c2498d9f5a78b92844c64c167e2d374e2c
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BedwarsImageId__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__RankDivision__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-division").RankDivision;
local l__RankTier__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-tier").RankTier;
local function v4(p1)
	if p1 == l__RankTier__1.BRONZE then
		return Color3.fromRGB(140, 74, 47);
	end;
	if p1 == l__RankTier__1.SILVER then
		return Color3.fromRGB(207, 207, 207);
	end;
	if p1 == l__RankTier__1.GOLD then
		return Color3.fromRGB(253, 228, 0);
	end;
	if p1 == l__RankTier__1.PLATINUM then
		return Color3.fromRGB(0, 253, 192);
	end;
	if p1 == l__RankTier__1.DIAMOND then
		return Color3.fromRGB(53, 243, 255);
	end;
	if p1 == l__RankTier__1.NIGHTMARE then
		return Color3.fromRGB(87, 0, 173);
	end;
	return Color3.fromRGB(140, 74, 47);
end;
local function v5(p2)
	if p2 == l__RankTier__1.BRONZE then
		return UDim2.fromScale(0.8, 0.8);
	end;
	if p2 == l__RankTier__1.SILVER then
		return UDim2.fromScale(0.8, 0.8);
	end;
	if p2 == l__RankTier__1.GOLD then
		return UDim2.fromScale(0.85, 0.85);
	end;
	if p2 == l__RankTier__1.PLATINUM then
		return UDim2.fromScale(0.9, 0.9);
	end;
	if p2 == l__RankTier__1.DIAMOND then
		return UDim2.fromScale(1, 1);
	end;
	if p2 == l__RankTier__1.NIGHTMARE then
		return UDim2.fromScale(1, 1);
	end;
	return UDim2.fromScale(1, 1);
end;
return {
	getRankColor = v4, 
	RankMeta = {
		[l__RankDivision__3.BRONZE_1] = {
			name = "Bronze 1", 
			tier = l__RankTier__1.BRONZE, 
			color = v4(l__RankTier__1.BRONZE), 
			image = l__BedwarsImageId__2.BRONZE_RANK, 
			imageSize = v5(l__RankTier__1.BRONZE), 
			nextRank = l__RankDivision__3.BRONZE_2
		}, 
		[l__RankDivision__3.BRONZE_2] = {
			name = "Bronze 2", 
			tier = l__RankTier__1.BRONZE, 
			color = v4(l__RankTier__1.BRONZE), 
			image = l__BedwarsImageId__2.BRONZE_RANK, 
			imageSize = v5(l__RankTier__1.BRONZE), 
			prevRank = l__RankDivision__3.BRONZE_1, 
			nextRank = l__RankDivision__3.BRONZE_3
		}, 
		[l__RankDivision__3.BRONZE_3] = {
			name = "Bronze 3", 
			tier = l__RankTier__1.BRONZE, 
			color = v4(l__RankTier__1.BRONZE), 
			image = l__BedwarsImageId__2.BRONZE_RANK, 
			imageSize = v5(l__RankTier__1.BRONZE), 
			prevRank = l__RankDivision__3.BRONZE_2, 
			nextRank = l__RankDivision__3.BRONZE_4
		}, 
		[l__RankDivision__3.BRONZE_4] = {
			name = "Bronze 4", 
			tier = l__RankTier__1.BRONZE, 
			color = v4(l__RankTier__1.BRONZE), 
			image = l__BedwarsImageId__2.BRONZE_RANK, 
			imageSize = v5(l__RankTier__1.BRONZE), 
			prevRank = l__RankDivision__3.BRONZE_3, 
			nextRank = l__RankDivision__3.SILVER_1
		}, 
		[l__RankDivision__3.SILVER_1] = {
			name = "Silver 1", 
			tier = l__RankTier__1.SILVER, 
			color = v4(l__RankTier__1.SILVER), 
			image = l__BedwarsImageId__2.SILVER_RANK, 
			imageSize = v5(l__RankTier__1.SILVER), 
			prevRank = l__RankDivision__3.BRONZE_4, 
			nextRank = l__RankDivision__3.SILVER_2
		}, 
		[l__RankDivision__3.SILVER_2] = {
			name = "Silver 2", 
			tier = l__RankTier__1.SILVER, 
			color = v4(l__RankTier__1.SILVER), 
			image = l__BedwarsImageId__2.SILVER_RANK, 
			imageSize = v5(l__RankTier__1.SILVER), 
			prevRank = l__RankDivision__3.SILVER_1, 
			nextRank = l__RankDivision__3.SILVER_3
		}, 
		[l__RankDivision__3.SILVER_3] = {
			name = "Silver 3", 
			tier = l__RankTier__1.SILVER, 
			color = v4(l__RankTier__1.SILVER), 
			image = l__BedwarsImageId__2.SILVER_RANK, 
			imageSize = v5(l__RankTier__1.SILVER), 
			prevRank = l__RankDivision__3.SILVER_2, 
			nextRank = l__RankDivision__3.SILVER_4
		}, 
		[l__RankDivision__3.SILVER_4] = {
			name = "Silver 4", 
			tier = l__RankTier__1.SILVER, 
			color = v4(l__RankTier__1.SILVER), 
			image = l__BedwarsImageId__2.SILVER_RANK, 
			imageSize = v5(l__RankTier__1.SILVER), 
			prevRank = l__RankDivision__3.SILVER_3, 
			nextRank = l__RankDivision__3.GOLD_1
		}, 
		[l__RankDivision__3.GOLD_1] = {
			name = "Gold 1", 
			tier = l__RankTier__1.GOLD, 
			color = v4(l__RankTier__1.GOLD), 
			image = l__BedwarsImageId__2.GOLD_RANK, 
			imageSize = v5(l__RankTier__1.GOLD), 
			prevRank = l__RankDivision__3.SILVER_4, 
			nextRank = l__RankDivision__3.GOLD_2
		}, 
		[l__RankDivision__3.GOLD_2] = {
			name = "Gold 2", 
			tier = l__RankTier__1.GOLD, 
			color = v4(l__RankTier__1.GOLD), 
			image = l__BedwarsImageId__2.GOLD_RANK, 
			imageSize = v5(l__RankTier__1.GOLD), 
			prevRank = l__RankDivision__3.GOLD_1, 
			nextRank = l__RankDivision__3.GOLD_3
		}, 
		[l__RankDivision__3.GOLD_3] = {
			name = "Gold 3", 
			tier = l__RankTier__1.GOLD, 
			color = v4(l__RankTier__1.GOLD), 
			image = l__BedwarsImageId__2.GOLD_RANK, 
			imageSize = v5(l__RankTier__1.GOLD), 
			prevRank = l__RankDivision__3.GOLD_2, 
			nextRank = l__RankDivision__3.GOLD_4
		}, 
		[l__RankDivision__3.GOLD_4] = {
			name = "Gold 4", 
			tier = l__RankTier__1.GOLD, 
			color = v4(l__RankTier__1.GOLD), 
			image = l__BedwarsImageId__2.GOLD_RANK, 
			imageSize = v5(l__RankTier__1.GOLD), 
			prevRank = l__RankDivision__3.GOLD_3, 
			nextRank = l__RankDivision__3.PLATINUM_1
		}, 
		[l__RankDivision__3.PLATINUM_1] = {
			name = "Platinum 1", 
			tier = l__RankTier__1.PLATINUM, 
			color = v4(l__RankTier__1.PLATINUM), 
			image = l__BedwarsImageId__2.PLATINUM_RANK, 
			imageSize = v5(l__RankTier__1.PLATINUM), 
			prevRank = l__RankDivision__3.GOLD_4, 
			nextRank = l__RankDivision__3.PLATINUM_2
		}, 
		[l__RankDivision__3.PLATINUM_2] = {
			name = "Platinum 2", 
			tier = l__RankTier__1.PLATINUM, 
			color = v4(l__RankTier__1.PLATINUM), 
			image = l__BedwarsImageId__2.PLATINUM_RANK, 
			imageSize = v5(l__RankTier__1.PLATINUM), 
			prevRank = l__RankDivision__3.PLATINUM_1, 
			nextRank = l__RankDivision__3.PLATINUM_3
		}, 
		[l__RankDivision__3.PLATINUM_3] = {
			name = "Platinum 3", 
			tier = l__RankTier__1.PLATINUM, 
			color = v4(l__RankTier__1.PLATINUM), 
			image = l__BedwarsImageId__2.PLATINUM_RANK, 
			imageSize = v5(l__RankTier__1.PLATINUM), 
			prevRank = l__RankDivision__3.PLATINUM_2, 
			nextRank = l__RankDivision__3.PLATINUM_4
		}, 
		[l__RankDivision__3.PLATINUM_4] = {
			name = "Platinum 4", 
			tier = l__RankTier__1.PLATINUM, 
			color = v4(l__RankTier__1.PLATINUM), 
			image = l__BedwarsImageId__2.PLATINUM_RANK, 
			imageSize = v5(l__RankTier__1.PLATINUM), 
			prevRank = l__RankDivision__3.PLATINUM_3, 
			nextRank = l__RankDivision__3.DIAMOND_1
		}, 
		[l__RankDivision__3.DIAMOND_1] = {
			name = "Diamond 1", 
			tier = l__RankTier__1.DIAMOND, 
			color = v4(l__RankTier__1.DIAMOND), 
			image = l__BedwarsImageId__2.DIAMOND_RANK, 
			imageSize = v5(l__RankTier__1.DIAMOND), 
			prevRank = l__RankDivision__3.PLATINUM_4, 
			nextRank = l__RankDivision__3.DIAMOND_2
		}, 
		[l__RankDivision__3.DIAMOND_2] = {
			name = "Diamond 2", 
			tier = l__RankTier__1.DIAMOND, 
			color = v4(l__RankTier__1.DIAMOND), 
			image = l__BedwarsImageId__2.DIAMOND_RANK, 
			imageSize = v5(l__RankTier__1.DIAMOND), 
			prevRank = l__RankDivision__3.DIAMOND_1, 
			nextRank = l__RankDivision__3.DIAMOND_3
		}, 
		[l__RankDivision__3.DIAMOND_3] = {
			name = "Diamond 3", 
			tier = l__RankTier__1.DIAMOND, 
			color = v4(l__RankTier__1.DIAMOND), 
			image = l__BedwarsImageId__2.DIAMOND_RANK, 
			imageSize = v5(l__RankTier__1.DIAMOND), 
			prevRank = l__RankDivision__3.DIAMOND_2, 
			nextRank = l__RankDivision__3.DIAMOND_4
		}, 
		[l__RankDivision__3.DIAMOND_4] = {
			name = "Diamond 4", 
			tier = l__RankTier__1.DIAMOND, 
			color = v4(l__RankTier__1.DIAMOND), 
			image = l__BedwarsImageId__2.DIAMOND_RANK, 
			imageSize = v5(l__RankTier__1.DIAMOND), 
			prevRank = l__RankDivision__3.DIAMOND_3, 
			noRPLimit = true
		}, 
		[l__RankDivision__3.NIGHTMARE_1] = {
			name = "NIGHTMARE", 
			tier = l__RankTier__1.NIGHTMARE, 
			color = v4(l__RankTier__1.NIGHTMARE), 
			image = l__BedwarsImageId__2.NIGHTMARE_RANK, 
			imageSize = v5(l__RankTier__1.NIGHTMARE), 
			noRPLimit = true, 
			noInstantDemote = true
		}
	}
};
