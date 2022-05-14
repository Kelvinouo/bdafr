-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes");
local l__HandKnitController__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v7 = setmetatable({}, {
	__tostring = function()
		return "DaoController";
	end, 
	__index = l__HandKnitController__6
});
v7.__index = v7;
function v7.new(...)
	local v8 = setmetatable({}, v7);
	return v8:constructor(...) and v8;
end;
local u1 = l__HandKnitController__6;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v7.constructor(p1)
	u1.constructor(p1);
	p1.Name = "DaoController";
	p1.maid = u2.new();
end;
local l__ClientSyncEvents__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__BedwarsKit__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__ContentProvider__5 = v4.ContentProvider;
local l__GameAnimationUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__AbilityId__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local l__SoundManager__9 = v2.SoundManager;
local l__GameSound__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v7.KnitStart(p2)
	u1.KnitStart(p2);
	l__ClientSyncEvents__3.KitEquip:connect(function(p3)
		if p3.kit == l__BedwarsKit__4.DASHER then
			task.spawn(function()
				l__ContentProvider__5:PreloadAsync({ l__GameAnimationUtil__6.getAnimation(l__AnimationType__7.DAO_CHARGE), l__GameAnimationUtil__6.getAnimation(l__AnimationType__7.DAO_DASH) });
			end);
		end;
	end);
	l__ClientSyncEvents__3.AbilityUsed:connect(function(p4)
		if p4.ability ~= l__AbilityId__8.DASH then
			return nil;
		end;
		if p4:isCancelled() then
			return nil;
		end;
		if not p4.userCharacter.PrimaryPart then
			return nil;
		end;
		l__SoundManager__9:playSound(l__GameSound__10.DAO_DASH, {
			position = p4.userCharacter.PrimaryPart.Position, 
			parent = p4.userCharacter.PrimaryPart
		});
	end);
end;
local l__default__11 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
local l__Flamework__12 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__WatchCharacter__13 = v2.WatchCharacter;
local l__Players__14 = v4.Players;
local u15 = v5.GetAttributeChangedSignal;
local l__DasherKit__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "dasher", "dasher-kit").DasherKit;
local l__Workspace__17 = v4.Workspace;
local l__CooldownId__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__RunService__19 = v4.RunService;
local l__EntityUtil__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__GetAttribute__21 = v5.GetAttribute;
local l__SetAttribute__22 = v5.SetAttribute;
function v7.onEnable(p5, p6)
	l__default__11.Debug("Begin");
	p5.maid:GiveTask(l__Flamework__12.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(l__AbilityId__8.DASH, nil));
	local u23 = false;
	p5.maid:GiveTask(l__ClientSyncEvents__3.SwordSwingDown:connect(function()
		u23 = true;
	end));
	p5.maid:GiveTask(l__ClientSyncEvents__3.SwordSwingUp:connect(function()
		u23 = false;
	end));
	l__WatchCharacter__13(function(p7, p8, p9)
		if p7 ~= l__Players__14.LocalPlayer then
			return nil;
		end;
		p9:GiveTask(u15(p8, l__DasherKit__16.canDashAttribute, function(p10)
			if p10 == nil then
				return nil;
			end;
			local v9 = p10 - l__Workspace__17:GetServerTimeNow();
			if p5.cooldownMaid then
				p5.cooldownMaid:DoCleaning();
			end;
			p5.cooldownMaid = u2.new();
			p5.cooldownMaid:GiveTask(l__Flamework__12.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__18.DASHER_ABILITY));
			l__Flamework__12.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__18.DASHER_ABILITY, v9, {
				cooldownBar = {
					color = Color3.fromRGB(166, 38, 38)
				}
			});
			p5.cooldownMaid:GiveTask(function()
				l__Flamework__12.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):removeCooldown(l__CooldownId__18.DASHER_ABILITY);
			end);
			task.delay(v9, function()
				if p5.cooldownMaid then
					p5.cooldownMaid:DoCleaning();
					p5.cooldownMaid = nil;
				end;
			end);
		end));
		p9:GiveTask(function()
			local l__cooldownMaid__10 = p5.cooldownMaid;
			if l__cooldownMaid__10 ~= nil then
				l__cooldownMaid__10:DoCleaning();
			end;
		end);
	end);
	p5.maid:GiveTask(l__RunService__19.Heartbeat:Connect(function()
		local l__Character__11 = l__Players__14.LocalPlayer.Character;
		if l__Character__11 == nil or not l__Character__11.PrimaryPart then
			return nil;
		end;
		local v12 = l__EntityUtil__20:getEntity(l__Character__11);
		if v12 == nil or v12:isAlive() == false then
			p5.beginChargeTime = nil;
			local l__chargingMaid__13 = p5.chargingMaid;
			if l__chargingMaid__13 ~= nil then
				l__chargingMaid__13:DoCleaning();
			end;
			p5.chargingMaid = nil;
			l__default__11.Debug("Removed");
			return nil;
		end;
		local v14 = l__GetAttribute__21(l__Character__11, l__DasherKit__16.canDashAttribute);
		local v15 = u23;
		if v15 then
			local l__beginChargeTime__16 = p5.beginChargeTime;
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
					v15 = v14 < l__Workspace__17:GetServerTimeNow();
				end;
			end;
		end;
		if v15 ~= 0 and v15 == v15 and v15 and l__Flamework__12.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(l__AbilityId__8.DASH) then
			p5.beginChargeTime = time();
		end;
		local v18 = p5.beginChargeTime;
		if v18 ~= 0 and v18 == v18 and v18 then
			local v19 = false;
			if l__DasherKit__16.CHARGE_TIME_BEFORE_CHARGING_STATE < time() - p5.beginChargeTime then
				v19 = not p5.chargingMaid;
			end;
			v18 = v19;
		end;
		if v18 ~= 0 and v18 == v18 and v18 then
			p5.beginChargeTime = nil;
			p5:enterChargingState();
			return nil;
		end;
		if u23 then
			return;
		end;
		local l__chargingMaid__20 = p5.chargingMaid;
		if l__chargingMaid__20 ~= nil then
			l__chargingMaid__20:DoCleaning();
		end;
		p5.chargingMaid = nil;
		local v21 = p5.beginChargeTime;
		if v21 ~= 0 and v21 == v21 and v21 then
			v21 = l__DasherKit__16.CHARGE_TIME <= time() - p5.beginChargeTime;
		end;
		if v21 ~= 0 and v21 == v21 and v21 then
			local l__LookVector__22 = l__Workspace__17.CurrentCamera.CFrame.LookVector;
			if l__Flamework__12.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(l__AbilityId__8.DASH) then
				l__Flamework__12.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(l__AbilityId__8.DASH, {
					direction = l__LookVector__22, 
					origin = l__Character__11.PrimaryPart.Position, 
					weapon = p6.itemType
				});
			end;
			p5:dashForward(l__LookVector__22);
			l__SetAttribute__22(l__Character__11, l__DasherKit__16.canDashAttribute, l__Workspace__17:GetServerTimeNow() + 500);
		end;
		p5.beginChargeTime = nil;
		return nil;
	end));
	p5.maid:GiveTask(function()
		local l__chargingMaid__23 = p5.chargingMaid;
		if l__chargingMaid__23 ~= nil then
			l__chargingMaid__23:DoCleaning();
		end;
		p5.chargingMaid = nil;
		local l__cooldownMaid__24 = p5.cooldownMaid;
		if l__cooldownMaid__24 ~= nil then
			l__cooldownMaid__24:DoCleaning();
		end;
		p5.cooldownMaid = nil;
		p5.beginChargeTime = nil;
	end);
end;
local u24 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__DasherProgressBar__25 = v1.import(script, script.Parent, "dasher-progress-bar").DasherProgressBar;
function v7.enterChargingState(p11)
	p11.chargingMaid = u2.new();
	local u26 = l__GameAnimationUtil__6.playAnimation(l__Players__14.LocalPlayer, l__AnimationType__7.DAO_CHARGE, {
		looped = true
	});
	p11.chargingMaid:GiveTask(function()
		if u26 ~= nil then
			u26:Stop();
		end;
	end);
	local u27 = u24.mount(u24.createElement("ScreenGui", {}, { u24.createElement(l__DasherProgressBar__25, {
			chargeTime = l__DasherKit__16.CHARGE_TIME
		}) }), l__Players__14.LocalPlayer:WaitForChild("PlayerGui"), "DasherCharge");
	p11.chargingMaid:GiveTask(function()
		u24.unmount(u27);
	end);
end;
local l__KnitClient__28 = v3.KnitClient;
local l__StarterPlayer__29 = v4.StarterPlayer;
function v7.dashForward(p12, p13)
	local l__Character__25 = l__Players__14.LocalPlayer.Character;
	if l__Character__25 then
		l__Character__25.HumanoidRootPart.CFrame = CFrame.lookAt(l__Character__25.HumanoidRootPart.Position, l__Character__25.HumanoidRootPart.Position + p13 * Vector3.new(1, 0, 1));
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
		l__Character__25.HumanoidRootPart:ApplyImpulse(p13.Unit * Vector3.new(1, 0, 1) * v27 * 70);
		l__KnitClient__28.Controllers.JumpHeightController:setJumpHeight(l__StarterPlayer__29.CharacterJumpHeight);
		l__SoundManager__9:playSound(l__GameSound__10.DAO_DASH);
		l__SoundManager__9:playSound(l__GameSound__10.DAO_SLASH);
		local v28 = l__GameAnimationUtil__6.playAnimation(l__Players__14.LocalPlayer, l__AnimationType__7.DAO_DASH);
		if v28 ~= nil then
			v28:AdjustSpeed(2.5);
		end;
	end;
end;
function v7.onDisable(p14)
	p14.maid:DoCleaning();
end;
local l__getItemMeta__30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function v7.isRelevantItem(p15, p16)
	local v29 = l__getItemMeta__30(p16.itemType).sword;
	if v29 ~= nil then
		v29 = v29.daoDash;
	end;
	return v29 == true;
end;
u1 = v3.KnitClient.CreateController;
u1 = u1(v7.new());
return nil;
