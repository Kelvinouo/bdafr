-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CreateRoduxApp__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__TargetMarker__2 = v1.import(script, script.Parent, "target-marker").TargetMarker;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	local u5 = l__CreateRoduxApp__1("TargetMarker", l__TargetMarker__2, {
		player = l__Players__3.LocalPlayer or {
			UserId = 87365146
		}
	}, {}, {
		Parent = p1
	});
	return function()
		return u4.unmount(u5);
	end;
end;
