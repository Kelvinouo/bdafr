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
	local v4, v5, v6 = ipairs((u4.entries(l__BedwarsKit__1)));
	while true do
		v4(v5, v6);
		if not v4 then
			break;
		end;
		v6 = v4;
		local v7 = v5[1];
		if v5[2] == p4 then
			local v8 = true;
		else
			v8 = nil;
		end;
		if v8 == true then
			v3 = v5;
			break;
		end;	
	end;
	return v3[1];
end;
function v2.getKitSkinKeyFromValue(p5)
	local v9 = nil;
	local v10, v11, v12 = ipairs((u4.entries(l__BedwarsKitSkin__2)));
	while true do
		v10(v11, v12);
		if not v10 then
			break;
		end;
		v12 = v10;
		local v13 = v11[1];
		if v11[2] == p5 then
			local v14 = true;
		else
			v14 = nil;
		end;
		if v14 == true then
			v9 = v11;
			break;
		end;	
	end;
	return v9[1];
end;
return {
	GiftUtils = v2
};
