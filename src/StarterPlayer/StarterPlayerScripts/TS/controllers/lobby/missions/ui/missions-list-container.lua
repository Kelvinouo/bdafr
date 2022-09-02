-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-missions");
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__DeviceUtil__2 = v2.DeviceUtil;
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u5 = v3.BattlePassMissionsContext;
local l__BattlePassMissions__6 = v3.BattlePassMissions;
local l__AutoCanvasScrollingFrame__7 = v2.AutoCanvasScrollingFrame;
local l__MissionsList__8 = v1.import(script, script.Parent, "mission", "missions-list").MissionsList;
local l__DividerComponent__9 = v2.DividerComponent;
return {
	MissionsListContainer = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local v4, v5 = p2.useState(nil);
		local v6 = u1.createRef();
		p2.useEffect(function()
			if not l__DeviceUtil__2.isHoarceKat() then
				l__KnitClient__3.Controllers.MissionsController:getMissionData():andThen(function(p3)
					v5(p3);
				end);
			end;
		end, {});
		local function v7(p4)
			local l__id__8 = p4.id;
			local v9 = v4;
			if v9 ~= nil then
				v9 = v9.stages[l__id__8];
			end;
			local v10 = v9;
			if v10 == nil then
				v10 = 0;
			end;
			local v11 = #p4.stages <= v10;
			if not v11 then
				local v12 = p4.stages[v10 + 1];
			else
				v12 = p4.stages[#p4.stages - 1 + 1];
			end;
			local v13 = v4;
			if v13 ~= nil then
				v13 = v13.progress[l__id__8];
				if v13 ~= nil then
					v13 = v13[v12.type];
				end;
			end;
			local v14 = v13;
			if v14 == nil then
				v14 = 0;
			end;
			local v15 = {
				description = string.format(p4.name, "<font color=\"" .. l__Theme__4.textPrimaryRichText .. "\">" .. tostring(v12.progress) .. "</font>")
			};
			if v11 then
				local v16 = v12.progress;
			else
				v16 = v14;
			end;
			v15.currProgress = v16;
			v15.goalProgress = v12.progress;
			v15.rewardAmount = p4.rewardAmount;
			return v15;
		end;
		local v17 = u5.getDailyMissions();
		local v18 = table.create(#v17);
		local v19, v20, v21 = ipairs(v17);
		while true do
			v19(v20, v21);
			if not v19 then
				break;
			end;
			v21 = v19;
			v18[v19] = v7(v20, v19 - 1, v17);		
		end;
		local v22 = u5.getWeeklyMissions();
		local v23 = table.create(#v22);
		local v24, v25, v26 = ipairs(v22);
		while true do
			v24(v25, v26);
			if not v24 then
				break;
			end;
			v26 = v24;
			v23[v24] = v7(v25, v24 - 1, v22);		
		end;
		return u1.createFragment({
			MissionsList = u1.createElement(l__AutoCanvasScrollingFrame__7, {
				ScrollingFrameProps = {
					Size = p1.Size, 
					LayoutOrder = 1
				}
			}, { u1.createElement("UISizeConstraint", {
					MinSize = Vector2.new(0, p1.MinSizeY), 
					MaxSize = Vector2.new(math.huge, p1.MaxSizeY)
				}), u1.createElement("UIPadding", {
					PaddingRight = UDim.new(0.04, 0)
				}), u1.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical, 
					HorizontalAlignment = Enum.HorizontalAlignment.Left, 
					VerticalAlignment = Enum.VerticalAlignment.Top, 
					Padding = UDim.new(0, 10), 
					SortOrder = Enum.SortOrder.LayoutOrder
				}), u1.createElement(l__MissionsList__8, {
					Missions = v18, 
					Title = "Daily Missions", 
					EndTime = l__BattlePassMissions__6.SEASON_START_DATE.UnixTimestamp + l__BattlePassMissions__6.getDay() * 86400, 
					LayoutOrder = 1
				}), u1.createElement(l__DividerComponent__9, {
					LengthScale = 1, 
					BarPosition = {
						AnchorPoint = Vector2.new(0, 0), 
						Position = UDim2.new(0, 0, 0, 0)
					}, 
					LayoutOrder = 2
				}), u1.createElement(l__MissionsList__8, {
					Missions = v23, 
					Title = "Weekly Missions", 
					EndTime = l__BattlePassMissions__6.SEASON_START_DATE.UnixTimestamp + l__BattlePassMissions__6.getWeek() * 604800, 
					LayoutOrder = 3
				}) })
		});
	end)
};
