-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
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
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "flipper").src);
function v5.constructor(p1, ...)
	l__KnitController__4.constructor(p1, ...);
	p1.Name = "DroneController";
	p1.speedMotor = u1.SingleMotor.new(0);
	p1.velocityMotor = u1.GroupMotor.new({
		x = 0, 
		y = 0, 
		z = 0
	});
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ClientSyncEvents__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__SoundManager__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__EngineerFilmEffect__7 = v1.import(script, script.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "watcher", "ui", "engineer-film-effect").EngineerFilmEffect;
local l__Players__8 = v3.Players;
local l__Flamework__9 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BuildRoduxApp__10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").BuildRoduxApp;
local l__DroneTntUi__11 = v1.import(script, script.Parent, "drone-tnt-ui").DroneTntUi;
local l__GameAnimationUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__CollectionService__14 = v3.CollectionService;
local l__RunService__15 = v3.RunService;
local l__KnitClient__16 = v2.KnitClient;
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "player-control-module");
local l__Workspace__18 = v3.Workspace;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	local u19 = u2.new();
	l__ClientSyncEvents__3.GuidedProjectileRemoved:connect(function(p3)
		if p3.guidedProjectileType == "drone" then
			u19:DoCleaning();
		end;
	end);
	l__ClientSyncEvents__3.GuidedProjectileEnabling:connect(function(p4)
		if p4.guidedProjectileType ~= "drone" then
			return nil;
		end;
		l__SoundManager__4:playSound(l__GameSound__5.DRONE_DEPLOY);
		p2:updateReleaseUi(p4.model:GetAttribute("HeldItem"), p4.model:GetAttribute("HeldItemAmount"), p4.model);
		p2:updateHealthUi(p4.model);
		u19:GiveTask(function()
			p2:updateReleaseUi(nil, nil, p4.model);
			p2:updateHealthUi(nil);
		end);
		p2.filmTree = u6.mount(u6.createElement("ScreenGui", {
			ResetOnSpawn = false, 
			IgnoreGuiInset = true
		}, { u6.createElement(l__EngineerFilmEffect__7, {
				transparency = 0.95, 
				color = Color3.fromRGB(84, 138, 99)
			}) }), l__Players__8.LocalPlayer:FindFirstChildOfClass("PlayerGui"));
		u19:GiveTask(function()
			if p2.filmTree then
				u6.unmount(p2.filmTree);
				p2.filmTree = nil;
			end;
		end);
		local v7 = l__Flamework__9.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(l__BuildRoduxApp__10(l__DroneTntUi__11));
		if v7 then
			u19:GiveTask(v7);
		end;
		u19:GiveTask(p4.model:GetAttributeChangedSignal("HeldItemAmount"):Connect(function()
			l__SoundManager__4:playSound(l__GameSound__5.BEEHIVE_PRODUCE);
		end));
		local u20 = l__GameAnimationUtil__12.playAnimation(l__Players__8.LocalPlayer, l__AnimationType__13.USE_TABLET, {
			looped = true
		});
		u19:GiveTask(function()
			if u20 ~= nil then
				u20:Stop();
			end;
		end);
	end);
	l__ClientSyncEvents__3.GuidedProjectileDisabling:connect(function(p5)
		if p5.guidedProjectileType ~= "drone" then
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
	l__CollectionService__14:GetInstanceAddedSignal("Drone"):Connect(function(p6)
		if p6:GetAttribute("PlayerUserId") ~= l__Players__8.LocalPlayer.UserId then
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
	l__RunService__15.Heartbeat:Connect(function()
		local v11 = l__KnitClient__16.Controllers.GuidedProjectileController:getCurrentGuidedProjectile();
		if v11 and v11.type == "drone" and v11.enabled == true then
			if v11.disabling then
				return nil;
			end;
			local v12 = u17:GetMoveVector();
			if v12.Magnitude > 0.5 then
				p2.speedMotor:setGoal(u1.Spring.new(30, {
					frequency = 1, 
					dampingRatio = 0.5
				}));
				local v13 = l__Workspace__18.CurrentCamera.CFrame:Inverse():VectorToObjectSpace(v12.Unit) * p2.speedMotor:getValue();
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
local l__ItemUtil__21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local l__WeldUtil__22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__DroneItemUi__23 = v1.import(script, script.Parent, "drone-item-ui").DroneItemUi;
function v5.updateReleaseUi(p7, p8, p9, p10)
	if p9 == nil then
		p9 = 1;
	end;
	if p8 == nil then
		if p7.heldItemUIMaid then
			p7.heldItemUIMaid:DoCleaning();
			p7.heldItemUIMaid = nil;
		end;
		local v18, v19, v20 = ipairs(p10:GetChildren());
		while true do
			v18(v19, v20);
			if not v18 then
				break;
			end;
			v20 = v18;
			if v19:IsA("Accessory") and v19:GetAttribute("DroneAccessory") == true then
				v19:Destroy();
			end;		
		end;
		return;
	end;
	local v21 = p10:FindFirstChildOfClass("Humanoid");
	if v21 then
		local v22 = l__ItemUtil__21.createItemInstance(p8, 1);
		v22:SetAttribute("DroneAccessory", true);
		v21:AddAccessory(v22);
		l__WeldUtil__22:weldCharacterAccessories(p10);
	end;
	if p7.heldItemUIMaid then
		p7.heldItemUIMaid:DoCleaning();
	end;
	p7.heldItemUIMaid = l__Flamework__9.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u6.createElement(l__DroneItemUi__23, {
		drone = p10, 
		amount = p9
	}));
end;
local l__DroneHealth__24 = v1.import(script, script.Parent, "drone-health").DroneHealth;
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
	p11.healthUIMaid = l__Flamework__9.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u6.createElement(l__DroneHealth__24, {
		health = p12:GetAttribute("Health"), 
		maxHealth = p12:GetAttribute("MaxHealth")
	}));
end;
local v23 = v2.KnitClient.CreateController(v5.new());
return nil;
