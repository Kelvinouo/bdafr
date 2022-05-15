
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = {
	teams = {}, 
	players = {}, 
	ranks = {}, 
	teamTotalKills = {}, 
	teamTotalBedBreaks = {}, 
	tabListColumnsData = {}
};
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
return {
	TabListReducer = function(p1, p2)
		if p1 == nil then
			p1 = u1;
		end;
		local v2 = {};
		for v3, v4 in pairs(p1) do
			v2[v3] = v4;
		end;
		local l__type__5 = p2.type;
		if l__type__5 == "TabListSetTeams" then
			v2.teams = p2.teams;
			return v2;
		end;
		if l__type__5 == "TabListSetPlayersTeamBulk" then
			local v6 = u2.entries(p2.playersTeam);
			local function v7(p3)
				local v8 = nil;
				v8 = p3[2];
				local v9 = tonumber(p3[1]);
				if v2.players[v9] then
					v2.players[v9].team = v8;
				else
					v2.players[v9] = {
						team = v8
					};
				end;
				return 0;
			end;
			local v10 = table.create(#v6);
			for v11, v12 in ipairs(v6) do
				v10[v11] = v7(v12, v11 - 1, v6);
			end;
			return v2;
		end;
		if l__type__5 ~= "TabListSetAvatarsBulk" then
			if l__type__5 == "TabListSetRanksBulk" then
				v2.ranks = p2.ranks;
				return v2;
			else
				if l__type__5 == "TablistSetColumnData" then
					v2.tabListColumnsData = p2.tabListColumnsData;
				end;
				return v2;
			end;
		end;
		local v13 = u2.entries(p2.avatarAssetIds);
		local function v14(p4)
			local v15 = nil;
			v15 = p4[2];
			local v16 = tonumber(p4[1]);
			if v2.players[v16] then
				v2.players[v16].avatarAssetId = v15;
			else
				v2.players[v16] = {
					avatarAssetId = v15
				};
			end;
			return 0;
		end;
		local v17 = table.create(#v13);
		for v18, v19 in ipairs(v13) do
			v17[v18] = v14(v19, v18 - 1, v13);
		end;
		return v2;
	end
};

