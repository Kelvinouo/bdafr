-- Decompiled with the Synapse X Luau decompiler.

local v1 = {
	SURVIVE_THE_PENGUINS = 2124914723, 
	EASTER_EGG_HUNT_2022 = 2125949335, 
	SURVIVE_THE_PENGUINS_S5 = 2127519281, 
	SURVIVE_THE_PENGUINS_S5_HARD = 2127531484
};
if require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil.isProduction() then
	v1.SURVIVE_THE_PENGUINS = 2124914723;
	v1.EASTER_EGG_HUNT_2022 = 2125949335;
	v1.SURVIVE_THE_PENGUINS_S5 = 2127519281;
	v1.SURVIVE_THE_PENGUINS_S5_HARD = 2127531484;
end;
return {
	Badges = v1
};
