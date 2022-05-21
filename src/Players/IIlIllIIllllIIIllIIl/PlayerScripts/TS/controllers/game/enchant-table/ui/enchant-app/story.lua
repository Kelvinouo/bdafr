-- Script Hash: 5507081c2b9d1e15c903e6b3d0a87e81d7b575eba39e60346310f2dcef1a228bb8126eb9c13db038571259fd696b892c
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__StoreProvider__2 = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).StoreProvider;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__EnchantApp__4 = v1.import(script, script.Parent, "enchant-app").EnchantApp;
local l__BedwarsAppIds__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
return function(p1)
	local u6 = u1.mount(u1.createElement(l__StoreProvider__2, {
		store = l__ClientStore__3
	}, { u1.createElement(l__EnchantApp__4, {
			AppId = l__BedwarsAppIds__5.ENCHANT_TABLE
		}) }), p1);
	return function()
		return u1.unmount(u6);
	end;
end;
