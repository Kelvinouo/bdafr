-- Script Hash: 2514bd7e82a1f5d80e80046a026779a2fddc27cbd7dccb2221cbd8d2888420a66b92cbe959681b278572980fd85d550b
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__ColorUtil__3 = v2.ColorUtil;
local u1 = l__ColorUtil__3.hexColor(16773227);
local l__TweenService__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__DeviceUtil__3 = v2.DeviceUtil;
local l__KnitClient__4 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__6 = v2.Empty;
return {
	TextAnnouncement = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u5)(function(p1, p2)
		local v4 = p1.Announcement.themeColor or u1;
		local u7 = nil;
		local u8 = nil;
		local u9 = nil;
		local u10 = nil;
		p2.useEffect(function()
			local v5 = u7:getValue();
			local v6 = u8:getValue();
			local l__backgroundImage__7 = p1.Announcement.backgroundImage;
			if l__backgroundImage__7 ~= "" and l__backgroundImage__7 then
				local v8 = u9:getValue();
			else
				v8 = u10:getValue();
			end;
			if not v5 or not v8 or not v6 then
				return nil;
			end;
			local v9 = l__TweenService__2:Create(v8, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
				Size = UDim2.fromScale(0.5, 1)
			});
			local l__backgroundImage__10 = p1.Announcement.backgroundImage;
			if l__backgroundImage__10 ~= "" and l__backgroundImage__10 then
				local v11 = {
					ImageTransparency = 0
				};
			else
				v11 = {
					BackgroundTransparency = 0
				};
			end;
			local l__backgroundImage__12 = p1.Announcement.backgroundImage;
			if l__backgroundImage__12 ~= "" and l__backgroundImage__12 then
				local v13 = {
					ImageTransparency = 1
				};
			else
				v13 = {
					BackgroundTransparency = 1
				};
			end;
			local v14 = l__TweenService__2:Create(v8, TweenInfo.new(0.3), v11):Play();
			v9:Play();
			v9.Completed:Connect(function()
				local v15 = l__TweenService__2:Create(v5, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
					TextTransparency = 0
				}):Play();
				local v16 = l__TweenService__2:Create(v6, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
					Transparency = 0
				}):Play();
			end);
			local v17 = p1.Announcement.duration;
			if v17 == nil then
				v17 = 5;
			end;
			local u11 = l__TweenService__2:Create(v5, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
				TextTransparency = 1
			});
			local u12 = l__TweenService__2:Create(v6, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
				Transparency = 1
			});
			local u13 = l__TweenService__2:Create(v8, TweenInfo.new(0.3), v13);
			local u14 = l__TweenService__2:Create(v8, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
				Size = UDim2.fromScale(0, 1)
			});
			v1.Promise.delay(v17):andThen(function()
				u11:Play();
				u12:Play();
				u13:Play();
				u14:Play();
				if l__DeviceUtil__3.isHoarceKat() then
					return nil;
				end;
				u11.Completed:Connect(function()
					l__KnitClient__4.Controllers.AnnouncerController:endAnnouncement();
				end);
			end);
		end, {});
		u7 = u5.createRef();
		u10 = u5.createRef();
		u9 = u5.createRef();
		u8 = u5.createRef();
		local v18 = {};
		local l__backgroundImage__19 = p1.Announcement.backgroundImage;
		local v20 = {};
		if l__backgroundImage__19 ~= "" and l__backgroundImage__19 then
			local v21 = u5.createFragment({
				AnnouncementBackground = u5.createElement("ImageLabel", {
					Image = p1.Announcement.backgroundImage, 
					ImageTransparency = 0, 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					Position = UDim2.fromScale(0.5, 0.5), 
					Size = UDim2.fromScale(0, 1), 
					BackgroundTransparency = 1, 
					[u5.Ref] = u9
				})
			});
		else
			v21 = u5.createFragment({
				AnnouncementBackground = u5.createElement("Frame", {
					AnchorPoint = Vector2.new(0.5, 0.5), 
					Position = UDim2.fromScale(0.5, 0.5), 
					Size = UDim2.fromScale(0, 1), 
					BackgroundTransparency = 1, 
					[u5.Ref] = u10
				}, {
					TopBorder = u5.createElement("Frame", {
						AnchorPoint = Vector2.new(0, 0), 
						Position = UDim2.fromScale(0, -0.03), 
						Size = UDim2.fromScale(1, 0.03), 
						BackgroundColor3 = l__ColorUtil__3.WHITE, 
						BackgroundTransparency = 0, 
						BorderSizePixel = 0
					}, { u5.createElement("UIGradient", {
							Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v4), ColorSequenceKeypoint.new(1, v4) }), 
							Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.1, 0.6), NumberSequenceKeypoint.new(0.25, 0.1), NumberSequenceKeypoint.new(0.75, 0.1), NumberSequenceKeypoint.new(0.9, 0.6), NumberSequenceKeypoint.new(1, 1) })
						}) }), 
					BottomBorder = u5.createElement("Frame", {
						AnchorPoint = Vector2.new(0, 1), 
						Position = UDim2.fromScale(0, 1.03), 
						Size = UDim2.fromScale(1, 0.03), 
						BackgroundColor3 = l__ColorUtil__3.WHITE, 
						BackgroundTransparency = 0, 
						BorderSizePixel = 0
					}, { u5.createElement("UIGradient", {
							Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v4), ColorSequenceKeypoint.new(1, v4) }), 
							Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.1, 0.6), NumberSequenceKeypoint.new(0.25, 0.1), NumberSequenceKeypoint.new(0.75, 0.1), NumberSequenceKeypoint.new(0.9, 0.6), NumberSequenceKeypoint.new(1, 1) })
						}) }),
					(u5.createElement("UIGradient", {
						Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, l__ColorUtil__3.BLACK), ColorSequenceKeypoint.new(1, l__ColorUtil__3.BLACK) }), 
						Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.1, 0.7), NumberSequenceKeypoint.new(0.2, 0.5), NumberSequenceKeypoint.new(0.8, 0.5), NumberSequenceKeypoint.new(0.9, 0.7), NumberSequenceKeypoint.new(1, 1) })
					}))
				})
			});
		end;
		v20[#v20 + 1] = v21;
		v20.AnnouncementMessage = u5.createElement("TextLabel", {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.6), 
			Size = UDim2.fromScale(0.9, 0.65), 
			Text = p1.Announcement.message, 
			TextColor3 = l__ColorUtil__3.WHITE, 
			Font = "LuckiestGuy", 
			TextScaled = true, 
			RichText = true, 
			SizeConstraint = "RelativeXY", 
			BackgroundTransparency = 1, 
			TextTransparency = 1, 
			[u5.Ref] = u7
		}, { u5.createElement("UIStroke", {
				Color = l__ColorUtil__3.BLACK, 
				Thickness = 2, 
				[u5.Ref] = u8, 
				Transparency = 1
			}) });
		v18[#v18 + 1] = u5.createElement(l__Empty__6, {
			AnchorPoint = Vector2.new(0.5, 0), 
			Position = UDim2.fromScale(0.5, 0.05), 
			Size = UDim2.fromScale(0.9, 0.07)
		}, v20);
		return u5.createElement("ScreenGui", {
			ResetOnSpawn = false
		}, v18);
	end)
};
