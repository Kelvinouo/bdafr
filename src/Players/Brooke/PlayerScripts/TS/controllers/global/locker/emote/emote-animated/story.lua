-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ServerStorage__2 = v2.ServerStorage;
local l__Workspace__3 = v2.Workspace;
local l__ReplicatedStorage__4 = v2.ReplicatedStorage;
local l__WeldUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__AnimationUtil__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).AnimationUtil;
local l__GameAnimationUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
return function(p1)
	local v3 = u1.new();
	local v4 = {};
	local v5 = l__ServerStorage__2.Assets.Villagers.barbarian:Clone();
	v5.PrimaryPart.Anchored = true;
	v5.Name = "AnimatedEmoteCharacter";
	v5.Parent = l__Workspace__3;
	local v6 = l__ReplicatedStorage__4.Assets.Misc.KillEffectKnives.KillEffectSpear:Clone();
	v6.Parent = v5;
	l__WeldUtil__5:weldCharacterAccessories(v5);
	v3:GiveTask(function()
		v6:Destroy();
		v5:Destroy();
	end);
	l__AnimationUtil__6.playAnimation(v5, l__GameAnimationUtil__7.getAssetId(l__AnimationType__8.KNIGHTS_BOW));
	return function()
		v3:DoCleaning();
	end;
end;
