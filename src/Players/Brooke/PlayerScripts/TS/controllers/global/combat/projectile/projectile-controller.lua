-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = {
	RelX = 0.8, 
	RelY = -0.6, 
	RelZ = 0, 
	CameraMultiplier = 10
};
if v2.DeviceUtil.isMobileControls() then
	local v6 = 0.25;
else
	v6 = 0.05;
end;
v5.YTargetOffset = v6;
v5.BeamGrowthMultiplier = 0.08;
local v7 = setmetatable({}, {
	__tostring = function()
		return "ProjectileController";
	end, 
	__index = l__KnitController__4
});
v7.__index = v7;
local u1 = v7;
function u1.new(...)
	local v8 = setmetatable({}, u1);
	return v8:constructor(...) and v8;
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1, ...)
	l__KnitController__4.constructor(p1, ...);
	p1.Name = "ProjectileController";
	p1.isTargeting = false;
	p1.targetingId = 0;
	p1.targetingMaid = u2.new();
	p1.itemSwapMaid = u2.new();
end;
local l__ReplicatedStorage__3 = v3.ReplicatedStorage;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__5 = v3.Workspace;
local l__default__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.KnitStart(p2)
	l__ReplicatedStorage__3:WaitForChild("ProjectilesReady");
	p2.projectileTargetingFolder = u4("Folder", {
		Parent = l__Workspace__5, 
		Name = "ProjectileTargeting"
	});
	l__default__6.Client:OnEvent("RemoteName", function(p3)
		p2:createLocalProjectile(nil, p3.ammoType, p3.projectileType, p3.positionFrom, p3.projectileRefId, p3.initialVelocity, {
			drawDurationSeconds = p3.drawDurationSeconds
		});
	end);
end;
local l__ProjectileHandler__7 = v1.import(script, script.Parent, "projectile-handler").ProjectileHandler;
local l__KnitClient__8 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__GameAnimationUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__Players__10 = v3.Players;
function u1.enableTargeting(p4, p5, p6, p7, p8, p9)
	if p4.isTargeting then
		p4:disableTargeting();
	end;
	local v9 = (p4.targetingId + 1) % 10000;
	p4.targetingId = v9;
	local v10 = p9;
	if v10 ~= nil then
		v10 = v10.initialVelocityMultiplier;
	end;
	local v11 = v10;
	if v11 == nil then
		v11 = 1;
	end;
	if p8 ~= nil then
		local v12 = {
			inputObject = p8
		};
		local v13 = p8;
		if v13 ~= nil then
			v13 = v13.Position.X;
		end;
		local v14 = p8;
		if v14 ~= nil then
			v14 = v14.Position.Y;
		end;
		v12.initialPosition = Vector2.new(v13, v14);
		local v15 = v12;
	else
		v15 = nil;
	end;
	local v16 = l__ProjectileHandler__7.new(1, v11, p6, v15);
	local v17 = p7.firstPerson;
	if v17 ~= nil then
		v17 = v17.aimAnimation;
	end;
	if v17 ~= 0 and v17 == v17 and v17 then
		local u11 = l__KnitClient__8.Controllers.ViewmodelController:playAnimation(p7.firstPerson.aimAnimation, {
			looped = true, 
			fadeTime = 0.18
		});
		p4.targetingMaid:GiveTask(function()
			if u11 ~= nil then
				u11:Stop();
			end;
		end);
	end;
	local v18 = p7.thirdPerson;
	if v18 ~= nil then
		v18 = v18.aimAnimation;
	end;
	if v18 ~= 0 and v18 == v18 and v18 then
		local u12 = l__GameAnimationUtil__9.playAnimation(l__Players__10.LocalPlayer, p7.thirdPerson.aimAnimation, {
			looped = true
		});
		p4.targetingMaid:GiveTask(function()
			if u12 ~= nil then
				u12:Stop();
			end;
		end);
	end;
	local v19 = p7.thirdPerson;
	if v19 ~= nil then
		v19 = v19.drawAnimation;
	end;
	if v19 ~= 0 and v19 == v19 and v19 then
		local u13 = l__GameAnimationUtil__9.playAnimation(l__Players__10.LocalPlayer, p7.thirdPerson.drawAnimation, {
			looped = false
		});
		p4.targetingMaid:GiveTask(function()
			if u13 ~= nil then
				u13:Stop();
			end;
		end);
	end;
	p4:enableBeam(v9, v16);
	return v16;
end;
function u1.getLaunchPosition(p10, p11)
	local v20 = p11;
	if v20 ~= nil then
		v20 = v20:IsA("BasePart");
	end;
	if v20 and p11.Head then
		return p11.Head.BulletOrigin.WorldPosition;
	end;
	local v21 = l__Players__10.LocalPlayer.Character;
	if v21 ~= nil then
		v21 = v21.PrimaryPart;
		if v21 ~= nil then
			v21 = v21.Position;
		end;
	end;
	return v21;
end;
function u1.disableTargeting(p12)
	p12.targetingMaid:DoCleaning();
	p12.isTargeting = false;
end;
u1.launchProjectile = v1.async(function(p13, p14, p15, p16, p17, p18, p19, p20)
	local v22 = p13:calculateImportantLaunchValues(p16, false, p17);
	if not v22 then
		p13:disableTargeting();
		return nil;
	end;
	return p13:launchProjectileWithValues(v22, p17, p18, p15, p19, p20);
end);
local l__ClientSyncEvents__14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__SoundManager__15 = v2.SoundManager;
local l__RandomUtil__16 = v2.RandomUtil;
local l__HttpService__17 = v3.HttpService;
local l__ProjectileMeta__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-meta").ProjectileMeta;
local l__EntityUtil__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
u1.launchProjectileWithValues = v1.async(function(p21, p22, p23, p24, p25, p26, p27)
	if p26 == nil then
		p26 = {};
	end;
	if not p22 then
		return nil;
	end;
	if l__ClientSyncEvents__14.PerformCombat:fire():isCancelled() then
		return nil;
	end;
	if p27 then
		local v23 = p27;
	else
		v23 = p24.projectileType(p25);
	end;
	if l__ClientSyncEvents__14.StartLaunchProjectile:fire(v23, p24):isCancelled() then
		return nil;
	end;
	local l__initialVelocity__24 = p22.initialVelocity;
	local l__positionFrom__25 = p22.positionFrom;
	local l__deltaT__26 = p22.deltaT;
	local v27 = p22.gravitationalAcceleration;
	local v28 = {};
	for v29, v30 in pairs(p26) do
		v28[v29] = v30;
	end;
	v28.drawDurationSeconds = p22.drawDurationSeconds;
	p26 = v28;
	if p24.launchSound then
		l__SoundManager__15:playSound(l__RandomUtil__16.fromList(unpack(p24.launchSound)));
	end;
	local v31 = p24.firstPerson;
	if v31 ~= nil then
		v31 = v31.fireAnimation;
	end;
	if v31 ~= 0 and v31 == v31 and v31 then
		l__KnitClient__8.Controllers.ViewmodelController:playAnimation(p24.firstPerson.fireAnimation, {
			fadeTime = 0.12
		});
	end;
	local v32 = p24.thirdPerson;
	if v32 ~= nil then
		v32 = v32.fireAnimation;
	end;
	if v32 ~= 0 and v32 == v32 and v32 then
		local v33 = l__GameAnimationUtil__9.playAnimation(l__Players__10.LocalPlayer, p24.thirdPerson.fireAnimation);
	end;
	local v34 = l__HttpService__17:GenerateGUID();
	local v35 = l__ProjectileMeta__18[v23];
	local v36 = p21:createLocalProjectile(p24, p25, v23, l__positionFrom__25, v34, l__initialVelocity__24, {
		drawDurationSeconds = p26.drawDurationSeconds
	});
	if v36 then
		local v37 = l__EntityUtil__19:getLocalPlayerEntity();
		if v37 ~= nil then
			v37 = v37:getInstance();
		end;
		l__ClientSyncEvents__14.ProjectileLaunched:fire(v23, v36, l__initialVelocity__24, l__positionFrom__25, v37);
	end;
	local v38 = l__Players__10.LocalPlayer.Character;
	if v38 ~= nil then
		v38 = v38.PrimaryPart;
		if v38 ~= nil then
			v38 = v38.Position;
		end;
	end;
	if v38 == nil then
		return nil;
	end;
	local v39 = v1.await(l__default__6.Client:WaitFor("RemoteName"):andThen(function(p28)
		return p28:CallServerAsync(p23, p25, v23, l__positionFrom__25, v38, l__initialVelocity__24, v34, p26, l__Workspace__5:GetServerTimeNow() - 0.045);
	end));
	if v39 and v39.PrimaryPart then
		return v39;
	end;
	return nil;
end);
local l__ProjectileUtil__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "projectile-util").ProjectileUtil;
function u1.createLocalProjectile(p29, p30, p31, p32, p33, p34, p35, p36)
	local v40 = l__ProjectileMeta__18[p32];
	local v41 = l__ProjectileUtil__20.createProjectile(l__Players__10.LocalPlayer, p32, p31, (l__Players__10.LocalPlayer.Character:GetPrimaryPartCFrame()));
	if not v41 or not (not v40.useServerModel) then
		return;
	end;
	l__ProjectileUtil__20.setupProjectileConstantOrientation(v41, l__Players__10.LocalPlayer);
	local v42 = 1;
	local v43 = p36;
	if v43 ~= nil then
		v43 = v43.drawDurationSeconds;
	end;
	local v44 = v43 ~= nil;
	if v44 then
		local v45 = p30;
		if v45 ~= nil then
			v45 = v45.maxStrengthChargeSec;
		end;
		v44 = v45;
	end;
	if v44 ~= 0 and v44 == v44 and v44 then
		v42 = math.clamp(p36.drawDurationSeconds / p30.maxStrengthChargeSec, 0, 1);
	end;
	local v46 = v40.gravitationalAcceleration;
	if v46 == nil then
		v46 = 196.2;
	end;
	local v47 = {};
	local v48 = p30;
	if v48 ~= nil then
		v48 = v48.relativeOverride;
	end;
	v47.relative = v48;
	v47.projectileSource = p30;
	v47.drawPercent = v42;
	l__ProjectileUtil__20.fireProjectile(l__Players__10.LocalPlayer, v41, p34, p33, p35, v46, function(p37, p38)
		local v49 = l__EntityUtil__19:getEntityFromDescendant(p38);
		local v50 = v49;
		if v50 ~= nil then
			v50 = v50:getInstance();
		end;
		l__default__6.Client:Get("RemoteName"):SendToServer(p34, v50);
		l__ClientSyncEvents__14.LocalProjectileImpact:fire(v41, p37, v49, p38);
		if not v40.keepProjectileOnHit or not v49 then
			v41:Destroy();
		end;
	end, nil, v47);
	return v41;
end;
local u21 = v2.ConstantManager.registerConstants(script, v5);
function u1.calculateImportantLaunchValues(p39, p40, p41, p42)
	local v51 = p39:getLaunchPosition(p42);
	if not v51 then
		return nil;
	end;
	local v52 = p40:getProjectileMeta();
	if p41 then
		local v53 = v52.predictionLifetimeSec;
	else
		v53 = v52.lifetimeSec;
	end;
	if v53 == nil then
		v53 = 3;
	end;
	local v54 = v52.launchVelocity;
	if v54 == nil then
		v54 = 100;
	end;
	local v55 = v52.gravitationalAcceleration;
	if v55 == nil then
		v55 = 196.2;
	end;
	local l__CFrame__56 = l__Workspace__5.CurrentCamera.CFrame;
	local v57 = v51 + p40.fromPositionOffset;
	if p40.targetPoint == nil then
		local l__mouse__58 = l__Players__10.LocalPlayer:GetMouse();
		local v59 = Vector2.new(l__mouse__58.X, l__mouse__58.Y);
		local l__inputInfo__60 = p40.inputInfo;
		if l__inputInfo__60 then
			v59 = l__inputInfo__60.initialPosition;
		end;
		local v61 = (l__CFrame__56.Position + (l__Workspace__5.CurrentCamera:ScreenPointToRay(v59.X, v59.Y).Unit.Direction + Vector3.new(0, u21.YTargetOffset, 0)).Unit * ((l__CFrame__56.Position - v57).Magnitude * u21.CameraMultiplier) - v57).Unit;
	else
		v61 = (p40.targetPoint - v57).Unit;
	end;
	return {
		initialVelocity = v61 * (v54 * p40.velocityMultiplier), 
		positionFrom = v57, 
		deltaT = v53, 
		gravitationalAcceleration = v55 * p40.gravityMultiplier, 
		drawDurationSeconds = p40.drawDurationSeconds
	};
end;
local l__GameQueryUtil__22 = v2.GameQueryUtil;
local l__CollectionService__23 = v3.CollectionService;
local l__RunService__24 = v3.RunService;
function u1.enableBeam(p43, p44, p45, p46)
	local v62 = {
		Transparency = 1, 
		CanCollide = false, 
		Anchored = true, 
		Parent = p43.projectileTargetingFolder
	};
	local v63 = u4("Part", v62);
	local v64 = u4("Part", v62);
	l__GameQueryUtil__22:setQueryIgnored(v63, true);
	l__GameQueryUtil__22:setQueryIgnored(v64, true);
	p43.targetingMaid:GiveTask(v63);
	p43.targetingMaid:GiveTask(v64);
	local v65 = u4("Beam", {
		FaceCamera = true, 
		Attachment0 = u4("Attachment", {
			Parent = v63
		}), 
		Attachment1 = u4("Attachment", {
			Parent = v64
		}), 
		Segments = 300, 
		Color = ColorSequence.new(Color3.fromRGB(255, 255, 255)), 
		Transparency = NumberSequence.new(0.2), 
		Width0 = 0.08, 
		Width1 = 0.08 + 2.22 * ((v63.Position - v64.Position).Magnitude / 100), 
		Parent = p43.projectileTargetingFolder
	});
	l__CollectionService__23:AddTag(v65, "projectile-preview-beam");
	p43.targetingMaid:GiveTask(v65);
	p43.targetingMaid:GiveTask(l__RunService__24.RenderStepped:Connect(function()
		if p44 ~= p43.targetingId then
			return nil;
		end;
		local v66 = p43:calculateImportantLaunchValues(p45, true, p46);
		if not v66 then
			p43:disableTargeting();
			return nil;
		end;
		local l__initialVelocity__67 = v66.initialVelocity;
		local l__positionFrom__68 = v66.positionFrom;
		local l__deltaT__69 = v66.deltaT;
		local l__Position__25 = (CFrame.new(l__positionFrom__68, l__positionFrom__68 + l__initialVelocity__67) * CFrame.new(Vector3.new(u21.RelX, u21.RelY, u21.RelZ))).Position;
		local u26 = v66.gravitationalAcceleration;
		local v70 = l__deltaT__69 / 2;
		local v71 = Vector3.new(l__initialVelocity__67.X * l__deltaT__69 + l__Position__25.X, -0.5 * u26 * l__deltaT__69 ^ 2 + l__initialVelocity__67.Y * l__deltaT__69 + l__Position__25.Y, l__initialVelocity__67.Z * l__deltaT__69 + l__Position__25.Z);
		local v72 = (Vector3.new(l__initialVelocity__67.X * (l__deltaT__69 / 2) + l__Position__25.X, -0.5 * u26 * v70 ^ 2 + l__initialVelocity__67.Y * v70 + l__Position__25.Y, l__initialVelocity__67.Z * (l__deltaT__69 / 2) + l__Position__25.Z) - l__Position__25 * 0.25 - v71 * 0.25) * 2;
		local v73 = v72 * 0.6666666666666666 + l__Position__25 * 0.3333333333333333;
		local v74 = v72 * 0.6666666666666666 + v71 * 0.3333333333333333;
		v63.CFrame = CFrame.new(l__Position__25, v73) * CFrame.Angles(0, math.pi / 2, 0);
		v64.CFrame = CFrame.new(v71, v74) * CFrame.Angles(0, -math.pi / 2, 0);
		v65.CurveSize0 = (v73 - v63.Position).Magnitude;
		v65.CurveSize1 = (v74 - v64.Position).Magnitude;
		v65.Width1 = 0.08 + u21.BeamGrowthMultiplier * ((v63.Position - v64.Position).Magnitude / 100);
	end));
end;
u1 = l__KnitClient__8.CreateController;
u1 = u1(u1.new());
return {
	ProjectileController = u1
};
