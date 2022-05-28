-- Script Hash: 0f0032315d2a0ea86ce6236cb3fa4dc9d386ca17c57038641302369c323a1ffefe793af2950da0db0f2f87072377282b
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
