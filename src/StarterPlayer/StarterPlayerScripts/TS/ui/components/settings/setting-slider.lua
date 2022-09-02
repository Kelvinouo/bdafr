-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__Theme__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__StringUtil__3 = v2.StringUtil;
local l__ColorUtil__4 = v2.ColorUtil;
local l__SliderComponent__5 = v2.SliderComponent;
return {
	SettingSlider = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local v3, v4 = p2.useState(p1.Value);
		local v5 = {
			Size = UDim2.fromScale(1, 1), 
			BackgroundColor3 = l__Theme__1.backgroundTertiary, 
			BorderSizePixel = 0
		};
		local l__FrameProps__6 = p1.FrameProps;
		if l__FrameProps__6 then
			for v7, v8 in pairs(l__FrameProps__6) do
				v5[v7] = v8;
			end;
		end;
		local v9 = { u2.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				VerticalAlignment = "Center", 
				HorizontalAlignment = "Center", 
				Padding = UDim.new(0.05, 0)
			}) };
		local v10 = #v9;
		local v11 = {
			Size = UDim2.fromScale(0.2, 1)
		};
		local v12 = string.split(tostring(p1.StepSize), ".")[2];
		if v12 ~= nil then
			v12 = #v12;
		end;
		local v13 = v12;
		if v13 == nil then
			v13 = 0;
		end;
		v11.Text = "<b>" .. l__StringUtil__3.roundNumber(v3, v13) .. "</b>";
		v11.BackgroundTransparency = 1;
		v11.TextColor3 = l__ColorUtil__4.WHITE;
		v11.Font = "Roboto";
		v11.TextXAlignment = "Left";
		v11.TextScaled = true;
		v11.RichText = true;
		v9[v10 + 1] = u2.createElement("TextLabel", v11, { u2.createElement("UITextSizeConstraint", {
				MaxTextSize = 18
			}) });
		local v14 = {
			Size = UDim2.fromScale(0.5, 0.3)
		};
		function v14.OnChange(p3)
			v4(p3);
		end;
		function v14.OnInputEnd(p4)
			p1.SetValue(p4);
		end;
		v14.InitialValue = p1.Value;
		v14.ThemeColor = p1.ThemeColor or l__Theme__1.textPrimary;
		v14.BarColor = l__Theme__1.backgroundSecondary;
		v14.StepSize = p1.StepSize;
		v14.Max = p1.Max;
		v14.Min = p1.Min;
		v9[v10 + 2] = u2.createElement(l__SliderComponent__5, v14);
		return u2.createElement("Frame", v5, v9);
	end)
};
