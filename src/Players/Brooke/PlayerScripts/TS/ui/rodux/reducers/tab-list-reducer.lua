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
			local v7 = table.create(#v6);
			local v8, v9, v10 = ipairs(v6);
			while true do
				local v11 = nil;
				local v12, v13 = v8(v9, v10);
				if not v12 then
					break;
				end;
				v10 = v12;
				v11 = v13[2];
				local v14 = tonumber(v13[1]);
				if v2.players[v14] then
					v2.players[v14].team = v11;
				else
					v2.players[v14] = {
						team = v11
					};
				end;
				v7[v12] = 0;			
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
		local v15 = u2.entries(p2.avatarAssetIds);
		local v16 = table.create(#v15);
		local v17, v18, v19 = ipairs(v15);
		while true do
			local v20 = nil;
			local v21, v22 = v17(v18, v19);
			if not v21 then
				break;
			end;
			v19 = v21;
			v20 = v22[2];
			local v23 = tonumber(v22[1]);
			if v2.players[v23] then
				v2.players[v23].avatarAssetId = v20;
			else
				v2.players[v23] = {
					avatarAssetId = v20
				};
			end;
			v16[v21] = 0;		
		end;
		return v2;
	end
};
