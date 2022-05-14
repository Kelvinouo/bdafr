-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__BedwarsShopOverride__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopOverride;
local v4 = {};
for v5, v6 in ipairs(script.Parent:FindFirstChild("shop-overrides"):GetDescendants()) do
	if v6:IsA("ModuleScript") then
		for v7, v8 in ipairs(v2.values((require(v6)))) do
			if v1.instanceof(v8, l__BedwarsShopOverride__3) then
				table.insert(v4, v8);
			end;
		end;
	end;
end;
return {
	BedwarsShopOverrides = v4
};
