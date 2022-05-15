
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__UserInputService__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).UserInputService;
local l__UIUtil__3 = v2.UIUtil;
local l__ColorUtil__4 = v2.ColorUtil;
local l__DeviceUtil__5 = v2.DeviceUtil;
return {
	QueueSelectionQueueButton = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local u6 = u1.createRef();
		p2.useEffect(function()
			if l__UserInputService__2.GamepadEnabled then
				l__UIUtil__3:selectGui(u6:getValue());
			end;
		end, {});
		local v4 = {
			[u1.Ref] = u6, 
			Size = UDim2.new(0.9, 0, 0, 50), 
			BackgroundColor3 = l__ColorUtil__4.WHITE, 
			BorderSizePixel = 0, 
			Selectable = true
		};
		v4[u1.Event.Activated] = function()
			p1.OnClick(p1.QueueButtonData.queueType);
		end;
		local v5 = {};
		local v6 = {};
		local v7 = {};
		if l__DeviceUtil__5.isSmallScreen() then
			local v8 = 12;
		else
			v8 = 14;
		end;
		v7.MaxTextSize = v8;
		v6[1] = u1.createElement("UITextSizeConstraint", v7);
		local v9 = {};
		local v10 = {};
		if l__DeviceUtil__5.isSmallScreen() then
			local v11 = 8;
		else
			v11 = 10;
		end;
		v10.MaxTextSize = v11;
		v9[1] = u1.createElement("UITextSizeConstraint", v10);
		v5[1] = u1.createElement("UIGradient", {
			Color = ColorSequence.new(Color3.fromRGB(107, 112, 185), l__ColorUtil__4.darken(Color3.fromRGB(107, 112, 185), 0.8)), 
			Rotation = 90
		});
		v5[2] = u1.createElement("UICorner", {
			CornerRadius = UDim.new(0, 6)
		});
		v5[3] = u1.createElement("TextLabel", {
			Size = UDim2.fromScale(1, 0), 
			SizeConstraint = "RelativeXX", 
			AutomaticSize = "Y", 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.4), 
			TextColor3 = l__ColorUtil__4.WHITE, 
			TextScaled = true, 
			BackgroundTransparency = 1, 
			RichText = true, 
			Text = p1.QueueButtonData.title
		}, v6);
		v5[4] = u1.createElement("TextLabel", {
			Size = UDim2.fromScale(1, 0), 
			SizeConstraint = "RelativeXX", 
			AutomaticSize = "Y", 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.7), 
			TextColor3 = Color3.fromRGB(206, 206, 206), 
			BackgroundTransparency = 1, 
			TextScaled = true, 
			RichText = true, 
			Text = "[Click to play]"
		}, v9);
		return u1.createElement("ImageButton", v4, v5);
	end)
};

