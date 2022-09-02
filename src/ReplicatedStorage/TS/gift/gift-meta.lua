-- Decompiled with the Synapse X Luau decompiler.

local v1 = nil;
local v2 = nil;
local v3 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v4 = {};
local v5 = v3.import(script, v3.getModule(script, "@rbxts", "object-utils"));
local l__BattlePassUtils__6 = v3.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local v7 = v5.values(v3.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit);
local l__getBedwarsKitMeta__1 = v3.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local l__DevProduct__2 = v3.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "devproduct").DevProduct;
local function v8(p1, p2)
	local v9 = l__getBedwarsKitMeta__1(p2);
	local v10 = v9.notGiftable or v9.unlockedInBattlePass;
	if not v10 then
		local l__devProductId__11 = v9.devProductId;
		local v12 = false;
		if l__devProductId__11 ~= 0 then
			v12 = false;
			if l__devProductId__11 == l__devProductId__11 then
				v12 = l__devProductId__11;
			end;
		end;
		local v13 = not v12;
		if v13 then
			local l__gamepassId__14 = v9.gamepassId;
			local v15 = false;
			if l__gamepassId__14 ~= 0 then
				v15 = false;
				if l__gamepassId__14 == l__gamepassId__14 then
					v15 = l__gamepassId__14;
				end;
			end;
			v13 = not v15;
		end;
		v10 = v13;
	end;
	if v10 then
		return p1;
	end;
	p1[p2] = {
		name = v9.name, 
		price = 399, 
		devProductId = l__DevProduct__2.KIT_GIFT
	};
	return p1;
end;
v1 = {};
for v16 = 1, #v7 do
	v1 = v8(v1, v7[v16], v16 - 1, v7);
end;
local v17 = v5.values(v3.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin);
local l__BedwarsKitSkinMeta__3 = v3.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local v18 = {};
for v19 = 1, #v17 do
	local v20 = nil;
	v20 = v18;
	local v21 = v17[v19];
	local v22 = l__BedwarsKitSkinMeta__3[v21];
	if not v22.product then
		local v23 = v20;
	else
		v20[v21] = {
			name = v22.name, 
			price = v22.product.priceRobux, 
			devProductId = v22.product.devProductId
		};
		v23 = v20;
	end;
end;
local v24 = v5.values(v3.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-type").BundleType);
local l__BundleMeta__4 = v3.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta;
v2 = {};
for v25 = 1, #v24 do
	local v26 = v24[v25];
	local v27 = l__BundleMeta__4[v26];
	v2[v26] = {
		name = v27.name, 
		imageId = v27.image, 
		price = v27.price, 
		devProductId = v27.devProductId
	};
	v2 = v2;
end;
local v28 = {
	[v3.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-type").GiftType.BattlePass] = {
		name = "Battle Pass Season " .. tostring(l__BattlePassUtils__6.BATTLE_PASS_SEASON_NUMBER), 
		imageId = l__BattlePassUtils__6.BATTLE_PASS_ICON, 
		price = 799, 
		devProductId = v3.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-dev-products").BattlePassGiftDevProduct
	}
};
for v29, v30 in pairs(local v31) do
	v28[v29] = v30;
end;
for v32, v33 in pairs(local v34) do
	v28[v32] = v33;
end;
for v35, v36 in pairs(v23) do
	v28[v35] = v36;
end;
v4.GiftMeta = v28;
function v4.getGiftMeta(p3)
	return v4.GiftMeta[p3];
end;
return v4;
