-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "HeavenlySwordController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v6.constructor(p1)
	l__KnitController__5.constructor(p1);
	p1.Name = "HeavenlySwordController";
	p1.animationMaid = u1.new();
end;
local l__KnitClient__2 = v3.KnitClient;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__AnimationType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientSyncEvents__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__ChargeState__8 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "sword", "sword-controller").ChargeState;
local l__Players__9 = v4.Players;
local l__getItemMeta__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__GameAnimationUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
function v6.KnitStart(p2)
	l__KnitController__5.KnitStart(p2);
	l__KnitClient__2.Controllers.PreloadController:preloadForItemType(l__ItemType__3.HEAVENLY_SWORD, {
		animations = { l__AnimationType__4.HEAVENLY_SWORD_CHARGE, l__AnimationType__4.HEAVENLY_SWORD_SWING }, 
		sounds = { l__GameSound__5.LIGHT_SWORD_CHARGE }
	});
	l__default__6.Client:Get("RemoteName"):Connect(function(p3)
		p2:playEffect(p3.cFrame);
	end);
	l__ClientSyncEvents__7.SwordChargedSwing:connect(function(p4)
		if p4.weapon.Name ~= l__ItemType__3.HEAVENLY_SWORD then
			return nil;
		end;
		local v8 = p4.chargedAttack;
		if v8 ~= nil then
			v8 = v8.chargeTime;
		end;
		if v8 == 0 or v8 ~= v8 or not v8 then
			return nil;
		end;
		if p4.chargedAttack.chargeTime < 0.5 then
			return nil;
		end;
		local v9 = p4.fromPlayer:GetAttribute("LumenUpgraded");
		if p4.chargedAttack.chargeTime <= 1 or v9 == 0 or v9 ~= v9 or v9 == "" or not v9 then
			p2:fire(p4.fromPlayer, p4.weapon, p4.chargedAttack.chargeTime);
		end;
		local v10 = false;
		if p4.chargedAttack.chargeTime >= 1 then
			v10 = v9;
		end;
		if v10 ~= 0 and v10 == v10 and v10 ~= "" and v10 then
			p2:playAnimation(l__AnimationType__4.BEAR_CLAWS_FLURRY);
			l__KnitClient__2.Controllers.ViewmodelController:playAnimation(l__AnimationType__4.BEAR_CLAWS_FLURRY);
			p2:fireMultiple(p4.fromPlayer, p4.weapon, p4.chargedAttack.chargeTime);
		end;
	end);
	local u12 = nil;
	local u13 = nil;
	l__ClientSyncEvents__7.SwordCharge:connect(function(p5)
		if p5.itemType.itemType ~= l__ItemType__3.HEAVENLY_SWORD then
			return nil;
		end;
		task.spawn(function()
			if p5.chargeState == l__ChargeState__8.Charging then
				l__Players__9.LocalPlayer:SetAttribute("IsCharging", true);
				local v11 = l__Players__9.LocalPlayer.Character;
				if v11 ~= nil then
					v11 = v11:FindFirstChild("Humanoid");
					if v11 ~= nil then
						v11 = v11:FindFirstChild("Animator");
					end;
				end;
				if not v11 then
					return nil;
				end;
				local v12 = l__getItemMeta__10(p5.itemType.itemType);
				local v13 = v12.sword;
				if v13 ~= nil then
					v13 = v13.chargedAttack;
				end;
				if not v13 then
					return nil;
				end;
				p2:playSound();
				local v14 = v12.sword;
				if v14 ~= nil then
					v14 = v14.chargedAttack.chargeSlowDelay;
				end;
				wait(v14);
				local v15 = l__Players__9.LocalPlayer:GetAttribute("IsCharging");
				if v15 == 0 or v15 ~= v15 or v15 == "" or not v15 then
					return nil;
				else
					u12 = v11:LoadAnimation(l__GameAnimationUtil__11.getAnimation(l__AnimationType__4.HEAVENLY_SWORD_CHARGE));
					u12:Play();
					u12:AdjustSpeed(0.683);
					u12:GetMarkerReachedSignal("end"):Connect(function()
						if u12 ~= nil then
							u12:AdjustSpeed(0);
						end;
					end);
					u13 = l__KnitClient__2.Controllers.ViewmodelController:playAnimation(l__AnimationType__4.FP_HEAVENLY_SWORD_CHARGE);
					if u13 then
						u13:GetMarkerReachedSignal("end"):Connect(function()
							if u13 ~= nil then
								u13:AdjustSpeed(0);
							end;
						end);
					end;
					p2.animationMaid:GiveTask(function()
						if u12 ~= nil then
							u12:Stop();
						end;
						if u12 ~= nil then
							u12:Destroy();
						end;
						if u13 ~= nil then
							u13:Stop();
						end;
						if u13 ~= nil then
							u13:Destroy();
						end;
					end);
				end;
			elseif p5.chargeState == l__ChargeState__8.Charged then

			end;
			if p5.chargeState == l__ChargeState__8.Idle then
				l__Players__9.LocalPlayer:SetAttribute("IsCharging", false);
				if u12 ~= nil then
					u12:Stop();
				end;
				if u12 ~= nil then
					u12:Destroy();
				end;
				if u13 ~= nil then
					u13:Stop();
				end;
				if u13 ~= nil then
					u13:Destroy();
				end;
				p2.animationMaid:DoCleaning();
			end;
		end);
	end);
end;
local l__ProjectileHandler__14 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-handler").ProjectileHandler;
local l__SoundManager__15 = v2.SoundManager;
local l__KnitClient__16 = v3.KnitClient;
function v6.fire(p6, p7, p8, p9)
	local v16 = l__getItemMeta__10(l__ItemType__3.HEAVENLY_SWORD);
	if not v16 then
		return nil;
	end;
	local v17 = l__ProjectileHandler__14.new(1, 1, "sword_wave", nil, nil, Vector3.new(0, 0, 0));
	local v18 = nil;
	if p9 >= 1 then
		v18 = l__ItemType__3.HEAVENLY_SWORD;
	end;
	l__SoundManager__15:playSound(l__GameSound__5.LIGHT_SWORD_ATTACK);
	l__KnitClient__16.Controllers.ProjectileController:launchProjectile(l__ItemType__3.HEAVENLY_SWORD, v18, v17, p8, v16.projectileSource);
end;
local l__EntityUtil__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
function v6.fireMultiple(p10, p11, p12, p13)
	local v19 = l__getItemMeta__10(l__ItemType__3.HEAVENLY_SWORD);
	if not v19 then
		return nil;
	end;
	local u18 = l__EntityUtil__17:getEntity(p11);
	local u19 = 0.3;
	local u20 = nil;
	local u21 = l__ProjectileHandler__14.new(1, 1, "sword_wave", nil, nil, Vector3.new(0, 0, 0));
	v1.Promise.defer(function()
		local v20 = 0;
		local v21 = false;
		while true do
			if v21 then
				v20 = v20 + 1;
			else
				v21 = true;
			end;
			if not (v20 < 4) then
				break;
			end;
			local v22 = u18;
			if v22 ~= nil then
				v22 = v22:getItemInHand();
				if v22 ~= nil then
					v22 = v22.Name;
				end;
			end;
			if v22 ~= l__ItemType__3.HEAVENLY_SWORD then
				return nil;
			end;
			if v20 == 3 then
				u19 = u19 + 0.1;
				u20 = l__ItemType__3.HEAVENLY_SWORD;
			end;
			l__SoundManager__15:playSound(l__GameSound__5.LIGHT_SWORD_ATTACK);
			l__KnitClient__16.Controllers.ProjectileController:launchProjectile(l__ItemType__3.HEAVENLY_SWORD, u20, u21, p12, v19.projectileSource);
			wait(u19);		
		end;
	end);
end;
local l__AnimationUtil__22 = v2.AnimationUtil;
function v6.playAnimation(p14, p15)
	local v23 = l__AnimationUtil__22.playAnimation(l__Players__9.LocalPlayer, l__GameAnimationUtil__11.getAssetId(p15));
	if v23 ~= nil then
		v23:AdjustSpeed(1);
	end;
end;
function v6.playSound(p16)
	local v24 = l__SoundManager__15:playSound(l__GameSound__5.LIGHT_SWORD_CHARGE);
	if v24 then
		p16.animationMaid:GiveTask(function()
			v24:Stop();
		end);
	end;
end;
local l__ReplicatedStorage__23 = v4.ReplicatedStorage;
local l__Workspace__24 = v4.Workspace;
function v6.playEffect(p17, p18)
	if not p18 then
		return nil;
	end;
	local v25 = l__ReplicatedStorage__23.Assets.Effects.HeavenlySwordEffect:Clone();
	v25:SetPrimaryPartCFrame(p18);
	v25.Parent = l__Workspace__24;
	v25:SetPrimaryPartCFrame(p18 * CFrame.new(0, 0, -6));
	task.delay(0.15, function()
		v25:Destroy();
	end);
end;
local v26 = l__KnitClient__2.CreateController(v6.new());
return nil;
