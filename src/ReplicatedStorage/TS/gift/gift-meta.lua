
-- Decompiled with the Synapse X Luau decompiler.

local v1 = nil;
local v2 = nil;
local v3 = nil;
local v4 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v5 = {};
local v6 = v4.import(script, v4.getModule(script, "@rbxts", "object-utils"));
local l__BattlePassUtils__7 = v4.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local v8 = v6.values(v4.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit);
local l__getBedwarsKitMeta__1 = v4.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local l__DevProduct__2 = v4.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "devproduct").DevProduct;
v1 = {};
local function v9(p1, p2)
	local v10 = l__getBedwarsKitMeta__1(p2);
	local v11 = v10.notGiftable or v10.unlockedInBattlePass;
	if not v11 then
		local l__devProductId__12 = v10.devProductId;
		local v13 = false;
		if l__devProductId__12 ~= 0 then
			v13 = false;
			if l__devProductId__12 == l__devProductId__12 then
				v13 = l__devProductId__12;
			end;
		end;
		local v14 = not v13;
		if v14 then
			local l__gamepassId__15 = v10.gamepassId;
			local v16 = false;
			if l__gamepassId__15 ~= 0 then
				v16 = false;
				if l__gamepassId__15 == l__gamepassId__15 then
					v16 = l__gamepassId__15;
				end;
			end;
			v14 = not v16;
		end;
		v11 = v14;
	end;
	if v11 then
		return p1;
	end;
	p1[p2] = {
		name = v10.name, 
		price = 399, 
		devProductId = l__DevProduct__2.KIT_GIFT
	};
	return p1;
end;
for v17 = 1, #v8 do
	v1 = v9(v1, v8[v17], v17 - 1, v8);
end;
local v18 = v6.values(v4.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin);
local l__BedwarsKitSkinMeta__3 = v4.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
v2 = {};
local function v19(p3, p4)
	local v20 = l__BedwarsKitSkinMeta__3[p4];
	if not v20.product then
		return p3;
	end;
	p3[p4] = {
		name = v20.name, 
		price = v20.product.priceRobux, 
		devProductId = v20.product.devProductId
	};
	return p3;
end;
for v21 = 1, #v18 do
	v2 = v19(v2, v18[v21], v21 - 1, v18);
end;
local v22 = v6.values(v4.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-type").BundleType);
local l__BundleMeta__4 = v4.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta;
v3 = {};
local function v23(p5, p6)
	local v24 = l__BundleMeta__4[p6];
	p5[p6] = {
		name = v24.name, 
		imageId = v24.image, 
		price = v24.price, 
		devProductId = v24.devProductId
	};
	return p5;
end;
for v25 = 1, #v22 do
	v3 = v23(v3, v22[v25], v25 - 1, v22);
end;
local v26 = {
	[v4.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-type").GiftType.BattlePass] = {
		name = "Battle Pass Season " .. tostring(l__BattlePassUtils__7.BATTLE_PASS_SEASON_INDEX), 
		imageId = l__BattlePassUtils__7.BATTLE_PASS_ICON, 
		price = 799, 
		devProductId = v4.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-dev-products").BattlePassGiftDevProduct
	}
};
for v27, v28 in pairs(local v29) do
	v26[v27] = v28;
end;
for v30, v31 in pairs(local v32) do
	v26[v30] = v31;
end;
for v33, v34 in pairs(local v35) do
	v26[v33] = v34;
end;
v5.GiftMeta = v26;
function v5.getGiftMeta(p7)
	return v5.GiftMeta[p7];
end;
return v5;

