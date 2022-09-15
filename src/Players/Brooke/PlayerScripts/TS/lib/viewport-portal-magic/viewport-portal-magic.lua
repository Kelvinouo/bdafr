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
	local v16, v17, v18 = ipairs(Enum.NormalId:GetEnumItems());
	while true do
		v16(v17, v18);
		if not v16 then
			break;
		end;
		v18 = v16;
		local v19 = v4(p5:GetPrimaryPartCFrame(), p5);
		local v20 = {};
		local v21 = {
			ResetOnSpawn = false, 
			Adornee = p4, 
			Face = v17, 
			SizingMode = Enum.SurfaceGuiSizingMode.FixedSize, 
			CanvasSize = Vector2.new(800, 800), 
			Children = { v19.viewportFrame }, 
			ClipsDescendants = true
		};
		if l__DeviceUtil__4.isHoarceKat() then
			local v22 = l__StarterGui__5;
		else
			v22 = l__Players__6.LocalPlayer:FindFirstChildOfClass("PlayerGui");
		end;
		v21.Parent = v22;
		v20.surfaceGui = u1("SurfaceGui", v21);
		v20.slice = v19;
		v15[v17] = v20;	
	end;
	return v15;
end;
function v3.update(p6, p7)
	local v23 = v9(p6);
	if v23 == nil then
		return nil;
	end;
	local l__Y__24 = l__Workspace__2.CurrentCamera.ViewportSize.Y;
	local v25 = v23.cf:PointToObjectSpace(l__Workspace__2.CurrentCamera.CFrame.Position);
	local v26 = v25.X / v23.size.X;
	local v27 = v25.Y / v23.size.Y;
	local v28 = 1 + math.abs(v26) * 2;
	local v29 = 1 + math.abs(v27) * 2;
	local v30 = math.sqrt(v28 * v28 + v29 * v29);
	local v31 = (l__Workspace__2.CurrentCamera.CFrame.Position - v23.cf.Position):Dot(v23.cf.LookVector);
	local v32 = 2 * math.atan2(v23.size.Y / 2, v31);
	local v33 = math.clamp(math.deg(v32), 1, 120);
	local v34 = math.tan(math.rad(v33) / 2);
	if v32 > 2.0943951023931953 then
		local v35 = v31 / (v23.size.Y / 2 / v34);
	else
		v35 = 1;
	end;
	local v36 = v35 / v30;
	p7.viewportFrame.Position = UDim2.new(p7.viewportFrame.AnchorPoint.X - v26, 0, p7.viewportFrame.AnchorPoint.Y - v27, 0);
	p7.viewportFrame.Size = UDim2.new(v30, 0, v30, 0);
	p6.CanvasSize = Vector2.new(l__Y__24 * (v23.size.X / v23.size.Y), l__Y__24);
	p7.camera.FieldOfView = v33;
	p7.camera.CFrame = CFrame.new(l__Workspace__2.CurrentCamera.CFrame.Position) * (v23.cf - v23.cf.Position) * CFrame.Angles(0, math.pi, 0) * CFrame.new(0, 0, 0, v36, 0, 0, 0, v36, 0, 0, 0, 1);
end;
return v3;
