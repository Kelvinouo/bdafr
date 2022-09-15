-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata");
local l__EventType__1 = v2.EventType;
local l__EventMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local l__CreateRoduxApp__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__EventApp__4 = v1.import(script, script.Parent, "event-app").EventApp;
local l__ClientStore__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__GameEventUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "game-event-utils").GameEventUtil;
local l__EventShopItem__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-shop", "event-shop-item").EventShopItem;
local l__EventCurrencyType__8 = v2.EventCurrencyType;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	local l__PIRATE_EVENT_2022__3 = l__EventType__1.PIRATE_EVENT_2022;
	local v4 = l__EventMeta__2[l__PIRATE_EVENT_2022__3];
	local v5 = l__CreateRoduxApp__3("EventApp", l__EventApp__4, {
		event = l__EventType__1.PIRATE_EVENT_2022
	}, {}, {
		Parent = p1
	});
	local v6 = {
		type = "SetEventDataAll"
	};
	local v7 = {};
	for v8, v9 in pairs(l__GameEventUtil__6.makeStarterEventData()) do
		v7[v8] = v9;
	end;
	v7.events = {
		[l__PIRATE_EVENT_2022__3] = {
			itemsPurchased = { {
					item = l__EventShopItem__7.PIRATE_TITLE_1, 
					time = os.time()
				} }, 
			missionsClaimed = {}
		}
	};
	v6.eventData = v7;
	l__ClientStore__5:dispatch(v6);
	l__ClientStore__5:dispatch({
		type = "SetEventPartial", 
		data = {
			activeMissions = {
				[l__PIRATE_EVENT_2022__3] = {
					daily = { {
							id = "daily_testmission_1", 
							metaId = "10", 
							name = "Kill 30 other players", 
							stages = { {
									type = "PlayerKill", 
									progress = 30
								} }, 
							rewardAmount = 3000, 
							reward = l__EventCurrencyType__8.DOUBLOONS
						}, {
							id = "daily_testmission_2", 
							metaId = "11", 
							name = "Win 20 Games", 
							stages = { {
									type = "GameWin", 
									progress = 20
								} }, 
							rewardAmount = 5000, 
							reward = l__EventCurrencyType__8.DOUBLOONS
						}, {
							id = "daily_testmission_3", 
							metaId = "12", 
							name = "Earn 21,600 points from time spent playing games", 
							stages = { {
									type = "GamePlayTime", 
									progress = 21600
								} }, 
							rewardAmount = 10000, 
							reward = l__EventCurrencyType__8.DOUBLOONS
						} }, 
					weekly = { {
							id = "weekly_testmission_1", 
							metaId = "13", 
							name = "Win 6 Games", 
							stages = { {
									type = "GameWin", 
									progress = 6
								} }, 
							rewardAmount = 3000, 
							reward = l__EventCurrencyType__8.DOUBLOONS
						}, {
							id = "weekly_testmission_2", 
							metaId = "14", 
							name = "Break 6 Beds", 
							stages = { {
									type = "BedBreak", 
									progress = 6
								} }, 
							rewardAmount = 3000, 
							reward = l__EventCurrencyType__8.DOUBLOONS
						}, {
							id = "weekly_testmission_3", 
							metaId = "15", 
							name = "Perform 15 finals kills", 
							stages = { {
									type = "FinalKill", 
									progress = 15
								} }, 
							rewardAmount = 5000, 
							reward = l__EventCurrencyType__8.DOUBLOONS
						} }
				}
			}
		}
	});
	return function()
		return u9.unmount(v5);
	end;
end;
