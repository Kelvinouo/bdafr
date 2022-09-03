-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__EventMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__3 = v2.ColorUtil;
local l__ResetTime__4 = v2.ResetTime;
local l__CountdownComponent__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "clan", "ui", "profile", "shop-tab", "countdown-component").CountdownComponent;
local l__Empty__6 = v2.Empty;
local l__EventMissionsCard__7 = v1.import(script, script.Parent, "event-missions-card").EventMissionsCard;
return {
	EventMissionsGeneratorSection = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = l__EventMeta__1[p1.EventType];
		local v5 = nil;
		local v6, v7, v8 = ipairs(v4.missionGenerators);
		while true do
			v6(v7, v8);
			if not v6 then
				break;
			end;
			v8 = v6;
			if v7.id == p1.GeneratorId == true then
				v5 = v7;
				break;
			end;		
		end;
		local v9 = v5;
		if v9 ~= nil then
			v9 = v9.resetTime;
		end;
		local v10 = {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = "X"
		};
		local l__FrameProps__11 = p1.FrameProps;
		if l__FrameProps__11 then
			for v12, v13 in pairs(l__FrameProps__11) do
				v10[v12] = v13;
			end;
		end;
		local v14 = { u2.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0, 6), 
				SortOrder = "LayoutOrder"
			}) };
		local v15 = {};
		local v16 = {
			Size = UDim2.fromScale(0.6, 1)
		};
		local v17 = v5;
		if v17 ~= nil then
			v17 = v17.name;
		end;
		v16.Text = "<b>" .. tostring(v17) .. " Missions</b>";
		v16.TextColor3 = l__ColorUtil__3.WHITE;
		v16.Font = "Roboto";
		v16.TextScaled = true;
		v16.RichText = true;
		v16.BackgroundTransparency = 1;
		v16.TextXAlignment = "Left";
		v15.MissionSectionName = u2.createElement("TextLabel", v16);
		local v18 = v9;
		if v18 then
			local v19 = {};
			local v20 = v9.firstResetTime;
			if v20 == nil then
				v20 = v4.startDate;
			end;
			v19.EndTime = l__ResetTime__4.new(v20):getNextResetTime(v9.intervalSeconds);
			v19.PreText = "Missions reset in: ";
			v19.AutomaticSize = "None";
			v19.SizeConstraint = "RelativeXY";
			v19.Size = UDim2.fromScale(0.4, 1);
			v19.AnchorPoint = Vector2.new(1, 0);
			v19.Position = UDim2.fromScale(1, 0);
			v19.TextXAlignment = "Right";
			v18 = u2.createElement(l__CountdownComponent__5, v19);
		end;
		if v18 then
			v15[#v15 + 1] = v18;
		end;
		v14[#v14 + 1] = u2.createElement(l__Empty__6, {
			Size = UDim2.new(0.98, 0, 0, 20), 
			LayoutOrder = 1
		}, v15);
		local l__Missions__21 = p1.Missions;
		table.sort(l__Missions__21, function(p3, p4)
			return p4.name < p3.name;
		end);
		table.sort(l__Missions__21, function(p5, p6)
			return p5.rewardAmount < p6.rewardAmount;
		end);
		local function v22(p7, p8)
			local v23 = p1.PlayerMissionData;
			if v23 ~= nil then
				v23 = v23.stages[p7.id];
			end;
			local v24 = v23;
			if v24 == nil then
				v24 = 0;
			end;
			local v25 = #p7.stages <= v24;
			if not v25 then
				local v26 = p7.stages[v24 + 1];
			else
				v26 = p7.stages[#p7.stages - 1 + 1];
			end;
			local v27 = p1.PlayerMissionData;
			if v27 ~= nil then
				v27 = v27.progress[p7.id];
				if v27 ~= nil then
					v27 = v27[v26.type];
				end;
			end;
			local v28 = v27;
			if v28 == nil then
				v28 = 0;
			end;
			local v29 = {
				Mission = p7, 
				EventType = p1.EventType, 
				StageId = v24, 
				Stage = v26
			};
			if v25 then
				local v30 = v26.progress;
			else
				v30 = v28;
			end;
			v29.Progress = v30;
			local v31 = nil;
			local v32, v33, v34 = ipairs(p1.ClaimedMissions);
			while true do
				v32(v33, v34);
				if not v32 then
					break;
				end;
				v34 = v32;
				if v33.missionId == p7.id == true then
					v31 = v33;
					break;
				end;			
			end;
			v29.Claimed = v31 ~= nil;
			v29.LayoutOrder = p8;
			return u2.createElement(l__EventMissionsCard__7, v29);
		end;
		local v35 = {};
		local v36 = 0;
		local v37, v38, v39 = ipairs(l__Missions__21);
		while true do
			v37(v38, v39);
			if not v37 then
				break;
			end;
			v39 = v37;
			local v40 = v22(v38, v37 - 1, l__Missions__21);
			if v40 ~= nil then
				v36 = v36 + 1;
				v35[v36] = v40;
			end;		
		end;
		local v41 = {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = "X", 
			LayoutOrder = 2
		};
		local v42 = { u2.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0, 4), 
				SortOrder = "LayoutOrder"
			}) };
		local v43 = #v42;
		local v44, v45, v46 = ipairs(v35);
		while true do
			v44(v45, v46);
			if not v44 then
				break;
			end;
			v46 = v44;
			v42[v43 + v44] = v45;		
		end;
		v14.MissionsList = u2.createElement(l__Empty__6, v41, v42);
		return u2.createElement(l__Empty__6, v10, v14);
	end)
};
