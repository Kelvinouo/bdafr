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
	local v3 = nil;
	for v4, v5 in ipairs((u4.entries(l__BedwarsKit__1))) do
		local v6 = v5[1];
		if v5[2] == p4 then
			local v7 = true;
		else
			v7 = nil;
		end;
		if v7 == true then
			v3 = v5;
			break;
		end;
	end;
	return v3[1];
end;
function v2.getKitSkinKeyFromValue(p5)
	local v8 = nil;
	for v9, v10 in ipairs((u4.entries(l__BedwarsKitSkin__2))) do
		local v11 = v10[1];
		if v10[2] == p5 then
			local v12 = true;
		else
			v12 = nil;
		end;
		if v12 == true then
			v8 = v10;
			break;
		end;
	end;
	return v8[1];
end;
return {
	GiftUtils = v2
};
