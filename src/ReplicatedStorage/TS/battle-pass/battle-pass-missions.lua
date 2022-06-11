-- Script Hash: ef2f9d4fc8d50fd6be23510083c2295b727b98893cd545e7e06a06082a527e5dd076f832bfa39710fc84f0b039f8adce
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
local function v4()
	return math.ceil(math.max(DateTime.now().UnixTimestamp - u1.UnixTimestamp, 0) / 86400);
end;
v2.getDay = v4;
local u2 = v4;
function v2.getWeek()
	return math.ceil(u2() / 7);
end;
local function u3(p1, p2, p3, p4, p5, p6)
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
			id = "BATTLE_PASS_" .. tostring(v2.SEASON_ID) .. "_" .. string.upper(p2) .. "_" .. tostring(p3) .. "_MISSION_" .. tostring(v8)
		};
		for v13, v14 in pairs(v10) do
			v12[v13] = v14;
		end;
		v12.reward = p6;
		v7[v11] = true;
		table.insert(v5, v12);	
	end;
	return v5;
end;
u1 = function(p7)
	local v15 = v2.getDay();
	return u3(p7, "daily", v15, v15, 2, v2.DAILY_MISSION_XP);
end;
u2 = function(p8)
	local v16 = v2.getWeek();
	return u3(p8, "weekly", v16, v16 * 100, 3, v2.WEEKKLY_MISSION_XP);
end;
return {
	BattlePassMissions = v2, 
	BattlePassMissionsContext = (function(p9, p10)
		local u4 = v2.getDay();
		local u5 = u1(p9);
		local u6 = v2.getWeek();
		local u7 = u2(p10);
		return {
			getDailyMissions = function()
				local v17 = v2.getDay();
				if v17 ~= u4 then
					u5 = u1(p9);
					u4 = v17;
				end;
				return u5;
			end, 
			getWeeklyMissions = function()
				local v18 = v2.getWeek();
				if v18 ~= u6 then
					u7 = u2(p10);
					u6 = v18;
				end;
				return u7;
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
