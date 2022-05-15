
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "FryingPanController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
local l__Maid__2 = v2.Maid;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "FryingPanController";
	p1.animationMaid = l__Maid__2.new();
end;
local l__KnitClient__3 = v2.KnitClient;
local l__ItemType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__AnimationType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ClientSyncEvents__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__EntityUtil__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__Players__9 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__ChargeState__10 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "sword", "sword-controller").ChargeState;
local l__getItemMeta__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__GameAnimationUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__SoundManager__13 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__KnitClient__3.Controllers.PreloadController:preloadForItemType(l__ItemType__4.FRYING_PAN, {
		animations = { l__AnimationType__5.PAN_CHARGE }, 
		sounds = { l__GameSound__6.FRYING_PAN_CHARGE, l__GameSound__6.FRYING_PAN_HIT }
	});
	local u14 = nil;
	l__ClientSyncEvents__7.SwordCharge:connect(function(p3)
		local v6 = l__EntityUtil__8:getEntity(l__Players__9.LocalPlayer);
		if p3.itemType.itemType ~= l__ItemType__4.FRYING_PAN then
			return nil;
		end;
		if p3.chargeState == l__ChargeState__10.Charging then
			local v7 = l__Players__9.LocalPlayer.Character;
			if v7 ~= nil then
				v7 = v7:FindFirstChild("Humanoid");
				if v7 ~= nil then
					v7 = v7:FindFirstChild("Animator");
				end;
			end;
			if not v7 then
				return nil;
			end;
			local v8 = l__getItemMeta__11(p3.itemType.itemType);
			local v9 = v8.sword;
			if v9 ~= nil then
				v9 = v9.chargedAttack;
			end;
			if not v9 then
				return nil;
			end;
			u14 = v7:LoadAnimation(l__GameAnimationUtil__12.getAnimation(l__AnimationType__5.PAN_CHARGE));
			u14:Play();
			u14:AdjustSpeed(u14.Length / v8.sword.chargedAttack.maxChargeTimeSec);
			u14:GetMarkerReachedSignal("end"):Connect(function()
				if u14 ~= nil then
					u14:AdjustSpeed(0);
				end;
			end);
			p2.animationMaid:GiveTask(function()
				if u14 ~= nil then
					u14:Stop();
				end;
				if u14 ~= nil then
					u14:Destroy();
				end;
			end);
			local v10 = l__SoundManager__13:playSound(l__GameSound__6.FRYING_PAN_CHARGE);
			if v10 then
				p2.animationMaid:GiveTask(function()
					v10:Stop();
				end);
			end;
		elseif p3.chargeState == l__ChargeState__10.Charged then

		end;
		if p3.chargeState == l__ChargeState__10.Idle then
			p2.animationMaid:DoCleaning();
		end;
	end);
	l__ClientSyncEvents__7.SwordSwing:connect(function(p4)

	end);
end;
u1 = l__KnitClient__3.CreateController;
u1 = u1(v4.new());
return nil;

