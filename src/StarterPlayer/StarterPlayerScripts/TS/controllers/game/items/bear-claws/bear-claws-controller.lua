-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "BearClawsController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__ChargeState__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "sword", "sword-controller").ChargeState;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "BearClawsController";
	p1.bearClawsType = l__ItemType__2.BEAR_CLAWS;
	p1.chargeState = l__ChargeState__3.Idle;
end;
local l__ClientSyncEvents__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__ClientSyncEvents__4.SwordCharge:connect(function(p3)
		if p3.itemType.itemType == p2.bearClawsType then
			if p2:isCharging(p3.chargeState) then
				p2:handleCharging();
			elseif p2:isCharged(p3.chargeState) then
				p2:handleChargedSwipe();
			end;
		end;
		p2.chargeState = p3.chargeState;
	end);
end;
function v4.isCharging(p4, p5)
	return p5 == l__ChargeState__3.Charging;
end;
function v4.isCharged(p6, p7)
	local v6 = false;
	if p6.chargeState == l__ChargeState__3.Charged then
		v6 = p7 == l__ChargeState__3.Idle;
	end;
	return v6;
end;
function v4.handleCharging(p8)

end;
function v4.handleChargedSwipe(p9)
	p9:playFlurryAnimation();
	p9:playFlurrySound();
end;
local l__AnimationUtil__5 = v2.AnimationUtil;
local l__Players__6 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__GameAnimationUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__BEAR_CLAWS_FLURRY__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType.BEAR_CLAWS_FLURRY;
local l__KnitClient__9 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
function v4.playFlurryAnimation(p10)
	l__AnimationUtil__5.playAnimation(l__Players__6.LocalPlayer, l__GameAnimationUtil__7.getAssetId(l__BEAR_CLAWS_FLURRY__8));
	l__KnitClient__9.Controllers.ViewmodelController:playAnimation(l__BEAR_CLAWS_FLURRY__8);
end;
local l__SoundManager__10 = v2.SoundManager;
local l__GameSound__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v4.playFlurrySound(p11)
	task.delay(0.33, function()
		l__SoundManager__10:playSound(l__GameSound__11.BEAR_CLAWS_FLURRY);
	end);
end;
u1 = l__KnitClient__9.CreateController;
u1 = u1(v4.new());
return nil;
