
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CreateRoduxApp__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__BedwarsItemShopApp__2 = v1.import(script, script.Parent, "bedwars-item-shop-app").BedwarsItemShopApp;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__BedwarsKit__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	local v2 = l__CreateRoduxApp__1("BedwarsItemShop", l__BedwarsItemShopApp__2, {}, {}, {
		Parent = p1
	});
	l__ClientStore__3:dispatch({
		type = "SetBedwarsKit", 
		kit = l__BedwarsKit__4.FARMER_CLETUS
	});
	return function()
		u5.unmount(v2);
	end;
end;

