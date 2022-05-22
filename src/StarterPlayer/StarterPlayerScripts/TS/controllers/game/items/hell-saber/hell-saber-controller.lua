-- Script Hash: 9fc0d0ea3ad361177a883b57620b74fce88d47ca82156860ae6626685eb62f9ccf44a781621b0467217197712d3d6d5b
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "HellSaberController";
	end, 
	__index = l__HandKnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = l__HandKnitController__5;
local l__Maid__2 = v3.Maid;
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "HellSaberController";
	p1.animationMaid = l__Maid__2.new();
end;
local l__KnitClient__3 = v3.KnitClient;
local l__ItemType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__AnimationType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientSyncEvents__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__EntityUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__ChargeState__10 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "sword", "sword-controller").ChargeState;
local l__Players__11 = v4.Players;
local l__getItemMeta__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__GameAnimationUtil__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	l__KnitClient__3.Controllers.PreloadController:preloadForItemType(l__ItemType__4.HELL_SABER, {
		animations = { l__AnimationType__5.INFERNO_SWORD_CHARGE }, 
		sounds = { l__GameSound__6.INFERNAL_SWORD_CHARGE }
	});
	l__default__7.Client:Get("RemoteName"):Connect(function(p3)
		p2:playEffects(p3.player);
	end);
	l__ClientSyncEvents__8.SwordChargedSwing:connect(function(p4)
		if p4.weapon.Name ~= l__ItemType__4.HELL_SABER then
			return nil;
		end;
		if p4.chargedAttack.chargeTime >= 0.5 then
			l__default__7.Client:Get("RemoteName"):SendToServer({
				chargeTime = p4.chargedAttack.chargeTime, 
				player = p4.fromPlayer, 
				weapon = p4.weapon
			});
			l__KnitClient__3.Controllers.ViewmodelController:playAnimation(l__AnimationType__5.FP_INFERNO_SWORD_SPIN);
			local v8 = false;
			if p4.chargedAttack.chargeTime >= 1.5 then
				v8 = p4.fromPlayer:GetAttribute("EmberUpgraded");
			end;
			if v8 ~= 0 and v8 == v8 and v8 ~= "" and v8 then
				wait(0.2);
				v1.Promise.defer(function()
					local v9 = 0;
					local v10 = false;
					while true do
						if v10 then
							v9 = v9 + 1;
						else
							v10 = true;
						end;
						if not (v9 < 3) then
							break;
						end;
						local v11 = l__EntityUtil__9:getEntity(p4.fromPlayer);
						if v11 ~= nil then
							v11 = v11:getItemInHand();
							if v11 ~= nil then
								v11 = v11.Name;
							end;
						end;
						if v11 ~= l__ItemType__4.HELL_SABER then
							return nil;
						end;
						wait(0.3);
						l__KnitClient__3.Controllers.ViewmodelController:playAnimation(l__AnimationType__5.FP_INFERNO_SWORD_SPIN);					
					end;
				end);
			end;
		end;
	end);
	local u14 = nil;
	local u15 = nil;
	l__ClientSyncEvents__8.SwordCharge:connect(function(p5)
		if p5.itemType.itemType ~= l__ItemType__4.HELL_SABER then
			return nil;
		end;
		local l__chargingSound__12 = p2.chargingSound;
		if l__chargingSound__12 ~= nil then
			l__chargingSound__12:Stop();
		end;
		if p5.chargeState == l__ChargeState__10.Charging then
			local v13 = l__Players__11.LocalPlayer.Character;
			if v13 ~= nil then
				v13 = v13:FindFirstChild("Humanoid");
				if v13 ~= nil then
					v13 = v13:FindFirstChild("Animator");
				end;
			end;
			if not v13 then
				return nil;
			end;
			local v14 = l__getItemMeta__12(p5.itemType.itemType).sword;
			if v14 ~= nil then
				v14 = v14.chargedAttack;
			end;
			if not v14 then
				return nil;
			end;
			p2:playSound();
			u14 = v13:LoadAnimation(l__GameAnimationUtil__13.getAnimation(l__AnimationType__5.INFERNO_SWORD_CHARGE));
			u14:Play();
			u14:AdjustSpeed(1.83);
			u14:GetMarkerReachedSignal("end"):Connect(function()
				if u14 ~= nil then
					u14:AdjustSpeed(0);
				end;
			end);
			u15 = l__KnitClient__3.Controllers.ViewmodelController:playAnimation(l__AnimationType__5.FP_INFERNO_SWORD_CHARGE);
			if u15 then
				u15:GetMarkerReachedSignal("end"):Connect(function()
					if u15 ~= nil then
						u15:AdjustSpeed(0);
					end;
				end);
			end;
			p2.animationMaid:GiveTask(function()
				if u14 ~= nil then
					u14:Stop();
				end;
				if u14 ~= nil then
					u14:Destroy();
				end;
				if u15 ~= nil then
					u15:Stop();
				end;
				if u15 ~= nil then
					u15:Destroy();
				end;
			end);
		elseif p5.chargeState == l__ChargeState__10.Charged then
			local l__chargingSound__15 = p2.chargingSound;
			if l__chargingSound__15 ~= nil then
				l__chargingSound__15:Stop();
			end;
		end;
		if p5.chargeState == l__ChargeState__10.Idle then
			if u14 ~= nil then
				u14:Stop();
			end;
			if u14 ~= nil then
				u14:Destroy();
			end;
			if u15 ~= nil then
				u15:Stop();
			end;
			if u15 ~= nil then
				u15:Destroy();
			end;
			p2.animationMaid:DoCleaning();
		end;
	end);
end;
function v6.isRelevantItem(p6, p7)
	return p7.itemType == l__ItemType__4.HELL_SABER;
end;
function v6.onEnable(p8, p9)
	print(p9);
end;
function v6.onDisable(p10)

end;
local l__SoundManager__16 = v2.SoundManager;
function v6.playSound(p11)
	p11.chargingSound = l__SoundManager__16:playSound(l__GameSound__6.INFERNAL_SWORD_CHARGE);
	if p11.chargingSound then
		p11.animationMaid:GiveTask(function()
			local l__chargingSound__16 = p11.chargingSound;
			if l__chargingSound__16 ~= nil then
				l__chargingSound__16:Stop();
			end;
		end);
	end;
end;
local l__ReplicatedStorage__17 = v4.ReplicatedStorage;
local l__scaleModel__18 = v1.import(script, v1.getModule(script, "@rbxts", "scale-model").out).scaleModel;
local l__Workspace__19 = v4.Workspace;
local l__GameQueryUtil__20 = v2.GameQueryUtil;
local l__ModelUtil__21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local l__InOutExpo__22 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).InOutExpo;
local l__RunService__23 = v4.RunService;
local l__default__24 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
function v6.playEffects(p12, p13)
	local v17 = l__EntityUtil__9:getEntity(p13);
	if v17 == nil then
		return nil;
	end;
	local v18 = l__Maid__2.new();
	local v19 = l__ReplicatedStorage__17.Assets.Effects.InfernalSwordSpin:Clone();
	v19:SetPrimaryPartCFrame(v17:getInstance():GetPrimaryPartCFrame());
	l__scaleModel__18(v19, 0.04);
	v19.Parent = l__Workspace__19;
	for v20, v21 in ipairs(v19:GetChildren()) do
		if v21:IsA("BasePart") then
			l__GameQueryUtil__20:setQueryIgnored(v21, true);
		end;
	end;
	l__ModelUtil__21.tweenModelSize(v19, 0, l__InOutExpo__22, 10);
	local u25 = 0;
	local u26 = l__RunService__23.Heartbeat:Connect(function(p14)
		local v22 = v17:getInstance():GetPrimaryPartCFrame();
		if not p12:validPlayerConditions(v17) then
			v18:DoCleaning();
			return nil;
		end;
		u25 = u25 + p14;
		if v19.PrimaryPart ~= nil then
			return;
		end;
		l__default__24.Error("Shield effect has no primary part");
		return nil;
	end);
	task.delay(0.1, function()
		v18:DoCleaning();
		u26:Disconnect();
		v19:Destroy();
		return nil;
	end);
end;
function v6.validPlayerConditions(p15, p16)
	if not p16:isAlive() then
		return false;
	end;
	local v23 = p16:getItemInHand();
	if v23 ~= nil then
		v23 = v23.Name;
	end;
	if v23 ~= l__ItemType__4.HELL_SABER then
		return false;
	end;
	if p16:getInstance().PrimaryPart == nil then
		return false;
	end;
	return true;
end;
u1 = l__KnitClient__3.CreateController;
u1 = u1(v6.new());
return nil;
