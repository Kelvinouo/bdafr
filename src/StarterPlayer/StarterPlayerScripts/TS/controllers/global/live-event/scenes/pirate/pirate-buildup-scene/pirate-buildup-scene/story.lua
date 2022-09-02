-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "log").out);
local l__default__1 = v2.default;
local l__Logger__2 = v2.Logger;
local l__SceneManager__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "live-event-system").SceneManager;
local l__pirateBuildupScene__4 = v1.import(script, script.Parent).pirateBuildupScene;
return function(p1)
	l__default__1.SetLogger(l__Logger__2:configure():WriteTo(l__default__1.RobloxOutput()):Create());
	local v3 = l__SceneManager__3.new();
	v3:loadScene(l__pirateBuildupScene__4);
	local u5 = v3:begin();
	return function()
		v3:cleanAllState();
		u5:DoCleaning();
	end;
end;
