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
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "VoidWorldMusicController";
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__WorldId__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "world", "world-id").WorldId;
local l__SoundManager__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	local u6 = u1.new();
	l__KnitClient__2.Controllers.WorldController:watchLocalWorld(function(p3)
		local v5 = p3;
		if v5 ~= nil then
			v5 = v5.Name;
		end;
		if v5 ~= l__WorldId__3.VOID_WORLD then
			u6:DoCleaning();
			return;
		end;
		local u7 = l__SoundManager__4:playSound(l__GameSound__5.VOID_THEME_SONG, {
			fadeInTime = 2
		});
		u6:GiveTask(function()
			if u7 ~= nil then
				u7:Stop();
			end;
		end);
	end);
end;
local v6 = l__KnitClient__2.CreateController(v3.new());
return nil;
