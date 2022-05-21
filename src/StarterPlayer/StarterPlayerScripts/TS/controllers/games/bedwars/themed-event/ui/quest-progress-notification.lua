-- Script Hash: 5acdf9f6950be4afe2820d5e39bfccdb8f94aa26853405cfe455b41c1f66cda1b2a71585df1aebd369995d420e9b0413
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__TweenService__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__Empty__3 = v2.Empty;
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ColorUtil__5 = v2.ColorUtil;
local l__DeviceUtil__6 = v2.DeviceUtil;
return {
	QuestProgressNotification = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local u7 = u1.createRef();
		p2.useEffect(function()
			local v4 = u7:getValue();
			if not v4 then
				return nil;
			end;
			(function()
				return l__TweenService__2:Create(v4, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {
					TextTransparency = 0, 
					Position = UDim2.fromScale(0.5, 0.3), 
					BackgroundTransparency = 0.4
				});
			end)():Play();
			local function u8()
				return l__TweenService__2:Create(v4, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {
					TextTransparency = 1, 
					BackgroundTransparency = 1
				});
			end;
			task.spawn(function()
				task.delay(2, function()
					local v5 = u8();
					if v5 ~= nil then
						v5:Play();
					end;
					if v5 ~= nil then
						local v6 = v5.Completed:Wait();
					end;
					local l__Parent__7 = v4.Parent;
					if l__Parent__7 ~= nil then
						l__Parent__7:Destroy();
					end;
				end);
			end);
		end, {});
		local v8 = {};
		local v9 = {
			Size = UDim2.fromScale(0, 0.8), 
			AutomaticSize = "X", 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 1), 
			TextScaled = true, 
			RichText = true
		};
		if p1.GoalAmount <= p1.CurrentAmount then
			local v10 = l__Theme__4.backgroundSuccess;
		else
			v10 = l__Theme__4.mcGold;
		end;
		v9.TextColor3 = v10;
		v9.Font = "Roboto";
		v9.Text = "<b>You've found <font color=\"#FFFFFF\"><b>(" .. tostring(p1.CurrentAmount) .. " / " .. tostring(p1.GoalAmount) .. ")</b></font> " .. p1.ItemName .. "s</b>";
		v9.TextTransparency = 1;
		v9.BackgroundTransparency = 0.6;
		v9.BackgroundColor3 = l__ColorUtil__5.BLACK;
		v9.BorderSizePixel = 0;
		v9.TextYAlignment = "Center";
		v9[u1.Ref] = u7;
		local v11 = {};
		local v12 = {};
		if l__DeviceUtil__6.isSmallScreen() then
			local v13 = 5;
		else
			v13 = 10;
		end;
		v12.PaddingTop = UDim.new(0, v13);
		if l__DeviceUtil__6.isSmallScreen() then
			local v14 = 5;
		else
			v14 = 10;
		end;
		v12.PaddingBottom = UDim.new(0, v14);
		if l__DeviceUtil__6.isSmallScreen() then
			local v15 = 10;
		else
			v15 = 20;
		end;
		v12.PaddingLeft = UDim.new(0, v15);
		if l__DeviceUtil__6.isSmallScreen() then
			local v16 = 10;
		else
			v16 = 20;
		end;
		v12.PaddingRight = UDim.new(0, v16);
		v11[1] = u1.createElement("UIPadding", v12);
		v11[2] = u1.createElement("UICorner", {
			CornerRadius = UDim.new(1, 0)
		});
		v11[3] = u1.createElement("UITextSizeConstraint", {
			MaxTextSize = 30
		});
		v8[1] = u1.createElement("TextLabel", v9, v11);
		return u1.createElement(l__Empty__3, {
			Size = UDim2.fromScale(1, 0.15)
		}, v8);
	end)
};
