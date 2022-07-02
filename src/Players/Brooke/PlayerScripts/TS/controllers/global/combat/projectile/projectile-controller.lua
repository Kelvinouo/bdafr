-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
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
local l__KnitController__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v8 = setmetatable({}, {
	__tostring = function()
		return "ProjectileController";
	end, 
	__index = l__KnitController__7
});
v8.__index = v8;
local u1 = v8;
function u1.new(...)
	local v9 = setmetatable({}, u1);
	return v9:constructor(...) and v9;
end;
local u2 = l__KnitController__7;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1, ...)
	u2.constructor(p1, ...);
	p1.Name = "ProjectileController";
	p1.isTargeting = false;
	p1.targetingId = 0;
	p1.targetingMaid = u3.new();
end;
local l__ReplicatedStorage__4 = v4.ReplicatedStorage;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__6 = v4.Workspace;
local l__default__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.KnitStart(p2)
	l__ReplicatedStorage__4:WaitForChild("ProjectilesReady");
	p2.projectileTargetingFolder = u5("Folder", {
		Parent = l__Workspace__6, 
		Name = "ProjectileTargeting"
	});
	l__default__7.Client:OnEvent("RemoteName", function(p3)
		p2:createLocalProjectile(nil, p3.ammoType, p3.projectileType, p3.positionFrom, p3.projectileRefId, p3.initialVelocity, {
			drawDurationSeconds = p3.drawDurationSeconds
		});
	end);
end;
local l__ProjectileHandler__8 = v1.import(script, script.Parent, "projectile-handler").ProjectileHandler;
local l__GameAnimationUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__Players__10 = v4.Players;
function u1.enableTargeting(p4, p5, p6, p7, p8, p9)
	if p4.isTargeting then
		p4:disableTargeting();
	end;
	local v10 = (p4.targetingId + 1) % 10000;
	p4.targetingId = v10;
	local v11 = p9;
	if v11 ~= nil then
		v11 = v11.initialVelocityMultiplier;
	end;
	local v12 = v11;
	if v12 == nil then
		v12 = 1;
	end;
	if p8 ~= nil then
		local v13 = {
			inputObject = p8
		};
		local v14 = p8;
		if v14 ~= nil then
			v14 = v14.Position.X;
		end;
		local v15 = p8;
		if v15 ~= nil then
			v15 = v15.Position.Y;
		end;
		v13.initialPosition = Vector2.new(v14, v15);
		local v16 = v13;
	else
		v16 = nil;
	end;
	local v17 = l__ProjectileHandler__8.new(1, v12, p6, v16);
	local v18 = p7.firstPerson;
	if v18 ~= nil then
		v18 = v18.aimAnimation;
	end;
	if v18 ~= 0 and v18 == v18 and v18 then
		local u11 = l__KnitClient__3.Controllers.ViewmodelController:playAnimation(p7.firstPerson.aimAnimation, {
			looped = true, 
			fadeTime = 0.18
		});
		p4.targetingMaid:GiveTask(function()
			if u11 ~= nil then
				u11:Stop();
			end;
		end);
	end;
	local v19 = p7.thirdPerson;
	if v19 ~= nil then
		v19 = v19.aimAnimation;
	end;
	if v19 ~= 0 and v19 == v19 and v19 then
		local u12 = l__GameAnimationUtil__9.playAnimation(l__Players__10.LocalPlayer, p7.thirdPerson.aimAnimation, {
			looped = true
		});
		p4.targetingMaid:GiveTask(function()
			if u12 ~= nil then
				u12:Stop();
			end;
		end);
	end;
	local v20 = p7.thirdPerson;
	if v20 ~= nil then
		v20 = v20.drawAnimation;
	end;
	if v20 ~= 0 and v20 == v20 and v20 then
		local u13 = l__GameAnimationUtil__9.playAnimation(l__Players__10.LocalPlayer, p7.thirdPerson.drawAnimation, {
			looped = false
		});
		p4.targetingMaid:GiveTask(function()
			if u13 ~= nil then
				u13:Stop();
			end;
		end);
	end;
	p4:enableBeam(v10, v17);
	return v17;
end;
function u1.getLaunchPosition(p10, p11)
	local v21 = p11;
	if v21 ~= nil then
		v21 = v21:IsA("BasePart");
	end;
	if v21 and p11.Head then
		return p11.Head.BulletOrigin.WorldPosition;
	end;
	local v22 = l__Players__10.LocalPlayer.Character;
	if v22 ~= nil then
		v22 = v22.PrimaryPart;
		if v22 ~= nil then
			v22 = v22.Position;
		end;
	end;
	return v22;
end;
function u1.disableTargeting(p12)
	p12.targetingMaid:DoCleaning();
	p12.isTargeting = false;
end;
u1.launchProjectile = v1.async(function(p13, p14, p15, p16, p17, p18, p19, p20)
	local v23 = p13:calculateImportantLaunchValues(p16, false, p17);
	if not v23 then
		p13:disableTargeting();
		return nil;
	end;
	return p13:launchProjectileWithValues(v23, p17, p18, p15, p19, p20);
end);
local l__ClientSyncEvents__14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__SoundManager__15 = v2.SoundManager;
local l__RandomUtil__16 = v2.RandomUtil;
local l__HttpService__17 = v4.HttpService;
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
		local v24 = p27;
	else
		v24 = p24.projectileType(p25);
	end;
	if l__ClientSyncEvents__14.StartLaunchProjectile:fire(v24, p24):isCancelled() then
		return nil;
	end;
	local l__initialVelocity__25 = p22.initialVelocity;
	local l__positionFrom__26 = p22.positionFrom;
	local l__deltaT__27 = p22.deltaT;
	local v28 = p22.gravitationalAcceleration;
	local v29 = {};
	for v30, v31 in pairs(p26) do
		v29[v30] = v31;
	end;
	v29.drawDurationSeconds = p22.drawDurationSeconds;
	p26 = v29;
	if p24.launchSound then
		l__SoundManager__15:playSound(l__RandomUtil__16.fromList(unpack(p24.launchSound)));
	end;
	local v32 = p24.firstPerson;
	if v32 ~= nil then
		v32 = v32.fireAnimation;
	end;
	if v32 ~= 0 and v32 == v32 and v32 then
		l__KnitClient__3.Controllers.ViewmodelController:playAnimation(p24.firstPerson.fireAnimation, {
			fadeTime = 0.12
		});
	end;
	local v33 = p24.thirdPerson;
	if v33 ~= nil then
		v33 = v33.fireAnimation;
	end;
	if v33 ~= 0 and v33 == v33 and v33 then
		l__GameAnimationUtil__9.playAnimation(l__Players__10.LocalPlayer, p24.thirdPerson.fireAnimation);
	end;
	local v34 = l__HttpService__17:GenerateGUID();
	local v35 = l__ProjectileMeta__18[v24];
	local v36 = p21:createLocalProjectile(p24, p25, v24, l__positionFrom__26, v34, l__initialVelocity__25, {
		drawDurationSeconds = p26.drawDurationSeconds
	});
	if v36 then
		local v37 = l__EntityUtil__19:getLocalPlayerEntity();
		if v37 ~= nil then
			v37 = v37:getInstance();
		end;
		l__ClientSyncEvents__14.ProjectileLaunched:fire(v24, v36, l__initialVelocity__25, l__positionFrom__26, v37);
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
	local v39 = v1.await(l__default__7.Client:WaitFor("RemoteName"):andThen(function(p28)
		return p28:CallServerAsync(p23, p25, v24, l__positionFrom__26, v38, l__initialVelocity__25, v34, p26);
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
		l__default__7.Client:Get("RemoteName"):SendToServer(p34, v50);
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
	local l__CFrame__56 = l__Workspace__6.CurrentCamera.CFrame;
	local v57 = v51 + p40.fromPositionOffset;
	if p40.targetPoint == nil then
		local l__mouse__58 = l__Players__10.LocalPlayer:GetMouse();
		local v59 = Vector2.new(l__mouse__58.X, l__mouse__58.Y);
		local l__inputInfo__60 = p40.inputInfo;
		if l__inputInfo__60 then
			v59 = l__inputInfo__60.initialPosition;
		end;
		local v61 = (l__CFrame__56.Position + (l__Workspace__6.CurrentCamera:ScreenPointToRay(v59.X, v59.Y).Unit.Direction + Vector3.new(0, u21.YTargetOffset, 0)).Unit * ((l__CFrame__56.Position - v57).Magnitude * u21.CameraMultiplier) - v57).Unit;
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
local l__CollectionService__23 = v4.CollectionService;
local l__RunService__24 = v4.RunService;
function u1.enableBeam(p43, p44, p45, p46)
	local v62 = {
		Transparency = 1, 
		CanCollide = false, 
		Anchored = true, 
		Parent = p43.projectileTargetingFolder
	};
	local v63 = u5("Part", v62);
	local v64 = u5("Part", v62);
	l__GameQueryUtil__22:setQueryIgnored(v63, true);
	l__GameQueryUtil__22:setQueryIgnored(v64, true);
	p43.targetingMaid:GiveTask(v63);
	p43.targetingMaid:GiveTask(v64);
	local v65 = u5("Beam", {
		FaceCamera = true, 
		Attachment0 = u5("Attachment", {
			Parent = v63
		}), 
		Attachment1 = u5("Attachment", {
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
		local l__deltaT__67 = v66.deltaT;
		local l__initialVelocity__25 = v66.initialVelocity;
		local l__positionFrom__26 = v66.positionFrom;
		local u27 = v66.gravitationalAcceleration;
		local v68 = l__deltaT__67 / 2;
		local v69 = Vector3.new(l__initialVelocity__25.X * l__deltaT__67 + l__positionFrom__26.X, -0.5 * u27 * l__deltaT__67 ^ 2 + l__initialVelocity__25.Y * l__deltaT__67 + l__positionFrom__26.Y, l__initialVelocity__25.Z * l__deltaT__67 + l__positionFrom__26.Z);
		local v70 = (Vector3.new(l__initialVelocity__25.X * (l__deltaT__67 / 2) + l__positionFrom__26.X, -0.5 * u27 * v68 ^ 2 + l__initialVelocity__25.Y * v68 + l__positionFrom__26.Y, l__initialVelocity__25.Z * (l__deltaT__67 / 2) + l__positionFrom__26.Z) - l__positionFrom__26 * 0.25 - v69 * 0.25) * 2;
		v63.CFrame = CFrame.new(l__positionFrom__26, v70) * CFrame.new(Vector3.new(u21.RelX, u21.RelY, u21.RelZ)) * CFrame.Angles(0, math.pi / 2, 0);
		v64.CFrame = CFrame.new(v69) * (v63.CFrame - v63.Position);
		v65.CurveSize0 = (v70 - v63.Position).Magnitude;
	end));
end;
u2 = l__KnitClient__3.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	ProjectileController = u2
};
return u1;
