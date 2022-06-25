-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local v2 = setmetatable({}, {
	__index = v1
});
v2.FIGHTER = 0;
v1[0] = "FIGHTER";
v2.TANK = 1;
v1[1] = "TANK";
v2.DEFENDER = 2;
v1[2] = "DEFENDER";
v2.MOVEMENT = 3;
v1[3] = "MOVEMENT";
v2.DESTROYER = 4;
v1[4] = "DESTROYER";
v2.ECONOMY = 5;
v1[5] = "ECONOMY";
v2.SUPPORT = 6;
v1[6] = "SUPPORT";
v2.MISC = 7;
v1[7] = "MISC";
return {
	BedwarsClass = v2
};
