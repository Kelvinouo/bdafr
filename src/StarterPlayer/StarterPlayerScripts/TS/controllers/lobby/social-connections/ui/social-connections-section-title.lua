
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ImageId__2 = v2.ImageId;
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ColorUtil__4 = v2.ColorUtil;
return {
	SocialConnectionsSectionTitle = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = {};
		local v5 = {};
		local v6 = {
			Size = UDim2.fromScale(1, 1), 
			ScaleType = "Fit", 
			SizeConstraint = "RelativeYY"
		};
		if p1.Completed then
			local v7 = l__ImageId__2.CHECK_CIRCLE_SOLID;
		else
			v7 = l__ImageId__2.CIRCLE_HOLLOW;
		end;
		v6.Image = v7;
		if p1.Completed then
			local v8 = l__Theme__3.backgroundSuccess;
		else
			v8 = l__ColorUtil__4.WHITE;
		end;
		v6.ImageColor3 = v8;
		if p1.Completed then
			local v9 = 0;
		else
			v9 = 0.4;
		end;
		v6.ImageTransparency = v9;
		v6.BackgroundTransparency = 1;
		v5[1] = u1.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal, 
			HorizontalAlignment = Enum.HorizontalAlignment.Left, 
			VerticalAlignment = Enum.VerticalAlignment.Center, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 10)
		});
		v5[2] = u1.createElement("ImageLabel", v6);
		v5[3] = u1.createElement("TextLabel", {
			Size = UDim2.new(1, 0, 0, 0), 
			AutomaticSize = Enum.AutomaticSize.Y, 
			Text = p1.Title, 
			TextColor3 = l__ColorUtil__4.WHITE, 
			TextXAlignment = Enum.TextXAlignment.Left, 
			RichText = true, 
			Font = Enum.Font.Roboto, 
			TextSize = 16, 
			BackgroundTransparency = 1
		});
		local v10 = {
			AnchorPoint = Vector2.new(1, 0.5), 
			Position = UDim2.fromScale(1, 0.5), 
			AutomaticSize = Enum.AutomaticSize.XY
		};
		if p1.Completed then
			local v11 = "";
		else
			v11 = "Incomplete";
		end;
		v10.Text = v11;
		v10.TextColor3 = l__Theme__3.textSecondary;
		v10.TextXAlignment = Enum.TextXAlignment.Right;
		v10.RichText = true;
		v10.Font = Enum.Font.Roboto;
		v10.TextSize = 12;
		v10.BackgroundTransparency = 1;
		v4[1] = u1.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0), 
			BackgroundTransparency = 1
		}, v5);
		v4[2] = u1.createElement("TextLabel", v10);
		return u1.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 24), 
			BackgroundTransparency = 1, 
			LayoutOrder = p1.LayoutOrder
		}, v4);
	end)
};

