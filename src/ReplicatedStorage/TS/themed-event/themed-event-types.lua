-- Script Hash: af351ef2f21827ad54916254e1b703f36c1b9db1378ec9d8e5e1d389345462140813004237e849837688a0c4580e4ab8
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
