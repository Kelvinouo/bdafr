-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "HellSaberController";
	end, 
	__index = l__HandKnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__HandKnitController__4;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "HellSaberController";
	p1.animationMaid = u2.new();
end;
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__ItemType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__AnimationType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientSyncEvents__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__EntityUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__ChargeState__10 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "sword", "sword-controller").ChargeState;
local l__Players__11 = v3.Players;
local l__getItemMeta__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__GameAnimationUtil__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
function v5.KnitStart(p2)
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
			local v7 = false;
			if p4.chargedAttack.chargeTime >= 1.5 then
				v7 = p4.fromPlayer:GetAttribute("EmberUpgraded");
			end;
			if v7 ~= 0 and v7 == v7 and v7 ~= "" and v7 then
				wait(0.2);
				v1.Promise.defer(function()
					local v8 = 0;
					local v9 = false;
					while true do
						if v9 then
							v8 = v8 + 1;
						else
							v9 = true;
						end;
						if not (v8 < 3) then
							break;
						end;
						local v10 = l__EntityUtil__9:getEntity(p4.fromPlayer);
						if v10 ~= nil then
							v10 = v10:getItemInHand();
							if v10 ~= nil then
								v10 = v10.Name;
							end;
						end;
						if v10 ~= l__ItemType__4.HELL_SABER then
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
		local l__chargingSound__11 = p2.chargingSound;
		if l__chargingSound__11 ~= nil then
			l__chargingSound__11:Stop();
		end;
		if p5.chargeState == l__ChargeState__10.Charging then
			local v12 = l__Players__11.LocalPlayer.Character;
			if v12 ~= nil then
				v12 = v12:FindFirstChild("Humanoid");
				if v12 ~= nil then
					v12 = v12:FindFirstChild("Animator");
				end;
			end;
			if not v12 then
				return nil;
			end;
			local v13 = l__getItemMeta__12(p5.itemType.itemType).sword;
			if v13 ~= nil then
				v13 = v13.chargedAttack;
			end;
			if not v13 then
				return nil;
			end;
			p2:playSound();
			u14 = v12:LoadAnimation(l__GameAnimationUtil__13.getAnimation(l__AnimationType__5.INFERNO_SWORD_CHARGE));
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
			local l__chargingSound__14 = p2.chargingSound;
			if l__chargingSound__14 ~= nil then
				l__chargingSound__14:Stop();
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
function v5.isRelevantItem(p6, p7)
	return p7.itemType == l__ItemType__4.HELL_SABER;
end;
function v5.onEnable(p8, p9)
	print(p9);
end;
function v5.onDisable(p10)

end;
local l__SoundManager__16 = v2.SoundManager;
function v5.playSound(p11)
	p11.chargingSound = l__SoundManager__16:playSound(l__GameSound__6.INFERNAL_SWORD_CHARGE);
	if p11.chargingSound then
		p11.animationMaid:GiveTask(function()
			local l__chargingSound__15 = p11.chargingSound;
			if l__chargingSound__15 ~= nil then
				l__chargingSound__15:Stop();
			end;
		end);
	end;
end;
local l__ReplicatedStorage__17 = v3.ReplicatedStorage;
local l__scaleModel__18 = v1.import(script, v1.getModule(script, "@rbxts", "scale-model").out).scaleModel;
local l__Workspace__19 = v3.Workspace;
local l__GameQueryUtil__20 = v2.GameQueryUtil;
local l__ModelUtil__21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local l__InOutExpo__22 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).InOutExpo;
local l__RunService__23 = v3.RunService;
local l__default__24 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
function v5.playEffects(p12, p13)
	local v16 = l__EntityUtil__9:getEntity(p13);
	if v16 == nil then
		return nil;
	end;
	local v17 = u2.new();
	local v18 = l__ReplicatedStorage__17.Assets.Effects.InfernalSwordSpin:Clone();
	v18:SetPrimaryPartCFrame(v16:getInstance():GetPrimaryPartCFrame());
	l__scaleModel__18(v18, 0.04);
	v18.Parent = l__Workspace__19;
	for v19, v20 in ipairs(v18:GetChildren()) do
		if v20:IsA("BasePart") then
			l__GameQueryUtil__20:setQueryIgnored(v20, true);
		end;
	end;
	l__ModelUtil__21.tweenModelSize(v18, 0, l__InOutExpo__22, 10);
	local u25 = 0;
	local u26 = l__RunService__23.Heartbeat:Connect(function(p14)
		local v21 = v16:getInstance():GetPrimaryPartCFrame();
		if not p12:validPlayerConditions(v16) then
			v17:DoCleaning();
			return nil;
		end;
		u25 = u25 + p14;
		if v18.PrimaryPart ~= nil then
			return;
		end;
		l__default__24.Error("Shield effect has no primary part");
		return nil;
	end);
	task.delay(0.1, function()
		v17:DoCleaning();
		u26:Disconnect();
		v18:Destroy();
		return nil;
	end);
end;
function v5.validPlayerConditions(p15, p16)
	if not p16:isAlive() then
		return false;
	end;
	local v22 = p16:getItemInHand();
	if v22 ~= nil then
		v22 = v22.Name;
	end;
	if v22 ~= l__ItemType__4.HELL_SABER then
		return false;
	end;
	if p16:getInstance().PrimaryPart == nil then
		return false;
	end;
	return true;
end;
u1 = l__KnitClient__3.CreateController;
u1 = u1(v5.new());
return nil;
