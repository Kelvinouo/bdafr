-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__TweenService__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__ColorUtil__3 = v2.ColorUtil;
local l__Empty__4 = v2.Empty;
local l__Padding__5 = v2.Padding;
local l__Theme__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
return {
	EventAppNavlink = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local v3, v4 = p2.useState(false);
		local u7 = u1.createRef();
		local u8 = string.lower(p1.ActivePage) == string.lower(p1.Page);
		p2.useEffect(function()
			local v5 = u7:getValue();
			if not v5 then
				return nil;
			end;
			if u8 then
				return nil;
			end;
			if v3 then
				l__TweenService__2:Create(v5, TweenInfo.new(0.25), {
					BackgroundTransparency = 0.75
				}):Play();
				return;
			end;
			local v6 = {};
			if u8 then
				local v7 = 0.6;
			else
				v7 = 1;
			end;
			v6.BackgroundTransparency = v7;
			l__TweenService__2:Create(v5, TweenInfo.new(0.25), v6):Play();
		end, { v3 });
		local v8 = {
			Size = UDim2.new(0, 70, 1, -1), 
			Selectable = true, 
			AutoButtonColor = false, 
			BackgroundColor3 = l__ColorUtil__3.BLACK
		};
		if u8 then
			local v9 = 0.6;
		else
			v9 = 1;
		end;
		v8.BackgroundTransparency = v9;
		v8.BorderSizePixel = 0;
		v8[u1.Event.Activated] = function()
			p1.OnClick();
		end;
		v8[u1.Event.MouseEnter] = function()
			v4(true);
		end;
		v8[u1.Event.MouseLeave] = function()
			v4(false);
		end;
		v8[u1.Ref] = u7;
		local v10 = {};
		local v11 = {};
		local v12 = {
			Size = UDim2.fromScale(1, 0.4), 
			Image = p1.Icon, 
			ScaleType = "Fit", 
			SizeConstraint = "RelativeYY", 
			ImageColor3 = l__Theme__6.textPrimary
		};
		if u8 then
			local v13 = 0;
		else
			v13 = 0.3;
		end;
		v12.ImageTransparency = v13;
		v12.BackgroundTransparency = 1;
		local v14 = {
			Size = UDim2.fromScale(0.9, 0.5), 
			Text = "<b>" .. p1.Text .. "</b>", 
			TextColor3 = l__Theme__6.textPrimary, 
			TextScaled = true, 
			RichText = true, 
			Font = "Roboto"
		};
		if u8 then
			local v15 = 0;
		else
			v15 = 0.3;
		end;
		v14.TextTransparency = v15;
		v14.TextXAlignment = "Center";
		v14.BackgroundTransparency = 1;
		v11[1] = u1.createElement(l__Padding__5, {
			Padding = {
				Top = 8, 
				Bottom = 6, 
				Left = 4, 
				Right = 4
			}
		});
		v11[2] = u1.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			VerticalAlignment = "Center", 
			HorizontalAlignment = "Center", 
			Padding = UDim.new(0, 0.1)
		});
		v11[3] = u1.createElement("ImageLabel", v12);
		v11[4] = u1.createElement("TextLabel", v14, { u1.createElement("UITextSizeConstraint", {
				MaxTextSize = 18
			}) });
		v10.ButtonContent = u1.createElement(l__Empty__4, {
			Size = UDim2.fromScale(1, 1)
		}, v11);
		local v16 = {
			Size = UDim2.new(1, 0, 0, 2), 
			Position = UDim2.fromScale(0, 1), 
			AnchorPoint = Vector2.new(0, 1), 
			BorderSizePixel = 0, 
			BackgroundColor3 = l__Theme__6.textPrimary
		};
		if u8 then
			local v17 = 0;
		else
			v17 = 1;
		end;
		v16.Transparency = v17;
		v10.BottomBorder = u1.createElement("Frame", v16);
		return u1.createElement("ImageButton", v8, v10);
	end)
};
