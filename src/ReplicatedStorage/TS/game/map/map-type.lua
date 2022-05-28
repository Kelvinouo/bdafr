-- Script Hash: 4f3fb2f8d56513562ea9c1feb9816f8e9514a39cb4f3424be99df84d76d0798693c5b4ee819e2dde98b2b62c031a278d
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {};
local v3 = setmetatable({}, {
	__index = v2
});
v3.BEDWARS_SQUADS = "to4";
v2.to4 = "BEDWARS_SQUADS";
v3.BEDWARS_DOUBLES = "to2";
v2.to2 = "BEDWARS_DOUBLES";
v3.BEDWARS_DUELS = "duels";
v2.duels = "BEDWARS_DUELS";
v3.BEDWARS_THIRTY_VS_THIRTY = "to30";
v2.to30 = "BEDWARS_THIRTY_VS_THIRTY";
local v4 = {};
local v5 = setmetatable({}, {
	__index = v4
});
v5.SKYWARS = "sw";
v4.sw = "SKYWARS";
v5.SKYWARS_SQUADS = "sw4";
v4.sw4 = "SKYWARS_SQUADS";
local v6 = {};
local v7 = setmetatable({}, {
	__index = v6
});
v7.FLAG_CAPTURE_MAP_TYPE = "ctf_to12";
v6.ctf_to12 = "FLAG_CAPTURE_MAP_TYPE";
local v8 = {};
local v9 = setmetatable({}, {
	__index = v8
});
v9.ROYALE = "royale";
v8.royale = "ROYALE";
v9.INFECTED = "infected";
v8.infected = "INFECTED";
v9.PVE = "pve";
v8.pve = "PVE";
v9.GUN_GAME = "gg";
v8.gg = "GUN_GAME";
local v10 = {};
for v11, v12 in pairs(v3) do
	v10[v11] = v12;
end;
for v13, v14 in pairs(v5) do
	v10[v13] = v14;
end;
for v15, v16 in pairs(v9) do
	v10[v15] = v16;
end;
for v17, v18 in pairs(v7) do
	v10[v17] = v18;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
return {
	BedwarsMapType = v3, 
	SkywarsMapType = v5, 
	FlagCaptureMapType = v7, 
	MiscMapType = v9, 
	MapType = v10, 
	getMapTypeFromVal = function(p1)
		local v19 = u1.entries(v10);
		local function v20(p2)
			local v21 = p2[1];
			local v22 = p2[2];
			return v22 == v22;
		end;
		local v23 = nil;
		for v24, v25 in ipairs(v19) do
			if v20(v25, v24 - 1, v19) == true then
				v23 = v25;
				break;
			end;
		end;
		local v26 = v23;
		if v26 ~= nil then
			v26 = v26[1];
		end;
		return v26;
	end
};
