
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "HeavenlySwordController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
local l__Maid__2 = v3.Maid;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "HeavenlySwordController";
	p1.animationMaid = l__Maid__2.new();
end;
local l__KnitClient__3 = v3.KnitClient;
local l__ItemType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__AnimationType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ClientSyncEvents__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__ChargeState__8 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "sword", "sword-controller").ChargeState;
local l__Players__9 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__getItemMeta__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__GameAnimationUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__KnitClient__3.Controllers.PreloadController:preloadForItemType(l__ItemType__4.HEAVENLY_SWORD, {
		animations = { l__AnimationType__5.HEAVENLY_SWORD_CHARGE, l__AnimationType__5.HEAVENLY_SWORD_SWING }, 
		sounds = { l__GameSound__6.LIGHT_SWORD_CHARGE }
	});
	l__ClientSyncEvents__7.SwordChargedSwing:connect(function(p3)
		if p3.weapon.Name ~= l__ItemType__4.HEAVENLY_SWORD then
			return nil;
		end;
		local v7 = p3.chargedAttack;
		if v7 ~= nil then
			v7 = v7.chargeTime;
		end;
		if v7 == 0 or v7 ~= v7 or not v7 then
			return nil;
		end;
		if p3.chargedAttack.chargeTime < 0.5 then
			return nil;
		end;
		local v8 = p3.fromPlayer:GetAttribute("LumenUpgraded");
		if p3.chargedAttack.chargeTime <= 1 or v8 == 0 or v8 ~= v8 or v8 == "" or not v8 then
			p2:fire(p3.fromPlayer, p3.weapon, p3.chargedAttack.chargeTime);
		end;
		local v9 = false;
		if p3.chargedAttack.chargeTime >= 1 then
			v9 = v8;
		end;
		if v9 ~= 0 and v9 == v9 and v9 ~= "" and v9 then
			p2:playAnimation(l__AnimationType__5.BEAR_CLAWS_FLURRY);
			l__KnitClient__3.Controllers.ViewmodelController:playAnimation(l__AnimationType__5.BEAR_CLAWS_FLURRY);
			p2:fireMultiple(p3.fromPlayer, p3.weapon, p3.chargedAttack.chargeTime);
		end;
	end);
	local u12 = nil;
	local u13 = nil;
	l__ClientSyncEvents__7.SwordCharge:connect(function(p4)
		if p4.itemType.itemType ~= l__ItemType__4.HEAVENLY_SWORD then
			return nil;
		end;
		if p4.chargeState == l__ChargeState__8.Charging then
			l__Players__9.LocalPlayer:SetAttribute("IsCharging", true);
			local v10 = l__Players__9.LocalPlayer.Character;
			if v10 ~= nil then
				v10 = v10:FindFirstChild("Humanoid");
				if v10 ~= nil then
					v10 = v10:FindFirstChild("Animator");
				end;
			end;
			if not v10 then
				return nil;
			end;
			local v11 = l__getItemMeta__10(p4.itemType.itemType);
			local v12 = v11.sword;
			if v12 ~= nil then
				v12 = v12.chargedAttack;
			end;
			if not v12 then
				return nil;
			end;
			p2:playSound();
			local v13 = v11.sword;
			if v13 ~= nil then
				v13 = v13.chargedAttack.chargeSlowDelay;
			end;
			wait(v13);
			local v14 = l__Players__9.LocalPlayer:GetAttribute("IsCharging");
			if v14 == 0 or v14 ~= v14 or v14 == "" or not v14 then
				return nil;
			else
				u12 = v10:LoadAnimation(l__GameAnimationUtil__11.getAnimation(l__AnimationType__5.HEAVENLY_SWORD_CHARGE));
				u12:Play();
				u12:AdjustSpeed(0.683);
				u12:GetMarkerReachedSignal("end"):Connect(function()
					if u12 ~= nil then
						u12:AdjustSpeed(0);
					end;
				end);
				u13 = l__KnitClient__3.Controllers.ViewmodelController:playAnimation(l__AnimationType__5.FP_HEAVENLY_SWORD_CHARGE);
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
		elseif p4.chargeState == l__ChargeState__8.Charged then

		end;
		if p4.chargeState == l__ChargeState__8.Idle then
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
end;
local l__ProjectileHandler__14 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-handler").ProjectileHandler;
local l__SoundManager__15 = v2.SoundManager;
local l__KnitClient__16 = v3.KnitClient;
function v5.fire(p5, p6, p7, p8)
	local v15 = l__getItemMeta__10(l__ItemType__4.HEAVENLY_SWORD);
	if not v15 then
		return nil;
	end;
	local v16 = l__ProjectileHandler__14.new(1, 1, "sword_wave", nil, nil, Vector3.new(0, 0, 0));
	local v17 = nil;
	if p8 >= 1 then
		v17 = l__ItemType__4.HEAVENLY_SWORD;
	end;
	l__SoundManager__15:playSound(l__GameSound__6.LIGHT_SWORD_ATTACK);
	l__KnitClient__16.Controllers.ProjectileController:launchProjectile(l__ItemType__4.HEAVENLY_SWORD, v17, v16, p7, v15.projectileSource);
end;
local l__EntityUtil__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
function v5.fireMultiple(p9, p10, p11, p12)
	local v18 = l__getItemMeta__10(l__ItemType__4.HEAVENLY_SWORD);
	if not v18 then
		return nil;
	end;
	local u18 = l__EntityUtil__17:getEntity(p10);
	local u19 = 0.3;
	local u20 = nil;
	local u21 = l__ProjectileHandler__14.new(1, 1, "sword_wave", nil, nil, Vector3.new(0, 0, 0));
	v1.Promise.defer(function()
		local v19 = 0;
		local v20 = false;
		while true do
			if v20 then
				v19 = v19 + 1;
			else
				v20 = true;
			end;
			if not (v19 < 4) then
				break;
			end;
			local v21 = u18;
			if v21 ~= nil then
				v21 = v21:getItemInHand();
				if v21 ~= nil then
					v21 = v21.Name;
				end;
			end;
			if v21 ~= l__ItemType__4.HEAVENLY_SWORD then
				return nil;
			end;
			if v19 == 3 then
				u19 = u19 + 0.1;
				u20 = l__ItemType__4.HEAVENLY_SWORD;
			end;
			l__SoundManager__15:playSound(l__GameSound__6.LIGHT_SWORD_ATTACK);
			l__KnitClient__16.Controllers.ProjectileController:launchProjectile(l__ItemType__4.HEAVENLY_SWORD, u20, u21, p11, v18.projectileSource);
			wait(u19);		
		end;
	end);
end;
local l__AnimationUtil__22 = v2.AnimationUtil;
function v5.playAnimation(p13, p14)
	local v22 = l__AnimationUtil__22.playAnimation(l__Players__9.LocalPlayer, l__GameAnimationUtil__11.getAssetId(p14));
	if v22 ~= nil then
		v22:AdjustSpeed(1);
	end;
end;
function v5.playSound(p15)
	local v23 = l__SoundManager__15:playSound(l__GameSound__6.LIGHT_SWORD_CHARGE);
	if v23 then
		p15.animationMaid:GiveTask(function()
			v23:Stop();
		end);
	end;
end;
u1 = l__KnitClient__3.CreateController;
u1 = u1(v5.new());
return nil;

