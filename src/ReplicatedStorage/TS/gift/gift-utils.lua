-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {};
local l__BedwarsKit__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
function v2.isKitGift(p1)
	if l__BedwarsKit__1[p1] ~= nil then
		return true;
	end;
	return false;
end;
local l__BedwarsKitSkin__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
function v2.isKitSkinGift(p2)
	if l__BedwarsKitSkin__2[p2] ~= nil then
		return true;
	end;
	return false;
end;
local l__BundleType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-type").BundleType;
function v2.isBundleGift(p3)
	if l__BundleType__3[p3] ~= nil then
		return true;
	end;
	return false;
end;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
function v2.getKitKeyFromValue(p4)
	local v3 = u4.entries(l__BedwarsKit__1);
	local function v4(p5)
		local v5 = p5[1];
		if p5[2] ~= p4 then
			return;
		end;
		return true;
	end;
	local v6 = nil;
	for v7, v8 in ipairs(v3) do
		if v4(v8, v7 - 1, v3) == true then
			v6 = v8;
			break;
		end;
	end;
	return v6[1];
end;
function v2.getKitSkinKeyFromValue(p6)
	local v9 = u4.entries(l__BedwarsKitSkin__2);
	local function v10(p7)
		local v11 = p7[1];
		if p7[2] ~= p6 then
			return;
		end;
		return true;
	end;
	local v12 = nil;
	for v13, v14 in ipairs(v9) do
		if v10(v14, v13 - 1, v9) == true then
			v12 = v14;
			break;
		end;
	end;
	return v12[1];
end;
return {
	GiftUtils = v2
};
