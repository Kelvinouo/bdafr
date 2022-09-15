-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tnt-wars", "tnt-wars-constants");
local v4 = v2.Component:extend("TNTWarsHpBar");
function v4.init(p1)
	p1.flashBarOneRef = v2.createRef();
	p1.outerBarOneRef = v2.createRef();
	p1.percentLabelOneRef = v2.createRef();
	p1.coreIconOneRef = v2.createRef();
	p1.flashBarTwoRef = v2.createRef();
	p1.outerBarTwoRef = v2.createRef();
	p1.percentLabelTwoRef = v2.createRef();
	p1.coreIconTwoRef = v2.createRef();
end;
local l__Theme__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__TNT_WARS_IMAGE_ID__2 = v3.TNT_WARS_IMAGE_ID;
local l__DeviceUtil__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).DeviceUtil;
function v4.render(p2)
	local v5 = {};
	local v6 = {
		TeamLabel = v2.createElement("TextLabel", {
			Text = p2.props.teamLabel, 
			RichText = true, 
			TextScaled = true, 
			TextColor3 = Color3.fromRGB(255, 255, 255), 
			TextStrokeColor3 = Color3.fromRGB(0, 0, 0), 
			TextStrokeTransparency = 0, 
			Font = Enum.Font.Arcade, 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			Position = p2.props.teamLabelPos, 
			Size = UDim2.fromScale(0.5, 0.075), 
			ZIndex = 4
		})
	};
	local v7 = { v2.createElement("UIStroke", {
			Color = Color3.fromRGB(255, 255, 255), 
			Thickness = 3
		}), (v2.createElement("UICorner")) };
	local v8 = {};
	local v9 = {
		[v2.Ref] = p2.percentLabelOneRef, 
		Text = "100%", 
		RichText = true, 
		Position = UDim2.fromScale(0.5, 0.58), 
		Size = UDim2.fromScale(1, 1), 
		AnchorPoint = Vector2.new(0.5, 0.5), 
		BackgroundTransparency = 1, 
		Font = Enum.Font.LuckiestGuy, 
		TextColor3 = Color3.fromRGB(255, 255, 255), 
		TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	};
	if l__DeviceUtil__3.isSmallScreen() then
		local v10 = 12;
	else
		v10 = 18;
	end;
	v9.TextSize = v10;
	v9.TextStrokeTransparency = 0;
	v9.TextXAlignment = Enum.TextXAlignment.Center;
	v9.ZIndex = 4;
	v8.CoreOnePercent = v2.createElement("TextLabel", v9);
	v7.CoreOneIcon = v2.createElement("ImageLabel", {
		[v2.Ref] = p2.coreIconOneRef, 
		Position = UDim2.fromScale(p2.props.barAnchorPoint.X - 0.075, -0.35), 
		Size = UDim2.fromScale(0.1, 0.1), 
		SizeConstraint = Enum.SizeConstraint.RelativeXX, 
		Image = l__TNT_WARS_IMAGE_ID__2.PURPLE_CORE, 
		BorderSizePixel = 0, 
		BackgroundTransparency = 1, 
		ZIndex = 3
	}, v8);
	v7.CoreBarOneFlash = v2.createElement("Frame", {
		[v2.Ref] = p2.flashBarOneRef, 
		Position = UDim2.fromScale(p2.props.barAnchorPoint.X, 0), 
		Size = UDim2.fromScale(1, 1), 
		AnchorPoint = p2.props.barAnchorPoint, 
		BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
		BorderSizePixel = 0, 
		ZIndex = 1
	}, { v2.createElement("UICorner") });
	v7.CoreBarOneOuter = v2.createElement("Frame", {
		[v2.Ref] = p2.outerBarOneRef, 
		Position = UDim2.fromScale(p2.props.barAnchorPoint.X, 0), 
		Size = UDim2.fromScale(1, 1), 
		AnchorPoint = p2.props.barAnchorPoint, 
		BackgroundColor3 = p2.props.barColor, 
		BorderSizePixel = 0, 
		ZIndex = 2
	}, { v2.createElement("UICorner") });
	v6.CoreBarOneInner = v2.createElement("Frame", {
		Position = UDim2.fromScale(p2.props.barAnchorPoint.X, 0), 
		Size = UDim2.fromScale(0.8, 0.055), 
		AnchorPoint = p2.props.barAnchorPoint, 
		BackgroundTransparency = 0.5, 
		BackgroundColor3 = l__Theme__1.Gray, 
		BorderSizePixel = 0
	}, v7);
	local v11 = { v2.createElement("UIStroke", {
			Color = Color3.fromRGB(255, 255, 255), 
			Thickness = 3
		}), (v2.createElement("UICorner")) };
	local v12 = {};
	local v13 = {
		[v2.Ref] = p2.percentLabelTwoRef, 
		Text = "100%", 
		RichText = true, 
		Position = UDim2.fromScale(0.5, 0.58), 
		Size = UDim2.fromScale(1, 1), 
		AnchorPoint = Vector2.new(0.5, 0.5), 
		BackgroundTransparency = 1, 
		Font = Enum.Font.LuckiestGuy
	};
	if l__DeviceUtil__3.isSmallScreen() then
		local v14 = 12;
	else
		v14 = 18;
	end;
	v13.TextSize = v14;
	v13.TextColor3 = Color3.fromRGB(255, 255, 255);
	v13.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	v13.TextStrokeTransparency = 0;
	v13.TextXAlignment = Enum.TextXAlignment.Center;
	v13.ZIndex = 4;
	v12.CoreTwoPercent = v2.createElement("TextLabel", v13);
	v11.CoreTwoIcon = v2.createElement("ImageLabel", {
		[v2.Ref] = p2.coreIconTwoRef, 
		Position = UDim2.fromScale(p2.props.barAnchorPoint.X - 0.075, -0.35), 
		Size = UDim2.fromScale(0.1, 0.1), 
		SizeConstraint = Enum.SizeConstraint.RelativeXX, 
		Image = l__TNT_WARS_IMAGE_ID__2.YELLOW_CORE, 
		BorderSizePixel = 0, 
		BackgroundTransparency = 1, 
		ZIndex = 3
	}, v12);
	v11.CoreBarTwoFlash = v2.createElement("Frame", {
		[v2.Ref] = p2.flashBarTwoRef, 
		Position = UDim2.fromScale(p2.props.barAnchorPoint.X, 0), 
		Size = UDim2.fromScale(1, 1), 
		AnchorPoint = p2.props.barAnchorPoint, 
		BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
		BorderSizePixel = 0, 
		ZIndex = 1
	}, { v2.createElement("UICorner") });
	v11.CoreBarTwoOuter = v2.createElement("Frame", {
		[v2.Ref] = p2.outerBarTwoRef, 
		Position = UDim2.fromScale(p2.props.barAnchorPoint.X, 0), 
		Size = UDim2.fromScale(1, 1), 
		AnchorPoint = p2.props.barAnchorPoint, 
		BackgroundColor3 = p2.props.barColor, 
		BorderSizePixel = 0, 
		ZIndex = 2
	}, { v2.createElement("UICorner") });
	v6.CoreBarTwoInner = v2.createElement("Frame", {
		Position = UDim2.fromScale(p2.props.barAnchorPoint.X, 0.125), 
		Size = UDim2.fromScale(0.7, 0.055), 
		BorderSizePixel = 0, 
		BackgroundTransparency = 0.5, 
		BackgroundColor3 = l__Theme__1.Gray, 
		AnchorPoint = p2.props.barAnchorPoint
	}, v11);
	v5.HpBarsContainer = v2.createElement("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5), 
		BackgroundTransparency = 1, 
		BorderSizePixel = 0, 
		Position = p2.props.containerPosition, 
		Size = UDim2.fromScale(0.5, 1)
	}, v6);
	return v2.createFragment(v5);
end;
local l__CORE_COLORS__4 = v3.CORE_COLORS;
function v4.didMount(p3)
	local v15 = nil;
	local v16, v17, v18 = ipairs(p3.props.cores);
	while true do
		v16(v17, v18);
		if not v16 then
			break;
		end;
		local v19 = v17.corePart;
		if v19 ~= nil then
			v19 = v19.Color;
		end;
		if v19 == l__CORE_COLORS__4[1] == true then
			v15 = v17;
			break;
		end;	
	end;
	p3.coreOne = v15;
	local v20 = nil;
	local v21, v22, v23 = ipairs(p3.props.cores);
	while true do
		v21(v22, v23);
		if not v21 then
			break;
		end;
		local v24 = v22.corePart;
		if v24 ~= nil then
			v24 = v24.Color;
		end;
		if v24 == l__CORE_COLORS__4[2] == true then
			v20 = v22;
			break;
		end;	
	end;
	p3.coreTwo = v20;
	p3:setupDamageListeners();
end;
function v4.setupDamageListeners(p4)
	local l__coreOne__25 = p4.coreOne;
	if l__coreOne__25 ~= nil then
		local l__corePart__26 = l__coreOne__25.corePart;
		if l__corePart__26 ~= nil then
			local v27 = l__corePart__26:GetAttributeChangedSignal("Hp"):Connect(function()
				p4:updateCoreOne();
			end);
		end;
	end;
	local l__coreTwo__28 = p4.coreTwo;
	if l__coreTwo__28 ~= nil then
		local l__corePart__29 = l__coreTwo__28.corePart;
		if l__corePart__29 ~= nil then
			local v30 = l__corePart__29:GetAttributeChangedSignal("Hp"):Connect(function()
				p4:updateCoreTwo();
			end);
		end;
	end;
end;
function v4.updateCoreOne(p5)
	local v31 = p5.coreOne;
	if v31 ~= nil then
		v31 = v31.corePart;
	end;
	if not v31 then
		return nil;
	end;
	local v32 = p5.outerBarOneRef:getValue();
	local v33 = p5.flashBarOneRef:getValue();
	local v34 = p5.percentLabelOneRef:getValue();
	local v35 = p5.coreIconOneRef:getValue();
	if v32 and v33 and v34 and v35 then
		p5:updateIcon(p5.coreOne.corePart, v35);
		p5:updateBar(p5.coreOne.corePart, v32, v33);
		p5:updatePercent(p5.coreOne.corePart, v34);
		return;
	end;
	return nil;
end;
function v4.updateCoreTwo(p6)
	local v36 = p6.coreTwo;
	if v36 ~= nil then
		v36 = v36.corePart;
	end;
	if not v36 then
		return nil;
	end;
	local v37 = p6.outerBarTwoRef:getValue();
	local v38 = p6.flashBarTwoRef:getValue();
	local v39 = p6.percentLabelTwoRef:getValue();
	local v40 = p6.coreIconTwoRef:getValue();
	if v37 and v38 and v39 and v40 then
		p6:updateIcon(p6.coreTwo.corePart, v40);
		p6:updateBar(p6.coreTwo.corePart, v37, v38);
		p6:updatePercent(p6.coreTwo.corePart, v39);
		return;
	end;
	return nil;
end;
local l__CORE_HP__5 = v3.CORE_HP;
local l__TweenService__6 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local u7 = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut);
function v4.updateBar(p7, p8, p9, p10)
	local v41 = UDim2.fromScale(p8:GetAttribute("Hp") / l__CORE_HP__5, p9.Size.Y.Scale);
	p9.Size = v41;
	task.delay(1, function()
		l__TweenService__6:Create(p10, u7, {
			Size = v41
		}):Play();
	end);
end;
function v4.updatePercent(p11, p12, p13)
	local v42 = p12:GetAttribute("Hp");
	if v42 <= 0 then
		p13.Visible = false;
		return nil;
	end;
	p13.Text = tostring((math.floor(v42 / l__CORE_HP__5 * 100))) .. "%";
end;
function v4.updateIcon(p14, p15, p16)
	if p15:GetAttribute("Hp") <= 0 then
		p16.Image = l__TNT_WARS_IMAGE_ID__2.DEAD_CORE;
	end;
end;
return {
	TNTWarsHpBar = v4
};
