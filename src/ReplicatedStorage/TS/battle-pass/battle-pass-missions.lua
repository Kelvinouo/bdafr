-- Decompiled with the Synapse X Luau decompiler.

local l__ItemType__1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local v2 = {
	SEASON_ID = 1
};
local v3 = DateTime.fromUniversalTime(2021, 8, 27, 19);
v2.SEASON_START_DATE = v3;
v2.DAILY_MISSION_XP = 2000;
v2.WEEKKLY_MISSION_XP = 8000;
local u1 = v3;
function v2.getDay()
	return math.ceil(math.max(DateTime.now().UnixTimestamp - u1.UnixTimestamp, 0) / 86400);
end;
function v2.getWeek()
	return math.ceil(math.ceil(math.max(DateTime.now().UnixTimestamp - u1.UnixTimestamp, 0) / 86400) / 7);
end;
local function u2(p1, p2, p3, p4, p5, p6)
	local v4 = {};
	local v5 = Random.new(p4);
	if #p1 == 0 then
		return {};
	end;
	local v6 = {};
	local v7 = 0;
	local v8 = false;
	while true do
		local v9 = nil;
		local v10 = nil;
		if v8 then
			v7 = v7 + 1;
		else
			v8 = true;
		end;
		if not (v7 < p5) then
			break;
		end;
		while true do
			v9 = p1[v5:NextInteger(0, #p1 - 1) + 1];
			v10 = v9.stages[1].type;
			if v6[v10] == nil then
				break;
			end;		
		end;
		local v11 = {
			id = "BATTLE_PASS_" .. tostring(v2.SEASON_ID) .. "_" .. string.upper(p2) .. "_" .. tostring(p3) .. "_MISSION_" .. tostring(v7)
		};
		for v12, v13 in pairs(v9) do
			v11[v12] = v13;
		end;
		v11.reward = p6;
		v6[v10] = true;
		table.insert(v4, v11);	
	end;
	return v4;
end;
u1 = function(p7)
	local v14 = v2.getDay();
	return u2(p7, "daily", v14, v14, 2, v2.DAILY_MISSION_XP);
end;
return {
	BattlePassMissions = v2, 
	BattlePassMissionsContext = (function(p8, p9)
		local v15 = v2.getDay();
		local v16 = v2.getWeek();
		local u3 = v2.getDay();
		local u4 = u2(p8, "daily", v15, v15, 2, v2.DAILY_MISSION_XP);
		local u5 = v2.getWeek();
		local u6 = u2(p9, "weekly", v16, v16 * 100, 3, v2.WEEKKLY_MISSION_XP);
		return {
			getDailyMissions = function()
				local v17 = v2.getDay();
				if v17 ~= u3 then
					local v18 = v2.getDay();
					u4 = u2(p8, "daily", v18, v18, 2, v2.DAILY_MISSION_XP);
					u3 = v17;
				end;
				return u4;
			end, 
			getWeeklyMissions = function()
				local v19 = v2.getWeek();
				if v19 ~= u5 then
					local v20 = v2.getWeek();
					u6 = u2(p9, "weekly", v20, v20 * 100, 3, v2.WEEKKLY_MISSION_XP);
					u5 = v19;
				end;
				return u6;
			end
		};
	end)({ {
			name = "Get %s kills", 
			stages = { {
					type = "PlayerKill", 
					progress = 5
				} }
		}, {
			name = "Win %s games", 
			stages = { {
					type = "GameWin", 
					progress = 1
				} }
		}, {
			name = "Deal %s damage", 
			stages = { {
					type = "PlayerDamage", 
					progress = 800
				} }
		}, {
			name = "Pop %s balloons", 
			stages = { {
					type = "BalloonPop", 
					progress = 2
				} }
		}, {
			name = "Spend %s emeralds", 
			stages = { {
					type = "SpendResource", 
					progress = 16, 
					resource = l__ItemType__1.EMERALD
				} }
		}, {
			name = "Spend %s diamonds", 
			stages = { {
					type = "SpendResource", 
					progress = 30, 
					resource = l__ItemType__1.DIAMOND
				} }
		}, {
			name = "Break %s blocks", 
			stages = { {
					type = "BlockBreak", 
					progress = 30
				} }
		}, {
			name = "Travel %s blocks with Telepearls", 
			stages = { {
					type = "TelepearlTeleport", 
					progress = 300
				} }
		}, {
			name = "Deal %s damage with arrows", 
			stages = { {
					type = "ArrowDamage", 
					progress = 250
				} }
		}, {
			name = "Use %s fireballs", 
			stages = { {
					type = "UseProjectile", 
					progress = 5, 
					projectileType = "fireball"
				} }
		}, {
			name = "Repair %s Enchant Tables", 
			stages = { {
					type = "RepairEnchantTable", 
					progress = 2
				} }
		} }, { {
			name = "Get %s kills", 
			stages = { {
					type = "PlayerKill", 
					progress = 20
				} }
		}, {
			name = "Win %s games", 
			stages = { {
					type = "GameWin", 
					progress = 5
				} }
		}, {
			name = "Deal %s damage", 
			stages = { {
					type = "PlayerDamage", 
					progress = 5000
				} }
		}, {
			name = "Break %s beds", 
			stages = { {
					type = "BedBreak", 
					progress = 3
				} }
		}, {
			name = "Pop %s balloons", 
			stages = { {
					type = "BalloonPop", 
					progress = 6
				} }
		}, {
			name = "Spend %s emeralds", 
			stages = { {
					type = "SpendResource", 
					progress = 90, 
					resource = l__ItemType__1.EMERALD
				} }
		}, {
			name = "Spend %s diamonds", 
			stages = { {
					type = "SpendResource", 
					progress = 110, 
					resource = l__ItemType__1.DIAMOND
				} }
		}, {
			name = "Break %s blocks", 
			stages = { {
					type = "BlockBreak", 
					progress = 80
				} }
		}, {
			name = "Travel %s blocks with Telepearls", 
			stages = { {
					type = "TelepearlTeleport", 
					progress = 1200
				} }
		}, {
			name = "Deal %s damage with arrows", 
			stages = { {
					type = "ArrowDamage", 
					progress = 1000
				} }
		} })
};
