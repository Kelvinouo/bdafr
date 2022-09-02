-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "TNTWarsDroneController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "flipper").src);
function v5.constructor(p1, ...)
	l__KnitController__4.constructor(p1, ...);
	p1.Name = "TNTWarsDroneController";
	p1.speedMotor = u1.SingleMotor.new(0);
	p1.velocityMotor = u1.GroupMotor.new({
		x = 0, 
		y = 0, 
		z = 0
	});
	p1.colorEnemy = Color3.fromRGB(255, 89, 89);
	p1.colorTeam = Color3.fromRGB(0, 248, 81);
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ClientSyncEvents__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__SoundManager__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Flamework__6 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__EngineerFilmEffect__9 = v1.import(script, script.Parent.Parent.Parent, "bedwars", "kit", "kits", "watcher", "ui", "engineer-film-effect").EngineerFilmEffect;
local l__Players__10 = v3.Players;
local l__BuildRoduxApp__11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").BuildRoduxApp;
local l__TNTWarsDroneUI__12 = v1.import(script, script.Parent, "ui", "tnt-wars-drone-ui").TNTWarsDroneUI;
local l__GameAnimationUtil__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__CollectionService__15 = v3.CollectionService;
local l__RunService__16 = v3.RunService;
local l__KnitClient__17 = v2.KnitClient;
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "player-control-module");
local l__Workspace__19 = v3.Workspace;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	local u20 = u2.new();
	l__ClientSyncEvents__3.GuidedProjectileRemoved:connect(function(p3)
		if p3.guidedProjectileType == "tnt_wars_drone" then
			u20:DoCleaning();
		end;
	end);
	l__ClientSyncEvents__3.GuidedProjectileEnabling:connect(function(p4)
		if p4.guidedProjectileType ~= "tnt_wars_drone" then
			return nil;
		end;
		l__SoundManager__4:playSound(l__GameSound__5.DRONE_DEPLOY);
		p2:updateHealthUi(p4.model);
		u20:GiveTask(function()
			p2:updateHealthUi(nil);
			l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__7.TNT_WARS_DRONE);
		end);
		p2.filmTree = u8.mount(u8.createElement("ScreenGui", {
			ResetOnSpawn = false, 
			IgnoreGuiInset = true
		}, { u8.createElement(l__EngineerFilmEffect__9, {
				transparency = 0.98, 
				color = Color3.fromRGB(219, 232, 148)
			}) }), l__Players__10.LocalPlayer:FindFirstChildOfClass("PlayerGui"));
		u20:GiveTask(function()
			if p2.filmTree then
				u8.unmount(p2.filmTree);
				p2.filmTree = nil;
			end;
		end);
		local v7 = l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(l__BuildRoduxApp__11(l__TNTWarsDroneUI__12));
		if v7 then
			u20:GiveTask(v7);
		end;
		local u21 = l__GameAnimationUtil__13.playAnimation(l__Players__10.LocalPlayer, l__AnimationType__14.USE_TABLET, {
			looped = true
		});
		u20:GiveTask(function()
			if u21 ~= nil then
				u21:Stop();
			end;
		end);
	end);
	l__ClientSyncEvents__3.GuidedProjectileDisabling:connect(function(p5)
		if p5.guidedProjectileType ~= "tnt_wars_drone" then
			return nil;
		end;
		l__SoundManager__4:playSound(l__GameSound__5.DRONE_DEPLOY);
		local v8, v9, v10 = ipairs(p5.model:GetDescendants());
		while true do
			v8(v9, v10);
			if not v8 then
				break;
			end;
			v10 = v8;
			if v9:IsA("Sound") then
				v9.Volume = 0;
			end;		
		end;
	end);
	l__CollectionService__15:GetInstanceAddedSignal("TNTWarsDrone"):Connect(function(p6)
		p2:setRelativeDroneColor(p6);
		if p6:GetAttribute("PlayerUserId") ~= l__Players__10.LocalPlayer.UserId then
			return nil;
		end;
		p6:GetAttributeChangedSignal("Health"):Connect(function()
			p2:updateHealthUi(p6);
		end);
		p6:GetAttributeChangedSignal("MaxHealth"):Connect(function()
			p2:updateHealthUi(p6);
		end);
	end);
	l__RunService__16.Heartbeat:Connect(function()
		local v11 = l__KnitClient__17.Controllers.GuidedProjectileController:getCurrentGuidedProjectile();
		if v11 and v11.type == "tnt_wars_drone" and v11.enabled == true then
			if v11.disabling then
				return nil;
			end;
			local v12 = u18:GetMoveVector();
			if v12.Magnitude > 0.5 then
				p2.speedMotor:setGoal(u1.Spring.new(30, {
					frequency = 1, 
					dampingRatio = 0.5
				}));
				local v13 = l__Workspace__19.CurrentCamera.CFrame:Inverse():VectorToObjectSpace(v12.Unit) * p2.speedMotor:getValue();
				p2.velocityMotor:setGoal({
					x = u1.Spring.new(v13.X, {
						frequency = 4, 
						dampingRatio = 0.7
					}), 
					y = u1.Spring.new(v13.Y, {
						frequency = 4, 
						dampingRatio = 0.7
					}), 
					z = u1.Spring.new(v13.Z, {
						frequency = 4, 
						dampingRatio = 0.7
					})
				});
			else
				p2.speedMotor:setGoal(u1.Spring.new(0, {
					frequency = 1, 
					dampingRatio = 0.5
				}));
				p2.velocityMotor:setGoal({
					x = u1.Spring.new(0, {
						frequency = 1, 
						dampingRatio = 0.75
					}), 
					y = u1.Spring.new(0, {
						frequency = 1, 
						dampingRatio = 0.75
					}), 
					z = u1.Spring.new(0, {
						frequency = 1, 
						dampingRatio = 0.75
					})
				});
			end;
			local v14, v15, v16 = ipairs(v11.sounds);
			while true do
				v14(v15, v16);
				if not v14 then
					break;
				end;
				v16 = v14;
				v15.Volume = p2.speedMotor:getValue() / 60 / 2 + 0.5;			
			end;
			local v17 = p2.velocityMotor:getValue();
			v11.model.PrimaryPart.AssemblyLinearVelocity = Vector3.new(v17.x, v17.y, v17.z);
			v11.model.PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0);
		end;
	end);
end;
local l__TNTWarsDroneHealth__22 = v1.import(script, script.Parent, "ui", "tnt-wars-drone-health-ui").TNTWarsDroneHealth;
function v5.updateHealthUi(p7, p8)
	if not p8 then
		if p7.healthUIMaid then
			p7.healthUIMaid:DoCleaning();
			p7.healthUIMaid = nil;
		end;
		return;
	end;
	if p7.healthUIMaid then
		p7.healthUIMaid:DoCleaning();
	end;
	p7.healthUIMaid = l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u8.createElement(l__TNTWarsDroneHealth__22, {
		health = p8:GetAttribute("Health"), 
		maxHealth = p8:GetAttribute("MaxHealth")
	}));
end;
local l__GamePlayerUtil__23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
function v5.setRelativeDroneColor(p9, p10)
	local v18 = p10:FindFirstChild("UpperTorso");
	if v18 ~= nil then
		v18 = v18:FindFirstChild("Color");
	end;
	if not v18 then
		return nil;
	end;
	local v19 = p10:GetAttribute("PlayerUserId");
	if v19 == 0 or v19 ~= v19 or not v19 then
		return nil;
	end;
	local v20 = l__Players__10:GetPlayerByUserId(v19);
	if not v20 then
		return nil;
	end;
	if l__GamePlayerUtil__23.getGamePlayer(v20):getTeamId() == l__GamePlayerUtil__23.getGamePlayer(l__Players__10.LocalPlayer):getTeamId() then
		local v21 = p9.colorTeam;
	else
		v21 = p9.colorEnemy;
	end;
	v18.Color = v21;
end;
local v22 = v2.KnitClient.CreateController(v5.new());
return nil;
