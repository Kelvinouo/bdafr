-- Script Hash: e63078bb727d45f79c68e527bbd09aaaad88b4e9cec55899abe9de742e424a4b80b6ad56bbcdbd855e682c3992cea698
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local v2 = setmetatable({}, {
	__index = v1
});
v2.GHOST = "ghost";
v1.ghost = "GHOST";
v2.ALCHEMIST_INGREDIENTS = "alchemist_ingedients";
v1.alchemist_ingedients = "ALCHEMIST_INGREDIENTS";
v2.HIDDEN_METAL = "hidden_metal";
v1.hidden_metal = "HIDDEN_METAL";
local v3 = {};
for v4, v5 in pairs(v2) do
	v3[v4] = v5;
end;
for v6, v7 in pairs(require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "themed-event", "themed-event-types").ThemedCollectableType) do
	v3[v6] = v7;
end;
return {
	CollectableEntityType = v3
};
