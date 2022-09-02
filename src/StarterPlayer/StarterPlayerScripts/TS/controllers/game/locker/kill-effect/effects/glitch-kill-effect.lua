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
local function u13(p5)
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
local l__default__14 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__OutBack__15 = v3.OutBack;
local l__OutExpo__16 = v3.OutExpo;
function v6.onKill(p6, p7, p8, p9)
	local v17 = u4.new();
	local v18 = u1("Part", {
		Size = Vector3.new(7, 7, 7), 
		Rotation = Vector3.new(45, 0, 0), 
		CanCollide = false, 
		Anchored = true, 
		Transparency = 1, 
		Position = p9.Position + Vector3.new(0, 0, 0), 
		Parent = l__Workspace__2
	});
	l__GameQueryUtil__5:setQueryIgnored(v18, true);
	local v19 = {};
	local v20, v21, v22 = ipairs(Enum.NormalId:GetEnumItems());
	while true do
		v20(v21, v22);
		if not v20 then
			break;
		end;
		v22 = v20;
		local v23 = u6(p8, p9);
		local v24 = {};
		local v25 = {
			ResetOnSpawn = false, 
			Adornee = v18, 
			Face = v21, 
			SizingMode = Enum.SurfaceGuiSizingMode.FixedSize, 
			CanvasSize = Vector2.new(800, 800), 
			Children = { v23.viewportFrame }, 
			ClipsDescendants = true
		};
		if l__DeviceUtil__7.isHoarceKat() then
			local v26 = l__StarterGui__8;
		else
			v26 = l__Players__9.LocalPlayer:FindFirstChildOfClass("PlayerGui");
		end;
		v25.Parent = v26;
		v24.surfaceGui = u1("SurfaceGui", v25);
		v24.slice = v23;
		v19[v21] = v24;	
	end;
	l__KillEffect__5.hideCharacter(p6, p8);
	l__SoundManager__10:playSound(l__GameSound__11.GLITCH_KILL_EFFECT, {
		position = p9.Position
	});
	local l__Position__17 = v18.Position;
	v17:GiveTask(l__RunService__12.RenderStepped:Connect(function()
		local v27 = math.noise(os.clock() * 8) + 0.05;
		local v28 = math.noise(0, os.clock() * 18) * 10;
		local v29 = math.noise(os.clock() * 18) * 5;
		local v30 = math.noise(0, 0, os.clock() * 18) * 5;
		v18.Rotation = Vector3.new(25 + v28, v29, v30);
		v18.Position = l__Position__17 + Vector3.new(math.noise(os.clock() * 15) * 0.5, math.noise(0, 0, -os.clock() * 15) * 0.5, math.noise(os.clock() * -15) * 0.5);
		for v31, v32 in pairs(v19) do
			local l__surfaceGui__33 = v32.surfaceGui;
			local l__slice__34 = v32.slice;
			local v35 = u13(l__surfaceGui__33);
			if v35 ~= nil then
				l__slice__34.clone:SetPrimaryPartCFrame(p9 * CFrame.Angles(-math.rad(v28) / 2, -math.rad(v29) / 2, -math.rad(v30) / 2));
				l__slice__34.viewportFrame.Ambient = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(170, 85, 255), math.clamp(0.9 + v27, 0, 1));
				local l__Y__36 = l__Workspace__2.CurrentCamera.ViewportSize.Y;
				local v37 = v35.cf:PointToObjectSpace(l__Workspace__2.CurrentCamera.CFrame.Position);
				local v38 = v37.X / v35.size.X;
				local v39 = v37.Y / v35.size.Y;
				local v40 = 1 + math.abs(v38) * 2;
				local v41 = 1 + math.abs(v39) * 2;
				local v42 = math.sqrt(v40 * v40 + v41 * v41);
				local v43 = (l__Workspace__2.CurrentCamera.CFrame.Position - v35.cf.Position):Dot(v35.cf.LookVector);
				local v44 = 2 * math.atan2(v35.size.Y / 2, v43);
				local v45 = math.clamp(math.deg(v44), 1, 120);
				local v46 = math.tan(math.rad(v45) / 2);
				if v44 > 2.0943951023931953 then
					local v47 = v43 / (v35.size.Y / 2 / v46);
				else
					v47 = 1;
				end;
				local v48 = v47 / v42;
				l__slice__34.viewportFrame.Position = UDim2.new(l__slice__34.viewportFrame.AnchorPoint.X - v38, 0, l__slice__34.viewportFrame.AnchorPoint.Y - v39, 0);
				l__slice__34.viewportFrame.Size = UDim2.new(v42, 0, v42, 0);
				l__surfaceGui__33.CanvasSize = Vector2.new(l__Y__36 * (v35.size.X / v35.size.Y), l__Y__36);
				l__slice__34.camera.FieldOfView = v45;
				l__slice__34.camera.CFrame = CFrame.new(l__Workspace__2.CurrentCamera.CFrame.Position) * (v35.cf - v35.cf.Position) * CFrame.Angles(0, math.pi, 0) * CFrame.new(0, 0, 0, v48, 0, 0, 0, v48, 0, 0, 0, 1);
			end;
		end;
	end));
	local l__Size__18 = v18.Size;
	task.spawn(function()
		task.wait(0.5);
		l__default__14(2, l__OutBack__15, function(p10)
			local v49 = math.noise(os.clock() * 15) * 1.5;
			v18.Size = Vector3.new((l__Size__18.X + v49) * p10, (l__Size__18.Y + v49) * p10, l__Size__18.Z);
		end, 1, 0.3):Wait();
		task.wait(0.2);
		l__default__14(0.2, l__OutExpo__16, function(p11)
			local v50 = math.random() * 3;
			v18.Size = Vector3.new((l__Size__18.X + v50) * p11, (l__Size__18.Y + v50) * p11, l__Size__18.Z);
		end, 0.3, 0);
	end);
	v17:GiveTask(function()
		for v51, v52 in pairs(v19) do
			v52.surfaceGui:Destroy();
		end;
	end);
	v17:GiveTask(v18);
	task.delay(5, function()
		v17:DoCleaning();
	end);
	return v17;
end;
return v6;
