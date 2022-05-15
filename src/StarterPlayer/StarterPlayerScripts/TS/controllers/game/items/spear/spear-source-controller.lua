
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "SpearSourceController";
	end, 
	__index = v3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = v3;
local l__Maid__2 = v2.Maid;
function v4.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.Name = "SpearSourceController";
	p1.chargingMaid = l__Maid__2.new();
end;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
end;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v4.isRelevantItem(p3, p4)
	return p4.itemType == l__ItemType__3.SPEAR;
end;
local l__GameAnimationUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__Players__5 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__AnimationType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v4.onStartCharging(p5)
	local v6 = l__GameAnimationUtil__4.playAnimation(l__Players__5.LocalPlayer, l__AnimationType__6.SPEAR_STARTUP);
	if v6 then
		p5.chargingMaid:GiveTask(v6);
		p5.chargingMaid:GiveTask(v6.Stopped:Connect(function()
			local v7 = l__GameAnimationUtil__4.playAnimation(l__Players__5.LocalPlayer, l__AnimationType__6.SPEAR_IDLE, {
				looped = true
			});
			if v7 then
				p5.chargingMaid:GiveTask(function()
					v7:Stop();
				end);
			end;
		end));
	end;
end;
function v4.onStopCharging(p6)
	p6.chargingMaid:DoCleaning();
end;
local l__SoundManager__7 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v4.onLaunch(p7)
	local v8 = {};
	local v9 = l__Players__5.LocalPlayer.Character;
	if v9 ~= nil then
		v9 = v9:GetPrimaryPartCFrame().Position;
	end;
	v8.position = v9;
	v8.parent = l__Players__5.LocalPlayer.Character;
	l__SoundManager__7:playSound(l__GameSound__8.SPEAR_THROW, v8);
	l__GameAnimationUtil__4.playAnimation(l__Players__5.LocalPlayer, l__AnimationType__6.SPEAR_THROW);
end;
function v4.onStartReload(p8)

end;
function v4.onMaxCharge(p9)

end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v4.new());
return nil;

