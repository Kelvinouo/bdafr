-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "CameraTurretFireController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "CameraTurretFireController";
	p1.mouseDown = false;
	p1.nextAllowedShot = -1;
	p1.maid = u2.new();
end;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__CollectionService__4 = v3.CollectionService;
local l__TurretId__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "turret", "turret-id").TurretId;
local l__UserInputService__6 = v3.UserInputService;
local l__RunService__7 = v3.RunService;
local l__GameQueryUtil__8 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
local l__default__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__10 = v3.Players;
local l__KnitClient__11 = v2.KnitClient;
function u1.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__ClientStore__3.changed:connect(function(p3, p4)
		local l__selectedTurret__7 = p3.Game.selectedTurret;
		if l__selectedTurret__7 == p4.Game.selectedTurret then
			return nil;
		end;
		p2.maid:DoCleaning();
		if l__selectedTurret__7 == nil or table.find(l__CollectionService__4:GetTags(l__selectedTurret__7), l__TurretId__5.VULCAN_TURRET) == nil then
			return nil;
		end;
		p2.maid:GiveTask(l__UserInputService__6.InputBegan:Connect(function(p5, p6)
			if not p6 and p2:isAcceptableInput(p5) and p5.UserInputState == Enum.UserInputState.Begin then
				p2.mouseDown = true;
			end;
		end));
		p2.maid:GiveTask(l__UserInputService__6.InputEnded:Connect(function(p7, p8)
			if not p8 and p2:isAcceptableInput(p7) and p7.UserInputState == Enum.UserInputState.End then
				p2.mouseDown = false;
			end;
		end));
		p2.maid:GiveTask(l__RunService__7.Heartbeat:Connect(function()
			if p2.mouseDown == true then
				p2:fire(l__selectedTurret__7);
			end;
		end));
		p2.maid:GiveTask(l__UserInputService__6.TouchTapInWorld:Connect(function(p9, p10)
			if not p10 then
				p2:fire(l__selectedTurret__7);
			end;
		end));
		l__CollectionService__4:GetInstanceAddedSignal(l__TurretId__5.VULCAN_TURRET):Connect(function(p11)
			p11:SetAttribute("ProjectilesIgnore", true);
			local v8, v9, v10 = ipairs(p11:GetDescendants());
			while true do
				v8(v9, v10);
				if not v8 then
					break;
				end;
				v10 = v8;
				l__GameQueryUtil__8:setQueryIgnored(v9, true);			
			end;
		end);
	end);
	l__default__9.Client:OnEvent("RemoteName", function(p12)
		if p12.extra.projectileData and p12.extra.projectileData.projectileType == "turretBullet" and p12.entityInstance == l__Players__10.LocalPlayer.Character then
			local v11 = u2.new();
			v11:GiveTask(l__KnitClient__11.Controllers.SprintController:getMovementStatusModifier():addModifier({
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
local l__getItemMeta__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ProjectileHandler__13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-handler").ProjectileHandler;
local l__KnitClient__14 = v2.KnitClient;
local l__ItemType__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__HapticService__16 = v3.HapticService;
function u1.fire(p15, p16)
	local v13 = l__getItemMeta__12(p16.Name).block;
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
	l__KnitClient__14.Controllers.ProjectileController:launchProjectile(l__ItemType__15.CAMERA_TURRET, nil, l__ProjectileHandler__13.new(1, 1, "turretBullet", nil, l__BulletOrigin__14.WorldCFrame.LookVector * 5 + l__BulletOrigin__14.WorldPosition, Vector3.new(0, 0, 0)), p16, v13);
	local l__ShootParticles1__15 = l__BulletOrigin__14.ShootParticles1;
	local l__ShootParticles2__16 = l__BulletOrigin__14.ShootParticles2;
	if l__ShootParticles1__15 then
		l__ShootParticles1__15:Emit(1);
	end;
	if l__ShootParticles2__16 then
		l__ShootParticles2__16:Emit(2);
	end;
	if l__HapticService__16:IsVibrationSupported(Enum.UserInputType.Gamepad1) then
		local l__hapticCancelPromise__17 = p15.hapticCancelPromise;
		if l__hapticCancelPromise__17 ~= nil then
			l__hapticCancelPromise__17:cancel();
		end;
		if l__HapticService__16:IsMotorSupported(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.RightTrigger) then
			local v18 = Enum.VibrationMotor.RightTrigger;
		else
			v18 = Enum.VibrationMotor.Small;
		end;
		l__HapticService__16:SetMotor(Enum.UserInputType.Gamepad1, v18, 1);
		p15.hapticCancelPromise = v1.Promise.defer(function(p17, p18, p19)
			local u17 = false;
			p19(function()
				u17 = true;
			end);
			task.wait(0.1);
			if u17 then
				return nil;
			end;
			l__HapticService__16:SetMotor(Enum.UserInputType.Gamepad1, v18, 0);
		end);
	end;
end;
u1 = l__KnitClient__11.CreateController;
u1 = u1(u1.new());
return nil;
