-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes");
local v7 = setmetatable({}, {
	__tostring = function()
		return "DaoController";
	end, 
	__index = l__HandKnitController__5
});
v7.__index = v7;
function v7.new(...)
	local v8 = setmetatable({}, v7);
	return v8:constructor(...) and v8;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v7.constructor(p1)
	l__HandKnitController__5.constructor(p1);
	p1.Name = "DaoController";
	p1.maid = u1.new();
end;
local l__KnitClient__2 = v3.KnitClient;
local l__BedwarsKit__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__ContentProvider__4 = v4.ContentProvider;
local l__GameAnimationUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__ClientSyncEvents__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__AbilityId__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local l__SoundManager__9 = v2.SoundManager;
local l__GameSound__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v7.KnitStart(p2)
	l__HandKnitController__5.KnitStart(p2);
	l__KnitClient__2.Controllers.KitController:watchKit(function(p3, p4)
		if p4 == l__BedwarsKit__3.DASHER then
			task.spawn(function()
				l__ContentProvider__4:PreloadAsync({ l__GameAnimationUtil__5.getAnimation(l__AnimationType__6.DAO_CHARGE), l__GameAnimationUtil__5.getAnimation(l__AnimationType__6.DAO_DASH) });
			end);
		end;
	end);
	l__ClientSyncEvents__7.AbilityUsed:connect(function(p5)
		if p5.ability ~= l__AbilityId__8.DASH then
			return nil;
		end;
		if p5:isCancelled() then
			return nil;
		end;
		if not p5.userCharacter.PrimaryPart then
			return nil;
		end;
		l__SoundManager__9:playSound(l__GameSound__10.DAO_DASH, {
			position = p5.userCharacter.PrimaryPart.Position, 
			parent = p5.userCharacter.PrimaryPart
		});
	end);
end;
local l__ClientStore__11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__QueueType__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local l__Flamework__13 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__WatchCharacter__14 = v2.WatchCharacter;
local l__Players__15 = v4.Players;
local u16 = v6.GetAttributeChangedSignal;
local l__DasherKit__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "dasher", "dasher-kit").DasherKit;
local l__Workspace__18 = v4.Workspace;
local l__CooldownId__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__RunService__20 = v4.RunService;
local l__EntityUtil__21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__default__22 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
local l__GetAttribute__23 = v6.GetAttribute;
local l__SetAttribute__24 = v6.SetAttribute;
function v7.onEnable(p6, p7)
	if l__ClientStore__11:getState().Game.queueType == l__QueueType__12.SURVIVAL then
		return nil;
	end;
	p6.maid:GiveTask(l__Flamework__13.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(l__AbilityId__8.DASH, nil));
	local u25 = false;
	p6.maid:GiveTask(l__ClientSyncEvents__7.SwordSwingDown:connect(function()
		u25 = true;
	end));
	p6.maid:GiveTask(l__ClientSyncEvents__7.SwordSwingUp:connect(function()
		u25 = false;
	end));
	l__WatchCharacter__14(function(p8, p9, p10)
		if p8 ~= l__Players__15.LocalPlayer then
			return nil;
		end;
		p10:GiveTask(u16(p9, l__DasherKit__17.canDashAttribute, function(p11)
			if p11 == nil then
				return nil;
			end;
			local v9 = p11 - l__Workspace__18:GetServerTimeNow();
			if p6.cooldownMaid then
				p6.cooldownMaid:DoCleaning();
			end;
			p6.cooldownMaid = u1.new();
			p6.cooldownMaid:GiveTask(l__Flamework__13.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__19.DASHER_ABILITY));
			l__Flamework__13.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__19.DASHER_ABILITY, v9, {
				cooldownBar = {
					color = Color3.fromRGB(166, 38, 38)
				}
			});
			p6.cooldownMaid:GiveTask(function()
				l__Flamework__13.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):removeCooldown(l__CooldownId__19.DASHER_ABILITY);
			end);
			task.delay(v9, function()
				if p6.cooldownMaid then
					p6.cooldownMaid:DoCleaning();
					p6.cooldownMaid = nil;
				end;
			end);
		end));
		p10:GiveTask(function()
			local l__cooldownMaid__10 = p6.cooldownMaid;
			if l__cooldownMaid__10 ~= nil then
				l__cooldownMaid__10:DoCleaning();
			end;
		end);
	end);
	p6.maid:GiveTask(l__RunService__20.Heartbeat:Connect(function()
		local l__Character__11 = l__Players__15.LocalPlayer.Character;
		if l__Character__11 == nil or not l__Character__11.PrimaryPart then
			return nil;
		end;
		local v12 = l__EntityUtil__21:getEntity(l__Character__11);
		if v12 == nil or v12:isAlive() == false then
			p6.beginChargeTime = nil;
			local l__chargingMaid__13 = p6.chargingMaid;
			if l__chargingMaid__13 ~= nil then
				l__chargingMaid__13:DoCleaning();
			end;
			p6.chargingMaid = nil;
			l__default__22.Debug("Removed");
			return nil;
		end;
		local v14 = l__GetAttribute__23(l__Character__11, l__DasherKit__17.canDashAttribute);
		local v15 = u25;
		if v15 then
			local l__beginChargeTime__16 = p6.beginChargeTime;
			local v17 = false;
			if l__beginChargeTime__16 ~= 0 then
				v17 = false;
				if l__beginChargeTime__16 == l__beginChargeTime__16 then
					v17 = l__beginChargeTime__16;
				end;
			end;
			v15 = not v17;
			if v15 then
				v15 = v14;
				if v15 ~= 0 and v15 == v15 and v15 then
					v15 = v14 < l__Workspace__18:GetServerTimeNow();
				end;
			end;
		end;
		if v15 ~= 0 and v15 == v15 and v15 and l__Flamework__13.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(l__AbilityId__8.DASH, {
			disableBlockedAbilityAlert = true
		}) then
			p6.beginChargeTime = time();
		end;
		local v18 = p6.beginChargeTime;
		if v18 ~= 0 and v18 == v18 and v18 then
			local v19 = false;
			if l__DasherKit__17.CHARGE_TIME_BEFORE_CHARGING_STATE < time() - p6.beginChargeTime then
				v19 = not p6.chargingMaid;
			end;
			v18 = v19;
		end;
		if v18 ~= 0 and v18 == v18 and v18 then
			p6.beginChargeTime = nil;
			p6:enterChargingState();
			return nil;
		end;
		if u25 then
			return;
		end;
		local l__chargingMaid__20 = p6.chargingMaid;
		if l__chargingMaid__20 ~= nil then
			l__chargingMaid__20:DoCleaning();
		end;
		p6.chargingMaid = nil;
		local v21 = p6.beginChargeTime;
		if v21 ~= 0 and v21 == v21 and v21 then
			v21 = l__DasherKit__17.CHARGE_TIME <= time() - p6.beginChargeTime;
		end;
		if v21 ~= 0 and v21 == v21 and v21 then
			local l__LookVector__22 = l__Workspace__18.CurrentCamera.CFrame.LookVector;
			if l__Flamework__13.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(l__AbilityId__8.DASH) then
				l__Flamework__13.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(l__AbilityId__8.DASH, {
					direction = l__LookVector__22, 
					origin = l__Character__11.PrimaryPart.Position, 
					weapon = p7.itemType
				});
				p6:dashForward(l__LookVector__22);
				l__SetAttribute__24(l__Character__11, l__DasherKit__17.canDashAttribute, l__Workspace__18:GetServerTimeNow() + 500);
			end;
		end;
		p6.beginChargeTime = nil;
		return nil;
	end));
	p6.maid:GiveTask(function()
		local l__chargingMaid__23 = p6.chargingMaid;
		if l__chargingMaid__23 ~= nil then
			l__chargingMaid__23:DoCleaning();
		end;
		p6.chargingMaid = nil;
		local l__cooldownMaid__24 = p6.cooldownMaid;
		if l__cooldownMaid__24 ~= nil then
			l__cooldownMaid__24:DoCleaning();
		end;
		p6.cooldownMaid = nil;
		p6.beginChargeTime = nil;
	end);
end;
local u26 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__DasherProgressBar__27 = v1.import(script, script.Parent, "dasher-progress-bar").DasherProgressBar;
function v7.enterChargingState(p12)
	p12.chargingMaid = u1.new();
	local u28 = l__GameAnimationUtil__5.playAnimation(l__Players__15.LocalPlayer, l__AnimationType__6.DAO_CHARGE, {
		looped = true
	});
	p12.chargingMaid:GiveTask(function()
		if u28 ~= nil then
			u28:Stop();
		end;
	end);
	local u29 = u26.mount(u26.createElement("ScreenGui", {}, { u26.createElement(l__DasherProgressBar__27, {
			chargeTime = l__DasherKit__17.CHARGE_TIME
		}) }), l__Players__15.LocalPlayer:WaitForChild("PlayerGui"), "DasherCharge");
	p12.chargingMaid:GiveTask(function()
		u26.unmount(u29);
	end);
end;
local l__KnitClient__30 = v3.KnitClient;
local l__StarterPlayer__31 = v4.StarterPlayer;
function v7.dashForward(p13, p14)
	local l__Character__25 = l__Players__15.LocalPlayer.Character;
	if l__Character__25 then
		l__Character__25.HumanoidRootPart.CFrame = CFrame.lookAt(l__Character__25.HumanoidRootPart.Position, l__Character__25.HumanoidRootPart.Position + p14 * Vector3.new(1, 0, 1));
		l__Character__25.Humanoid.JumpHeight = 0.5;
		l__Character__25.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
		local v26 = l__Character__25.PrimaryPart;
		if v26 ~= nil then
			v26 = v26.AssemblyMass;
		end;
		local v27 = v26;
		if v27 == nil then
			v27 = 1;
		end;
		l__Character__25.HumanoidRootPart:ApplyImpulse(p14.Unit * Vector3.new(1, 0, 1) * v27 * 70);
		l__KnitClient__30.Controllers.JumpHeightController:setJumpHeight(l__StarterPlayer__31.CharacterJumpHeight);
		l__SoundManager__9:playSound(l__GameSound__10.DAO_DASH);
		l__SoundManager__9:playSound(l__GameSound__10.DAO_SLASH);
		local v28 = l__GameAnimationUtil__5.playAnimation(l__Players__15.LocalPlayer, l__AnimationType__6.DAO_DASH);
		if v28 ~= nil then
			v28:AdjustSpeed(2.5);
		end;
	end;
end;
function v7.onDisable(p15)
	p15.maid:DoCleaning();
end;
local l__getItemMeta__32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function v7.isRelevantItem(p16, p17)
	local v29 = l__getItemMeta__32(p17.itemType).sword;
	if v29 ~= nil then
		v29 = v29.daoDash;
	end;
	return v29 == true;
end;
local v30 = l__KnitClient__2.CreateController(v7.new());
return nil;
