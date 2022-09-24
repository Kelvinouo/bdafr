-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions"));
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "flipper").src);
local v5 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KillEffect__6 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local v7 = Random.new();
local v8 = setmetatable({}, {
	__tostring = function()
		return "MirrorKillEffect";
	end, 
	__index = l__KillEffect__6
});
v8.__index = v8;
function v8.new(...)
	local v9 = setmetatable({}, v8);
	return v9:constructor(...) and v9;
end;
function v8.constructor(p1, p2)
	l__KillEffect__6.constructor(p1, p2);
	l__KillEffect__6.setPlayDefaultKillEffect(p1, false);
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__SoundManager__2 = v2.SoundManager;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Workspace__4 = v5.Workspace;
local l__SingleMotor__5 = v4.SingleMotor;
local l__ReplicatedStorage__6 = v5.ReplicatedStorage;
local l__GameQueryUtil__7 = v2.GameQueryUtil;
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "viewport-portal-magic", "viewport-portal-magic");
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__AnimationUtil__10 = v2.AnimationUtil;
local l__default__11 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__OutElastic__12 = v3.OutElastic;
local l__OutQuad__13 = v3.OutQuad;
local l__Spring__14 = v4.Spring;
local l__GameAnimationUtil__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__Linear__17 = v3.Linear;
local l__RunService__18 = v5.RunService;
local l__InCubic__19 = v3.InCubic;
local l__GameWorldUtil__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
function v8.onKill(p3, p4, p5, p6)
	local v10 = u1.new();
	l__SoundManager__2:playSound(l__GameSound__3.MIRROR_EFFECT, {
		position = p6.Position, 
		rollOffMaxDistance = 100
	});
	p5.Archivable = true;
	local v11 = p5:Clone();
	v11.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
	v11.HumanoidRootPart.Anchored = true;
	v11:SetPrimaryPartCFrame(p6);
	v11.Parent = l__Workspace__4;
	l__KillEffect__6.hideCharacter(p3, p5);
	v10:GiveTask(v11);
	local v12 = l__SingleMotor__5.new(0);
	local v13 = p6 * CFrame.new(0, -20, 10);
	local v14 = l__ReplicatedStorage__6.Assets.Effects.MagicMirror:Clone();
	local v15, v16, v17 = ipairs(v14:GetChildren());
	while true do
		v15(v16, v17);
		if not v15 then
			break;
		end;
		v17 = v15;
		if v16:IsA("BasePart") then
			v16.Anchored = true;
			v16.CanCollide = false;
		end;	
	end;
	l__GameQueryUtil__7:setQueryIgnored(v14, true);
	v14.Parent = l__Workspace__4;
	v10:GiveTask(v14);
	local v18 = u8.createFaces(v14.PrimaryPart, v11, { Enum.NormalId.Front });
	local v19 = {};
	local v20 = v18[Enum.NormalId.Front];
	if v20 ~= nil then
		v20 = v20.slice.worldModel;
	end;
	v19.Parent = v20;
	v19.Anchored = true;
	v19.CanCollide = false;
	v19.Color = Color3.fromRGB(255, 255, 255);
	v19.Size = Vector3.new(256, 1, 256);
	v19.CFrame = v13 * CFrame.new(0, 16.5, 0);
	v19.Material = Enum.Material.SmoothPlastic;
	local v21 = u9("Part", v19);
	l__GameQueryUtil__7:setQueryIgnored(v21, true);
	v10:GiveTask(v21);
	local v22 = l__ReplicatedStorage__6.Assets.Effects.FloorShadow:Clone();
	v22.Anchored = true;
	v22.CanCollide = false;
	l__GameQueryUtil__7:setQueryIgnored(v22, true);
	v22.Size = Vector3.new(8, 1, 5);
	local v23 = v18[Enum.NormalId.Front];
	if v23 ~= nil then
		v23 = v23.slice.worldModel;
	end;
	v22.Parent = v23;
	v22.CFrame = v13 * CFrame.new(0, 16.55, 1.5);
	v18[Enum.NormalId.Front].slice.viewportFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	v18[Enum.NormalId.Front].slice.viewportFrame.BackgroundTransparency = 0;
	v18[Enum.NormalId.Front].slice.viewportFrame.LightColor = Color3.fromRGB(255, 255, 255);
	for v24, v25 in pairs(v18) do
		l__AnimationUtil__10.playAnimation(v25.slice.clone.Humanoid.Animator, "rbxassetid://507766388");
	end;
	l__AnimationUtil__10.playAnimation(v11.Humanoid.Animator, "rbxassetid://507766388");
	task.spawn(function()
		local u21 = p6 * CFrame.new(0, 0, 10);
		l__default__11(0.1, l__OutElastic__12, function(p7)
			v14:PivotTo(v13:Lerp(u21, p7));
		end, 0, 1):Wait();
		local u22 = nil;
		l__default__11(0.2, l__OutQuad__13, function(p8)
			local v26 = p6:Lerp(p6 * CFrame.new(0, 0, 12), p8);
			if u22 then
				v12:setGoal(l__Spring__14.new(math.rad((v26.Position - u22.Position).Magnitude * 50), {
					dampingRatio = 0.75, 
					frequency = 15
				}));
			end;
			if u21.LookVector:Dot(v26.Position - (u21 * CFrame.new(0, 0, -1)).Position) < 0 then
				v11:PivotTo(CFrame.new(math.huge, math.huge, math.huge));
			elseif v11.PrimaryPart then
				local v27 = v26 * CFrame.Angles(v12:getValue(), 0, 0);
				u22 = v27;
				v11:PivotTo(v27);
			end;
			for v28, v29 in pairs(v18) do
				local v30 = v26 * CFrame.Angles(v12:getValue(), 0, 0);
				u22 = v30;
				v29.slice.clone:PivotTo(v30);
			end;
		end, 0, 1):Wait();
		for v31, v32 in pairs(v18) do
			v32.slice.clone:PivotTo(p6 * CFrame.new(0, 0, 12));
		end;
		task.wait(0.1);
		local v33 = l__GameAnimationUtil__15.playAnimation(v18[Enum.NormalId.Front].slice.clone.Humanoid.Animator, l__AnimationType__16.MIRROR_KILL_EFFECT, {
			looped = false
		});
		if v33 == nil then
			return nil;
		end;
		v33:AdjustSpeed(2);
		local function u23()
			local v34, v35, v36 = ipairs(v14.Part.Attachment:GetChildren());
			while true do
				v34(v35, v36);
				if not v34 then
					break;
				end;
				v36 = v34;
				if v35:IsA("ParticleEmitter") then
					v35:Emit((v35:GetAttribute("EmitCount")));
				end;			
			end;
		end;
		task.delay(0.175, function()
			return u23();
		end);
		task.delay(0.6083, function()
			return u23();
		end);
		task.delay(0.975, function()
			return u23();
		end);
		local u24 = l__default__11(v33.Length / 2 - 0.8, l__Linear__17, function(p9)
			v18[Enum.NormalId.Front].slice.viewportFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(171, 33, 33), p9);
			v18[Enum.NormalId.Front].slice.viewportFrame.LightColor = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(255, 0, 0), p9);
			v21.Color = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(153, 56, 79), p9);
		end, 0, 1);
		v10:GiveTask(function()
			u24:Cancel();
		end);
		local u25 = 0;
		local v37 = l__RunService__18.RenderStepped:Connect(function(p10)
			u25 = u25 + p10;
			if v33.Length == 0 then
				local v38 = 1;
			else
				v38 = v33.Length;
			end;
			local v39 = v33.TimePosition / v38;
			v14:PivotTo(p6 * CFrame.new(math.noise(u25 * 20) * l__InCubic__19(v39, 0.1, 2, 1), 0, 10) * CFrame.Angles(0, 0, (math.rad(math.sin(u25 * 30) * l__InCubic__19(v39, 0.5, 5, 1)))));
		end);
		local v40 = v33;
		if v40 ~= nil then
			v40 = v40.Length;
		end;
		task.wait(v40 / 2 - 0.2);
		v37:Disconnect();
		v14:Destroy();
		local v41 = l__ReplicatedStorage__6.Assets.Effects.MagicMirrorExplosion:Clone();
		v41.Anchored = true;
		v41.CanCollide = false;
		v41.CFrame = p6 * CFrame.new(0, 0, 10);
		l__GameQueryUtil__7:setQueryIgnored(v41, true);
		v41.Parent = l__Workspace__4;
		local v42, v43, v44 = ipairs(v41:GetDescendants());
		while true do
			v42(v43, v44);
			if not v42 then
				break;
			end;
			v44 = v42;
			if v43:IsA("ParticleEmitter") then
				v43:Emit((v43:GetAttribute("EmitCount")));
			end;		
		end;
		task.delay(3, function()
			local v45 = v41;
			if v45 ~= nil then
				v45 = v45:Destroy();
			end;
			return v45;
		end);
		local v46 = l__ReplicatedStorage__6.Assets.Effects.FracturedMirror:Clone();
		l__GameQueryUtil__7:setQueryIgnored(v46, true);
		v46:PivotTo(p6 * CFrame.new(0, 0, 10));
		v46.Parent = l__Workspace__4;
		v10:GiveTask(v46);
		local v47, v48, v49 = ipairs(v46:GetDescendants());
		while true do
			v47(v48, v49);
			if not v47 then
				break;
			end;
			v49 = v47;
			if v48:IsA("BasePart") then
				v48.Anchored = false;
				v48.CanCollide = false;
				local v50 = l__GameWorldUtil__20.randomUnitVector(Vector3.new(0, 1, 0), 0.8726646259971648);
				v48:ApplyImpulse(v50 * (v48.AssemblyMass * 50));
				v48:ApplyAngularImpulse(v50 * (v48.AssemblyMass * 10));
			end;		
		end;
	end);
	v10:GiveTask(l__RunService__18.RenderStepped:Connect(function()
		for v51, v52 in pairs(v18) do
			u8.update(v52.surfaceGui, {
				viewportFrame = v52.slice.viewportFrame, 
				camera = v52.slice.camera
			});
		end;
	end));
	v10:GiveTask(function()
		for v53, v54 in pairs(v18) do
			v54.surfaceGui:Destroy();
		end;
	end);
	return v10;
end;
return v8;
