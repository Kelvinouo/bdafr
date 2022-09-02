-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__ColorUtil__1 = v2.ColorUtil;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Padding__4 = v2.Padding;
local l__DeviceUtil__5 = v2.DeviceUtil;
return {
	QueueRegionButton = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = {};
		local v5 = {};
		local v6 = {};
		if l__DeviceUtil__5.isSmallScreen() then
			local v7 = 4;
		else
			v7 = 6;
		end;
		v6.Padding = UDim.new(0, v7);
		local v8 = {
			Color = l__Theme__3.textPrimary
		};
		if l__DeviceUtil__5.isSmallScreen() then
			local v9 = 1;
		else
			v9 = 2;
		end;
		v8.Thickness = v9;
		v5[1] = u2.createElement("UIAspectRatioConstraint", {
			AspectRatio = 4, 
			AspectType = "ScaleWithParentSize", 
			DominantAxis = "Height"
		});
		v5[2] = u2.createElement("UISizeConstraint", {
			MaxSize = Vector2.new(234, 45)
		});
		v5[3] = u2.createElement("UIGradient", {
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, l__Theme__3.buttonPrimary), ColorSequenceKeypoint.new(1, l__Theme__3.buttonPrimary) }), 
			Rotation = 45
		});
		v5[4] = u2.createElement(l__Padding__4, v6);
		v5[5] = u2.createElement("UICorner", {
			CornerRadius = UDim.new(0.5, 0)
		});
		v5[6] = u2.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			VerticalAlignment = "Center", 
			HorizontalAlignment = "Center", 
			Padding = UDim.new(0.05, 0), 
			SortOrder = "LayoutOrder"
		});
		v5[7] = u2.createElement("UIStroke", v8);
		local v10 = {
			Size = UDim2.fromScale(0, 1), 
			AutomaticSize = "X", 
			Text = "<b>REGION:</b>"
		};
		if l__DeviceUtil__5.isSmallScreen() then
			local v11 = false;
		else
			v11 = true;
		end;
		v10.TextScaled = v11;
		v10.RichText = true;
		v10.Font = "Roboto";
		v10.TextColor3 = l__Theme__3.textPrimary;
		v10.TextXAlignment = "Left";
		v10.TextYAlignment = "Center";
		v10.BackgroundTransparency = 1;
		v10.TextTransparency = 0.3;
		v10.LayoutOrder = 1;
		v5.Label = u2.createElement("TextLabel", v10, { u2.createElement("UITextSizeConstraint", {
				MaxTextSize = 20
			}) });
		local v12 = {};
		if l__DeviceUtil__5.isSmallScreen() then
			local v13 = 1;
		else
			v13 = 0.8;
		end;
		if l__DeviceUtil__5.isSmallScreen() then
			local v14 = 1;
		else
			v14 = 0.8;
		end;
		v12.Size = UDim2.fromScale(v13, v14);
		v12.Image = ({
			EU = "rbxassetid://10469521157", 
			SEA = "rbxassetid://10469521246", 
			NA = "rbxassetid://10469464193"
		})[p1.Region];
		v12.SizeConstraint = "RelativeYY";
		v12.ScaleType = "Fit";
		v12.ImageColor3 = l__ColorUtil__1.WHITE;
		v12.BackgroundTransparency = 1;
		v12.LayoutOrder = 2;
		v5.RegionIcon = u2.createElement("ImageLabel", v12, { u2.createElement("UICorner", {
				CornerRadius = UDim.new(1, 0)
			}) });
		local v15 = {
			Size = UDim2.fromScale(0, 1), 
			AutomaticSize = "X", 
			Text = "<b>" .. p1.Region .. "</b>"
		};
		if l__DeviceUtil__5.isSmallScreen() then
			local v16 = false;
		else
			v16 = true;
		end;
		v15.TextScaled = v16;
		v15.RichText = true;
		v15.Font = "Roboto";
		v15.TextColor3 = l__ColorUtil__1.WHITE;
		v15.TextXAlignment = "Left";
		v15.TextYAlignment = "Center";
		v15.BackgroundTransparency = 1;
		v15.LayoutOrder = 3;
		v5.Region = u2.createElement("TextLabel", v15, { u2.createElement("UITextSizeConstraint", {
				MaxTextSize = 20
			}) });
		v4.QueueRegionButton = u2.createElement("ImageButton", {
			AnchorPoint = Vector2.new(0, 1), 
			Position = UDim2.fromScale(0.01, 0.99), 
			Size = UDim2.fromScale(0.065, 0.05), 
			AutomaticSize = "X", 
			BackgroundColor3 = l__ColorUtil__1.WHITE, 
			BorderSizePixel = 0
		}, v5);
		return u2.createFragment({
			QueueRegionDisplay = u2.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, v4)
		});
	end)
};
