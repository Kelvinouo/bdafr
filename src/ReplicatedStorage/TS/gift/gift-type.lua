
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {};
local v3 = setmetatable({}, {
	__index = v2
});
v3.BattlePass = "BattlePass";
v2.BattlePass = "BattlePass";
local v4 = {};
for v5, v6 in pairs(v3) do
	v4[v5] = v6;
end;
for v7, v8 in pairs(v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit) do
	v4[v7] = v8;
end;
for v9, v10 in pairs(v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin) do
	v4[v9] = v10;
end;
for v11, v12 in pairs(v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-type").BundleType) do
	v4[v11] = v12;
end;
return {
	GiftT = v3, 
	GiftType = v4
};

