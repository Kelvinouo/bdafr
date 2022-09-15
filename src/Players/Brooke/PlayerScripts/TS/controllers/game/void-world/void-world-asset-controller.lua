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
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "VoidWorldAssetController";
end;
local l__KnitClient__1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__WorldId__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "world", "world-id").WorldId;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	local u3 = nil;
	u3 = l__KnitClient__1.Controllers.WorldController:watchLocalWorld(function(p3)
		local v5 = p3;
		if v5 ~= nil then
			v5 = v5.Name;
		end;
		if v5 == l__WorldId__2.VOID_WORLD then
			u3:Destroy();
			p2:preloadVoidAssets();
		end;
	end);
end;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__AnimationType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v3.preloadVoidAssets(p4)
	l__KnitClient__1.Controllers.PreloadController:runPreload({
		sounds = { l__GameSound__4.VOID_CRAB_BASIC_ATTACK, l__GameSound__4.VOID_CRAB_BEAM_ATTACK, l__GameSound__4.VOID_CRAB_DAMAGED, l__GameSound__4.VOID_CRAB_DEATH, l__GameSound__4.VOID_CRAB_FOOTSTEPS, l__GameSound__4.VOID_CRAB_LUNGE_ATTACK }, 
		animations = { l__AnimationType__5.VOID_CRAB_BEAM_ATTACK, l__AnimationType__5.VOID_CRAB_LEFT_ATTACK, l__AnimationType__5.VOID_CRAB_RIGHT_ATTACK, l__AnimationType__5.VOID_CRAB_WALKING, l__AnimationType__5.VOID_CRAB_ATTACKED, l__AnimationType__5.VOID_CRAB_MIDDLE_ATTACK }
	});
end;
local v6 = l__KnitClient__1.CreateController(v3.new());
return nil;
