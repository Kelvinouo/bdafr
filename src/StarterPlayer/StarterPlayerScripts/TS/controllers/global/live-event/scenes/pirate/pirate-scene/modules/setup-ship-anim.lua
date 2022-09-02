-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__GameAnimationUtil__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
return {
	setupShipAnim = v1.async(function(p1)
		local v2 = p1.AnimationController:WaitForChild("Animator", 2):LoadAnimation(l__GameAnimationUtil__1.getAnimation(l__AnimationType__2.PIRATE_SHIP_FLY));
		v2:Play();
		v2:AdjustSpeed(0.3);
		return v2;
	end)
};
