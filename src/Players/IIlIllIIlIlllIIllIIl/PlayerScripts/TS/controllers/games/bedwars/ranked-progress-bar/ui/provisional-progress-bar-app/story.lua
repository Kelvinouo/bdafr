-- Script Hash: c8aa2a4356d2ccda6ccb9af964d67c2442defd785ab358593411f0c1b6bd318c320ed52fe406139259a585c1c9baf3c3
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CreateRoduxApp__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local u2 = v1.import(script, script.Parent, "provisional-progress-bar-core").ProvisionalProgressBarCore;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	local u4 = l__CreateRoduxApp__1("ProvisionalProgressBarAppWrapper", u2, {
		RankedMatchesPlayed = 3
	}, {}, {
		Parent = p1
	});
	return function()
		u3.unmount(u4);
	end;
end;
