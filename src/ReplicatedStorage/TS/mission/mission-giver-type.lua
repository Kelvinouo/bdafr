-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local v2 = setmetatable({}, {
	__index = v1
});
v2.BATTLEPASS = "battlepass";
v1.battlepass = "BATTLEPASS";
local v3 = {};
for v4, v5 in pairs(v2) do
	v3[v4] = v5;
end;
for v6, v7 in pairs(require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventType) do
	v3[v6] = v7;
end;
return {
	MissionGiver = v3
};
