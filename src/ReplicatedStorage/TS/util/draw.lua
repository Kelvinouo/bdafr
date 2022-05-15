
-- Decompiled with the Synapse X Luau decompiler.

local l__Workspace__1 = game:GetService("Workspace");
local v2 = Color3.new(1, 0, 0);
local u1 = {
	_defaultColor = v2, 
	setColor = function(p1)
		u1._defaultColor = p1;
	end
};
function u1.resetColor()
	u1._defaultColor = v2;
end;
function u1.setRandomColor()
	u1.setColor(Color3.fromHSV(math.random(), 0.5 + 0.5 * math.random(), 1));
end;
function u1.ray(p2, p3, p4, p5, p6)
	assert(typeof(p2) == "Ray", "Bad typeof(ray) for Ray");
	p3 = p3 or u1._defaultColor;
	p4 = p4 or u1.getDefaultParent();
	p5 = p5 and 0.2;
	p6 = p6 and 0.2;
	local v3 = Instance.new("Part");
	v3.Material = Enum.Material.ForceField;
	v3.Anchored = true;
	v3.Archivable = false;
	v3.CanCollide = false;
	v3.CastShadow = false;
	v3.CFrame = CFrame.new(p2.Origin + p2.Direction / 2, p2.Origin + p2.Direction) * CFrame.Angles(math.pi / 2, 0, 0);
	v3.Color = p3;
	v3.Name = "DebugRay";
	v3.Shape = Enum.PartType.Cylinder;
	v3.Size = Vector3.new(p6, p2.Direction.Magnitude, p6);
	v3.TopSurface = Enum.SurfaceType.Smooth;
	v3.Transparency = 0.5;
	local v4 = Instance.new("Part");
	v4.Name = "RotatedPart";
	v4.Anchored = true;
	v4.Archivable = false;
	v4.CanCollide = false;
	v4.CastShadow = false;
	v4.CFrame = CFrame.new(p2.Origin, p2.Origin + p2.Direction);
	v4.Transparency = 1;
	v4.Size = Vector3.new(1, 1, 1);
	v4.Parent = v3;
	local v5 = Instance.new("LineHandleAdornment");
	v5.Name = "DrawRayLineHandleAdornment";
	v5.Length = p2.Direction.Magnitude;
	v5.Thickness = 5 * p6;
	v5.ZIndex = 3;
	v5.Color3 = p3;
	v5.AlwaysOnTop = true;
	v5.Transparency = 0;
	v5.Adornee = v4;
	v5.Parent = v4;
	local v6 = Instance.new("SpecialMesh");
	v6.Name = "DrawRayMesh";
	v6.Scale = Vector3.new(0, 1, 0) + Vector3.new(p5, 0, p5) / p6;
	v6.Parent = v3;
	v3.Parent = p4;
	return v3;
end;
function u1.updateRay(p7, p8, p9)
	p9 = p9 or p7.Color;
	local l__x__7 = p7.Size.x;
	p7.CFrame = CFrame.new(p8.Origin + p8.Direction / 2, p8.Origin + p8.Direction) * CFrame.Angles(math.pi / 2, 0, 0);
	p7.Size = Vector3.new(l__x__7, p8.Direction.Magnitude, l__x__7);
	p7.Color = p9;
	local l__RotatedPart__8 = p7:FindFirstChild("RotatedPart");
	if l__RotatedPart__8 then
		l__RotatedPart__8.CFrame = CFrame.new(p8.Origin, p8.Origin + p8.Direction);
	end;
	local v9 = l__RotatedPart__8 and l__RotatedPart__8:FindFirstChild("DrawRayLineHandleAdornment");
	if v9 then
		v9.Length = p8.Direction.Magnitude;
		v9.Thickness = 5 * l__x__7;
		v9.Color3 = p9;
	end;
end;
local l__Terrain__2 = l__Workspace__1.Terrain;
function u1.text(p10, p11, p12)
	if typeof(p10) == "Vector3" then
		local v10 = Instance.new("Attachment");
		v10.WorldPosition = p10;
		v10.Parent = l__Terrain__2;
		v10.Name = "DebugTextAttachment";
		u1._textOnAdornee(v10, p11, p12);
		return v10;
	end;
	if typeof(p10) ~= "Instance" then
		error("Bad adornee");
		return;
	end;
	return u1._textOnAdornee(p10, p11, p12);
end;
local l__TextService__3 = game:GetService("TextService");
function u1._textOnAdornee(p13, p14, p15)
	local v11 = Instance.new("BillboardGui");
	v11.Name = "DebugBillboardGui";
	v11.SizeOffset = Vector2.new(0, 0.5);
	v11.ExtentsOffset = Vector3.new(0, 1, 0);
	v11.AlwaysOnTop = true;
	v11.Adornee = p13;
	v11.StudsOffset = Vector3.new(0, 0, 0.01);
	local v12 = Instance.new("Frame");
	v12.Name = "Background";
	v12.Size = UDim2.new(1, 0, 1, 0);
	v12.Position = UDim2.new(0.5, 0, 1, 0);
	v12.AnchorPoint = Vector2.new(0.5, 1);
	v12.BackgroundTransparency = 0.3;
	v12.BorderSizePixel = 0;
	v12.BackgroundColor3 = p15 or u1._defaultColor;
	v12.Parent = v11;
	local v13 = Instance.new("TextLabel");
	v13.Text = tostring(p14);
	v13.TextScaled = true;
	v13.TextSize = 32;
	v13.BackgroundTransparency = 1;
	v13.BorderSizePixel = 0;
	v13.TextColor3 = Color3.new(1, 1, 1);
	v13.Size = UDim2.new(1, 0, 1, 0);
	v13.Parent = v12;
	if tonumber(p14) then
		v13.Font = Enum.Font.Code;
	else
		v13.Font = Enum.Font.GothamSemibold;
	end;
	local v14 = l__TextService__3:GetTextSize(v13.Text, v13.TextSize, v13.Font, Vector2.new(1024, 1000000));
	local v15 = v13.TextSize * 0.5;
	local v16 = v14.y + 2 * v15;
	local v17 = v14.x + 2 * v15;
	local v18 = v17 / v16;
	local v19 = Instance.new("UIAspectRatioConstraint");
	v19.AspectRatio = v18;
	v19.Parent = v12;
	local v20 = Instance.new("UIPadding");
	v20.PaddingBottom = UDim.new(v15 / v16, 0);
	v20.PaddingTop = UDim.new(v15 / v16, 0);
	v20.PaddingLeft = UDim.new(v15 / v17, 0);
	v20.PaddingRight = UDim.new(v15 / v17, 0);
	v20.Parent = v12;
	local v21 = Instance.new("UICorner");
	v21.CornerRadius = UDim.new(v15 / v16 / 2, 0);
	v21.Parent = v12;
	local v22 = v14.y / v13.TextSize * 2 * 2 * 0.5;
	v11.Size = UDim2.new(v22 * v18, 0, v22, 0);
	v11.Parent = p13;
	return v11;
end;
function u1.sphere(p16, p17, p18, p19)
	return u1.point(p16, p18, p19, p17 * 2);
end;
function u1.point(p20, p21, p22, p23)
	if typeof(p20) == "CFrame" then
		p20 = p20.p;
	end;
	assert(typeof(p20) == "Vector3", "Bad vector3");
	p21 = p21 or u1._defaultColor;
	p22 = p22 or u1.getDefaultParent();
	p23 = p23 and 1;
	local v23 = Instance.new("Part");
	v23.Material = Enum.Material.ForceField;
	v23.Anchored = true;
	v23.Archivable = false;
	v23.BottomSurface = Enum.SurfaceType.Smooth;
	v23.CanCollide = false;
	v23.CastShadow = false;
	v23.CFrame = CFrame.new(p20);
	v23.Color = p21;
	v23.Name = "DebugPoint";
	v23.Shape = Enum.PartType.Ball;
	v23.Size = Vector3.new(p23, p23, p23);
	v23.TopSurface = Enum.SurfaceType.Smooth;
	v23.Transparency = 0.5;
	local v24 = Instance.new("SphereHandleAdornment");
	v24.Archivable = false;
	v24.Radius = p23 / 4;
	v24.Color3 = p21;
	v24.AlwaysOnTop = true;
	v24.Adornee = v23;
	v24.ZIndex = 2;
	v24.Parent = v23;
	v23.Parent = p22;
	return v23;
end;
function u1.labelledPoint(p24, p25, p26, p27)
	if typeof(p24) == "CFrame" then
		p24 = p24.p;
	end;
	local v25 = u1.point(p24, p26, p27);
	u1.text(v25, p25, p26);
	return v25;
end;
function u1.cframe(p28)
	local v26 = Instance.new("Model");
	v26.Name = "DebugCFrame";
	local l__Position__27 = p28.Position;
	u1.point(l__Position__27, nil, v26, 0.1);
	u1.ray(Ray.new(l__Position__27, p28.XVector), Color3.new(0.75, 0.25, 0.25), v26, 0.1).Name = "XVector";
	u1.ray(Ray.new(l__Position__27, p28.YVector), Color3.new(0.25, 0.75, 0.25), v26, 0.1).Name = "YVector";
	u1.ray(Ray.new(l__Position__27, p28.ZVector), Color3.new(0.25, 0.25, 0.75), v26, 0.1).Name = "ZVector";
	v26.Parent = u1.getDefaultParent();
	return v26;
end;
function u1.box(p29, p30, p31)
	assert(typeof(p30) == "Vector3", "Bad size");
	p31 = p31 or u1._defaultColor;
	p29 = typeof(p29) == "Vector3" and CFrame.new(p29) or p29;
	local v28 = Instance.new("Part");
	v28.Color = p31;
	v28.Material = Enum.Material.ForceField;
	v28.Name = "DebugPart";
	v28.Anchored = true;
	v28.CanCollide = false;
	v28.CastShadow = false;
	v28.Archivable = false;
	v28.BottomSurface = Enum.SurfaceType.Smooth;
	v28.TopSurface = Enum.SurfaceType.Smooth;
	v28.Transparency = 0.75;
	v28.Size = p30;
	v28.CFrame = p29;
	local v29 = Instance.new("BoxHandleAdornment");
	v29.Adornee = v28;
	v29.Size = p30;
	v29.Color3 = p31;
	v29.AlwaysOnTop = true;
	v29.Transparency = 0.75;
	v29.ZIndex = 1;
	v29.Parent = v28;
	v28.Parent = u1.getDefaultParent();
	return v28;
end;
function u1.region3(p32, p33)
	return u1.box(p32.CFrame, p32.Size, p33);
end;
function u1.terrainCell(p34, p35)
	local v30 = l__Terrain__2:WorldToCell(p34);
	local v31 = u1.box(CFrame.new((l__Terrain__2:CellCenterToWorld(v30.x, v30.y, v30.z))), Vector3.new(4, 4, 4), p35);
	v31.Name = "DebugTerrainCell";
	return v31;
end;
function u1.vector(p36, p37, p38, p39, p40)
	return u1.ray(Ray.new(p36, p37), p38, p39, p40);
end;
local l__RunService__4 = game:GetService("RunService");
function u1.getDefaultParent()
	if not l__RunService__4:IsRunning() then
		return l__Workspace__1.CurrentCamera;
	end;
	return l__RunService__4:IsServer() and l__Workspace__1 or l__Workspace__1.CurrentCamera;
end;
return u1;

