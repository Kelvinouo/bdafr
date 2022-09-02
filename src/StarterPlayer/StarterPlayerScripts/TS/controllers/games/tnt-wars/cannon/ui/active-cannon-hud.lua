-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v4 = v2.Component:extend("ActiveCannonHud");
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v4.init(p1)
	p1.hpOuterRef = v2.createRef();
	p1.autoOuterRef = v2.createRef();
	p1.ammoCounterRef = v2.createRef();
	p1.autoFireMaid = u1.new();
end;
local l__ColorUtil__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__TNT_WARS_IMAGE_ID__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tnt-wars", "tnt-wars-constants").TNT_WARS_IMAGE_ID;
function v4.render(p2)
	local v5 = {};
	local v6 = {
		BackgroundColor3 = l__ColorUtil__2.darken(l__Theme__3.Gray, 0.25), 
		BackgroundTransparency = 0.1, 
		Size = UDim2.fromScale(0.2, 0.4), 
		Position = UDim2.fromScale(0.8, 0.5), 
		AnchorPoint = Vector2.new(0.5, 0.5)
	};
	local v7 = {
		HpContainer = v2.createElement("Frame", {
			Position = UDim2.fromScale(0.05, 0), 
			Size = UDim2.fromScale(0.9, 0.15), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0
		}, {
			HpLabel = v2.createElement("TextLabel", {
				Text = "HP", 
				Font = Enum.Font.Arcade, 
				Size = UDim2.fromScale(0.25, 1), 
				Position = UDim2.fromScale(0, 0.15), 
				TextScaled = true, 
				BackgroundTransparency = 1, 
				TextStrokeTransparency = 0, 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
			}), 
			HpBarInner = v2.createElement("Frame", {
				Size = UDim2.fromScale(0.7, 0.4), 
				Position = UDim2.fromScale(0.28, 0.5), 
				BackgroundColor3 = l__Theme__3.Gray, 
				BackgroundTransparency = 0.25
			}, {
				HpBarOuter = v2.createElement("Frame", {
					[v2.Ref] = p2.hpOuterRef, 
					Size = p2:getCurrentDurability(), 
					BackgroundColor3 = l__Theme__3.mcGreen
				}, { v2.createElement("UICorner") }),
				v2.createElement("UIStroke", {
					Color = Color3.fromRGB(255, 255, 255), 
					Thickness = 2
				}), (v2.createElement("UICorner"))
			})
		}), 
		AmmoContainer = v2.createElement("Frame", {
			Size = UDim2.fromScale(0.8, 0.25), 
			Position = UDim2.fromScale(0.1, 0.2), 
			BackgroundColor3 = l__Theme__3.Gray, 
			BackgroundTransparency = 0.25
		}, {
			TNTIcon = v2.createElement("ImageLabel", {
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Image = l__TNT_WARS_IMAGE_ID__4.LOGO, 
				Size = UDim2.fromScale(0.4, 0.4), 
				Position = UDim2.fromScale(0.225, 0.5), 
				SizeConstraint = Enum.SizeConstraint.RelativeXX, 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0
			}), 
			Counter = v2.createElement("TextLabel", {
				AnchorPoint = Vector2.new(0.5, 0.5), 
				[v2.Ref] = p2.ammoCounterRef, 
				Text = tostring(p2.props.cannon:GetAttribute("CannonAmmo")) .. "/" .. tostring(p2.props.config.ammoCapacity), 
				Font = Enum.Font.Arcade, 
				Size = UDim2.fromScale(0.5, 0.6), 
				Position = UDim2.fromScale(0.7, 0.5), 
				TextStrokeTransparency = 0, 
				TextStrokeColor3 = Color3.fromRGB(0, 0, 0), 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				TextScaled = true, 
				BackgroundTransparency = 1
			}),
			v2.createElement("UICorner"), (v2.createElement("UIStroke", {
				Color = Color3.fromRGB(255, 255, 255), 
				Thickness = 2
			}))
		}),
		v2.createElement("UICorner"), (v2.createElement("UIStroke", {
			Color = Color3.fromRGB(255, 255, 255), 
			Thickness = 6
		}))
	};
	local v8 = p2.props.config.autoFire and v2.createFragment({
		AutoFireBarInner = v2.createElement("Frame", {
			Position = UDim2.fromScale(0.05, 0.5), 
			Size = UDim2.fromScale(0.9, 0.075), 
			BackgroundColor3 = l__Theme__3.Gray, 
			BackgroundTransparency = 0.3
		}, {
			AutoFireBarOuter = v2.createElement("Frame", {
				[v2.Ref] = p2.autoOuterRef, 
				Size = UDim2.fromScale(0, 1), 
				BackgroundColor3 = l__Theme__3.mcBlue
			}, { v2.createElement("UICorner") }),
			v2.createElement("UICorner"), (v2.createElement("UIStroke", {
				Color = Color3.fromRGB(255, 255, 255), 
				Thickness = 2
			}))
		})
	});
	if v8 then
		v7[#v7 + 1] = v8;
	end;
	local v9 = {
		BackgroundTransparency = 1, 
		Size = UDim2.fromScale(0.9, 0.4)
	};
	if p2.props.config.autoFire then
		local v10 = UDim2.fromScale(0.05, 0.6);
	else
		v10 = UDim2.fromScale(0.05, 0.525);
	end;
	v9.Position = v10;
	local v11 = {};
	local v12 = not p2.props.config.autoFire;
	if v12 then
		local v13 = {};
		local v14 = {
			Active = true, 
			Size = UDim2.fromScale(0.5, 1), 
			Position = UDim2.fromScale(0, 0), 
			BackgroundTransparency = 1
		};
		v14[v2.Event.TouchTap] = function()
			p2.props.requestFire(p2.props.cannon);
		end;
		v13.FireControl = v2.createElement("Frame", v14, {
			FireOutline = v2.createElement("Frame", {
				Size = UDim2.fromScale(0.8, 0.8), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromScale(0.5, 0.5), 
				BackgroundTransparency = 1
			}, {
				FireButton = v2.createElement("TextLabel", {
					Text = "X", 
					Font = Enum.Font.RobotoMono, 
					TextColor3 = Color3.fromRGB(255, 255, 255), 
					TextStrokeColor3 = Color3.fromRGB(0, 0, 0), 
					TextStrokeTransparency = 0, 
					TextScaled = true, 
					Size = UDim2.fromScale(0.5, 0.5), 
					Position = UDim2.fromScale(0.5, 0.4), 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					BackgroundTransparency = 1
				}), 
				FireText = v2.createElement("TextLabel", {
					Text = "Fire", 
					Font = Enum.Font.RobotoMono, 
					TextColor3 = Color3.fromRGB(255, 255, 255), 
					TextStrokeColor3 = Color3.fromRGB(0, 0, 0), 
					TextStrokeTransparency = 0, 
					TextScaled = true, 
					Size = UDim2.fromScale(0.9, 0.4), 
					Position = UDim2.fromScale(0.5, 0.75), 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					BackgroundTransparency = 1
				}),
				v2.createElement("UIStroke", {
					Color = Color3.fromRGB(255, 255, 255), 
					Thickness = 2
				}), (v2.createElement("UICorner"))
			})
		});
		v12 = v2.createFragment(v13);
	end;
	if v12 then
		v11[#v11 + 1] = v12;
	end;
	local v15 = {
		Active = true, 
		Size = UDim2.fromScale(0.5, 1)
	};
	if p2.props.config.autoFire then
		local v16 = UDim2.fromScale(0.25, 0);
	else
		v16 = UDim2.fromScale(0.5, 0);
	end;
	v15.Position = v16;
	v15.BackgroundTransparency = 1;
	v15[v2.Event.TouchTap] = function()
		p2.props.unmount();
	end;
	v11.UnmountControl = v2.createElement("Frame", v15, {
		UnmountOutline = v2.createElement("Frame", {
			Size = UDim2.fromScale(0.8, 0.8), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			BackgroundTransparency = 1
		}, {
			UnmountButton = v2.createElement("TextLabel", {
				Text = "F", 
				Font = Enum.Font.RobotoMono, 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				TextStrokeColor3 = Color3.fromRGB(0, 0, 0), 
				TextStrokeTransparency = 0, 
				TextScaled = true, 
				Size = UDim2.fromScale(0.5, 0.5), 
				Position = UDim2.fromScale(0.5, 0.4), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				BackgroundTransparency = 1
			}), 
			UnmountText = v2.createElement("TextLabel", {
				Text = "Unmount", 
				Font = Enum.Font.RobotoMono, 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				TextStrokeColor3 = Color3.fromRGB(0, 0, 0), 
				TextStrokeTransparency = 0, 
				TextScaled = true, 
				Size = UDim2.fromScale(0.9, 0.4), 
				Position = UDim2.fromScale(0.5, 0.75), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				BackgroundTransparency = 1
			}),
			v2.createElement("UIStroke", {
				Color = Color3.fromRGB(255, 255, 255), 
				Thickness = 2
			}), (v2.createElement("UICorner"))
		})
	});
	v7.ControlContainer = v2.createElement("Frame", v9, v11);
	v5.ActiveHudContainer = v2.createElement("Frame", v6, v7);
	return v2.createFragment({
		ActiveCannonHud = v2.createElement("ScreenGui", {
			ResetOnSpawn = true
		}, v5)
	});
end;
function v4.didMount(p3)
	p3:startAutoFireTween();
	p3:setupDamageListener();
	p3:setupAmmoListener();
	p3:setupKeybinds();
end;
function v4.willUnmount(p4)
	p4:cleanupKeybinds();
end;
local l__ContextActionService__5 = v3.ContextActionService;
function v4.setupKeybinds(p5)
	if not p5.props.config.autoFire then
		l__ContextActionService__5:BindAction("fire-cannon", function(p6, p7, p8)
			if p7 == Enum.UserInputState.Begin then
				p5.props.requestFire(p5.props.cannon);
			end;
		end, false, Enum.KeyCode.X);
	end;
	l__ContextActionService__5:BindAction("unmount-cannon", function(p9, p10, p11)
		if p10 == Enum.UserInputState.Begin then
			p5.props.unmount();
		end;
	end, false, Enum.KeyCode.F);
end;
function v4.cleanupKeybinds(p12)
	l__ContextActionService__5:UnbindAction("fire-cannon");
	l__ContextActionService__5:UnbindAction("unmount-cannon");
end;
function v4.getCurrentDurability(p13)
	return UDim2.fromScale(p13.props.cannon:GetAttribute("CannonDurability") / p13.props.cannon:GetAttribute("MaxHealth"), 1);
end;
local l__TweenService__6 = v3.TweenService;
function v4.startAutoFireTween(p14)
	if not p14.props.config.autoFire then
		return nil;
	end;
	local v17 = p14.autoOuterRef:getValue();
	if not v17 then
		return nil;
	end;
	local v18 = l__TweenService__6:Create(v17, TweenInfo.new(p14.props.config.autoFire.fireInterval, Enum.EasingStyle.Linear, Enum.EasingDirection.In, math.huge), {
		Size = UDim2.fromScale(1, 1)
	});
	v18:Play();
	p14.autoFireMaid:GiveTask(function()
		v18:Destroy();
	end);
end;
local u7 = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut);
function v4.setupDamageListener(p15)
	local v19 = p15.hpOuterRef:getValue();
	if not v19 then
		return nil;
	end;
	p15.props.cannon:GetAttributeChangedSignal("CannonDurability"):Connect(function()
		l__TweenService__6:Create(v19, u7, {
			Size = UDim2.fromScale(p15.props.cannon:GetAttribute("CannonDurability") / p15.props.cannon:GetAttribute("MaxHealth"), v19.Size.Y.Scale)
		}):Play();
	end);
end;
function v4.setupAmmoListener(p16)
	local v20 = p16.ammoCounterRef:getValue();
	if not v20 then
		return nil;
	end;
	p16.props.cannon:GetAttributeChangedSignal("CannonAmmo"):Connect(function()
		v20.Text = tostring((p16.props.cannon:GetAttribute("CannonAmmo"))) .. "/" .. tostring(p16.props.config.ammoCapacity);
	end);
end;
return {
	ActiveCannonHud = v4
};
