-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions"));
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KillEffect__5 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__2 = v4.Workspace;
local l__Lighting__3 = v4.Lighting;
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
local l__GameQueryUtil__5 = v2.GameQueryUtil;
local function u6(p3, p4)
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
local l__DeviceUtil__7 = v2.DeviceUtil;
local l__StarterGui__8 = v4.StarterGui;
local l__Players__9 = v4.Players;
local l__SoundManager__10 = v2.SoundManager;
local l__GameSound__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__RunService__12 = v4.RunService;
local l__getSurfaceInfo__13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "viewport-portal-magic", "viewport-portal-magic").getSurfaceInfo;
local l__default__14 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__OutBack__15 = v3.OutBack;
local l__OutExpo__16 = v3.OutExpo;
function v6.onKill(p5, p6, p7, p8)
	local v12 = u4.new();
	local v13 = u1("Part", {
		Size = Vector3.new(7, 7, 7), 
		Rotation = Vector3.new(45, 0, 0), 
		CanCollide = false, 
		Anchored = true, 
		Transparency = 1, 
		Position = p8.Position + Vector3.new(0, 0, 0), 
		Parent = l__Workspace__2
	});
	l__GameQueryUtil__5:setQueryIgnored(v13, true);
	local v14 = {};
	local v15, v16, v17 = ipairs(Enum.NormalId:GetEnumItems());
	while true do
		v15(v16, v17);
		if not v15 then
			break;
		end;
		v17 = v15;
		local v18 = u6(p7, p8);
		local v19 = {};
		local v20 = {
			ResetOnSpawn = false, 
			Adornee = v13, 
			Face = v16, 
			SizingMode = Enum.SurfaceGuiSizingMode.FixedSize, 
			CanvasSize = Vector2.new(800, 800), 
			Children = { v18.viewportFrame }, 
			ClipsDescendants = true
		};
		if l__DeviceUtil__7.isHoarceKat() then
			local v21 = l__StarterGui__8;
		else
			v21 = l__Players__9.LocalPlayer:FindFirstChildOfClass("PlayerGui");
		end;
		v20.Parent = v21;
		v19.surfaceGui = u1("SurfaceGui", v20);
		v19.slice = v18;
		v14[v16] = v19;	
	end;
	l__KillEffect__5.hideCharacter(p5, p7);
	l__SoundManager__10:playSound(l__GameSound__11.GLITCH_KILL_EFFECT, {
		position = p8.Position
	});
	local l__Position__17 = v13.Position;
	v12:GiveTask(l__RunService__12.RenderStepped:Connect(function()
		local v22 = math.noise(os.clock() * 8) + 0.05;
		local v23 = math.noise(0, os.clock() * 18) * 10;
		local v24 = math.noise(os.clock() * 18) * 5;
		local v25 = math.noise(0, 0, os.clock() * 18) * 5;
		v13.Rotation = Vector3.new(25 + v23, v24, v25);
		v13.Position = l__Position__17 + Vector3.new(math.noise(os.clock() * 15) * 0.5, math.noise(0, 0, -os.clock() * 15) * 0.5, math.noise(os.clock() * -15) * 0.5);
		for v26, v27 in pairs(v14) do
			local l__surfaceGui__28 = v27.surfaceGui;
			local l__slice__29 = v27.slice;
			local v30 = l__getSurfaceInfo__13(l__surfaceGui__28);
			if v30 ~= nil then
				l__slice__29.clone:SetPrimaryPartCFrame(p8 * CFrame.Angles(-math.rad(v23) / 2, -math.rad(v24) / 2, -math.rad(v25) / 2));
				l__slice__29.viewportFrame.Ambient = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(170, 85, 255), math.clamp(0.9 + v22, 0, 1));
				local l__Y__31 = l__Workspace__2.CurrentCamera.ViewportSize.Y;
				local v32 = v30.cf:PointToObjectSpace(l__Workspace__2.CurrentCamera.CFrame.Position);
				local v33 = v32.X / v30.size.X;
				local v34 = v32.Y / v30.size.Y;
				local v35 = 1 + math.abs(v33) * 2;
				local v36 = 1 + math.abs(v34) * 2;
				local v37 = math.sqrt(v35 * v35 + v36 * v36);
				local v38 = (l__Workspace__2.CurrentCamera.CFrame.Position - v30.cf.Position):Dot(v30.cf.LookVector);
				local v39 = 2 * math.atan2(v30.size.Y / 2, v38);
				local v40 = math.clamp(math.deg(v39), 1, 120);
				local v41 = math.tan(math.rad(v40) / 2);
				if v39 > 2.0943951023931953 then
					local v42 = v38 / (v30.size.Y / 2 / v41);
				else
					v42 = 1;
				end;
				local v43 = v42 / v37;
				l__slice__29.viewportFrame.Position = UDim2.new(l__slice__29.viewportFrame.AnchorPoint.X - v33, 0, l__slice__29.viewportFrame.AnchorPoint.Y - v34, 0);
				l__slice__29.viewportFrame.Size = UDim2.new(v37, 0, v37, 0);
				l__surfaceGui__28.CanvasSize = Vector2.new(l__Y__31 * (v30.size.X / v30.size.Y), l__Y__31);
				l__slice__29.camera.FieldOfView = v40;
				l__slice__29.camera.CFrame = CFrame.new(l__Workspace__2.CurrentCamera.CFrame.Position) * (v30.cf - v30.cf.Position) * CFrame.Angles(0, math.pi, 0) * CFrame.new(0, 0, 0, v43, 0, 0, 0, v43, 0, 0, 0, 1);
			end;
		end;
	end));
	local l__Size__18 = v13.Size;
	task.spawn(function()
		task.wait(0.5);
		l__default__14(2, l__OutBack__15, function(p9)
			local v44 = math.noise(os.clock() * 15) * 1.5;
			v13.Size = Vector3.new((l__Size__18.X + v44) * p9, (l__Size__18.Y + v44) * p9, l__Size__18.Z);
		end, 1, 0.3):Wait();
		task.wait(0.2);
		l__default__14(0.2, l__OutExpo__16, function(p10)
			local v45 = math.random() * 3;
			v13.Size = Vector3.new((l__Size__18.X + v45) * p10, (l__Size__18.Y + v45) * p10, l__Size__18.Z);
		end, 0.3, 0);
	end);
	v12:GiveTask(function()
		for v46, v47 in pairs(v14) do
			v47.surfaceGui:Destroy();
		end;
	end);
	v12:GiveTask(v13);
	task.delay(5, function()
		v12:DoCleaning();
	end);
	return v12;
end;
return v6;
