-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__Theme__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ImageId__3 = v2.ImageId;
local l__ColorUtil__4 = v2.ColorUtil;
local l__MissionDescriptionRow__5 = v1.import(script, script.Parent, "mission-description-row").MissionDescriptionRow;
local l__MissionProgressRow__6 = v1.import(script, script.Parent, "mission-progress-row").MissionProgressRow;
return {
	Mission = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = Enum.AutomaticSize.Y, 
			BackgroundColor3 = l__Theme__1.backgroundTertiary, 
			BorderSizePixel = 0, 
			BackgroundTransparency = 0
		};
		local v5 = {};
		local v6 = false;
		if p1.Mission.currProgress == p1.Mission.goalProgress then
			v6 = u2.createElement("ImageLabel", {
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromScale(1, 0.1), 
				Size = UDim2.fromOffset(24, 24), 
				BackgroundTransparency = 1, 
				Image = l__ImageId__3.CHECK_CIRCLE_SOLID, 
				ImageColor3 = l__ColorUtil__4.hexColor(65305)
			});
		end;
		if v6 then
			v5[#v5 + 1] = v6;
		end;
		local v7 = #v5;
		v5[v7 + 1] = u2.createElement("UICorner", {
			CornerRadius = UDim.new(0, 5)
		});
		v5[v7 + 2] = u2.createElement("Frame", {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = Enum.AutomaticSize.Y, 
			BorderSizePixel = 0, 
			BackgroundTransparency = 1
		}, { u2.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 10), 
				PaddingBottom = UDim.new(0, 10), 
				PaddingLeft = UDim.new(0, 18), 
				PaddingRight = UDim.new(0, 26)
			}), u2.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				Padding = UDim.new(0, 10), 
				SortOrder = Enum.SortOrder.LayoutOrder
			}), u2.createElement(l__MissionDescriptionRow__5, {
				Mission = p1.Mission
			}), u2.createElement(l__MissionProgressRow__6, {
				Mission = p1.Mission
			}) });
		return u2.createFragment({
			TaskContainer = u2.createElement("Frame", v4, v5)
		});
	end)
};
