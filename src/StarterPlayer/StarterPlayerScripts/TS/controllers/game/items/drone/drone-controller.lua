-- Script Hash: 857e7446c54f34237f496bcf21d4b5181830a586eb4357ed826db6f8f8109fe524e52c9df7225a9354f0a936454e1bab
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "DroneController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "flipper").src);
function v5.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.Name = "DroneController";
	p1.speedMotor = u2.SingleMotor.new(0);
	p1.velocityMotor = u2.GroupMotor.new({
		x = 0, 
		y = 0, 
		z = 0
	});
end;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ClientSyncEvents__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__SoundManager__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__EngineerFilmEffect__8 = v1.import(script, script.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "watcher", "ui", "engineer-film-effect").EngineerFilmEffect;
local l__Players__9 = v3.Players;
local l__Flamework__10 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BuildRoduxApp__11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").BuildRoduxApp;
local l__DroneTntUi__12 = v1.import(script, script.Parent, "drone-tnt-ui").DroneTntUi;
local l__GameAnimationUtil__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__CollectionService__15 = v3.CollectionService;
local l__RunService__16 = v3.RunService;
local l__KnitClient__17 = v2.KnitClient;
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "player-control-module");
local l__Workspace__19 = v3.Workspace;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	local u20 = u3.new();
	l__ClientSyncEvents__4.GuidedProjectileRemoved:connect(function(p3)
		if p3.guidedProjectileType == "drone" then
			u20:DoCleaning();
		end;
	end);
	l__ClientSyncEvents__4.GuidedProjectileEnabling:connect(function(p4)
		if p4.guidedProjectileType ~= "drone" then
			return nil;
		end;
		l__SoundManager__5:playSound(l__GameSound__6.DRONE_DEPLOY);
		p2:updateReleaseUi(p4.model:GetAttribute("HeldItem"), p4.model:GetAttribute("HeldItemAmount"), p4.model);
		p2:updateHealthUi(p4.model);
		u20:GiveTask(function()
			p2:updateReleaseUi(nil, nil, p4.model);
			p2:updateHealthUi(nil);
		end);
		p2.filmTree = u7.mount(u7.createElement("ScreenGui", {
			ResetOnSpawn = false, 
			IgnoreGuiInset = true
		}, { u7.createElement(l__EngineerFilmEffect__8, {
				transparency = 0.95, 
				color = Color3.fromRGB(84, 138, 99)
			}) }), l__Players__9.LocalPlayer:FindFirstChildOfClass("PlayerGui"));
		u20:GiveTask(function()
			if p2.filmTree then
				u7.unmount(p2.filmTree);
				p2.filmTree = nil;
			end;
		end);
		local v7 = l__Flamework__10.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(l__BuildRoduxApp__11(l__DroneTntUi__12));
		if v7 then
			u20:GiveTask(v7);
		end;
		u20:GiveTask(p4.model:GetAttributeChangedSignal("HeldItemAmount"):Connect(function()
			l__SoundManager__5:playSound(l__GameSound__6.BEEHIVE_PRODUCE);
		end));
		local u21 = l__GameAnimationUtil__13.playAnimation(l__Players__9.LocalPlayer, l__AnimationType__14.USE_TABLET, {
			looped = true
		});
		u20:GiveTask(function()
			if u21 ~= nil then
				u21:Stop();
			end;
		end);
	end);
	l__ClientSyncEvents__4.GuidedProjectileDisabling:connect(function(p5)
		if p5.guidedProjectileType ~= "drone" then
			return nil;
		end;
		l__SoundManager__5:playSound(l__GameSound__6.DRONE_DEPLOY);
		for v8, v9 in ipairs(p5.model:GetDescendants()) do
			if v9:IsA("Sound") then
				v9.Volume = 0;
			end;
		end;
	end);
	l__CollectionService__15:GetInstanceAddedSignal("Drone"):Connect(function(p6)
		if p6:GetAttribute("PlayerUserId") ~= l__Players__9.LocalPlayer.UserId then
			return nil;
		end;
		p6:GetAttributeChangedSignal("HeldItem"):Connect(function()
			p2:updateReleaseUi(p6:GetAttribute("HeldItem"), p6:GetAttribute("HeldItemAmount"), p6);
		end);
		p6:GetAttributeChangedSignal("HeldItemAmount"):Connect(function()
			p2:updateReleaseUi(p6:GetAttribute("HeldItem"), p6:GetAttribute("HeldItemAmount"), p6);
		end);
		p6:GetAttributeChangedSignal("Health"):Connect(function()
			p2:updateHealthUi(p6);
		end);
		p6:GetAttributeChangedSignal("MaxHealth"):Connect(function()
			p2:updateHealthUi(p6);
		end);
	end);
	l__RunService__16.Heartbeat:Connect(function()
		local v10 = l__KnitClient__17.Controllers.GuidedProjectileController:getCurrentGuidedProjectile();
		if v10 and v10.type == "drone" and v10.enabled == true then
			if v10.disabling then
				return nil;
			end;
			local v11 = u18:GetMoveVector();
			if v11.Magnitude > 0.5 then
				p2.speedMotor:setGoal(u2.Spring.new(30, {
					frequency = 1, 
					dampingRatio = 0.5
				}));
				local v12 = l__Workspace__19.CurrentCamera.CFrame:Inverse():VectorToObjectSpace(v11.Unit) * p2.speedMotor:getValue();
				p2.velocityMotor:setGoal({
					x = u2.Spring.new(v12.X, {
						frequency = 4, 
						dampingRatio = 0.7
					}), 
					y = u2.Spring.new(v12.Y, {
						frequency = 4, 
						dampingRatio = 0.7
					}), 
					z = u2.Spring.new(v12.Z, {
						frequency = 4, 
						dampingRatio = 0.7
					})
				});
			else
				p2.speedMotor:setGoal(u2.Spring.new(0, {
					frequency = 1, 
					dampingRatio = 0.5
				}));
				p2.velocityMotor:setGoal({
					x = u2.Spring.new(0, {
						frequency = 1, 
						dampingRatio = 0.75
					}), 
					y = u2.Spring.new(0, {
						frequency = 1, 
						dampingRatio = 0.75
					}), 
					z = u2.Spring.new(0, {
						frequency = 1, 
						dampingRatio = 0.75
					})
				});
			end;
			for v13, v14 in ipairs(v10.sounds) do
				v14.Volume = p2.speedMotor:getValue() / 60 / 2 + 0.5;
			end;
			local v15 = p2.velocityMotor:getValue();
			v10.model.PrimaryPart.AssemblyLinearVelocity = Vector3.new(v15.x, v15.y, v15.z);
			v10.model.PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0);
		end;
	end);
end;
local l__ItemUtil__22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local l__WeldUtil__23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__DroneItemUi__24 = v1.import(script, script.Parent, "drone-item-ui").DroneItemUi;
function v5.updateReleaseUi(p7, p8, p9, p10)
	if p9 == nil then
		p9 = 1;
	end;
	if p8 == nil then
		if p7.heldItemUIMaid then
			p7.heldItemUIMaid:DoCleaning();
			p7.heldItemUIMaid = nil;
		end;
		for v16, v17 in ipairs(p10:GetChildren()) do
			if v17:IsA("Accessory") and v17:GetAttribute("DroneAccessory") == true then
				v17:Destroy();
			end;
		end;
		return;
	end;
	local v18 = p10:FindFirstChildOfClass("Humanoid");
	if v18 then
		local v19 = l__ItemUtil__22.createItemInstance(p8, 1);
		v19:SetAttribute("DroneAccessory", true);
		v18:AddAccessory(v19);
		l__WeldUtil__23.weldCharacterAccessories(p10);
	end;
	if p7.heldItemUIMaid then
		p7.heldItemUIMaid:DoCleaning();
	end;
	p7.heldItemUIMaid = l__Flamework__10.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u7.createElement(l__DroneItemUi__24, {
		drone = p10, 
		amount = p9
	}));
end;
local l__DroneHealth__25 = v1.import(script, script.Parent, "drone-health").DroneHealth;
function v5.updateHealthUi(p11, p12)
	if not p12 then
		if p11.healthUIMaid then
			p11.healthUIMaid:DoCleaning();
			p11.healthUIMaid = nil;
		end;
		return;
	end;
	if p11.healthUIMaid then
		p11.healthUIMaid:DoCleaning();
	end;
	p11.healthUIMaid = l__Flamework__10.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u7.createElement(l__DroneHealth__25, {
		health = p12:GetAttribute("Health"), 
		maxHealth = p12:GetAttribute("MaxHealth")
	}));
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
