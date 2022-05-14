-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__TweenService__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__DeviceUtil__2 = v2.DeviceUtil;
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__5 = v2.Empty;
local l__ColorUtil__6 = v2.ColorUtil;
return {
	ImageAnnouncement = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u4)(function(p1, p2)
		local u7 = nil;
		local u8 = nil;
		local u9 = nil;
		p2.useEffect(function()
			local v3 = nil;
			local v4 = nil;
			local v5 = u7:getValue();
			v4 = u8:getValue();
			v3 = u9:getValue();
			if not v5 or not v3 or not v4 then
				return nil;
			end;
			local v6 = l__TweenService__1:Create(v3, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
				Size = UDim2.fromScale(0.5, 1)
			});
			local v7 = l__TweenService__1:Create(v3, TweenInfo.new(0.3), {
				ImageTransparency = 0
			}):Play();
			v6:Play();
			v6.Completed:Connect(function()
				local v8 = l__TweenService__1:Create(v5, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
					TextTransparency = 0
				}):Play();
				local v9 = l__TweenService__1:Create(v4, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
					Transparency = 0
				}):Play();
			end);
			local v10 = p1.Announcement.duration;
			if v10 == nil then
				v10 = 5;
			end;
			local u10 = l__TweenService__1:Create(v5, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
				TextTransparency = 1
			});
			local u11 = l__TweenService__1:Create(v4, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
				Transparency = 1
			});
			local u12 = l__TweenService__1:Create(v3, TweenInfo.new(0.3), {
				ImageTransparency = 1
			});
			local u13 = l__TweenService__1:Create(v3, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
				Size = UDim2.fromScale(0, 1)
			});
			v1.Promise.delay(v10):andThen(function()
				u10:Play();
				u11:Play();
				u12:Play();
				u13:Play();
				if l__DeviceUtil__2.isHoarceKat() then
					return nil;
				end;
				u10.Completed:Connect(function()
					l__KnitClient__3.Controllers.AnnouncerController:endAnnouncement();
				end);
			end);
		end, {});
		u7 = u4.createRef();
		u8 = u4.createRef();
		u9 = u4.createRef();
		return u4.createElement("ScreenGui", {
			ResetOnSpawn = false
		}, { u4.createElement(l__Empty__5, {
				AnchorPoint = Vector2.new(0.5, 0), 
				Position = UDim2.fromScale(0.5, 0.05), 
				Size = UDim2.fromScale(0.9, 0.07)
			}, {
				AnnouncementBackground = u4.createElement("ImageLabel", {
					Image = "rbxassetid://8602789875", 
					ImageTransparency = 0, 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					Position = UDim2.fromScale(0.5, 0.5), 
					Size = UDim2.fromScale(0, 1), 
					BackgroundTransparency = 1, 
					[u4.Ref] = u9
				}), 
				AnnouncementMessage = u4.createElement("TextLabel", {
					AnchorPoint = Vector2.new(0.5, 0.5), 
					Position = UDim2.fromScale(0.5, 0.6), 
					Size = UDim2.fromScale(0.9, 0.65), 
					Text = p1.Announcement.message, 
					TextColor3 = l__ColorUtil__6.WHITE, 
					Font = "LuckiestGuy", 
					TextScaled = true, 
					SizeConstraint = "RelativeXY", 
					BackgroundTransparency = 1, 
					TextTransparency = 1, 
					[u4.Ref] = u7
				}, { u4.createElement("UIStroke", {
						Color = l__ColorUtil__6.BLACK, 
						Thickness = 2, 
						[u4.Ref] = u8, 
						Transparency = 1
					}) })
			}) });
	end)
};
