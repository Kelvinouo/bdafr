-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "VoidTurretAttackController";
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
	p1.Name = "VoidTurretAttackController";
	p1.maid = u2.new();
end;
local l__ClientSyncEvents__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__AbilityId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local l__Players__5 = v3.Players;
local l__ClientStore__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__CollectionService__7 = v3.CollectionService;
local l__TurretId__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "turret", "turret-id").TurretId;
local l__Flamework__9 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__UserInputService__10 = v3.UserInputService;
local l__RunService__11 = v3.RunService;
local l__Workspace__12 = v3.Workspace;
local l__EntityUtil__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__GameWorldUtil__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
local u15 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__GameQueryUtil__16 = v2.GameQueryUtil;
local l__default__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__KnitClient__18 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
function u1.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__ClientSyncEvents__3.AbilityUsed:connect(function(p3)
		if p3.ability ~= l__AbilityId__4.VOID_TURRET_FIRE then
			return nil;
		end;
		local l__extra__7 = p3.extra;
		p2:playAttackAnimation(l__extra__7.fromTurret, l__extra__7.target, p3.userCharacter == l__Players__5.LocalPlayer.Character);
	end);
	l__ClientStore__6.changed:connect(function(p4, p5)
		local l__selectedTurret__8 = p4.Game.selectedTurret;
		if l__selectedTurret__8 == p5.Game.selectedTurret then
			return nil;
		end;
		p2.maid:DoCleaning();
		if l__selectedTurret__8 == nil or table.find(l__CollectionService__7:GetTags(l__selectedTurret__8), l__TurretId__8.VOID_TURRET) == nil then
			return nil;
		end;
		p2.maid:GiveTask(l__Flamework__9.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(l__AbilityId__4.VOID_TURRET_FIRE, nil));
		p2.maid:GiveTask(l__UserInputService__10.InputBegan:Connect(function(p6, p7)
			if not p7 and p2:isAcceptableInput(p6) and p6.UserInputState == Enum.UserInputState.Begin then
				if not p2.target then
					return nil;
				end;
				if l__Flamework__9.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(l__AbilityId__4.VOID_TURRET_FIRE) then
					l__Flamework__9.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(l__AbilityId__4.VOID_TURRET_FIRE, {
						target = p2.target, 
						fromTurret = l__selectedTurret__8
					});
				end;
			end;
		end));
		p2.maid:GiveTask(function()
			p2:removeTarget();
		end);
		p2.maid:GiveTask(l__RunService__11.Heartbeat:Connect(function()
			local v9 = l__Workspace__12.CurrentCamera;
			if v9 ~= nil then
				v9 = v9.CFrame;
			end;
			if not v9 then
				p2:removeTarget();
				return nil;
			end;
			local v10 = l__EntityUtil__13:getLocalPlayerEntity();
			if not v10 then
				p2:removeTarget();
				return nil;
			end;
			local l__Unit__11 = Ray.new(v9.Position, v9.LookVector).Unit;
			local v12 = nil;
			local v13 = math.huge;
			local v14, v15, v16 = ipairs((l__GameWorldUtil__14.getEntitiesWithinRadius(v9 * Vector3.new(0, 0, -20), 20)));
			while true do
				v14(v15, v16);
				if not v14 then
					break;
				end;
				v16 = v14;
				if v10:canAttack(v15) then
					local l__Position__17 = v15:getInstance():GetPrimaryPartCFrame().Position;
					local v18 = l__Unit__11:ClosestPoint(l__Position__17);
					local l__Magnitude__19 = (l__Position__17 - v18).Magnitude;
					if not (l__Magnitude__19 > 6) then
						local v20 = l__Magnitude__19 + (l__Unit__11.Origin - v18).Magnitude / 3;
						if v20 < v13 then
							v12 = v15:getInstance();
							v13 = v20;
						end;
					end;
				end;			
			end;
			if p2.target ~= v12 then
				p2:removeTarget();
				if v12 then
					p2.targetIcon = u15("BillboardGui", {
						Parent = v12.PrimaryPart, 
						Size = UDim2.new(0.8, 10, 0.8, 10), 
						AlwaysOnTop = true, 
						Children = { u15("ImageLabel", {
								Image = "rbxassetid://9429977101", 
								BackgroundTransparency = 1, 
								Size = UDim2.fromScale(1, 1), 
								ScaleType = Enum.ScaleType.Fit, 
								ImageColor3 = Color3.fromRGB(255, 37, 222)
							}) }
					});
				end;
			end;
			p2.target = v12;
		end));
		l__CollectionService__7:GetInstanceAddedSignal(l__TurretId__8.VULCAN_TURRET):Connect(function(p8)
			p8:SetAttribute("ProjectilesIgnore", true);
			local v21, v22, v23 = ipairs(p8:GetDescendants());
			while true do
				v21(v22, v23);
				if not v21 then
					break;
				end;
				v23 = v21;
				l__GameQueryUtil__16:setQueryIgnored(v22, true);			
			end;
		end);
	end);
	l__default__17.Client:OnEvent("RemoteName", function(p9)
		if p9.extra.projectileData and p9.extra.projectileData.projectileType == "turretBullet" and p9.entityInstance == l__Players__5.LocalPlayer.Character then
			local v24 = u2.new();
			v24:GiveTask(l__KnitClient__18.Controllers.SprintController:getMovementStatusModifier():addModifier({
				moveSpeedMultiplier = 0.5
			}));
			task.delay(0.1, function()
				v24:DoCleaning();
			end);
		end;
	end);
end;
function u1.removeTarget(p10)
	p10.target = nil;
	local l__targetIcon__25 = p10.targetIcon;
	if l__targetIcon__25 ~= nil then
		l__targetIcon__25:Destroy();
	end;
end;
function u1.isAcceptableInput(p11, p12)
	local v26 = true;
	if p12.KeyCode ~= Enum.KeyCode.ButtonR2 then
		v26 = true;
		if p12.UserInputType ~= Enum.UserInputType.MouseButton1 then
			v26 = p12.UserInputType == Enum.UserInputType.Touch;
		end;
	end;
	return v26;
end;
local l__SoundManager__19 = v2.SoundManager;
local l__GameSound__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__21 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__Linear__22 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).Linear;
function u1.playAttackAnimation(p13, p14, p15, p16)
	local v27 = u2.new();
	local v28 = {};
	if p16 then
		local v29 = nil;
	else
		v29 = p14;
	end;
	v28.parent = v29;
	v28.rollOffMaxDistance = 100;
	local u23 = l__SoundManager__19:playSound(l__GameSound__20.VOID_CRAB_BEAM_ATTACK, v28);
	v27:GiveTask(function()
		if u23 ~= nil then
			u23:Stop();
		end;
		if u23 ~= nil then
			u23:Destroy();
		end;
	end);
	v27:GiveTask(p14.AncestryChanged:Connect(function()
		if p14.Parent then
			return nil;
		end;
		v27:DoCleaning();
	end));
	v27:GiveTask(p15.AncestryChanged:Connect(function()
		if p15.Parent then
			return nil;
		end;
		v27:DoCleaning();
	end));
	local l__BulletOrigin__30 = p14:WaitForChild("Head"):WaitForChild("BulletOrigin");
	local l__TargetBeam__31 = l__BulletOrigin__30:WaitForChild("TargetBeam");
	l__TargetBeam__31.Enabled = true;
	local l__BlastBeam__24 = l__BulletOrigin__30:WaitForChild("BlastBeam");
	local v32 = p15;
	if v32 ~= nil then
		v32 = v32:FindFirstChild("UpperTorso");
		if v32 ~= nil then
			v32 = v32:FindFirstChild("BodyFrontAttachment");
		end;
	end;
	l__TargetBeam__31.Attachment1 = v32;
	l__BlastBeam__24.Attachment1 = v32;
	local u25 = v1.Promise.delay(1.8):andThen(function()
		l__TargetBeam__31.Enabled = false;
		l__BlastBeam__24.Enabled = true;
		local u26 = l__default__21(0.1, l__Linear__22, function(p17)
			l__BlastBeam__24.Width0 = 0.1 + p17 * 0.4;
			l__BlastBeam__24.Width1 = 0.2 + p17 * 0.6;
		end);
		v27:GiveTask(function()
			return u26:Cancel();
		end);
		task.delay(0.3, function()
			if not l__BlastBeam__24.Parent then
				return nil;
			end;
			local u27 = l__default__21(0.05, l__Linear__22, function(p18)
				l__BlastBeam__24.Width0 = 0.5 * (1 - p18);
				l__BlastBeam__24.Width1 = 0.8 * (1 - p18);
			end);
			v27:GiveTask(function()
				return u27:Cancel();
			end);
		end);
	end);
	v27:GiveTask(function()
		return u25:cancel();
	end);
end;
u1 = l__KnitClient__18.CreateController;
u1 = u1(u1.new());
return nil;
