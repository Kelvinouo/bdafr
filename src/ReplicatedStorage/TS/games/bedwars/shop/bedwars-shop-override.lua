-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__BedwarsShopOverride__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopOverride;
local v4 = {};
local v5, v6, v7 = ipairs(script.Parent:FindFirstChild("shop-overrides"):GetDescendants());
while true do
	v5(v6, v7);
	if not v5 then
		break;
	end;
	v7 = v5;
	if v6:IsA("ModuleScript") then
		local v8, v9, v10 = ipairs(v2.values((require(v6))));
		while true do
			v8(v9, v10);
			if not v8 then
				break;
			end;
			v10 = v8;
			if v1.instanceof(v9, l__BedwarsShopOverride__3) then
				table.insert(v4, v9);
			end;		
		end;
	end;
end;
return {
	BedwarsShopOverrides = v4
};
