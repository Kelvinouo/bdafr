-- Decompiled with the Synapse X Luau decompiler.

local v1 = { 0.10999999999999999, 0.30000000000000004, 0.4, 0.5, 0.6, 0.7, 0.75 };
local l__Players__2 = game:GetService("Players");
local l__GuiService__3 = game:GetService("GuiService");
local l__UserInputService__4 = game:GetService("UserInputService");
local l__RunService__5 = game:GetService("RunService");
local v6 = l__Players__2.LocalPlayer;
if not v6 then
	l__Players__2:GetPropertyChangedSignal("LocalPlayer"):Wait();
	v6 = l__Players__2.LocalPlayer;
end;
local v7 = require(script.Parent:WaitForChild("BaseCharacterController"));
local v8 = setmetatable({}, v7);
v8.__index = v8;
function v8.new()
	local v9 = setmetatable(v7.new(), v8);
	v9.moveTouchObject = nil;
	v9.moveTouchLockedIn = false;
	v9.moveTouchFirstChanged = false;
	v9.moveTouchStartPosition = nil;
	v9.startImage = nil;
	v9.endImage = nil;
	v9.middleImages = {};
	v9.startImageFadeTween = nil;
	v9.endImageFadeTween = nil;
	v9.middleImageFadeTweens = {};
	v9.isFirstTouch = true;
	v9.thumbstickFrame = nil;
	v9.onRenderSteppedConn = nil;
	v9.fadeInAndOutBalance = 0.5;
	v9.fadeInAndOutHalfDuration = 0.3;
	v9.hasFadedBackgroundInPortrait = false;
	v9.hasFadedBackgroundInLandscape = false;
	v9.tweenInAlphaStart = nil;
	v9.tweenOutAlphaStart = nil;
	return v9;
end;
function v8.GetIsJumping(p1)
	p1.isJumping = false;
	return p1.isJumping;
end;
local l__ContextActionService__1 = game:GetService("ContextActionService");
function v8.Enable(p2, p3, p4)
	if p3 == nil then
		return false;
	end;
	if p3 then
		local v10 = true;
	else
		v10 = false;
	end;
	p3 = v10;
	if p2.enabled == p3 then
		return true;
	end;
	if p3 then
		if not p2.thumbstickFrame then
			p2:Create(p4);
		end;
		p2:BindContextActions();
	else
		l__ContextActionService__1:UnbindAction("DynamicThumbstickAction");
		p2:OnInputEnded();
	end;
	p2.enabled = p3;
	p2.thumbstickFrame.Visible = p3;
end;
local u2 = Vector3.new(0, 0, 0);
function v8.OnInputEnded(p5)
	p5.moveTouchObject = nil;
	p5.moveVector = u2;
	p5:FadeThumbstick(false);
end;
local l__TweenService__3 = game:GetService("TweenService");
local u4 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
function v8.FadeThumbstick(p6, p7)
	if not p7 and p6.moveTouchObject then
		return;
	end;
	if p6.isFirstTouch then
		return;
	end;
	if p6.startImageFadeTween then
		p6.startImageFadeTween:Cancel();
	end;
	if p6.endImageFadeTween then
		p6.endImageFadeTween:Cancel();
	end;
	for v11 = 1, #p6.middleImages do
		if p6.middleImageFadeTweens[v11] then
			p6.middleImageFadeTweens[v11]:Cancel();
		end;
	end;
	if not p7 then
		p6.startImageFadeTween = l__TweenService__3:Create(p6.startImage, u4, {
			ImageTransparency = 1
		});
		p6.startImageFadeTween:Play();
		p6.endImageFadeTween = l__TweenService__3:Create(p6.endImage, u4, {
			ImageTransparency = 1
		});
		p6.endImageFadeTween:Play();
		for v12 = 1, #p6.middleImages do
			p6.middleImageFadeTweens[v12] = l__TweenService__3:Create(p6.middleImages[v12], u4, {
				ImageTransparency = 1
			});
			p6.middleImageFadeTweens[v12]:Play();
		end;
		return;
	end;
	p6.startImageFadeTween = l__TweenService__3:Create(p6.startImage, u4, {
		ImageTransparency = 0
	});
	p6.startImageFadeTween:Play();
	p6.endImageFadeTween = l__TweenService__3:Create(p6.endImage, u4, {
		ImageTransparency = 0.2
	});
	p6.endImageFadeTween:Play();
	for v13 = 1, #p6.middleImages do
		p6.middleImageFadeTweens[v13] = l__TweenService__3:Create(p6.middleImages[v13], u4, {
			ImageTransparency = v1[v13]
		});
		p6.middleImageFadeTweens[v13]:Play();
	end;
end;
function v8.FadeThumbstickFrame(p8, p9, p10)
	p8.fadeInAndOutHalfDuration = p9 * 0.5;
	p8.fadeInAndOutBalance = p10;
	p8.tweenInAlphaStart = tick();
end;
function v8.InputInFrame(p11, p12)
	local l__AbsolutePosition__14 = p11.thumbstickFrame.AbsolutePosition;
	local v15 = l__AbsolutePosition__14 + p11.thumbstickFrame.AbsoluteSize;
	local l__Position__16 = p12.Position;
	if l__AbsolutePosition__14.X <= l__Position__16.X and l__AbsolutePosition__14.Y <= l__Position__16.Y and l__Position__16.X <= v15.X and l__Position__16.Y <= v15.Y then
		return true;
	end;
	return false;
end;
function v8.DoFadeInBackground(p13)
	local v17 = v6:FindFirstChildOfClass("PlayerGui");
	local v18 = false;
	if v17 then
		if v17.CurrentScreenOrientation == Enum.ScreenOrientation.LandscapeLeft or v17.CurrentScreenOrientation == Enum.ScreenOrientation.LandscapeRight then
			v18 = p13.hasFadedBackgroundInLandscape;
			p13.hasFadedBackgroundInLandscape = true;
		elseif v17.CurrentScreenOrientation == Enum.ScreenOrientation.Portrait then
			v18 = p13.hasFadedBackgroundInPortrait;
			p13.hasFadedBackgroundInPortrait = true;
		end;
	end;
	if not v18 then
		p13.fadeInAndOutHalfDuration = 0.3;
		p13.fadeInAndOutBalance = 0.5;
		p13.tweenInAlphaStart = tick();
	end;
end;
function v8.DoMove(p14, p15)
	if p15.magnitude < p14.radiusOfDeadZone then
		local v19 = u2;
	else
		local v20 = p15.unit * (1 - math.max(0, (p14.radiusOfMaxSpeed - p15.magnitude) / p14.radiusOfMaxSpeed));
		v19 = Vector3.new(v20.x, 0, v20.y);
	end;
	p14.moveVector = v19;
end;
local u5 = #v1;
function v8.LayoutMiddleImages(p16, p17, p18)
	local v21 = p16.thumbstickSize / 2 + p16.middleSize;
	local v22 = p18 - p17;
	local v23 = v22.magnitude - p16.thumbstickRingSize / 2 - p16.middleSize;
	local l__unit__24 = v22.unit;
	local v25 = p16.middleSpacing;
	if p16.middleSpacing * u5 < v23 then
		v25 = v23 / u5;
	end;
	for v26 = 1, u5 do
		local v27 = nil;
		v27 = p16.middleImages[v26];
		local v28 = v21 + v25 * (v26 - 1);
		if v21 + v25 * (v26 - 2) < v23 then
			local v29 = p18 - l__unit__24 * v28;
			local v30 = math.clamp(1 - (v28 - v23) / v25, 0, 1);
			v27.Visible = true;
			v27.Position = UDim2.new(0, v29.X, 0, v29.Y);
			v27.Size = UDim2.new(0, p16.middleSize * v30, 0, p16.middleSize * v30);
		else
			v27.Visible = false;
		end;
	end;
end;
function v8.MoveStick(p19, p20)
	local v31 = Vector2.new(p19.moveTouchStartPosition.X, p19.moveTouchStartPosition.Y) - p19.thumbstickFrame.AbsolutePosition;
	local v32 = Vector2.new(p20.X, p20.Y) - p19.thumbstickFrame.AbsolutePosition;
	p19.endImage.Position = UDim2.new(0, v32.X, 0, v32.Y);
	p19:LayoutMiddleImages(v31, v32);
end;
local l__Value__6 = Enum.ContextActionPriority.High.Value;
function v8.BindContextActions(p21)
	local function u7(p22)
		if p21.moveTouchObject then
			return Enum.ContextActionResult.Pass;
		end;
		if not p21:InputInFrame(p22) then
			return Enum.ContextActionResult.Pass;
		end;
		if p21.isFirstTouch then
			p21.isFirstTouch = false;
			local v33 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
			l__TweenService__3:Create(p21.startImage, v33, {
				Size = UDim2.new(0, 0, 0, 0)
			}):Play();
			l__TweenService__3:Create(p21.endImage, v33, {
				Size = UDim2.new(0, p21.thumbstickSize, 0, p21.thumbstickSize), 
				ImageColor3 = Color3.new(0, 0, 0)
			}):Play();
		end;
		p21.moveTouchLockedIn = false;
		p21.moveTouchObject = p22;
		p21.moveTouchStartPosition = p22.Position;
		p21.moveTouchFirstChanged = true;
		p21:DoFadeInBackground();
		return Enum.ContextActionResult.Pass;
	end;
	local function u8(p23)
		if p23 ~= p21.moveTouchObject then
			return Enum.ContextActionResult.Pass;
		end;
		if p21.moveTouchFirstChanged then
			p21.moveTouchFirstChanged = false;
			local v34 = Vector2.new(p23.Position.X - p21.thumbstickFrame.AbsolutePosition.X, p23.Position.Y - p21.thumbstickFrame.AbsolutePosition.Y);
			p21.startImage.Visible = true;
			p21.startImage.Position = UDim2.new(0, v34.X, 0, v34.Y);
			p21.endImage.Visible = true;
			p21.endImage.Position = p21.startImage.Position;
			p21:FadeThumbstick(true);
			p21:MoveStick(p23.Position);
		end;
		p21.moveTouchLockedIn = true;
		local v35 = Vector2.new(p23.Position.x - p21.moveTouchStartPosition.x, p23.Position.y - p21.moveTouchStartPosition.y);
		if math.abs(v35.x) > 0 or math.abs(v35.y) > 0 then
			p21:DoMove(v35);
			p21:MoveStick(p23.Position);
		end;
		return Enum.ContextActionResult.Sink;
	end;
	local function u9(p24)
		if p24 == p21.moveTouchObject then
			p21:OnInputEnded();
			if p21.moveTouchLockedIn then
				return Enum.ContextActionResult.Sink;
			end;
		end;
		return Enum.ContextActionResult.Pass;
	end;
	l__ContextActionService__1:BindActionAtPriority("DynamicThumbstickAction", function(p25, p26, p27)
		if p26 == Enum.UserInputState.Begin then
			return u7(p27);
		end;
		if p26 == Enum.UserInputState.Change then
			return u8(p27);
		end;
		if p26 == Enum.UserInputState.End then
			return u9(p27);
		end;
		if p26 == Enum.UserInputState.Cancel then
			p21:OnInputEnded();
		end;
	end, false, l__Value__6, Enum.UserInputType.Touch);
end;
function v8.Create(p28, p29)
	if p28.thumbstickFrame then
		p28.thumbstickFrame:Destroy();
		p28.thumbstickFrame = nil;
		if p28.onRenderSteppedConn then
			p28.onRenderSteppedConn:Disconnect();
			p28.onRenderSteppedConn = nil;
		end;
	end;
	p28.thumbstickSize = 45;
	p28.thumbstickRingSize = 20;
	p28.middleSize = 10;
	p28.middleSpacing = p28.middleSize + 4;
	p28.radiusOfDeadZone = 2;
	p28.radiusOfMaxSpeed = 20;
	local l__AbsoluteSize__36 = p29.AbsoluteSize;
	if math.min(l__AbsoluteSize__36.x, l__AbsoluteSize__36.y) > 500 then
		p28.thumbstickSize = p28.thumbstickSize * 2;
		p28.thumbstickRingSize = p28.thumbstickRingSize * 2;
		p28.middleSize = p28.middleSize * 2;
		p28.middleSpacing = p28.middleSpacing * 2;
		p28.radiusOfDeadZone = p28.radiusOfDeadZone * 2;
		p28.radiusOfMaxSpeed = p28.radiusOfMaxSpeed * 2;
	end;
	local function v37(p30)
		if p30 then
			p28.thumbstickFrame.Size = UDim2.new(1, 0, 0.4, 0);
			p28.thumbstickFrame.Position = UDim2.new(0, 0, 0.6, 0);
			return;
		end;
		p28.thumbstickFrame.Size = UDim2.new(0.4, 0, 0.6666666666666666, 0);
		p28.thumbstickFrame.Position = UDim2.new(0, 0, 0.3333333333333333, 0);
	end;
	p28.thumbstickFrame = Instance.new("Frame");
	p28.thumbstickFrame.BorderSizePixel = 0;
	p28.thumbstickFrame.Name = "DynamicThumbstickFrame";
	p28.thumbstickFrame.Visible = false;
	p28.thumbstickFrame.BackgroundTransparency = 1;
	p28.thumbstickFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
	p28.thumbstickFrame.Active = false;
	v37(false);
	p28.startImage = Instance.new("ImageLabel");
	p28.startImage.Name = "ThumbstickStart";
	p28.startImage.Visible = true;
	p28.startImage.BackgroundTransparency = 1;
	p28.startImage.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png";
	p28.startImage.ImageRectOffset = Vector2.new(1, 1);
	p28.startImage.ImageRectSize = Vector2.new(144, 144);
	p28.startImage.ImageColor3 = Color3.new(0, 0, 0);
	p28.startImage.AnchorPoint = Vector2.new(0.5, 0.5);
	p28.startImage.Position = UDim2.new(0, p28.thumbstickRingSize * 3.3, 1, -p28.thumbstickRingSize * 2.8);
	p28.startImage.Size = UDim2.new(0, p28.thumbstickRingSize * 3.7, 0, p28.thumbstickRingSize * 3.7);
	p28.startImage.ZIndex = 10;
	p28.startImage.Parent = p28.thumbstickFrame;
	p28.endImage = Instance.new("ImageLabel");
	p28.endImage.Name = "ThumbstickEnd";
	p28.endImage.Visible = true;
	p28.endImage.BackgroundTransparency = 1;
	p28.endImage.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png";
	p28.endImage.ImageRectOffset = Vector2.new(1, 1);
	p28.endImage.ImageRectSize = Vector2.new(144, 144);
	p28.endImage.AnchorPoint = Vector2.new(0.5, 0.5);
	p28.endImage.Position = p28.startImage.Position;
	p28.endImage.Size = UDim2.new(0, p28.thumbstickSize * 0.8, 0, p28.thumbstickSize * 0.8);
	p28.endImage.ZIndex = 10;
	p28.endImage.Parent = p28.thumbstickFrame;
	for v38 = 1, u5 do
		p28.middleImages[v38] = Instance.new("ImageLabel");
		p28.middleImages[v38].Name = "ThumbstickMiddle";
		p28.middleImages[v38].Visible = false;
		p28.middleImages[v38].BackgroundTransparency = 1;
		p28.middleImages[v38].Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png";
		p28.middleImages[v38].ImageRectOffset = Vector2.new(1, 1);
		p28.middleImages[v38].ImageRectSize = Vector2.new(144, 144);
		p28.middleImages[v38].ImageTransparency = v1[v38];
		p28.middleImages[v38].AnchorPoint = Vector2.new(0.5, 0.5);
		p28.middleImages[v38].ZIndex = 9;
		p28.middleImages[v38].Parent = p28.thumbstickFrame;
	end;
	local u10 = nil;
	local function v39()
		if u10 then
			u10:Disconnect();
			u10 = nil;
		end;
		local l__CurrentCamera__40 = workspace.CurrentCamera;
		if l__CurrentCamera__40 then
			local function v41()
				local l__ViewportSize__42 = l__CurrentCamera__40.ViewportSize;
				v37(l__ViewportSize__42.X < l__ViewportSize__42.Y);
			end;
			u10 = l__CurrentCamera__40:GetPropertyChangedSignal("ViewportSize"):Connect(v41);
			v41();
		end;
	end;
	workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(v39);
	if workspace.CurrentCamera then
		v39();
	end;
	p28.moveTouchStartPosition = nil;
	p28.startImageFadeTween = nil;
	p28.endImageFadeTween = nil;
	p28.middleImageFadeTweens = {};
	p28.onRenderSteppedConn = l__RunService__5.RenderStepped:Connect(function()
		if p28.tweenInAlphaStart ~= nil then
			local v43 = tick() - p28.tweenInAlphaStart;
			local v44 = p28.fadeInAndOutHalfDuration * 2 * p28.fadeInAndOutBalance;
			p28.thumbstickFrame.BackgroundTransparency = 1 - 0.35 * math.min(v43 / v44, 1);
			if v44 < v43 then
				p28.tweenOutAlphaStart = tick();
				p28.tweenInAlphaStart = nil;
				return;
			end;
		elseif p28.tweenOutAlphaStart ~= nil then
			local v45 = tick() - p28.tweenOutAlphaStart;
			local v46 = p28.fadeInAndOutHalfDuration * 2 - p28.fadeInAndOutHalfDuration * 2 * p28.fadeInAndOutBalance;
			p28.thumbstickFrame.BackgroundTransparency = 0.65 + 0.35 * math.min(v45 / v46, 1);
			if v46 < v45 then
				p28.tweenOutAlphaStart = nil;
			end;
		end;
	end);
	p28.onTouchEndedConn = l__UserInputService__4.TouchEnded:connect(function(p31)
		if p31 == p28.moveTouchObject then
			p28:OnInputEnded();
		end;
	end);
	l__GuiService__3.MenuOpened:connect(function()
		if p28.moveTouchObject then
			p28:OnInputEnded();
		end;
	end);
	local v47 = v6:FindFirstChildOfClass("PlayerGui");
	while not v47 do
		v6.ChildAdded:wait();
		v47 = v6:FindFirstChildOfClass("PlayerGui");	
	end;
	local v48 = true;
	if v47.CurrentScreenOrientation ~= Enum.ScreenOrientation.LandscapeLeft then
		v48 = v47.CurrentScreenOrientation == Enum.ScreenOrientation.LandscapeRight;
	end;
	local u11 = nil;
	local function u12()
		p28.fadeInAndOutHalfDuration = 2.5;
		p28.fadeInAndOutBalance = 0.05;
		p28.tweenInAlphaStart = tick();
	end;
	u11 = v47:GetPropertyChangedSignal("CurrentScreenOrientation"):Connect(function()
		if not (not v48) and v47.CurrentScreenOrientation == Enum.ScreenOrientation.Portrait or not v48 and v47.CurrentScreenOrientation ~= Enum.ScreenOrientation.Portrait then
			u11:disconnect();
			u12();
			if v48 then
				p28.hasFadedBackgroundInPortrait = true;
				return;
			end;
			p28.hasFadedBackgroundInLandscape = true;
		end;
	end);
	p28.thumbstickFrame.Parent = p29;
	if game:IsLoaded() then
		u12();
	else
		coroutine.wrap(function()
			game.Loaded:Wait();
			u12();
		end)();
	end;
end;
return v8;
