-- Script Hash: 111a5e3f04316cdf783b5aa6558a677a1fbf55883d4605172ad66b42f02af594344db8f3eaafbf78aec4c86b7246c52e
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
v2.STARS = "stars";
v1.stars = "STARS";
v2.FLAG = "flag";
v1.flag = "FLAG";
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
