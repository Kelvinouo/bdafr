-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "AmbientSoundController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__SoundService__2 = v2.SoundService;
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "AmbientSoundController";
	p1.ambienceGroup = u1("SoundGroup", {
		Parent = l__SoundService__2, 
		Name = "Ambience"
	});
end;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__PlaceUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	if l__PlaceUtil__4.isLobbyServer() then

	end;
	local l__WIND_AMBIENCE__5 = l__GameSound__3.WIND_AMBIENCE;
	task.spawn(function()
		p2:startAmbience(l__WIND_AMBIENCE__5);
	end);
end;
local l__ContentProvider__6 = v2.ContentProvider;
local l__SoundManager__7 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v4.startAmbience(p3, p4)
	p3:stopAmbience();
	l__ContentProvider__6:PreloadAsync({ u1("Sound", {
			SoundId = p4
		}) });
	local v6 = l__SoundManager__7:playSound(p4, {
		fadeInTime = 2, 
		looped = true
	});
	p3.activeTrack = v6;
	local v7 = u8.new();
	v7:GiveTask(function()
		if p3.activeTrack == v6 then
			p3:stopAmbience();
		end;
	end);
	return v7;
end;
local l__default__9 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__Linear__10 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).Linear;
function v4.stopAmbience(p5, p6)
	if p6 == nil then
		p6 = 2;
	end;
	local l__activeTrack__8 = p5.activeTrack;
	if l__activeTrack__8 then
		p5.activeTrack = nil;
		if p6 > 0 then
			local l__Volume__11 = l__activeTrack__8.Volume;
			l__default__9(p6, l__Linear__10, function(p7)
				local v9 = l__activeTrack__8;
				if v9 ~= nil then
					v9 = v9.Parent;
				end;
				if not v9 then
					return nil;
				end;
				l__activeTrack__8.Volume = l__Volume__11 * (1 - p7);
			end);
		end;
		task.delay(p6, function()
			l__activeTrack__8:Stop();
			l__activeTrack__8:Destroy();
		end);
	end;
end;
local v10 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
