-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "VoidTurretAttackController";
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
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "VoidTurretAttackController";
	p1.maid = u3.new();
end;
local l__ClientSyncEvents__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__AbilityId__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local l__Players__6 = v4.Players;
local l__ClientStore__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__CollectionService__8 = v4.CollectionService;
local l__TurretId__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "turret", "turret-id").TurretId;
local l__Flamework__10 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__UserInputService__11 = v4.UserInputService;
local l__RunService__12 = v4.RunService;
local l__Workspace__13 = v4.Workspace;
local l__EntityUtil__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__GameWorldUtil__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
local u16 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__GameQueryUtil__17 = v2.GameQueryUtil;
local l__default__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
	l__ClientSyncEvents__4.AbilityUsed:connect(function(p3)
		if p3.ability ~= l__AbilityId__5.VOID_TURRET_FIRE then
			return nil;
		end;
		local l__extra__8 = p3.extra;
		p2:playAttackAnimation(l__extra__8.fromTurret, l__extra__8.target, p3.userCharacter == l__Players__6.LocalPlayer.Character);
	end);
	l__ClientStore__7.changed:connect(function(p4, p5)
		local l__selectedTurret__9 = p4.Game.selectedTurret;
		if l__selectedTurret__9 == p5.Game.selectedTurret then
			return nil;
		end;
		p2.maid:DoCleaning();
		if l__selectedTurret__9 == nil or table.find(l__CollectionService__8:GetTags(l__selectedTurret__9), l__TurretId__9.VOID_TURRET) == nil then
			return nil;
		end;
		p2.maid:GiveTask(l__Flamework__10.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(l__AbilityId__5.VOID_TURRET_FIRE, nil));
		p2.maid:GiveTask(l__UserInputService__11.InputBegan:Connect(function(p6, p7)
			if not p7 and p2:isAcceptableInput(p6) and p6.UserInputState == Enum.UserInputState.Begin then
				if not p2.target then
					return nil;
				end;
				if l__Flamework__10.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(l__AbilityId__5.VOID_TURRET_FIRE) then
					l__Flamework__10.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(l__AbilityId__5.VOID_TURRET_FIRE, {
						target = p2.target, 
						fromTurret = l__selectedTurret__9
					});
				end;
			end;
		end));
		p2.maid:GiveTask(function()
			p2:removeTarget();
		end);
		p2.maid:GiveTask(l__RunService__12.Heartbeat:Connect(function()
			local v10 = l__Workspace__13.CurrentCamera;
			if v10 ~= nil then
				v10 = v10.CFrame;
			end;
			if not v10 then
				p2:removeTarget();
				return nil;
			end;
			local v11 = l__EntityUtil__14:getLocalPlayerEntity();
			if not v11 then
				p2:removeTarget();
				return nil;
			end;
			local l__Unit__12 = Ray.new(v10.Position, v10.LookVector).Unit;
			local v13 = nil;
			local v14 = math.huge;
			for v15, v16 in ipairs((l__GameWorldUtil__15.getEntitiesWithinRadius(v10 * Vector3.new(0, 0, -20), 20))) do
				if v11:canAttack(v16) then
					local l__Position__17 = v16:getInstance():GetPrimaryPartCFrame().Position;
					local v18 = l__Unit__12:ClosestPoint(l__Position__17);
					local l__Magnitude__19 = (l__Position__17 - v18).Magnitude;
					if not (l__Magnitude__19 > 6) then
						local v20 = l__Magnitude__19 + (l__Unit__12.Origin - v18).Magnitude / 3;
						if v20 < v14 then
							v13 = v16:getInstance();
							v14 = v20;
						end;
					end;
				end;
			end;
			if p2.target ~= v13 then
				p2:removeTarget();
				if v13 then
					p2.targetIcon = u16("BillboardGui", {
						Parent = v13.PrimaryPart, 
						Size = UDim2.new(0.8, 10, 0.8, 10), 
						AlwaysOnTop = true, 
						Children = { u16("ImageLabel", {
								Image = "rbxassetid://9429977101", 
								BackgroundTransparency = 1, 
								Size = UDim2.fromScale(1, 1), 
								ScaleType = Enum.ScaleType.Fit, 
								ImageColor3 = Color3.fromRGB(255, 37, 222)
							}) }
					});
				end;
			end;
			p2.target = v13;
		end));
		l__CollectionService__8:GetInstanceAddedSignal(l__TurretId__9.VULCAN_TURRET):Connect(function(p8)
			p8:SetAttribute("ProjectilesIgnore", true);
			for v21, v22 in ipairs(p8:GetDescendants()) do
				l__GameQueryUtil__17:setQueryIgnored(v22, true);
			end;
		end);
	end);
	l__default__18.Client:OnEvent("RemoteName", function(p9)
		if p9.extra.projectileData and p9.extra.projectileData.projectileType == "turretBullet" and p9.entityInstance == l__Players__6.LocalPlayer.Character then
			local v23 = u3.new();
			v23:GiveTask(l__KnitClient__3.Controllers.SprintController:getMovementStatusModifier():addModifier({
				moveSpeedMultiplier = 0.5
			}));
			task.delay(0.1, function()
				v23:DoCleaning();
			end);
		end;
	end);
end;
function u1.removeTarget(p10)
	p10.target = nil;
	local l__targetIcon__24 = p10.targetIcon;
	if l__targetIcon__24 ~= nil then
		l__targetIcon__24:Destroy();
	end;
end;
function u1.isAcceptableInput(p11, p12)
	local v25 = true;
	if p12.KeyCode ~= Enum.KeyCode.ButtonR2 then
		v25 = true;
		if p12.UserInputType ~= Enum.UserInputType.MouseButton1 then
			v25 = p12.UserInputType == Enum.UserInputType.Touch;
		end;
	end;
	return v25;
end;
local l__SoundManager__19 = v2.SoundManager;
local l__GameSound__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__21 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__Linear__22 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).Linear;
function u1.playAttackAnimation(p13, p14, p15, p16)
	local v26 = u3.new();
	local v27 = {};
	if p16 then
		local v28 = nil;
	else
		v28 = p14;
	end;
	v27.parent = v28;
	v27.rollOffMaxDistance = 100;
	local u23 = l__SoundManager__19:playSound(l__GameSound__20.VOID_CRAB_BEAM_ATTACK, v27);
	v26:GiveTask(function()
		if u23 ~= nil then
			u23:Stop();
		end;
		if u23 ~= nil then
			u23:Destroy();
		end;
	end);
	v26:GiveTask(p14.AncestryChanged:Connect(function()
		if p14.Parent then
			return nil;
		end;
		v26:DoCleaning();
	end));
	v26:GiveTask(p15.AncestryChanged:Connect(function()
		if p15.Parent then
			return nil;
		end;
		v26:DoCleaning();
	end));
	local l__BulletOrigin__29 = p14:WaitForChild("Head"):WaitForChild("BulletOrigin");
	local l__TargetBeam__30 = l__BulletOrigin__29:WaitForChild("TargetBeam");
	l__TargetBeam__30.Enabled = true;
	local l__BlastBeam__24 = l__BulletOrigin__29:WaitForChild("BlastBeam");
	(function(p17)
		local v31 = p17;
		if v31 ~= nil then
			v31 = v31:FindFirstChild("UpperTorso");
			if v31 ~= nil then
				v31 = v31:FindFirstChild("BodyFrontAttachment");
			end;
		end;
		l__TargetBeam__30.Attachment1 = v31;
		l__BlastBeam__24.Attachment1 = v31;
	end)(p15);
	local u25 = v1.Promise.delay(1.8):andThen(function()
		l__TargetBeam__30.Enabled = false;
		l__BlastBeam__24.Enabled = true;
		local u26 = l__default__21(0.1, l__Linear__22, function(p18)
			l__BlastBeam__24.Width0 = 0.1 + p18 * 0.4;
			l__BlastBeam__24.Width1 = 0.2 + p18 * 0.6;
		end);
		v26:GiveTask(function()
			return u26:Cancel();
		end);
		task.delay(0.3, function()
			if not l__BlastBeam__24.Parent then
				return nil;
			end;
			local u27 = l__default__21(0.05, l__Linear__22, function(p19)
				l__BlastBeam__24.Width0 = 0.5 * (1 - p19);
				l__BlastBeam__24.Width1 = 0.8 * (1 - p19);
			end);
			v26:GiveTask(function()
				return u27:Cancel();
			end);
		end);
	end);
	v26:GiveTask(function()
		return u25:cancel();
	end);
end;
u2 = l__KnitClient__3.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
