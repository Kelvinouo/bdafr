-- Script Hash: 97d7ca95f22863bfa106083bb3d7a4ca072f59b9bca303e1166705cd91348885903dccdc39f2d52a8addf0b1cb420c2c
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {};
local l__RunService__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).RunService;
local l__DevAnimations__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "definitions", "dev-animations").DevAnimations;
local l__ProdAnimations__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "definitions", "prod-animations").ProdAnimations;
local function v3(p1)
	if l__RunService__1:IsStudio() then
		local v4 = l__DevAnimations__2[p1];
		if v4 ~= "" and v4 then
			return v4;
		end;
	end;
	return l__ProdAnimations__3[p1];
end;
v2.getAssetId = v3;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local u5 = v3;
function v2.getAnimation(p2)
	return u4("Animation", {
		AnimationId = u5(p2)
	});
end;
local l__AnimationUtil__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).AnimationUtil;
function v2.playAnimation(p3, p4, p5)
	return l__AnimationUtil__6.playAnimation(p3, u5(p4), p5);
end;
u5 = {
	getAnimation = function(p6)
		return u4("Animation", {
			AnimationId = v2.getAssetId(p6)
		});
	end, 
	GameAnimationUtil = v2
};
return u5;
