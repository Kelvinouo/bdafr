-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__DeviceUtil__2 = v2.DeviceUtil;
local l__ColorUtil__3 = v2.ColorUtil;
return {
	GameUpdateKitCardBottom = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = {};
		local v5 = {};
		local v6 = {};
		if l__DeviceUtil__2.isSmallScreen() then
			local v7 = 8;
		else
			v7 = 14;
		end;
		v6.PaddingTop = UDim.new(0, v7);
		if l__DeviceUtil__2.isSmallScreen() then
			local v8 = 8;
		else
			v8 = 14;
		end;
		v6.PaddingBottom = UDim.new(0, v8);
		v6.PaddingLeft = p1.PaddingHorizontal;
		v6.PaddingRight = p1.PaddingHorizontal;
		local v9 = {};
		local v10 = {};
		if l__DeviceUtil__2.isSmallScreen() then
			local v11 = 14;
		else
			v11 = 18;
		end;
		v10.MaxTextSize = v11;
		v9[1] = u1.createElement("UITextSizeConstraint", v10);
		local v12 = {};
		local v13 = {};
		if l__DeviceUtil__2.isSmallScreen() then
			local v14 = 14;
		else
			v14 = 18;
		end;
		v13.MaxTextSize = v14;
		v12[1] = u1.createElement("UITextSizeConstraint", v13);
		v5[1] = u1.createElement("UIPadding", v6);
		v5[2] = u1.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical, 
			VerticalAlignment = Enum.VerticalAlignment.Top, 
			HorizontalAlignment = Enum.HorizontalAlignment.Left, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 6)
		});
		v5[3] = u1.createElement("TextLabel", {
			Size = UDim2.new(0.9, 0, 0, 0), 
			AutomaticSize = "Y", 
			BackgroundTransparency = 1, 
			Font = Enum.Font.Roboto, 
			RichText = true, 
			TextScaled = true, 
			TextXAlignment = "Left", 
			TextColor3 = l__ColorUtil__3.WHITE, 
			Text = "<b>Description:</b>", 
			LayoutOrder = 1
		}, v9);
		v5[4] = u1.createElement("TextLabel", {
			Size = UDim2.new(0.9, 0, 0, 0), 
			AutomaticSize = "Y", 
			BackgroundTransparency = 1, 
			Font = Enum.Font.Roboto, 
			RichText = true, 
			TextScaled = true, 
			TextXAlignment = "Left", 
			TextColor3 = l__ColorUtil__3.WHITE, 
			TextTransparency = 0.2, 
			Text = p1.Description, 
			LayoutOrder = 2
		}, v12);
		v4.BottomHalf = u1.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 0), 
			AutomaticSize = "Y", 
			BackgroundTransparency = 1
		}, v5);
		return u1.createFragment(v4);
	end)
};
