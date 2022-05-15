
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BedwarsKit__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local v3 = {
	maxStock = 3, 
	reqClanLevel = 3, 
	reqRank = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank.ADMIN, 
	priceMultiplier = 10, 
	kitPool = { l__BedwarsKit__2.FARMER_CLETUS, l__BedwarsKit__2.GRIM_REAPER, l__BedwarsKit__2.BARBARIAN, l__BedwarsKit__2.BAKER, l__BedwarsKit__2.ARCHER, l__BedwarsKit__2.ANGEL, l__BedwarsKit__2.BIGMAN, l__BedwarsKit__2.COWGIRL, l__BedwarsKit__2.WIZARD, l__BedwarsKit__2.SHIELDER, l__BedwarsKit__2.BUILDER, l__BedwarsKit__2.DASHER, l__BedwarsKit__2.DAVEY, l__BedwarsKit__2.MELODY }
};
local l__ClanUtil__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil;
function v3.getKitShopKitPrice(p1)
	return l__ClanUtil__1.calcClanMaxDailyCoins(p1) * 10;
end;
return {
	ClanKitShop = v3
};

