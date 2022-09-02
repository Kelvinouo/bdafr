-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local v2 = setmetatable({}, {
	__index = v1
});
v2.OFFENSIVE = 0;
v1[0] = "OFFENSIVE";
v2.SUPPORT = 1;
v1[1] = "SUPPORT";
v2.OMIT = 2;
v1[2] = "OMIT";
local v3 = {};
local v4 = setmetatable({}, {
	__index = v3
});
v4.DAMAGE = "damage";
v3.damage = "DAMAGE";
v4.KILLS = "kills";
v3.kills = "KILLS";
v4.BLOCKBREAKS = "blockbreaks";
v3.blockbreaks = "BLOCKBREAKS";
return {
	StatType = v2, 
	TrackType = v4, 
	TYPE_TO_COLOR = {
		[v2.OFFENSIVE] = Color3.fromRGB(243, 45, 27), 
		[v2.SUPPORT] = Color3.fromRGB(0, 188, 47), 
		[v2.OMIT] = Color3.fromRGB(0, 0, 0)
	}, 
	STAT_TO_TYPE = {
		player = v2.OMIT, 
		damage = v2.OFFENSIVE, 
		kills = v2.OFFENSIVE, 
		blockbreaks = v2.SUPPORT
	}, 
	STAT_TO_DESCRIPTION = {
		player = "OMIT", 
		damage = "Damage Dealt", 
		kills = "Players Killed", 
		blockbreaks = "Blocks Broken"
	}, 
	TYPE_PRIORITY = { v4.DAMAGE, v4.KILLS, v4.BLOCKBREAKS }
};
