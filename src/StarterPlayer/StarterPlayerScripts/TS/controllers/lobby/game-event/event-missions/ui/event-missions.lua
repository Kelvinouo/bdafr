-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__DeviceUtil__1 = v2.DeviceUtil;
local u2 = nil;
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__EventMeta__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local u7 = v1.import(script, script.Parent, "event-missions-generator-section").EventMissionsGeneratorSection;
local l__Padding__8 = v2.Padding;
local l__AutoCanvasScrollingFrame__9 = v2.AutoCanvasScrollingFrame;
local l__Empty__10 = v2.Empty;
u2 = function(p1)
	return {
		progress = {
			daily_testmission_1 = {
				[p1.daily[1].stages[1].type] = p1.daily[1].stages[1].progress
			}, 
			daily_testmission_2 = {
				[p1.daily[2].stages[1].type] = 1
			}, 
			weekly_testmission_1 = {
				[p1.weekly[1].stages[1].type] = 5
			}, 
			weekly_testmission_2 = {
				[p1.weekly[2].stages[1].type] = 6
			}
		}, 
		stages = {
			daily_testmission_1 = 0, 
			daily_testmission_2 = 0, 
			weekly_testmission_1 = 0, 
			weekly_testmission_2 = 0
		}
	};
end;
return {
	EventMissions = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u6)(function(p2, p3)
		local v3, v4 = p3.useState(nil);
		p3.useEffect(function()
			if l__DeviceUtil__1.isHoarceKat() then
				v4(u2(p2.MissionsMap));
				return;
			end;
			l__KnitClient__3.Controllers.MissionsController:getMissionData():andThen(function(p4)
				v4(p4);
			end);
		end, {});
		local v5 = v3;
		if v5 then
			local v6 = u4.entries(p2.MissionsMap);
			local function v7(p5, p6)
				local v8 = p5[1];
				local v9 = {
					GeneratorId = v8, 
					Missions = p5[2], 
					PlayerMissionData = v3, 
					ClaimedMissions = p2.ClaimedMissions, 
					EventType = p2.EventType
				};
				local v10 = {};
				local v11 = nil;
				local v12, v13, v14 = ipairs(l__EventMeta__5[p2.EventType].missionGenerators);
				while true do
					v12(v13, v14);
					if not v12 then
						break;
					end;
					v14 = v12;
					if v13.id == v8 == true then
						v11 = v13;
						break;
					end;				
				end;
				local v15 = v11;
				if v15 ~= nil then
					v15 = v15.layoutOrder;
				end;
				local v16 = v15;
				if v16 == nil then
					v16 = p6;
				end;
				v10.LayoutOrder = v16;
				v9.FrameProps = v10;
				return u6.createElement(u7, v9);
			end;
			local v17 = table.create(#v6);
			local v18, v19, v20 = ipairs(v6);
			while true do
				v18(v19, v20);
				if not v18 then
					break;
				end;
				v20 = v18;
				v17[v18] = v7(v19, v18 - 1, v6);			
			end;
			local v21 = {
				ScrollingFrameProps = {
					Size = UDim2.fromScale(1, 1), 
					LayoutOrder = 2, 
					Selectable = false
				}
			};
			local v22 = { u6.createElement(l__Padding__8, {
					Padding = {
						Vertical = 2, 
						Horizontal = 2
					}
				}), u6.createElement("UIListLayout", {
					FillDirection = "Vertical", 
					Padding = UDim.new(0, 10), 
					SortOrder = "LayoutOrder"
				}) };
			local v23 = #v22;
			local v24, v25, v26 = ipairs(v17);
			while true do
				v24(v25, v26);
				if not v24 then
					break;
				end;
				v26 = v24;
				v22[v23 + v24] = v25;			
			end;
			v5 = u6.createFragment({
				MissionsList = u6.createElement(l__AutoCanvasScrollingFrame__9, v21, v22)
			});
		end;
		local v27 = {};
		if v5 then
			v27[#v27 + 1] = v5;
		end;
		return u6.createFragment({
			EventMissions = u6.createElement(l__Empty__10, {
				Size = UDim2.fromScale(1, 1)
			}, v27)
		});
	end)
};
