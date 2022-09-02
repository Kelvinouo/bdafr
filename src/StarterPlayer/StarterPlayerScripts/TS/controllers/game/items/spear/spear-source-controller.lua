-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "SpearSourceController";
	end, 
	__index = v2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v3.constructor(p1, ...)
	v2.constructor(p1, ...);
	p1.Name = "SpearSourceController";
	p1.chargingMaid = u1.new();
end;
function v3.KnitStart(p2)
	v2.KnitStart(p2);
end;
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v3.isRelevantItem(p3, p4)
	return p4.itemType == l__ItemType__2.SPEAR;
end;
local l__GameAnimationUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__Players__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__AnimationType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v3.onStartCharging(p5)
	local v5 = l__GameAnimationUtil__3.playAnimation(l__Players__4.LocalPlayer, l__AnimationType__5.SPEAR_STARTUP);
	if v5 then
		p5.chargingMaid:GiveTask(v5);
		p5.chargingMaid:GiveTask(v5.Stopped:Connect(function()
			local v6 = l__GameAnimationUtil__3.playAnimation(l__Players__4.LocalPlayer, l__AnimationType__5.SPEAR_IDLE, {
				looped = true
			});
			if v6 then
				p5.chargingMaid:GiveTask(function()
					v6:Stop();
				end);
			end;
		end));
	end;
end;
function v3.onStopCharging(p6)
	p6.chargingMaid:DoCleaning();
end;
local l__SoundManager__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v3.onLaunch(p7)
	local v7 = {};
	local v8 = l__Players__4.LocalPlayer.Character;
	if v8 ~= nil then
		v8 = v8:GetPrimaryPartCFrame().Position;
	end;
	v7.position = v8;
	v7.parent = l__Players__4.LocalPlayer.Character;
	l__SoundManager__6:playSound(l__GameSound__7.SPEAR_THROW, v7);
	l__GameAnimationUtil__3.playAnimation(l__Players__4.LocalPlayer, l__AnimationType__5.SPEAR_THROW);
end;
function v3.onStartReload(p8)

end;
function v3.onMaxCharge(p9)

end;
local v9 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
