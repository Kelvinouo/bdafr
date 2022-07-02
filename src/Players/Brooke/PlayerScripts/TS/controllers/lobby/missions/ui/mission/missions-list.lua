-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local l__MissionsListTimer__3 = v1.import(script, script.Parent, "missions-list-timer").MissionsListTimer;
local l__Mission__4 = v1.import(script, script.Parent, "mission").Mission;
return {
	MissionsList = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local v2 = {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = Enum.AutomaticSize.Y, 
			BackgroundTransparency = 1, 
			LayoutOrder = p1.LayoutOrder
		};
		local v3 = { u1.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				Padding = UDim.new(0, 10)
			}) };
		local v4 = #v3;
		local v5 = {};
		local v6 = false;
		if p1.Title ~= nil then
			v6 = u1.createElement("TextLabel", {
				AnchorPoint = Vector2.new(0, 1), 
				Position = UDim2.fromScale(0, 1), 
				Size = UDim2.fromScale(0, 1), 
				AutomaticSize = Enum.AutomaticSize.X, 
				BackgroundTransparency = 1, 
				Text = "<b>" .. p1.Title .. "</b>", 
				TextXAlignment = Enum.TextXAlignment.Left, 
				TextColor3 = l__ColorUtil__2.WHITE, 
				RichText = true, 
				Font = Enum.Font.Roboto, 
				TextSize = 20
			});
		end;
		if v6 then
			v5[#v5 + 1] = v6;
		end;
		v5[#v5 + 1] = u1.createElement(l__MissionsListTimer__3, {
			EndTime = p1.EndTime, 
			AnchorPoint = Vector2.new(1, 1), 
			Position = UDim2.fromScale(1, 1)
		});
		v3[v4 + 1] = u1.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 18), 
			BackgroundTransparency = 1
		}, v5);
		local l__Missions__7 = p1.Missions;
		local v8 = table.create(#l__Missions__7);
		for v9, v10 in ipairs(l__Missions__7) do
			v8[v9] = u1.createElement(l__Mission__4, {
				Mission = v10
			});
		end;
		local v11 = {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = Enum.AutomaticSize.Y, 
			BackgroundTransparency = 1
		};
		local v12 = { u1.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				Padding = UDim.new(0, 8)
			}) };
		local v13 = #v12;
		for v14, v15 in ipairs(v8) do
			v12[v13 + v14] = v15;
		end;
		v3[v4 + 2] = u1.createElement("Frame", v11, v12);
		return u1.createFragment({
			PassMissionLists = u1.createElement("Frame", v2, v3)
		});
	end)
};
