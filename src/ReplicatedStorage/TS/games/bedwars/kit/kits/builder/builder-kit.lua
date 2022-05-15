
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {};
local l__getItemMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__BedwarsShop__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
function v2.getFortificationCost(p1)
	local v3 = {};
	local v4 = l__getItemMeta__1(p1);
	local v5 = v4.block;
	if v5 ~= nil then
		v5 = v5.wool;
	end;
	if v5 then
		p1 = l__ItemType__2.WOOL_WHITE;
	end;
	local v6 = l__BedwarsShop__3.getShopItem(p1, nil);
	if not v6 then
		return nil;
	end;
	local v7 = {
		currency = v6.currency
	};
	local v8 = v4.block;
	if v8 ~= nil then
		v8 = v8.blastProof;
	end;
	if v8 then
		local v9 = math.ceil(v6.price * 1.5 / v6.amount);
	else
		v9 = math.ceil(v6.price * 2.25 / v6.amount);
	end;
	v7.amount = v9;
	table.insert(v3, v7);
	return v3;
end;
return {
	BuilderKit = v2
};

