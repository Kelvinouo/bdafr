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
				v8(v9, v10);
				if not v8 then
					break;
				end;
				v10 = v8;
				v11 = v9[2];
				local v12 = tonumber(v9[1]);
				if v2.players[v12] then
					v2.players[v12].team = v11;
				else
					v2.players[v12] = {
						team = v11
					};
				end;
				v7[v8] = 0;			
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
		local v14 = table.create(#v13);
		local v15, v16, v17 = ipairs(v13);
		while true do
			local v18 = nil;
			v15(v16, v17);
			if not v15 then
				break;
			end;
			v17 = v15;
			v18 = v16[2];
			local v19 = tonumber(v16[1]);
			if v2.players[v19] then
				v2.players[v19].avatarAssetId = v18;
			else
				v2.players[v19] = {
					avatarAssetId = v18
				};
			end;
			v14[v15] = 0;		
		end;
		return v2;
	end
};
