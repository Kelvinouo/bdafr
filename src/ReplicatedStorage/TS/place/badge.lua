
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {
	SURVIVE_THE_PENGUINS = 2124914723, 
	EASTER_EGG_HUNT_2022 = 2125949335
};
if require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil.isProduction() then
	v1.SURVIVE_THE_PENGUINS = 2124914723;
	v1.EASTER_EGG_HUNT_2022 = 2125949335;
end;
return {
	Badges = v1
};

