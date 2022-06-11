-- Script Hash: 8c21061bee3da1709363842e201455ab8d79bf1f7fc0e835b474f1832afda9ee819ca32bd407be7333cc2abed225e733
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "VoidWorldMusicController";
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
	p1.Name = "VoidWorldMusicController";
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__WorldId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "world", "world-id").WorldId;
local l__SoundManager__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	local u7 = u2.new();
	l__KnitClient__3.Controllers.WorldController:watchLocalWorld(function(p3)
		local v5 = p3;
		if v5 ~= nil then
			v5 = v5.Name;
		end;
		if v5 ~= l__WorldId__4.VOID_WORLD then
			u7:DoCleaning();
			return;
		end;
		local u8 = l__SoundManager__5:playSound(l__GameSound__6.VOID_THEME_SONG, {
			fadeInTime = 2
		});
		u7:GiveTask(function()
			if u8 ~= nil then
				u8:Stop();
			end;
		end);
	end);
end;
u1 = l__KnitClient__3.CreateController;
u1 = u1(v3.new());
return nil;
