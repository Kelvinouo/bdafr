-- Script Hash: 35a4ff0d845213ba8a77e837fe4c9b68960671206e8d28f5697a68b8290c0356f8262e3c977688106ced5ccfaef147a1
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ProgressBar__2 = v2.ProgressBar;
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ColorUtil__4 = v2.ColorUtil;
return {
	EmberProgressBar = function(p1)
		local v3 = p1.store.Kit.emberProgress;
		if v3 == nil then
			v3 = 0.01;
		end;
		local v4 = math.min(1, (math.max(0.01, v3)));
		print("Updating Ember progress Bar");
		return u1.createElement(l__ProgressBar__2, {
			Size = l__Theme__3.actionBarProgressBarSize, 
			Progress = v4, 
			BarGradient = ColorSequence.new(l__ColorUtil__4.hexColor(14363435), l__ColorUtil__4.hexColor(14573407))
		});
	end
};
