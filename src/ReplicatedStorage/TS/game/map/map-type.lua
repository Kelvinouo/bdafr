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
v9.TNT_WARS = "tnt";
v8.tnt = "TNT_WARS";
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
		local v19 = nil;
		local v20, v21, v22 = ipairs((u1.entries(v10)));
		while true do
			v20(v21, v22);
			if not v20 then
				break;
			end;
			v22 = v20;
			local v23 = v21[1];
			local v24 = v21[2];
			if v24 == v24 == true then
				v19 = v21;
				break;
			end;		
		end;
		local v25 = v19;
		if v25 ~= nil then
			v25 = v25[1];
		end;
		return v25;
	end
};
