-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__Workspace__1 = v3.Workspace;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__TweenService__3 = v3.TweenService;
local l__DeviceUtil__4 = v2.DeviceUtil;
local l__default__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Theme__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Countdown__7 = v2.Countdown;
return {
	BlackholeCountdown = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local v4, v5 = p2.useState(l__Workspace__1:GetServerTimeNow() + p1.initialCountdown);
		local u8 = u2.createRef();
		local u9 = u2.createRef();
		p2.useEffect(function()
			local v6 = nil;
			local v7 = u8:getValue();
			v6 = u9:getValue();
			if not v7 or not v6 then
				return nil;
			end;
			local v8 = l__TweenService__3:Create(v7, TweenInfo.new(p1.initialCountdown, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
				Size = UDim2.fromScale(0, 1)
			});
			v8:Play();
			l__TweenService__3:Create(v7, TweenInfo.new(25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, false), {
				ImageRectOffset = Vector2.new(100, 100), 
				ImageRectSize = Vector2.new(100, 100)
			}):Play();
			l__TweenService__3:Create(v6, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
				Position = UDim2.fromScale(v6.Position.X.Scale + 0.002, v6.Position.Y.Scale + 0.002)
			}):Play();
			local v9 = nil;
			if not l__DeviceUtil__4.isHoarceKat() then
				local u10 = v8;
				v9 = l__default__5.Client:WaitFor("RemoteName"):expect():Connect(function(p3)
					u10:Pause();
					u10:Destroy();
					local v10 = p3.updatedEndTime - l__Workspace__1:GetServerTimeNow();
					if v10 <= 0 then
						v7.Size = UDim2.fromScale(0, 1);
						return nil;
					end;
					v5(p3.updatedEndTime);
					v7.Size = UDim2.fromScale(v10 / p1.initialCountdown, 1);
					u10 = l__TweenService__3:Create(v7, TweenInfo.new(v10, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
						Size = UDim2.fromScale(0, 1)
					});
					u10:Play();
				end);
			end;
			return function()
				if v9 then
					v9:Disconnect();
				end;
			end;
		end, {});
		return u2.createElement("ScreenGui", {
			ResetOnSpawn = false, 
			IgnoreGuiInset = true
		}, {
			InnerCountdownBar = u2.createElement("Frame", {
				Size = UDim2.fromScale(0.2, 0.02), 
				Position = UDim2.fromScale(0.5, 0.12), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				BackgroundColor3 = l__Theme__6.Gray, 
				BackgroundTransparency = 0.3, 
				BorderSizePixel = 0, 
				ClipsDescendants = true
			}, {
				OuterCountdownBar = u2.createElement("ImageLabel", {
					[u2.Ref] = u8, 
					Size = UDim2.fromScale(1, 1), 
					Position = UDim2.fromScale(0, 0), 
					BorderSizePixel = 0, 
					Image = "rbxassetid://10970371596", 
					ScaleType = Enum.ScaleType.Tile, 
					TileSize = UDim2.fromOffset(100, 100)
				}, { u2.createElement("UICorner", {
						CornerRadius = UDim.new(0, 6)
					}) }),
				u2.createElement("UICorner", {
					CornerRadius = UDim.new(0, 6)
				}), (u2.createElement("UIStroke", {
					Thickness = 1.5, 
					Color = Color3.fromRGB(255, 255, 255)
				}, { u2.createElement("UIGradient", {
						Color = ColorSequence.new(Color3.fromRGB(123, 100, 42), Color3.fromRGB(0, 0, 0))
					}) }))
			}), 
			BlackholeRender = u2.createElement("ImageLabel", {
				[u2.Ref] = u9, 
				Size = UDim2.fromScale(0.075, 0.075), 
				Position = UDim2.fromScale(0.4, 0.115), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				SizeConstraint = Enum.SizeConstraint.RelativeXX, 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				Image = "rbxassetid://7976208473", 
				ZIndex = 5
			}),
			u2.createElement(l__Countdown__7, {
				EndTime = v4, 
				TextLabel = {
					Size = UDim2.fromScale(0.0375, 0.0375), 
					Position = UDim2.fromScale(0.575, 0.088), 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					ZIndex = 5
				}, 
				CountdownConfig = {
					minutes = true, 
					hours = false, 
					days = false
				}
			})
		});
	end)
};
