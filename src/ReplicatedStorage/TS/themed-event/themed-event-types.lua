-- Script Hash: 382646dc5f8af1bb721bbcce1eb964d5404c8075be7bed2dd05f6679a7fc46aca8e6bb0f30fa335d58b6e286f05a0b73
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local v2 = setmetatable({}, {
	__index = v1
});
v2.EASTER_2022 = "easter_2022";
v1.easter_2022 = "EASTER_2022";
local v3 = {};
local v4 = setmetatable({}, {
	__index = v3
});
v4.EASTER_EGG = "easter_egg";
v3.easter_egg = "EASTER_EGG";
local v5 = {};
for v6, v7 in pairs(v4) do
	v5[v6] = v7;
end;
return {
	ThemedEventType = v2, 
	EasterCollectableType = v4, 
	ThemedCollectableType = v5
};
