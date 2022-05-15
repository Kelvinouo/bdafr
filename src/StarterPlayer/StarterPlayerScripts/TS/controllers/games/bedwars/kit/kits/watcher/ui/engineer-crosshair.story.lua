
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__EngineerCrosshair__2 = v1.import(script, script.Parent, "engineer-crosshair").EngineerCrosshair;
return function(p1)
	local u3 = u1.mount(u1.createElement(l__EngineerCrosshair__2), p1, "EngineerCrosshair");
	return function()
		return u1.unmount(u3);
	end;
end;

