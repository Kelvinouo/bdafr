-- Script Hash: 1b18b46987ffe09ff10be1a306bb7781e5909272f7b5e51541e7011ee8aff181a1594d7d56b91aeccabfdc510a81ac47
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
local function u8()
	local l__CurrentCamera__24 = l__Workspace__7.CurrentCamera;
	local v25 = l__CurrentCamera__24:FindFirstChild("ClickToMoveDisplay");
	if not v25 then
		v25 = Instance.new("Model");
		v25.Name = "ClickToMoveDisplay";
		v25.Parent = l__CurrentCamera__24;
	end;
	return v25;
end;
local v26 = {};
v26.__index = v26;
function v26.Destroy(p1)
	p1.DisplayModel:Destroy();
end;
local u9 = v21;
local function u10(p2, p3)
	local v27, v28, v29 = l__Workspace__7:FindPartOnRayWithIgnoreList(Ray.new(p3 + Vector3.new(0, 2.5, 0), Vector3.new(0, -10, 0)), { l__Workspace__7.CurrentCamera, l__LocalPlayer__8.Character });
	if v27 then
		p2.CFrame = CFrame.new(v28, v28 + v29);
		p2.Parent = u8();
	end;
end;
function v26.NewDisplayModel(p4, p5)
	local v30 = u9:Clone();
	u10(v30, p5);
	return v30;
end;
function v26.new(p6, p7)
	local v31 = setmetatable({}, v26);
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
local u11 = v22;
function v32.NewDisplayModel(p9, p10)
	local v33 = u11:Clone();
	u10(v33, p10);
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
	if p16 and (p16 - p14).magnitude > 5 then
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
local u12 = v23;
function v37.NewDisplayModel(p19, p20)
	local v38 = u12:Clone();
	u10(v38, p20);
	local v39, v40, v41 = l__Workspace__7:FindPartOnRayWithIgnoreList(Ray.new(p20 + Vector3.new(0, 2.5, 0), Vector3.new(0, -10, 0)), { l__Workspace__7.CurrentCamera, l__LocalPlayer__8.Character });
	if v39 then
		v38.CFrame = CFrame.new(v40, v40 + v41);
		v38.Parent = u8();
	end;
	return v38;
end;
function v37.RunFailureTween(p21)
	wait(0.125);
	local v42 = TweenInfo.new(0.0625, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
	local v43 = l__TweenService__5:Create(p21.DisplayModel.FailureWaypointBillboard, v42, {
		SizeOffset = v3
	});
	v43:Play();
	l__TweenService__5:Create(p21.DisplayModel.FailureWaypointBillboard.Frame, v42, {
		Rotation = 10
	}):Play();
	v43.Completed:wait();
	local v44 = l__TweenService__5:Create(p21.DisplayModel.FailureWaypointBillboard, TweenInfo.new(0.125, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 3, true), {
		SizeOffset = v4
	});
	v44:Play();
	local v45 = TweenInfo.new(0.125, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 3, true);
	l__TweenService__5:Create(p21.DisplayModel.FailureWaypointBillboard.Frame.ImageLabel, v45, {
		ImageColor3 = Color3.new(0.75, 0.75, 0.75)
	}):Play();
	l__TweenService__5:Create(p21.DisplayModel.FailureWaypointBillboard.Frame, v45, {
		Rotation = -10
	}):Play();
	v44.Completed:wait();
	local v46 = TweenInfo.new(0.0625, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
	local v47 = l__TweenService__5:Create(p21.DisplayModel.FailureWaypointBillboard, v46, {
		SizeOffset = u7
	});
	v47:Play();
	l__TweenService__5:Create(p21.DisplayModel.FailureWaypointBillboard.Frame, v46, {
		Rotation = 0
	}):Play();
	v47.Completed:wait();
	wait(0.125);
end;
function v37.new(p22)
	local v48 = setmetatable({}, v37);
	v48.DisplayModel = v48:NewDisplayModel(p22);
	return v48;
end;
local v49 = Instance.new("Animation");
v49.AnimationId = "rbxassetid://2874840706";
local u13 = nil;
local u14 = 0;
local function u15(p23, p24)
	local v50 = {};
	local v51 = 1;
	for v52 = 1, #p23 - 1 do
		local v53 = false;
		if v52 % 2 == 0 then
			v53 = not ((p23[v52].Position - p23[#p23].Position).magnitude < 3);
		end;
		if v53 then
			v50[v51] = v26.new(p23[v52].Position, v52);
			v51 = v51 + 1;
		end;
	end;
	table.insert(v50, (v32.new(p23[#p23].Position, #p23, p24)));
	local v54 = {};
	local v55 = 1;
	for v56 = #v50, 1, -1 do
		v54[v55] = v50[v56];
		v55 = v55 + 1;
	end;
	return v54;
end;
local function u16(p25, p26)
	return p26 * (1 + 1.5 * (math.clamp(p25 - 10, 0, 90) / 90));
end;
function v1.CreatePathDisplay(p27, p28)
	u14 = u14 + 1;
	local u17 = u15(p27, p28);
	local u18 = "ClickToMoveResizeTrail" .. u14;
	l__RunService__6:BindToRenderStep(u18, Enum.RenderPriority.Camera.Value - 1, function()
		if #u17 == 0 then
			l__RunService__6:UnbindFromRenderStep(u18);
			return;
		end;
		local l__p__57 = l__Workspace__7.CurrentCamera.CFrame.p;
		for v58 = 1, #u17 do
			local l__TrailDotImage__59 = u17[v58].DisplayModel:FindFirstChild("TrailDotImage");
			if l__TrailDotImage__59 then
				l__TrailDotImage__59.Size = u16((u17[v58].DisplayModel.Position - l__p__57).magnitude, u1);
			end;
		end;
	end);
	local function u19(p29)
		for v60 = #u17, 1, -1 do
			local v61 = u17[v60];
			if not (v61.ClosestWayPoint <= p29) then
				break;
			end;
			v61:Destroy();
			u17[v60] = nil;
		end;
	end;
	return function()
		u19(#p27);
	end, u19;
end;
local u20 = nil;
function v1.DisplayFailureWaypoint(p30)
	if u20 then
		u20:Hide();
	end;
	local v62 = v37.new(p30);
	u20 = v62;
	local u21 = v62;
	coroutine.wrap(function()
		u21:RunFailureTween();
		u21:Destroy();
		u21 = nil;
	end)();
end;
function v1.CreateEndWaypoint(p31)
	return v32.new(p31);
end;
local function u22()
	local l__Character__63 = l__LocalPlayer__8.Character;
	if not l__Character__63 then
		return;
	end;
	return l__Character__63:FindFirstChildOfClass("Humanoid");
end;
local function u23(p32)
	if p32 == nil then
		return u13;
	end;
	u13 = p32:LoadAnimation(v49);
	u13.Priority = Enum.AnimationPriority.Action;
	u13.Looped = false;
	return u13;
end;
function v1.PlayFailureAnimation()
	local v64 = u22();
	if v64 then
		u23(v64):Play();
	end;
end;
function v1.CancelFailureAnimation()
	if u13 ~= nil and u13.IsPlaying then
		u13:Stop();
	end;
end;
function v1.SetWaypointTexture(p33)
	u3 = p33;
	local v65, v66, v67 = v9();
	u9 = v65;
	u11 = v66;
	u12 = v67;
end;
function v1.GetWaypointTexture()
	return u3;
end;
function v1.SetWaypointRadius(p34)
	u1 = Vector2.new(p34, p34);
	local v68, v69, v70 = v9();
	u9 = v68;
	u11 = v69;
	u12 = v70;
end;
function v1.GetWaypointRadius()
	return u1.X;
end;
function v1.SetEndWaypointTexture(p35)
	u6 = p35;
	local v71, v72, v73 = v9();
	u9 = v71;
	u11 = v72;
	u12 = v73;
end;
function v1.GetEndWaypointTexture()
	return u6;
end;
function v1.SetWaypointsAlwaysOnTop(p36)
	u2 = p36;
	local v74, v75, v76 = v9();
	u9 = v74;
	u11 = v75;
	u12 = v76;
end;
function v1.GetWaypointsAlwaysOnTop()
	return u2;
end;
return v1;
