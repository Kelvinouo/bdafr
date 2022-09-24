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
		AnchorPoint = Vector2.new(0, 0), 
		Position = UDim2.fromScale(0, 0), 
		LightColor = Color3.fromRGB(255, 255, 255), 
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
function v3.createFaces(p4, p5, p6)
	if p6 == nil then
		p6 = Enum.NormalId:GetEnumItems();
	end;
	local v15 = {};
	local v16, v17, v18 = ipairs(p6);
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
			LightInfluence = 1, 
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
function v3.update(p7, p8)
	local l__CFrame__23 = l__Workspace__2.CurrentCamera.CFrame;
	local v24 = v9(p7);
	if v24 == nil then
		return nil;
	end;
	if v24.cf:PointToObjectSpace(l__CFrame__23.Position).Z > 0 then
		return nil;
	end;
	local v25 = v24.cf.YVector:Cross(l__CFrame__23.ZVector);
	if v25:Dot(v25) > 0 then
		local v26 = v25.Unit;
	else
		v26 = l__CFrame__23.XVector;
	end;
	local v27 = CFrame.fromMatrix(l__CFrame__23.Position, v26, v24.cf.YVector);
	local l__Unit__28 = (v27:PointToObjectSpace(v24.cf * Vector3.new(0, v24.size.Y / 2, 0)) * Vector3.new(0, 1, 1)).Unit;
	local l__Unit__29 = (v27:PointToObjectSpace(v24.cf * Vector3.new(0, -v24.size.Y / 2, 0)) * Vector3.new(0, 1, 1)).Unit;
	local v30 = (math.tan(math.sign(l__Unit__28.Y) * math.acos(-l__Unit__28.Z)) - math.tan(math.sign(l__Unit__29.Y) * math.acos(-l__Unit__29.Z))) / (2 * math.tan(math.rad(l__Workspace__2.CurrentCamera.FieldOfView / 2)));
	local v31 = v24.cf:VectorToObjectSpace(v24.cf.Position - l__CFrame__23.Position);
	local l__Unit__32 = (v31 * Vector3.new(1, 0, 1)).Unit;
	local v33 = v31 * Vector3.new(0, 1, 1);
	local v34 = -l__Unit__32.Z;
	local v35 = (v24.cf:VectorToObjectSpace(l__CFrame__23.LookVector) * Vector3.new(1, 0, 1)).Unit:Dot(l__Unit__32) / v34;
	local v36 = math.sqrt(1 - v34 * v34) / v34;
	local v37 = v24.size.X / v24.size.Y;
	local v38 = 0;
	local v39 = {};
	for v40, v41 in pairs({ ((v24.cf - v24.cf.Position) * CFrame.fromEulerAnglesXYZ(0, math.pi, 0) * CFrame.new(0, 0, 0, 1, 0, 0, 0, v37, 0, math.sign(v31.X * v31.Z) * v36, v33.Y / v33.Z * v37, (math.abs(v35 * v30 * v37)))):GetComponents() }) do
		v39[v40] = v41;
	end;
	local v42, v43, v44 = ipairs(v39);
	while true do
		v42(v43, v44);
		if not v42 then
			break;
		end;
		v44 = v42;
		v38 = math.max(v38, math.abs(v43));	
	end;
	local v45, v46, v47 = ipairs(v39);
	while true do
		v45(v46, v47);
		if not v45 then
			break;
		end;
		v47 = v45;
		v39[v45 - 1 + 1] = v46 / v38;	
	end;
	p8.camera.FieldOfView = l__Workspace__2.CurrentCamera.FieldOfView;
	p8.camera.CFrame = CFrame.new(unpack(v39)) + l__CFrame__23.Position;
end;
return v3;
