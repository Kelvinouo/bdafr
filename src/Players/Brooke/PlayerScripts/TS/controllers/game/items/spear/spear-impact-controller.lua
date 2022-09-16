-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "SpearImpactController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
function v3.constructor(p1, ...)
	l__KnitController__2.constructor(p1, ...);
	p1.Name = "SpearImpactController";
	p1.random = Random.new();
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__SoundManager__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__KnitClient__5 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	l__default__1.Client:OnEvent("RemoteName", function(p3)
		local v5 = u2.new();
		l__SoundManager__3:playSound(l__GameSound__4.SPEAR_HIT, {
			position = p3.position, 
			rollOffMaxDistance = 100
		});
		l__KnitClient__5.Controllers.LightningController:createExplosion({
			position = p3.position, 
			explosionType = "spearExplosion"
		});
	end);
end;
local v6 = l__KnitClient__5.CreateController(v3.new());
return nil;
