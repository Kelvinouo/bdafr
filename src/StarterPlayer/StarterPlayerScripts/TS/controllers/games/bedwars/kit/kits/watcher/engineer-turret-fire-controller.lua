
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitClient__3 = v2.KnitClient;
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "CameraTurretFireController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
local u1 = v6;
function u1.new(...)
	local v7 = setmetatable({}, u1);
	return v7:constructor(...) and v7;
end;
local u2 = l__KnitController__5;
local l__Maid__3 = v2.Maid;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "CameraTurretFireController";
	p1.mouseDown = false;
	p1.nextAllowedShot = -1;
	p1.maid = l__Maid__3.new();
end;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__UserInputService__5 = v4.UserInputService;
local l__RunService__6 = v4.RunService;
local l__CollectionService__7 = v4.CollectionService;
local l__GameQueryUtil__8 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
local l__default__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__10 = v4.Players;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
	l__ClientStore__4.changed:connect(function(p3, p4)
		local l__engineerSelectedTurret__8 = p3.Kit.engineerSelectedTurret;
		if l__engineerSelectedTurret__8 == p4.Kit.engineerSelectedTurret then
			return nil;
		end;
		p2.maid:DoCleaning();
		if l__engineerSelectedTurret__8 == nil then
			return nil;
		end;
		p2.maid:GiveTask(l__UserInputService__5.InputBegan:Connect(function(p5, p6)
			if not p6 and p2:isAcceptableInput(p5) and p5.UserInputState == Enum.UserInputState.Begin then
				p2.mouseDown = true;
			end;
		end));
		p2.maid:GiveTask(l__UserInputService__5.InputEnded:Connect(function(p7, p8)
			if not p8 and p2:isAcceptableInput(p7) and p7.UserInputState == Enum.UserInputState.End then
				p2.mouseDown = false;
			end;
		end));
		p2.maid:GiveTask(l__RunService__6.Heartbeat:Connect(function()
			if p2.mouseDown == true then
				p2:fire(l__engineerSelectedTurret__8);
			end;
		end));
		p2.maid:GiveTask(l__UserInputService__5.TouchTapInWorld:Connect(function(p9, p10)
			if not p10 then
				p2:fire(l__engineerSelectedTurret__8);
			end;
		end));
		l__CollectionService__7:GetInstanceAddedSignal("engineer-turret"):Connect(function(p11)
			p11:SetAttribute("ProjectilesIgnore", true);
			for v9, v10 in ipairs(p11:GetDescendants()) do
				l__GameQueryUtil__8:setQueryIgnored(v10, true);
			end;
		end);
	end);
	l__default__9.Client:OnEvent("RemoteName", function(p12)
		if p12.extra.projectileData and p12.extra.projectileData.projectileType == "turretBullet" and p12.entityInstance == l__Players__10.LocalPlayer.Character then
			local v11 = l__Maid__3.new();
			v11:GiveTask(l__KnitClient__3.Controllers.SprintController:getMovementStatusModifier():addModifier({
				moveSpeedMultiplier = 0.5
			}));
			task.delay(0.1, function()
				v11:DoCleaning();
			end);
		end;
	end);
end;
function u1.isAcceptableInput(p13, p14)
	local v12 = true;
	if p14.KeyCode ~= Enum.KeyCode.ButtonR2 then
		v12 = p14.UserInputType == Enum.UserInputType.MouseButton1;
	end;
	return v12;
end;
local l__getItemMeta__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ProjectileHandler__12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-handler").ProjectileHandler;
local l__KnitClient__13 = v2.KnitClient;
local l__ItemType__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__HapticService__15 = v4.HapticService;
function u1.fire(p15, p16)
	local v13 = l__getItemMeta__11(p16.Name).block;
	if v13 ~= nil then
		v13 = v13.projectileSource;
	end;
	if not v13 then
		return nil;
	end;
	if time() < p15.nextAllowedShot then
		return nil;
	end;
	p15.nextAllowedShot = time() + v13.fireDelaySec;
	local l__BulletOrigin__14 = p16.Head.BulletOrigin;
	l__KnitClient__13.Controllers.ProjectileController:launchProjectile(l__ItemType__14.CAMERA_TURRET, nil, l__ProjectileHandler__12.new(1, 1, "turretBullet", nil, l__BulletOrigin__14.WorldCFrame.LookVector * 5 + l__BulletOrigin__14.WorldPosition, Vector3.new(0, 0, 0)), p16, v13);
	local l__ShootParticles1__15 = l__BulletOrigin__14.ShootParticles1;
	local l__ShootParticles2__16 = l__BulletOrigin__14.ShootParticles2;
	if l__ShootParticles1__15 then
		l__ShootParticles1__15:Emit(1);
	end;
	if l__ShootParticles2__16 then
		l__ShootParticles2__16:Emit(2);
	end;
	if l__HapticService__15:IsVibrationSupported(Enum.UserInputType.Gamepad1) then
		local l__hapticCancelPromise__17 = p15.hapticCancelPromise;
		if l__hapticCancelPromise__17 ~= nil then
			l__hapticCancelPromise__17:cancel();
		end;
		if l__HapticService__15:IsMotorSupported(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.RightTrigger) then
			local v18 = Enum.VibrationMotor.RightTrigger;
		else
			v18 = Enum.VibrationMotor.Small;
		end;
		l__HapticService__15:SetMotor(Enum.UserInputType.Gamepad1, v18, 1);
		p15.hapticCancelPromise = v1.Promise.defer(function(p17, p18, p19)
			local u16 = false;
			p19(function()
				u16 = true;
			end);
			task.wait(0.1);
			if u16 then
				return nil;
			end;
			l__HapticService__15:SetMotor(Enum.UserInputType.Gamepad1, v18, 0);
		end);
	end;
end;
u2 = l__KnitClient__3.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;

