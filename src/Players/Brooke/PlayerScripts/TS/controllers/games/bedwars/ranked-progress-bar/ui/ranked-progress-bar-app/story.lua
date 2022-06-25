-- Script Hash: 78596ec1e576708d1bc1eea72d318e67b62c505d9017c2f78a90828f54fac6aa6a222dd5f8fe37fcd84880a76c59345b
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__RankDivision__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-division").RankDivision;
local l__CreateRoduxApp__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__RankedProgressBarCore__3 = v1.import(script, script.Parent, "ranked-progress-bar-core").RankedProgressBarCore;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	local u5 = l__CreateRoduxApp__2("RankedProgressBarApp", l__RankedProgressBarCore__3, {
		RankChangeData = {
			oldDivision = {
				division = l__RankDivision__1.DIAMOND_3, 
				rankPoints = 80
			}, 
			newDivision = {
				division = l__RankDivision__1.DIAMOND_4, 
				rankPoints = 10
			}, 
			rpDelta = 110, 
			rankVisible = true, 
			matchesPlayed = 10
		}
	}, {}, {
		Parent = p1
	});
	return function()
		u4.unmount(u5);
	end;
end;
