-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "log").out);
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "live-event-system");
local l__default__1 = v2.default;
local l__Logger__2 = v2.Logger;
local l__RunService__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).RunService;
local l__SceneManager__4 = v3.SceneManager;
local l__pirateBuildupScene__5 = v1.import(script, script.Parent.Parent, "pirate-buildup-scene").pirateBuildupScene;
local l__TimeConfig__6 = v3.TimeConfig;
local l__pirateScene__7 = v1.import(script, script.Parent).pirateScene;
return function(p1)
	l__default__1.SetLogger(l__Logger__2:configure():WriteTo(l__default__1.RobloxOutput()):Create());
	task.spawn(function()
		l__RunService__3:Run();
	end);
	local v4 = DateTime.fromUnixTimestamp(DateTime.now().UnixTimestamp + 2);
	local v5 = l__SceneManager__4.new();
	l__pirateBuildupScene__5:overrideTimeConfig(l__TimeConfig__6.betweenDates({
		startDate = DateTime.now(), 
		endDate = v4
	}));
	l__pirateScene__7:overrideTimeConfig(l__TimeConfig__6.startDateAndLength({
		startDate = v4, 
		length = 145
	}));
	v5:loadChainedScenes(l__pirateBuildupScene__5, l__pirateScene__7);
	local u8 = v5:begin();
	return function()
		v5:cleanAllState();
		u8:DoCleaning();
		task.spawn(function()
			l__RunService__3:Stop();
		end);
	end;
end;
