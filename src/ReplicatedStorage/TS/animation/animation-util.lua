-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {};
local l__RunService__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).RunService;
local l__DevAnimations__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "definitions", "dev-animations").DevAnimations;
local l__ProdAnimations__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "definitions", "prod-animations").ProdAnimations;
function v2.getAssetId(p1)
	if l__RunService__1:IsStudio() then
		local v3 = l__DevAnimations__2[p1];
		if v3 ~= "" and v3 then
			return v3;
		end;
	end;
	return l__ProdAnimations__3[p1];
end;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function v2.getAnimation(p2)
	local v4 = {};
	if l__RunService__1:IsStudio() then
		local v5 = l__DevAnimations__2[p2];
		if v5 ~= "" and v5 then
			local v6 = v5;
		else
			v6 = l__ProdAnimations__3[p2];
		end;
	else
		v6 = l__ProdAnimations__3[p2];
	end;
	v4.AnimationId = v6;
	return u4("Animation", v4);
end;
local l__AnimationUtil__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).AnimationUtil;
function v2.playAnimation(p3, p4, p5)
	if p3:IsA("Player") then
		if l__RunService__1:IsStudio() then
			local v7 = l__DevAnimations__2[p4];
			if v7 ~= "" and v7 then
				local v8 = v7;
			else
				v8 = l__ProdAnimations__3[p4];
			end;
		else
			v8 = l__ProdAnimations__3[p4];
		end;
		return l__AnimationUtil__5.playAnimation(p3, v8, p5);
	end;
	if l__RunService__1:IsStudio() then
		local v9 = l__DevAnimations__2[p4];
		if v9 ~= "" and v9 then
			local v10 = v9;
		else
			v10 = l__ProdAnimations__3[p4];
		end;
	else
		v10 = l__ProdAnimations__3[p4];
	end;
	return l__AnimationUtil__5.playAnimation(p3, v10, p5);
end;
return {
	getAnimation = function(p6)
		return u4("Animation", {
			AnimationId = v2.getAssetId(p6)
		});
	end, 
	GameAnimationUtil = v2
};
