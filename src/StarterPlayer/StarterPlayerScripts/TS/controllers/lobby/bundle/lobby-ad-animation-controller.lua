-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "LobbyAdAnimation";
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
	p1.Name = "LobbyAdAnimation";
end;
local l__WatchCollectionTag__2 = v2.WatchCollectionTag;
local l__GameAnimationUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__SoundManager__5 = v2.SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ContentProvider__7 = v1.import(script, v1.getModule(script, "@rbxts", "services")).ContentProvider;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__WatchCollectionTag__2("rockstar-melody-ad", function(p3)
		local v6 = l__GameAnimationUtil__3.getAnimation(l__AnimationType__4.MELODY_ROCKSTAR_AD);
		local v7 = l__SoundManager__5:createSound(l__GameSound__6.GUITAR_LOOP_ROCKSTAR);
		if not v7 then
			return nil;
		end;
		v7.RollOffMinDistance = 40;
		v7.RollOffMaxDistance = 60;
		v7.RollOffMode = Enum.RollOffMode.Linear;
		v7.Volume = 0.8;
		l__ContentProvider__7:PreloadAsync({ v6, v7 });
		local v8 = p3:FindFirstChild("Humanoid");
		if v8 ~= nil then
			v8 = v8:FindFirstChild("Animator");
		end;
		if not v8 then
			return nil;
		end;
		if not p3.PrimaryPart then
			p3:GetPropertyChangedSignal("PrimaryPart"):Wait();
		end;
		v7.Parent = p3.PrimaryPart;
		v7.Looped = true;
		local v9 = v8:LoadAnimation(v6);
		v9.Looped = true;
		v9:Play();
		v7:Play();
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
