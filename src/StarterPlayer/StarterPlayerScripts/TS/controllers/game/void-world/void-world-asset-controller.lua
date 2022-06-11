-- Script Hash: 89f7906566b50afdfecedec2a3a9af96acb11978428e637438e64d0ce2e0dde32db2222eb208a5e61b2efc40b9e1d79f
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "VoidWorldAssetController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__KnitController__2;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "VoidWorldAssetController";
end;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__WorldId__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "world", "world-id").WorldId;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	local u4 = nil;
	u4 = l__KnitClient__2.Controllers.WorldController:watchLocalWorld(function(p3)
		local v5 = p3;
		if v5 ~= nil then
			v5 = v5.Name;
		end;
		if v5 == l__WorldId__3.VOID_WORLD then
			u4:Destroy();
			p2:preloadVoidAssets();
		end;
	end);
end;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__AnimationType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v3.preloadVoidAssets(p4)
	l__KnitClient__2.Controllers.PreloadController:runPreload({
		sounds = { l__GameSound__5.VOID_CRAB_BASIC_ATTACK, l__GameSound__5.VOID_CRAB_BEAM_ATTACK, l__GameSound__5.VOID_CRAB_DAMAGED, l__GameSound__5.VOID_CRAB_DEATH, l__GameSound__5.VOID_CRAB_FOOTSTEPS, l__GameSound__5.VOID_CRAB_LUNGE_ATTACK }, 
		animations = { l__AnimationType__6.VOID_CRAB_BEAM_ATTACK, l__AnimationType__6.VOID_CRAB_LEFT_ATTACK, l__AnimationType__6.VOID_CRAB_RIGHT_ATTACK, l__AnimationType__6.VOID_CRAB_WALKING, l__AnimationType__6.VOID_CRAB_ATTACKED, l__AnimationType__6.VOID_CRAB_MIDDLE_ATTACK }
	});
end;
u1 = l__KnitClient__2.CreateController;
u1 = u1(v3.new());
return nil;
