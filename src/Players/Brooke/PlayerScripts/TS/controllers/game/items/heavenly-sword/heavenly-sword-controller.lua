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
local u1 = l__KnitController__5;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "HeavenlySwordController";
	p1.animationMaid = u2.new();
end;
local l__KnitClient__3 = v3.KnitClient;
local l__ItemType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__AnimationType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientSyncEvents__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__ChargeState__9 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "sword", "sword-controller").ChargeState;
local l__Players__10 = v4.Players;
local l__getItemMeta__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__GameAnimationUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	l__KnitClient__3.Controllers.PreloadController:preloadForItemType(l__ItemType__4.HEAVENLY_SWORD, {
		animations = { l__AnimationType__5.HEAVENLY_SWORD_CHARGE, l__AnimationType__5.HEAVENLY_SWORD_SWING }, 
		sounds = { l__GameSound__6.LIGHT_SWORD_CHARGE }
	});
	l__default__7.Client:Get("RemoteName"):Connect(function(p3)
		p2:playEffect(p3.cFrame);
	end);
	l__ClientSyncEvents__8.SwordChargedSwing:connect(function(p4)
		if p4.weapon.Name ~= l__ItemType__4.HEAVENLY_SWORD then
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
			p2:playAnimation(l__AnimationType__5.BEAR_CLAWS_FLURRY);
			l__KnitClient__3.Controllers.ViewmodelController:playAnimation(l__AnimationType__5.BEAR_CLAWS_FLURRY);
			p2:fireMultiple(p4.fromPlayer, p4.weapon, p4.chargedAttack.chargeTime);
		end;
	end);
	local u13 = nil;
	local u14 = nil;
	l__ClientSyncEvents__8.SwordCharge:connect(function(p5)
		if p5.itemType.itemType ~= l__ItemType__4.HEAVENLY_SWORD then
			return nil;
		end;
		task.spawn(function()
			if p5.chargeState == l__ChargeState__9.Charging then
				l__Players__10.LocalPlayer:SetAttribute("IsCharging", true);
				local v11 = l__Players__10.LocalPlayer.Character;
				if v11 ~= nil then
					v11 = v11:FindFirstChild("Humanoid");
					if v11 ~= nil then
						v11 = v11:FindFirstChild("Animator");
					end;
				end;
				if not v11 then
					return nil;
				end;
				local v12 = l__getItemMeta__11(p5.itemType.itemType);
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
				local v15 = l__Players__10.LocalPlayer:GetAttribute("IsCharging");
				if v15 == 0 or v15 ~= v15 or v15 == "" or not v15 then
					return nil;
				else
					u13 = v11:LoadAnimation(l__GameAnimationUtil__12.getAnimation(l__AnimationType__5.HEAVENLY_SWORD_CHARGE));
					u13:Play();
					u13:AdjustSpeed(0.683);
					u13:GetMarkerReachedSignal("end"):Connect(function()
						if u13 ~= nil then
							u13:AdjustSpeed(0);
						end;
					end);
					u14 = l__KnitClient__3.Controllers.ViewmodelController:playAnimation(l__AnimationType__5.FP_HEAVENLY_SWORD_CHARGE);
					if u14 then
						u14:GetMarkerReachedSignal("end"):Connect(function()
							if u14 ~= nil then
								u14:AdjustSpeed(0);
							end;
						end);
					end;
					p2.animationMaid:GiveTask(function()
						if u13 ~= nil then
							u13:Stop();
						end;
						if u13 ~= nil then
							u13:Destroy();
						end;
						if u14 ~= nil then
							u14:Stop();
						end;
						if u14 ~= nil then
							u14:Destroy();
						end;
					end);
				end;
			elseif p5.chargeState == l__ChargeState__9.Charged then

			end;
			if p5.chargeState == l__ChargeState__9.Idle then
				l__Players__10.LocalPlayer:SetAttribute("IsCharging", false);
				if u13 ~= nil then
					u13:Stop();
				end;
				if u13 ~= nil then
					u13:Destroy();
				end;
				if u14 ~= nil then
					u14:Stop();
				end;
				if u14 ~= nil then
					u14:Destroy();
				end;
				p2.animationMaid:DoCleaning();
			end;
		end);
	end);
end;
local l__ProjectileHandler__15 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-handler").ProjectileHandler;
local l__SoundManager__16 = v2.SoundManager;
local l__KnitClient__17 = v3.KnitClient;
function v6.fire(p6, p7, p8, p9)
	local v16 = l__getItemMeta__11(l__ItemType__4.HEAVENLY_SWORD);
	if not v16 then
		return nil;
	end;
	local v17 = l__ProjectileHandler__15.new(1, 1, "sword_wave", nil, nil, Vector3.new(0, 0, 0));
	local v18 = nil;
	if p9 >= 1 then
		v18 = l__ItemType__4.HEAVENLY_SWORD;
	end;
	l__SoundManager__16:playSound(l__GameSound__6.LIGHT_SWORD_ATTACK);
	l__KnitClient__17.Controllers.ProjectileController:launchProjectile(l__ItemType__4.HEAVENLY_SWORD, v18, v17, p8, v16.projectileSource);
end;
local l__EntityUtil__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
function v6.fireMultiple(p10, p11, p12, p13)
	local v19 = l__getItemMeta__11(l__ItemType__4.HEAVENLY_SWORD);
	if not v19 then
		return nil;
	end;
	local u19 = l__EntityUtil__18:getEntity(p11);
	local u20 = 0.3;
	local u21 = nil;
	local u22 = l__ProjectileHandler__15.new(1, 1, "sword_wave", nil, nil, Vector3.new(0, 0, 0));
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
			local v22 = u19;
			if v22 ~= nil then
				v22 = v22:getItemInHand();
				if v22 ~= nil then
					v22 = v22.Name;
				end;
			end;
			if v22 ~= l__ItemType__4.HEAVENLY_SWORD then
				return nil;
			end;
			if v20 == 3 then
				u20 = u20 + 0.1;
				u21 = l__ItemType__4.HEAVENLY_SWORD;
			end;
			l__SoundManager__16:playSound(l__GameSound__6.LIGHT_SWORD_ATTACK);
			l__KnitClient__17.Controllers.ProjectileController:launchProjectile(l__ItemType__4.HEAVENLY_SWORD, u21, u22, p12, v19.projectileSource);
			wait(u20);		
		end;
	end);
end;
local l__AnimationUtil__23 = v2.AnimationUtil;
function v6.playAnimation(p14, p15)
	local v23 = l__AnimationUtil__23.playAnimation(l__Players__10.LocalPlayer, l__GameAnimationUtil__12.getAssetId(p15));
	if v23 ~= nil then
		v23:AdjustSpeed(1);
	end;
end;
function v6.playSound(p16)
	local v24 = l__SoundManager__16:playSound(l__GameSound__6.LIGHT_SWORD_CHARGE);
	if v24 then
		p16.animationMaid:GiveTask(function()
			v24:Stop();
		end);
	end;
end;
local l__ReplicatedStorage__24 = v4.ReplicatedStorage;
local l__Workspace__25 = v4.Workspace;
function v6.playEffect(p17, p18)
	if not p18 then
		return nil;
	end;
	local v25 = l__ReplicatedStorage__24.Assets.Effects.HeavenlySwordEffect:Clone();
	v25:SetPrimaryPartCFrame(p18);
	v25.Parent = l__Workspace__25;
	v25:SetPrimaryPartCFrame(p18 * CFrame.new(0, 0, -6));
	task.delay(0.15, function()
		v25:Destroy();
	end);
end;
u1 = l__KnitClient__3.CreateController;
u1 = u1(v6.new());
return nil;
