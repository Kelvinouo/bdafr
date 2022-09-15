-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "FryingPanController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "FryingPanController";
	p1.animationMaid = u1.new();
end;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__AnimationType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ClientSyncEvents__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__EntityUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__Players__8 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__ChargeState__9 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "sword", "sword-controller").ChargeState;
local l__getItemMeta__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__GameAnimationUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__SoundManager__12 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	l__KnitClient__2.Controllers.PreloadController:preloadForItemType(l__ItemType__3.FRYING_PAN, {
		animations = { l__AnimationType__4.PAN_CHARGE }, 
		sounds = { l__GameSound__5.FRYING_PAN_CHARGE, l__GameSound__5.FRYING_PAN_HIT }
	});
	local u13 = nil;
	l__ClientSyncEvents__6.SwordCharge:connect(function(p3)
		local v5 = l__EntityUtil__7:getEntity(l__Players__8.LocalPlayer);
		if p3.itemType.itemType ~= l__ItemType__3.FRYING_PAN then
			return nil;
		end;
		if p3.chargeState == l__ChargeState__9.Charging then
			local v6 = l__Players__8.LocalPlayer.Character;
			if v6 ~= nil then
				v6 = v6:FindFirstChild("Humanoid");
				if v6 ~= nil then
					v6 = v6:FindFirstChild("Animator");
				end;
			end;
			if not v6 then
				return nil;
			end;
			local v7 = l__getItemMeta__10(p3.itemType.itemType);
			local v8 = v7.sword;
			if v8 ~= nil then
				v8 = v8.chargedAttack;
			end;
			if not v8 then
				return nil;
			end;
			u13 = v6:LoadAnimation(l__GameAnimationUtil__11.getAnimation(l__AnimationType__4.PAN_CHARGE));
			u13:Play();
			u13:AdjustSpeed(u13.Length / v7.sword.chargedAttack.maxChargeTimeSec);
			u13:GetMarkerReachedSignal("end"):Connect(function()
				if u13 ~= nil then
					u13:AdjustSpeed(0);
				end;
			end);
			p2.animationMaid:GiveTask(function()
				if u13 ~= nil then
					u13:Stop();
				end;
				if u13 ~= nil then
					u13:Destroy();
				end;
			end);
			local v9 = l__SoundManager__12:playSound(l__GameSound__5.FRYING_PAN_CHARGE);
			if v9 then
				p2.animationMaid:GiveTask(function()
					v9:Stop();
				end);
			end;
		elseif p3.chargeState == l__ChargeState__9.Charged then

		end;
		if p3.chargeState == l__ChargeState__9.Idle then
			p2.animationMaid:DoCleaning();
		end;
	end);
	l__ClientSyncEvents__6.SwordSwing:connect(function(p4)

	end);
end;
local v10 = l__KnitClient__2.CreateController(v3.new());
return nil;
