-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {
	SPAWNS_ENABLED = true, 
	PATH_VISUALIZER_ENABLED = false
};
local l__ServerStorage__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).ServerStorage;
local l__GameAnimationUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
function v2.setupDefaultAnimations(p1, p2)
	local v3 = l__ServerStorage__1.Assets.Misc.AnimateServerScript:Clone();
	v3.Parent = p1;
	v3.run.RunAnim.AnimationId = l__GameAnimationUtil__2.getAssetId(p2.walk);
	v3.jump.JumpAnim.AnimationId = l__GameAnimationUtil__2.getAssetId(p2.jump);
	v3.idle.Animation1.AnimationId = l__GameAnimationUtil__2.getAssetId(p2.idle);
	local l__attack__4 = p2.attack;
	if l__attack__4 ~= 0 and l__attack__4 == l__attack__4 and l__attack__4 then
		p1:SetAttribute("AttackAnimId", l__GameAnimationUtil__2.getAssetId(p2.attack));
	end;
	local v5 = {
		animateScript = v3
	};
	function v5.enable()
		v3.Disabled = false;
	end;
	return v5;
end;
return {
	MonsterUtil = v2
};
