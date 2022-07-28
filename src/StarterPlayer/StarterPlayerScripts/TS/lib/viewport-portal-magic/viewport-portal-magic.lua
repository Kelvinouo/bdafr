-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v3 = {};
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__2 = v2.Workspace;
local l__Lighting__3 = v2.Lighting;
local function v4(p1, p2)
	local v5 = u1("Camera", {
		FieldOfView = l__Workspace__2.CurrentCamera.FieldOfView, 
		CFrame = l__Workspace__2.CurrentCamera.CFrame
	});
	local v6 = u1("ViewportFrame", {
		Size = UDim2.fromScale(1, 1), 
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(1, 1), 
		LightColor = Color3.fromRGB(214, 74, 172), 
		LightDirection = l__Lighting__3:GetSunDirection(), 
		CurrentCamera = v5, 
		BackgroundTransparency = 1
	});
	local v7 = u1("WorldModel", {
		Parent = v6
	});
	v5.Parent = v6;
	p2.Archivable = true;
	local v8 = p2:Clone();
	v8:SetPrimaryPartCFrame(p1);
	v8.Parent = v7;
	return {
		viewportFrame = v6, 
		clone = v8, 
		worldModel = v7, 
		camera = v5
	};
end;
v3.createViewportSetup = v4;
local function v9(p3)
	local l__Adornee__10 = p3.Adornee;
	if l__Adornee__10 == nil then
		return nil;
	end;
	local v11 = Vector3.FromNormalId(p3.Face) * -1;
	if math.abs(v11.Y) == 1 then
		local v12 = Vector3.new(v11.Y, 0, 0);
	else
		v12 = Vector3.new(0, 1, 0);
	end;
	local v13 = CFrame.fromAxisAngle(v12, math.pi / 2) * v11;
	local l__Unit__14 = v11:Cross(v13).Unit;
	return {
		cf = l__Adornee__10.CFrame * CFrame.fromMatrix(v11 * -1 * (l__Adornee__10.Size / 2), v13, l__Unit__14, v11), 
		size = Vector2.new((l__Adornee__10.Size * v13).Magnitude, (l__Adornee__10.Size * l__Unit__14).Magnitude)
	};
end;
v3.getSurfaceInfo = v9;
local l__DeviceUtil__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).DeviceUtil;
local l__StarterGui__5 = v2.StarterGui;
local l__Players__6 = v2.Players;
function v3.createFaces(p4, p5)
	local v15 = {};
	for v16, v17 in ipairs(Enum.NormalId:GetEnumItems()) do
		local v18 = v4(p5:GetPrimaryPartCFrame(), p5);
		local v19 = {};
		local v20 = {
			ResetOnSpawn = false, 
			Adornee = p4, 
			Face = v17, 
			SizingMode = Enum.SurfaceGuiSizingMode.FixedSize, 
			CanvasSize = Vector2.new(800, 800), 
			Children = { v18.viewportFrame }, 
			ClipsDescendants = true
		};
		if l__DeviceUtil__4.isHoarceKat() then
			local v21 = l__StarterGui__5;
		else
			v21 = l__Players__6.LocalPlayer:FindFirstChildOfClass("PlayerGui");
		end;
		v20.Parent = v21;
		v19.surfaceGui = u1("SurfaceGui", v20);
		v19.slice = v18;
		v15[v17] = v19;
	end;
	return v15;
end;
function v3.update(p6, p7)
	local v22 = v9(p6);
	if v22 == nil then
		return nil;
	end;
	local l__Y__23 = l__Workspace__2.CurrentCamera.ViewportSize.Y;
	local v24 = v22.cf:PointToObjectSpace(l__Workspace__2.CurrentCamera.CFrame.Position);
	local v25 = v24.X / v22.size.X;
	local v26 = v24.Y / v22.size.Y;
	local v27 = 1 + math.abs(v25) * 2;
	local v28 = 1 + math.abs(v26) * 2;
	local v29 = math.sqrt(v27 * v27 + v28 * v28);
	local v30 = (l__Workspace__2.CurrentCamera.CFrame.Position - v22.cf.Position):Dot(v22.cf.LookVector);
	local v31 = 2 * math.atan2(v22.size.Y / 2, v30);
	local v32 = math.clamp(math.deg(v31), 1, 120);
	local v33 = math.tan(math.rad(v32) / 2);
	if v31 > 2.0943951023931953 then
		local v34 = v30 / (v22.size.Y / 2 / v33);
	else
		v34 = 1;
	end;
	local v35 = v34 / v29;
	p7.viewportFrame.Position = UDim2.new(p7.viewportFrame.AnchorPoint.X - v25, 0, p7.viewportFrame.AnchorPoint.Y - v26, 0);
	p7.viewportFrame.Size = UDim2.new(v29, 0, v29, 0);
	p6.CanvasSize = Vector2.new(l__Y__23 * (v22.size.X / v22.size.Y), l__Y__23);
	p7.camera.FieldOfView = v32;
	p7.camera.CFrame = CFrame.new(l__Workspace__2.CurrentCamera.CFrame.Position) * (v22.cf - v22.cf.Position) * CFrame.Angles(0, math.pi, 0) * CFrame.new(0, 0, 0, v35, 0, 0, 0, v35, 0, 0, 0, 1);
end;
return v3;
