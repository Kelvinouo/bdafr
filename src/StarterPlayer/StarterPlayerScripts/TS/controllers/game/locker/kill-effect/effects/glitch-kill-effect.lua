-- Script Hash: 876520e73060d3dc1ddb1e49b3d46e13bc649901bd485f85b6fe2c490d9cf4dc60256522f108da25da9ac2d384186cc8
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions"));
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__2 = v4.Workspace;
local l__Lighting__3 = v4.Lighting;
local l__KillEffect__5 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local v6 = setmetatable({}, {
	__tostring = function()
		return "GlitchKillEffect";
	end, 
	__index = l__KillEffect__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
function v6.constructor(p1, p2)
	l__KillEffect__5.constructor(p1, p2);
	l__KillEffect__5.setPlayDefaultKillEffect(p1, false);
end;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local function u5(p3, p4)
	local v8 = u1("Camera", {
		FieldOfView = l__Workspace__2.CurrentCamera.FieldOfView, 
		CFrame = l__Workspace__2.CurrentCamera.CFrame
	});
	local v9 = u1("ViewportFrame", {
		Size = UDim2.fromScale(1, 1), 
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(1, 1), 
		LightColor = Color3.fromRGB(214, 74, 172), 
		LightDirection = l__Lighting__3:GetSunDirection(), 
		CurrentCamera = v8, 
		BackgroundTransparency = 1
	});
	local v10 = u1("WorldModel", {
		Parent = v9
	});
	v8.Parent = v9;
	p3.Archivable = true;
	local v11 = p3:Clone();
	v11.HumanoidRootPart.Anchored = true;
	v11:SetPrimaryPartCFrame(p4);
	v11.Parent = v10;
	return {
		viewportFrame = v9, 
		clone = v11, 
		worldModel = v10, 
		camera = v8
	};
end;
local l__DeviceUtil__6 = v2.DeviceUtil;
local l__StarterGui__7 = v4.StarterGui;
local l__Players__8 = v4.Players;
local l__SoundManager__9 = v2.SoundManager;
local l__GameSound__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__RunService__11 = v4.RunService;
local function u12(p5)
	local l__Adornee__12 = p5.Adornee;
	if l__Adornee__12 == nil then
		return nil;
	end;
	local v13 = Vector3.FromNormalId(p5.Face) * -1;
	if math.abs(v13.Y) == 1 then
		local v14 = Vector3.new(v13.Y, 0, 0);
	else
		v14 = Vector3.new(0, 1, 0);
	end;
	local v15 = CFrame.fromAxisAngle(v14, math.pi / 2) * v13;
	local l__Unit__16 = v13:Cross(v15).Unit;
	return {
		cf = l__Adornee__12.CFrame * CFrame.fromMatrix(v13 * -1 * (l__Adornee__12.Size / 2), v15, l__Unit__16, v13), 
		size = Vector2.new((l__Adornee__12.Size * v15).Magnitude, (l__Adornee__12.Size * l__Unit__16).Magnitude)
	};
end;
local l__default__13 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__OutBack__14 = v3.OutBack;
local l__OutExpo__15 = v3.OutExpo;
function v6.onKill(p6, p7, p8, p9)
	local v17 = u4.new();
	local v18 = u1("Part", {
		Size = Vector3.new(7, 7, 7), 
		Rotation = Vector3.new(45, 0, 0), 
		Anchored = true, 
		Transparency = 1, 
		Position = p9.Position + Vector3.new(0, 0, 0), 
		Parent = l__Workspace__2
	});
	local v19 = {};
	for v20, v21 in ipairs(Enum.NormalId:GetEnumItems()) do
		local v22 = u5(p8, p9);
		local v23 = {};
		local v24 = {
			ResetOnSpawn = false, 
			Adornee = v18, 
			Face = v21, 
			SizingMode = Enum.SurfaceGuiSizingMode.FixedSize, 
			CanvasSize = Vector2.new(800, 800), 
			Children = { v22.viewportFrame }, 
			ClipsDescendants = true
		};
		if l__DeviceUtil__6.isHoarceKat() then
			local v25 = l__StarterGui__7;
		else
			v25 = l__Players__8.LocalPlayer:FindFirstChildOfClass("PlayerGui");
		end;
		v24.Parent = v25;
		v23.surfaceGui = u1("SurfaceGui", v24);
		v23.slice = v22;
		v19[v21] = v23;
	end;
	l__KillEffect__5.hideCharacter(p6, p8);
	l__SoundManager__9:playSound(l__GameSound__10.GLITCH_KILL_EFFECT, {
		position = p9.Position
	});
	local l__Position__16 = v18.Position;
	v17:GiveTask(l__RunService__11.RenderStepped:Connect(function()
		local v26 = math.noise(os.clock() * 8) + 0.05;
		local v27 = math.noise(0, os.clock() * 18) * 10;
		local v28 = math.noise(os.clock() * 18) * 5;
		local v29 = math.noise(0, 0, os.clock() * 18) * 5;
		v18.Rotation = Vector3.new(25 + v27, v28, v29);
		v18.Position = l__Position__16 + Vector3.new(math.noise(os.clock() * 15) * 0.5, math.noise(0, 0, -os.clock() * 15) * 0.5, math.noise(os.clock() * -15) * 0.5);
		for v30, v31 in pairs(v19) do
			local l__surfaceGui__32 = v31.surfaceGui;
			local l__slice__33 = v31.slice;
			local v34 = u12(l__surfaceGui__32);
			if v34 ~= nil then
				l__slice__33.clone:SetPrimaryPartCFrame(p9 * CFrame.Angles(-math.rad(v27) / 2, -math.rad(v28) / 2, -math.rad(v29) / 2));
				l__slice__33.viewportFrame.Ambient = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(170, 85, 255), math.clamp(0.9 + v26, 0, 1));
				local l__Y__35 = l__Workspace__2.CurrentCamera.ViewportSize.Y;
				local v36 = v34.cf:PointToObjectSpace(l__Workspace__2.CurrentCamera.CFrame.Position);
				local v37 = v36.X / v34.size.X;
				local v38 = v36.Y / v34.size.Y;
				local v39 = 1 + math.abs(v37) * 2;
				local v40 = 1 + math.abs(v38) * 2;
				local v41 = math.sqrt(v39 * v39 + v40 * v40);
				local v42 = (l__Workspace__2.CurrentCamera.CFrame.Position - v34.cf.Position):Dot(v34.cf.LookVector);
				local v43 = 2 * math.atan2(v34.size.Y / 2, v42);
				local v44 = math.clamp(math.deg(v43), 1, 120);
				local v45 = math.tan(math.rad(v44) / 2);
				if math.rad(120) < v43 then
					local v46 = v42 / (v34.size.Y / 2 / v45);
				else
					v46 = 1;
				end;
				local v47 = v46 / v41;
				l__slice__33.viewportFrame.Position = UDim2.new(l__slice__33.viewportFrame.AnchorPoint.X - v37, 0, l__slice__33.viewportFrame.AnchorPoint.Y - v38, 0);
				l__slice__33.viewportFrame.Size = UDim2.new(v41, 0, v41, 0);
				l__surfaceGui__32.CanvasSize = Vector2.new(l__Y__35 * (v34.size.X / v34.size.Y), l__Y__35);
				l__slice__33.camera.FieldOfView = v44;
				l__slice__33.camera.CFrame = CFrame.new(l__Workspace__2.CurrentCamera.CFrame.Position) * (v34.cf - v34.cf.Position) * CFrame.Angles(0, math.pi, 0) * CFrame.new(0, 0, 0, v47, 0, 0, 0, v47, 0, 0, 0, 1);
			end;
		end;
	end));
	local l__Size__17 = v18.Size;
	task.spawn(function()
		task.wait(0.5);
		l__default__13(2, l__OutBack__14, function(p10)
			local v48 = math.noise(os.clock() * 15) * 1.5;
			v18.Size = Vector3.new((l__Size__17.X + v48) * p10, (l__Size__17.Y + v48) * p10, l__Size__17.Z);
		end, 1, 0.3):Wait();
		task.wait(0.2);
		l__default__13(0.2, l__OutExpo__15, function(p11)
			local v49 = math.random() * 3;
			v18.Size = Vector3.new((l__Size__17.X + v49) * p11, (l__Size__17.Y + v49) * p11, l__Size__17.Z);
		end, 0.3, 0);
	end);
	v17:GiveTask(function()
		for v50, v51 in pairs(v19) do
			v51.surfaceGui:Destroy();
		end;
	end);
	v17:GiveTask(v18);
	task.delay(5, function()
		v17:DoCleaning();
	end);
	return v17;
end;
return v6;
