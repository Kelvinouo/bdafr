-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {};
local l__ItemType__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v2.getThemeColor(p1)
	local v3 = Color3.fromRGB(255, 173, 69);
	if p1 == l__ItemType__1.ENCHANT_TABLE_GLITCHED then
		v3 = Color3.fromRGB(64, 255, 255);
	end;
	return v3;
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
function v2.convertToRoman(p2)
	local v4 = {
		M = 1000, 
		CM = 900, 
		D = 500, 
		CD = 400, 
		C = 100, 
		XC = 90, 
		L = 50, 
		XL = 40, 
		X = 10, 
		IX = 9, 
		V = 5, 
		IV = 4, 
		I = 1
	};
	local v5 = "";
	local v6, v7, v8 = ipairs(u2.keys(v4));
	while true do
		v6(v7, v8);
		if not v6 then
			break;
		end;
		v8 = v6;
		local v9 = math.floor(p2 / v4[v7]);
		p2 = p2 - v9 * v4[v7];
		v5 = v5 .. string.rep(v7, v9);	
	end;
	return v5;
end;
return {
	EnchantTableUIUtil = v2
};
