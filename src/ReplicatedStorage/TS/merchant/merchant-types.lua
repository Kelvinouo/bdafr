-- Script Hash: d6f5fd24c590a2a3502d21e3f4709cabb614bd31237108f6220e1459e4ae0e7055931e74ef45aec7157b8c9fd0091267
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local v2 = setmetatable({}, {
	__index = v1
});
v2.SILVER = 0;
v1[0] = "SILVER";
v2.GOLD = 1;
v1[1] = "GOLD";
return {
	DiscountTier = v2, 
	discountAmount = {
		[v2.SILVER] = 0.15, 
		[v2.GOLD] = 0.3
	}, 
	discountColor = {
		[v2.SILVER] = Color3.fromRGB(211, 211, 211), 
		[v2.GOLD] = Color3.fromRGB(212, 175, 55)
	}, 
	discountImage = {
		[v2.SILVER] = "rbxassetid://9867811680", 
		[v2.GOLD] = "rbxassetid://9866051599"
	}
};
