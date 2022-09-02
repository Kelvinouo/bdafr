-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__DeviceUtil__1 = v2.DeviceUtil;
local l__GameEventUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "game-event-utils").GameEventUtil;
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__EventMissionsCard__5 = v1.import(script, script.Parent, "event-missions-card").EventMissionsCard;
local l__Padding__6 = v2.Padding;
local l__AutoCanvasScrollingFrame__7 = v2.AutoCanvasScrollingFrame;
local l__Empty__8 = v2.Empty;
return {
	EventMissions = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u4)(function(p1, p2)
		local v3, v4 = p2.useState(nil);
		p2.useEffect(function()
			if not l__DeviceUtil__1.isHoarceKat() then
				l__KnitClient__3.Controllers.MissionsController:getMissionData():andThen(function(p3)
					v4(p3);
				end);
				return;
			end;
			v4({
				progress = {
					[l__GameEventUtil__2.getMissionId(p1.Missions[1].name, p1.EventType)] = {
						[p1.Missions[1].stages[1].type] = p1.Missions[1].stages[1].progress
					}, 
					[l__GameEventUtil__2.getMissionId(p1.Missions[2].name, p1.EventType)] = {
						[p1.Missions[2].stages[1].type] = 1
					}, 
					[l__GameEventUtil__2.getMissionId(p1.Missions[3].name, p1.EventType)] = {
						[p1.Missions[3].stages[1].type] = 3
					}, 
					[l__GameEventUtil__2.getMissionId(p1.Missions[5].name, p1.EventType)] = {
						[p1.Missions[5].stages[1].type] = p1.Missions[5].stages[1].progress
					}
				}, 
				stages = {
					[l__GameEventUtil__2.getMissionId(p1.Missions[1].name, p1.EventType)] = 0, 
					[l__GameEventUtil__2.getMissionId(p1.Missions[2].name, p1.EventType)] = 0, 
					[l__GameEventUtil__2.getMissionId(p1.Missions[3].name, p1.EventType)] = 0, 
					[l__GameEventUtil__2.getMissionId(p1.Missions[5].name, p1.EventType)] = 0
				}
			});
		end, {});
		local v5 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v6 = {};
		local l__Missions__7 = p1.Missions;
		table.sort(l__Missions__7, function(p4, p5)
			return p5.name < p4.name;
		end);
		table.sort(l__Missions__7, function(p6, p7)
			return p6.rewardAmount < p7.rewardAmount;
		end);
		local function v8(p8, p9)
			local v9 = l__GameEventUtil__2.getMissionId(p8.name, p1.EventType);
			if v9 == "" or not v9 then
				return nil;
			end;
			local v10 = v3;
			if v10 ~= nil then
				v10 = v10.stages[v9];
			end;
			local v11 = v10;
			if v11 == nil then
				v11 = 0;
			end;
			local v12 = #p8.stages <= v11;
			if not v12 then
				local v13 = p8.stages[v11 + 1];
			else
				v13 = p8.stages[#p8.stages - 1 + 1];
			end;
			local v14 = v3;
			if v14 ~= nil then
				v14 = v14.progress[v9];
				if v14 ~= nil then
					v14 = v14[v13.type];
				end;
			end;
			local v15 = v14;
			if v15 == nil then
				v15 = 0;
			end;
			local v16 = {
				Mission = p8, 
				MissionId = v9, 
				EventType = p1.EventType, 
				StageId = v11, 
				Stage = v13
			};
			if v12 then
				local v17 = v13.progress;
			else
				v17 = v15;
			end;
			v16.Progress = v17;
			local v18 = nil;
			local v19, v20, v21 = ipairs(p1.MissionsClaimed);
			while true do
				v19(v20, v21);
				if not v19 then
					break;
				end;
				v21 = v19;
				if v20.missionId == v9 == true then
					v18 = v20;
					break;
				end;			
			end;
			v16.Claimed = v18 ~= nil;
			v16.LayoutOrder = p9;
			return u4.createElement(l__EventMissionsCard__5, v16);
		end;
		local v22 = {};
		local v23 = 0;
		local v24, v25, v26 = ipairs(l__Missions__7);
		while true do
			v24(v25, v26);
			if not v24 then
				break;
			end;
			v26 = v24;
			local v27 = v8(v25, v24 - 1, l__Missions__7);
			if v27 ~= nil then
				v23 = v23 + 1;
				v22[v23] = v27;
			end;		
		end;
		local v28 = {
			ScrollingFrameProps = {
				Size = UDim2.fromScale(1, 1), 
				LayoutOrder = 2, 
				Selectable = false
			}
		};
		local v29 = { u4.createElement(l__Padding__6, {
				Padding = {
					Vertical = 2, 
					Horizontal = 2
				}
			}), u4.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0, 6), 
				SortOrder = "LayoutOrder"
			}) };
		local v30 = #v29;
		local v31, v32, v33 = ipairs(v22);
		while true do
			v31(v32, v33);
			if not v31 then
				break;
			end;
			v33 = v31;
			v29[v30 + v31] = v32;		
		end;
		v6.MissionsList = u4.createElement(l__AutoCanvasScrollingFrame__7, v28, v29);
		return u4.createFragment({
			EventMissions = u4.createElement(l__Empty__8, v5, v6)
		});
	end)
};
