-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local v3 = {
	SEASON_ID = 1
};
local v4 = DateTime.fromUniversalTime(2021, 8, 27, 19);
v3.SEASON_START_DATE = v4;
v3.DAILY_MISSION_XP = 3000;
v3.WEEKLY_MISSION_XP = 12000;
local u1 = v4;
function v3.getDay()
	return math.ceil(math.max(DateTime.now().UnixTimestamp - u1.UnixTimestamp, 0) / 86400);
end;
function v3.getWeek()
	return math.ceil(math.ceil(math.max(DateTime.now().UnixTimestamp - u1.UnixTimestamp, 0) / 86400) / 7);
end;
local l__MissionGiver__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mission", "mission-giver-type").MissionGiver;
u1 = function(p1, p2, p3, p4, p5, p6)
	local v5 = {};
	local v6 = Random.new(p4);
	if #p1 == 0 then
		return {};
	end;
	local v7 = {};
	local v8 = 0;
	local v9 = false;
	while true do
		local v10 = nil;
		local v11 = nil;
		if v9 then
			v8 = v8 + 1;
		else
			v9 = true;
		end;
		if not (v8 < p5) then
			break;
		end;
		while true do
			v10 = p1[v6:NextInteger(0, #p1 - 1) + 1];
			v11 = v10.stages[1].type;
			if v7[v11] == nil then
				break;
			end;		
		end;
		local v12 = {
			id = "BATTLE_PASS_" .. tostring(v3.SEASON_ID) .. "_" .. string.upper(p2) .. "_" .. tostring(p3) .. "_MISSION_" .. tostring(v8), 
			giver = l__MissionGiver__2.BATTLEPASS
		};
		for v13, v14 in pairs(v10) do
			v12[v13] = v14;
		end;
		v12.rewardAmount = p6;
		v7[v11] = true;
		table.insert(v5, v12);	
	end;
	return v5;
end;
return {
	BattlePassMissions = v3, 
	BattlePassMissionsContext = (function(p7, p8)
		local v15 = v3.getDay();
		local v16 = v3.getWeek();
		local u3 = v3.getDay();
		local u4 = u1(p7, "daily", v15, v15, 2, v3.DAILY_MISSION_XP);
		local u5 = v3.getWeek();
		local u6 = u1(p8, "weekly", v16, v16 * 100, 3, v3.WEEKLY_MISSION_XP);
		return {
			getDailyMissions = function()
				local v17 = v3.getDay();
				if v17 ~= u3 then
					local v18 = v3.getDay();
					u4 = u1(p7, "daily", v18, v18, 2, v3.DAILY_MISSION_XP);
					u3 = v17;
				end;
				return u4;
			end, 
			getWeeklyMissions = function()
				local v19 = v3.getWeek();
				if v19 ~= u5 then
					local v20 = v3.getWeek();
					u6 = u1(p8, "weekly", v20, v20 * 100, 3, v3.WEEKLY_MISSION_XP);
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
					resource = l__ItemType__2.EMERALD
				} }
		}, {
			name = "Spend %s diamonds", 
			stages = { {
					type = "SpendResource", 
					progress = 30, 
					resource = l__ItemType__2.DIAMOND
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
		}, {
			name = "Repair %s Snow Cone Machines", 
			stages = { {
					type = "RepairSnowConeMachine", 
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
					resource = l__ItemType__2.EMERALD
				} }
		}, {
			name = "Spend %s diamonds", 
			stages = { {
					type = "SpendResource", 
					progress = 110, 
					resource = l__ItemType__2.DIAMOND
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
