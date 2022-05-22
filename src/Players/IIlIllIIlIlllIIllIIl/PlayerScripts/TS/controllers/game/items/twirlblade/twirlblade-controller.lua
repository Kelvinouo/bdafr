-- Script Hash: a0435c0b8a0eceae4b330ab7ddbc10a8e186736004ec9f83c5f06fd204cab8cd981e3f47dbc79fb014b07a7fd1b6eae5
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "TwirlbladeController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "TwirlbladeController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__SoundManager__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__KnitClient__6 = v2.KnitClient;
local l__AnimationType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		if p3.executingPlayer ~= l__Players__3.LocalPlayer then
			l__SoundManager__4:playSound(l__GameSound__5.TWIRLBLADE_SPIN, {
				position = p3.position
			});
			return;
		end;
		l__SoundManager__4:playSound(l__GameSound__5.TWIRLBLADE_SPIN, {});
		l__KnitClient__6.Controllers.ViewmodelController:playAnimation(l__AnimationType__7.FP_TWIRLBLADE_ATTACK_SPIN);
	end);
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
