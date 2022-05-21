-- Script Hash: 6dd627b4dc6f8bad5d5ade8d137bf4270f18245cb12726b9ed281edab59607db48dfb50d6f976027819d4558363a8b68
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = setmetatable({}, {
	__tostring = function()
		return "RankDistribution";
	end
});
v2.__index = v2;
function v2.new(...)
	local v3 = setmetatable({}, v2);
	return v3:constructor(...) and v3;
end;
function v2.constructor(p1)

end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__RankDivision__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-division").RankDivision;
function v2.getDivisionFromGlickoRating(p2, p3)
	local v4 = 0;
	local v5 = false;
	while true do
		if v5 then
			v4 = v4 + 1;
		else
			v5 = true;
		end;
		if not (v4 < #u1.values(l__RankDivision__2)) then
			break;
		end;
		if p3 <= p2.glickoRating[v4] then
			if v4 == 0 then
				return v4;
			else
				return v4 - 1;
			end;
		end;	
	end;
	return l__RankDivision__2.NIGHTMARE_1;
end;
function v2.getDivisionFromRankPoints(p4, p5, p6)
	if p6 ~= -1 and p6 < v2.NIGHTMARE_USER_LIMIT and l__RankDivision__2.DIAMOND_4 * 100 + 100 < p5 then
		return l__RankDivision__2.NIGHTMARE_1;
	end;
	local v6 = math.floor(p5 / 100);
	if v6 < #u1.values(l__RankDivision__2) - 1 then
		return v6;
	end;
	return l__RankDivision__2.DIAMOND_4;
end;
function v2.getDisplayedRank(p7, p8, p9)
	local v7 = p7:getDivisionFromRankPoints(p8, p9);
	return {
		division = v7, 
		rankPoints = p8 - v7 * 100
	};
end;
function v2.getLegacyDivisionFromRankPoints(p10, p11, p12)
	local v8 = math.floor(p11 / 100);
	if v8 < #u1.values(l__RankDivision__2) then
		return v8;
	end;
	return l__RankDivision__2.NIGHTMARE_1;
end;
function v2.getRankPointsFromDivision(p13, p14)
	return p14 * 100;
end;
function v2.getExpectedGlickoRatingForDivision(p15, p16)
	return p15.glickoRating[p16];
end;
v2.NIGHTMARE_USER_LIMIT = 200;
v2.glickoRating = {
	[l__RankDivision__2.BRONZE_1] = 0, 
	[l__RankDivision__2.BRONZE_2] = 500, 
	[l__RankDivision__2.BRONZE_3] = 900, 
	[l__RankDivision__2.BRONZE_4] = 1100, 
	[l__RankDivision__2.SILVER_1] = 1400, 
	[l__RankDivision__2.SILVER_2] = 1480, 
	[l__RankDivision__2.SILVER_3] = 1550, 
	[l__RankDivision__2.SILVER_4] = 1620, 
	[l__RankDivision__2.GOLD_1] = 1700, 
	[l__RankDivision__2.GOLD_2] = 1800, 
	[l__RankDivision__2.GOLD_3] = 1880, 
	[l__RankDivision__2.GOLD_4] = 1960, 
	[l__RankDivision__2.PLATINUM_1] = 2020, 
	[l__RankDivision__2.PLATINUM_2] = 2070, 
	[l__RankDivision__2.PLATINUM_3] = 2100, 
	[l__RankDivision__2.PLATINUM_4] = 2150, 
	[l__RankDivision__2.DIAMOND_1] = 2170, 
	[l__RankDivision__2.DIAMOND_2] = 2230, 
	[l__RankDivision__2.DIAMOND_3] = 2300, 
	[l__RankDivision__2.DIAMOND_4] = 2370, 
	[l__RankDivision__2.NIGHTMARE_1] = 2500
};
return {
	RankDistribution = v2
};
