-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local v2 = Vector2.new(0, 1);
local v3 = Vector2.new(0.1, 0.5);
local v4 = Vector2.new(-0.1, 0.5);
local l__TweenService__5 = game:GetService("TweenService");
local l__RunService__6 = game:GetService("RunService");
local l__Workspace__7 = game:GetService("Workspace");
local l__LocalPlayer__8 = game:GetService("Players").LocalPlayer;
local u1 = Vector2.new(1.5, 1.5);
local u2 = false;
local u3 = "rbxasset://textures/ui/traildot.png";
local u4 = UDim2.new(0, 42, 0, 50);
local u5 = Vector2.new(0, 0.5);
local u6 = "rbxasset://textures/ui/waypoint.png";
local u7 = Vector2.new(0, 0.5);
local function v9()
	local v10 = Instance.new("Part");
	v10.Size = Vector3.new(1, 1, 1);
	v10.Anchored = true;
	v10.CanCollide = false;
	v10.Name = "TrailDot";
	v10.Transparency = 1;
	local v11 = Instance.new("ImageHandleAdornment");
	v11.Name = "TrailDotImage";
	v11.Size = u1;
	v11.SizeRelativeOffset = Vector3.new(0, 0, -0.1);
	v11.AlwaysOnTop = u2;
	v11.Image = u3;
	v11.Adornee = v10;
	v11.Parent = v10;
	local v12 = Instance.new("Part");
	v12.Size = Vector3.new(2, 2, 2);
	v12.Anchored = true;
	v12.CanCollide = false;
	v12.Name = "EndWaypoint";
	v12.Transparency = 1;
	local v13 = Instance.new("ImageHandleAdornment");
	v13.Name = "TrailDotImage";
	v13.Size = u1;
	v13.SizeRelativeOffset = Vector3.new(0, 0, -0.1);
	v13.AlwaysOnTop = u2;
	v13.Image = u3;
	v13.Adornee = v12;
	v13.Parent = v12;
	local v14 = Instance.new("BillboardGui");
	v14.Name = "EndWaypointBillboard";
	v14.Size = u4;
	v14.LightInfluence = 0;
	v14.SizeOffset = u5;
	v14.AlwaysOnTop = true;
	v14.Adornee = v12;
	v14.Parent = v12;
	local v15 = Instance.new("ImageLabel");
	v15.Image = u6;
	v15.BackgroundTransparency = 1;
	v15.Size = UDim2.new(1, 0, 1, 0);
	v15.Parent = v14;
	local v16 = Instance.new("Part");
	v16.Size = Vector3.new(2, 2, 2);
	v16.Anchored = true;
	v16.CanCollide = false;
	v16.Name = "FailureWaypoint";
	v16.Transparency = 1;
	local v17 = Instance.new("ImageHandleAdornment");
	v17.Name = "TrailDotImage";
	v17.Size = u1;
	v17.SizeRelativeOffset = Vector3.new(0, 0, -0.1);
	v17.AlwaysOnTop = u2;
	v17.Image = u3;
	v17.Adornee = v16;
	v17.Parent = v16;
	local v18 = Instance.new("BillboardGui");
	v18.Name = "FailureWaypointBillboard";
	v18.Size = u4;
	v18.LightInfluence = 0;
	v18.SizeOffset = u7;
	v18.AlwaysOnTop = true;
	v18.Adornee = v16;
	v18.Parent = v16;
	local v19 = Instance.new("Frame");
	v19.BackgroundTransparency = 1;
	v19.Size = UDim2.new(0, 0, 0, 0);
	v19.Position = UDim2.new(0.5, 0, 1, 0);
	v19.Parent = v18;
	local v20 = Instance.new("ImageLabel");
	v20.Image = u6;
	v20.BackgroundTransparency = 1;
	v20.Position = UDim2.new(0, -u4.X.Offset / 2, 0, -u4.Y.Offset);
	v20.Size = u4;
	v20.Parent = v19;
	return v10, v12, v16;
end;
local v21, v22, v23 = v9();
local v24 = {};
v24.__index = v24;
function v24.Destroy(p1)
	p1.DisplayModel:Destroy();
end;
local u8 = v21;
local function u9(p2, p3)
	local v25, v26, v27 = l__Workspace__7:FindPartOnRayWithIgnoreList(Ray.new(p3 + Vector3.new(0, 2.5, 0), Vector3.new(0, -10, 0)), { l__Workspace__7.CurrentCamera, l__LocalPlayer__8.Character });
	if v25 then
		p2.CFrame = CFrame.new(v26, v26 + v27);
		local l__CurrentCamera__28 = l__Workspace__7.CurrentCamera;
		local v29 = l__CurrentCamera__28:FindFirstChild("ClickToMoveDisplay");
		if not v29 then
			v29 = Instance.new("Model");
			v29.Name = "ClickToMoveDisplay";
			v29.Parent = l__CurrentCamera__28;
		end;
		p2.Parent = v29;
	end;
end;
function v24.NewDisplayModel(p4, p5)
	local v30 = u8:Clone();
	u9(v30, p5);
	return v30;
end;
function v24.new(p6, p7)
	local v31 = setmetatable({}, v24);
	v31.DisplayModel = v31:NewDisplayModel(p6);
	v31.ClosestWayPoint = p7;
	return v31;
end;
local v32 = {};
v32.__index = v32;
function v32.Destroy(p8)
	p8.Destroyed = true;
	p8.Tween:Cancel();
	p8.DisplayModel:Destroy();
end;
local u10 = v22;
function v32.NewDisplayModel(p9, p10)
	local v33 = u10:Clone();
	u9(v33, p10);
	return v33;
end;
function v32.CreateTween(p11)
	local v34 = l__TweenService__5:Create(p11.DisplayModel.EndWaypointBillboard, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, -1, true), {
		SizeOffset = v2
	});
	v34:Play();
	return v34;
end;
function v32.TweenInFrom(p12, p13)
	p12.DisplayModel.EndWaypointBillboard.StudsOffset = Vector3.new(0, (p13 - p12.DisplayModel.Position).Y, 0);
	local v35 = l__TweenService__5:Create(p12.DisplayModel.EndWaypointBillboard, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		StudsOffset = Vector3.new(0, 0, 0)
	});
	v35:Play();
	return v35;
end;
function v32.new(p14, p15, p16)
	local v36 = setmetatable({}, v32);
	v36.DisplayModel = v36:NewDisplayModel(p14);
	v36.Destroyed = false;
	if p16 and (p16 - p14).Magnitude > 5 then
		v36.Tween = v36:TweenInFrom(p16);
		coroutine.wrap(function()
			v36.Tween.Completed:Wait();
			if not v36.Destroyed then
				v36.Tween = v36:CreateTween();
			end;
		end)();
	else
		v36.Tween = v36:CreateTween();
	end;
	v36.ClosestWayPoint = p15;
	return v36;
end;
local v37 = {};
v37.__index = v37;
function v37.Hide(p17)
	p17.DisplayModel.Parent = nil;
end;
function v37.Destroy(p18)
	p18.DisplayModel:Destroy();
end;
local u11 = v23;
function v37.NewDisplayModel(p19, p20)
	local v38 = u11:Clone();
	u9(v38, p20);
	local v39, v40, v41 = l__Workspace__7:FindPartOnRayWithIgnoreList(Ray.new(p20 + Vector3.new(0, 2.5, 0), Vector3.new(0, -10, 0)), { l__Workspace__7.CurrentCamera, l__LocalPlayer__8.Character });
	if v39 then
		v38.CFrame = CFrame.new(v40, v40 + v41);
		local l__CurrentCamera__42 = l__Workspace__7.CurrentCamera;
		local v43 = l__CurrentCamera__42:FindFirstChild("ClickToMoveDisplay");
		if not v43 then
			v43 = Instance.new("Model");
			v43.Name = "ClickToMoveDisplay";
			v43.Parent = l__CurrentCamera__42;
		end;
		v38.Parent = v43;
	end;
	return v38;
end;
function v37.RunFailureTween(p21)
	wait(0.125);
	local v44 = TweenInfo.new(0.0625, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
	local v45 = l__TweenService__5:Create(p21.DisplayModel.FailureWaypointBillboard, v44, {
		SizeOffset = v3
	});
	v45:Play();
	l__TweenService__5:Create(p21.DisplayModel.FailureWaypointBillboard.Frame, v44, {
		Rotation = 10
	}):Play();
	v45.Completed:wait();
	local v46 = l__TweenService__5:Create(p21.DisplayModel.FailureWaypointBillboard, TweenInfo.new(0.125, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 3, true), {
		SizeOffset = v4
	});
	v46:Play();
	local v47 = TweenInfo.new(0.125, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 3, true);
	l__TweenService__5:Create(p21.DisplayModel.FailureWaypointBillboard.Frame.ImageLabel, v47, {
		ImageColor3 = Color3.new(0.75, 0.75, 0.75)
	}):Play();
	l__TweenService__5:Create(p21.DisplayModel.FailureWaypointBillboard.Frame, v47, {
		Rotation = -10
	}):Play();
	v46.Completed:wait();
	local v48 = TweenInfo.new(0.0625, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
	local v49 = l__TweenService__5:Create(p21.DisplayModel.FailureWaypointBillboard, v48, {
		SizeOffset = u7
	});
	v49:Play();
	l__TweenService__5:Create(p21.DisplayModel.FailureWaypointBillboard.Frame, v48, {
		Rotation = 0
	}):Play();
	v49.Completed:wait();
	wait(0.125);
end;
function v37.new(p22)
	local v50 = setmetatable({}, v37);
	v50.DisplayModel = v50:NewDisplayModel(p22);
	return v50;
end;
local v51 = Instance.new("Animation");
v51.AnimationId = "rbxassetid://2874840706";
local u12 = nil;
local u13 = 0;
local function u14(p23, p24)
	local v52 = {};
	local v53 = 1;
	for v54 = 1, #p23 - 1 do
		local v55 = false;
		if v54 % 2 == 0 then
			v55 = not ((p23[v54].Position - p23[#p23].Position).Magnitude < 3);
		end;
		if v55 then
			v52[v53] = v24.new(p23[v54].Position, v54);
			v53 = v53 + 1;
		end;
	end;
	table.insert(v52, (v32.new(p23[#p23].Position, #p23, p24)));
	local v56 = {};
	local v57 = 1;
	for v58 = #v52, 1, -1 do
		v56[v57] = v52[v58];
		v57 = v57 + 1;
	end;
	return v56;
end;
function v1.CreatePathDisplay(p25, p26)
	u13 = u13 + 1;
	local u15 = u14(p25, p26);
	local u16 = "ClickToMoveResizeTrail" .. u13;
	l__RunService__6:BindToRenderStep(u16, Enum.RenderPriority.Camera.Value - 1, function()
		if #u15 == 0 then
			l__RunService__6:UnbindFromRenderStep(u16);
			return;
		end;
		local l__p__59 = l__Workspace__7.CurrentCamera.CFrame.p;
		for v60 = 1, #u15 do
			local l__TrailDotImage__61 = u15[v60].DisplayModel:FindFirstChild("TrailDotImage");
			if l__TrailDotImage__61 then
				l__TrailDotImage__61.Size = u1 * (1 + 1.5 * (math.clamp((u15[v60].DisplayModel.Position - l__p__59).Magnitude - 10, 0, 90) / 90));
			end;
		end;
	end);
	local function u17(p27)
		for v62 = #u15, 1, -1 do
			local v63 = u15[v62];
			if not (v63.ClosestWayPoint <= p27) then
				break;
			end;
			v63:Destroy();
			u15[v62] = nil;
		end;
	end;
	return function()
		u17(#p25);
	end, u17;
end;
local u18 = nil;
function v1.DisplayFailureWaypoint(p28)
	if u18 then
		u18:Hide();
	end;
	local v64 = v37.new(p28);
	u18 = v64;
	local u19 = v64;
	coroutine.wrap(function()
		u19:RunFailureTween();
		u19:Destroy();
		u19 = nil;
	end)();
end;
function v1.CreateEndWaypoint(p29)
	return v32.new(p29);
end;
function v1.PlayFailureAnimation()
	local l__Character__65 = l__LocalPlayer__8.Character;
	if l__Character__65 then
		local v66 = l__Character__65:FindFirstChildOfClass("Humanoid");
	else
		v66 = nil;
	end;
	if v66 then
		if v66 == nil then
			local v67 = u12;
		else
			u12 = v66:LoadAnimation(v51);
			assert(u12, "");
			u12.Priority = Enum.AnimationPriority.Action;
			u12.Looped = false;
			v67 = u12;
		end;
		v67:Play();
	end;
end;
function v1.CancelFailureAnimation()
	if u12 ~= nil and u12.IsPlaying then
		u12:Stop();
	end;
end;
function v1.SetWaypointTexture(p30)
	u3 = p30;
	local v68, v69, v70 = v9();
	u8 = v68;
	u10 = v69;
	u11 = v70;
end;
function v1.GetWaypointTexture()
	return u3;
end;
function v1.SetWaypointRadius(p31)
	u1 = Vector2.new(p31, p31);
	local v71, v72, v73 = v9();
	u8 = v71;
	u10 = v72;
	u11 = v73;
end;
function v1.GetWaypointRadius()
	return u1.X;
end;
function v1.SetEndWaypointTexture(p32)
	u6 = p32;
	local v74, v75, v76 = v9();
	u8 = v74;
	u10 = v75;
	u11 = v76;
end;
function v1.GetEndWaypointTexture()
	return u6;
end;
function v1.SetWaypointsAlwaysOnTop(p33)
	u2 = p33;
	local v77, v78, v79 = v9();
	u8 = v77;
	u10 = v78;
	u11 = v79;
end;
function v1.GetWaypointsAlwaysOnTop()
	return u2;
end;
return v1;
