-- Script Hash: 8ac180f609a0293e20dc49496fd4970d3fe53ab89d63a0dd17f0560c40adc59031b7fe74b73f96b7fc8b4d337de8e9c7
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__BedwarsKit__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__BedwarsKitSkin__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__CreateRoduxApp__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__KitShopApp__6 = v1.import(script, script.Parent, "kit-shop-app").KitShopApp;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	l__ClientStore__4:dispatch({
		type = "SetEquippedKitSkins", 
		equippedKitSkins = (function()
			local v2 = u1.values(l__BedwarsKit__2);
			local function v3(p2)
				return { p2, l__BedwarsKitSkin__3.DEFAULT };
			end;
			local v4 = table.create(#v2);
			for v5, v6 in ipairs(v2) do
				v4[v5] = v3(v6, v5 - 1, v2);
			end;
			return u1.fromEntries(v4);
		end)()
	});
	local u8 = l__CreateRoduxApp__5("KitShop", l__KitShopApp__6, {}, {}, {
		Parent = p1
	});
	return function()
		u7.unmount(u8);
	end;
end;
