
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
v7.ROYALE = "royale";
v6.royale = "ROYALE";
v7.INFECTED = "infected";
v6.infected = "INFECTED";
v7.PVE = "pve";
v6.pve = "PVE";
v7.GUN_GAME = "gg";
v6.gg = "GUN_GAME";
local v8 = {};
for v9, v10 in pairs(v3) do
	v8[v9] = v10;
end;
for v11, v12 in pairs(v5) do
	v8[v11] = v12;
end;
for v13, v14 in pairs(v7) do
	v8[v13] = v14;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
return {
	BedwarsMapType = v3, 
	SkywarsMapType = v5, 
	MiscMapType = v7, 
	MapType = v8, 
	getMapTypeFromVal = function(p1)
		local v15 = u1.entries(v8);
		local function v16(p2)
			local v17 = p2[1];
			local v18 = p2[2];
			return v18 == v18;
		end;
		local v19 = nil;
		for v20, v21 in ipairs(v15) do
			if v16(v21, v20 - 1, v15) == true then
				v19 = v21;
				break;
			end;
		end;
		local v22 = v19;
		if v22 ~= nil then
			v22 = v22[1];
		end;
		return v22;
	end
};

