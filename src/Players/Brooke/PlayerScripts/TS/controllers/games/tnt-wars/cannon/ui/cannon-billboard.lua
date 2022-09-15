-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v4 = v2.Component:extend("CannonBillboard");
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v4.init(p1)
	p1.billboardRef = v2.createRef();
	p1.hpOuterRef = v2.createRef();
	p1.autoOuterRef = v2.createRef();
	p1.ammoCounterRef = v2.createRef();
	p1.autoFireMaid = u1.new();
end;
local l__TNT_WARS_IMAGE_ID__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tnt-wars", "tnt-wars-constants").TNT_WARS_IMAGE_ID;
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
function v4.render(p2)
	local v5 = {};
	local v6 = {};
	local v7 = {
		HpContainer = v2.createElement("Frame", {
			Size = UDim2.fromScale(1, 0.25), 
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
					Size = UDim2.fromScale(1, 1), 
					BackgroundColor3 = l__Theme__3.mcGreen
				}, { v2.createElement("UICorner") }),
				v2.createElement("UIStroke", {
					Color = Color3.fromRGB(255, 255, 255), 
					Thickness = 2
				}), (v2.createElement("UICorner"))
			})
		})
	};
	local v8 = {
		Size = UDim2.fromScale(1, 0.45)
	};
	if p2.props.config.autoFire then
		local v9 = UDim2.fromScale(0, 0.32);
	else
		v9 = UDim2.fromScale(0, 0.42);
	end;
	v8.Position = v9;
	v8.BackgroundColor3 = l__Theme__3.Gray;
	v8.BackgroundTransparency = 0.25;
	v7.AmmoContainer = v2.createElement("Frame", v8, {
		TNTIcon = v2.createElement("ImageLabel", {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Image = l__TNT_WARS_IMAGE_ID__2.LOGO, 
			Size = UDim2.fromScale(0.4, 0.4), 
			Position = UDim2.fromScale(0.225, 0.5), 
			SizeConstraint = Enum.SizeConstraint.RelativeXX, 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0
		}), 
		Counter = v2.createElement("TextLabel", {
			[v2.Ref] = p2.ammoCounterRef, 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Text = "0/" .. tostring(p2.props.config.ammoCapacity), 
			Font = Enum.Font.Arcade, 
			Size = UDim2.fromScale(0.5, 0.5), 
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
	});
	local v10 = p2.props.config.autoFire and v2.createFragment({
		AutoFireBarInner = v2.createElement("Frame", {
			Position = UDim2.fromScale(0, 0.85), 
			Size = UDim2.fromScale(1, 0.1), 
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
	if v10 then
		v7[#v7 + 1] = v10;
	end;
	v6.UsableArea = v2.createElement("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.6), 
		Position = UDim2.fromScale(0.5, 0.5), 
		Size = UDim2.fromScale(0.8, 0.7), 
		BackgroundTransparency = 1, 
		BorderSizePixel = 0
	}, v7);
	v5.BillboardFrame = v2.createElement("ImageLabel", {
		Size = UDim2.fromScale(1, 1), 
		Image = l__TNT_WARS_IMAGE_ID__2.BILLBOARD, 
		BackgroundTransparency = 1
	}, v6);
	return v2.createFragment({
		CannonBillboard = v2.createElement("BillboardGui", {
			[v2.Ref] = p2.billboardRef, 
			Adornee = p2.props.cannon:WaitForChild("Camera"), 
			ExtentsOffset = Vector3.new(0, 7.5, 0), 
			Size = UDim2.fromScale(4, 5), 
			MaxDistance = 25
		}, v5)
	});
end;
function v4.didMount(p3)
	p3:addTag();
	p3:startAutoFireTween();
	p3:setupDamageListener();
	p3:setupAmmoListener();
end;
function v4.willUnmount(p4)
	p4.autoFireMaid:DoCleaning();
end;
local l__CollectionService__4 = v3.CollectionService;
local l__CANNON_COLLECTION_TAGS__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tnt-wars", "cannon-constants").CANNON_COLLECTION_TAGS;
function v4.addTag(p5)
	local v11 = p5.billboardRef:getValue();
	if not v11 then
		return nil;
	end;
	l__CollectionService__4:AddTag(v11, l__CANNON_COLLECTION_TAGS__5.billboard);
end;
local l__TweenService__6 = v3.TweenService;
function v4.startAutoFireTween(p6)
	if not p6.props.config.autoFire then
		return nil;
	end;
	local v12 = p6.autoOuterRef:getValue();
	if not v12 then
		return nil;
	end;
	local v13 = l__TweenService__6:Create(v12, TweenInfo.new(p6.props.config.autoFire.fireInterval, Enum.EasingStyle.Linear, Enum.EasingDirection.In, math.huge), {
		Size = UDim2.fromScale(1, 1)
	});
	v13:Play();
	p6.autoFireMaid:GiveTask(function()
		v13:Destroy();
	end);
end;
local u7 = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut);
function v4.setupDamageListener(p7)
	local v14 = p7.hpOuterRef:getValue();
	if not v14 then
		return nil;
	end;
	p7.props.cannon:GetAttributeChangedSignal("CannonDurability"):Connect(function()
		l__TweenService__6:Create(v14, u7, {
			Size = UDim2.fromScale(p7.props.cannon:GetAttribute("CannonDurability") / p7.props.cannon:GetAttribute("MaxHealth"), v14.Size.Y.Scale)
		}):Play();
	end);
end;
function v4.setupAmmoListener(p8)
	local v15 = p8.ammoCounterRef:getValue();
	if not v15 then
		return nil;
	end;
	p8.props.cannon:GetAttributeChangedSignal("CannonAmmo"):Connect(function()
		v15.Text = tostring((p8.props.cannon:GetAttribute("CannonAmmo"))) .. "/" .. tostring(p8.props.config.ammoCapacity);
	end);
end;
return {
	CannonBillboard = v4
};
