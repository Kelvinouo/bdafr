-- Script Hash: bf3bfd1c1b412707529acac3c8d60275f6975f042c6d51948628874f693e1440c54d173a7bc296c078945f9df78f9c43
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CreateRoduxApp__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__EngineerCameraView__2 = v1.import(script, script.Parent, "engineer-camera-view").EngineerCameraView;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	local u4 = l__CreateRoduxApp__1("EngineerCameraView", l__EngineerCameraView__2, {}, {}, {
		Parent = p1
	});
	return function()
		return u3.unmount(u4);
	end;
end;
