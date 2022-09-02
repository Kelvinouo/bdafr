-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local u2 = v1.import(script, script.Parent, "star-collector-notification").StarCollectorNotification;
return function(p1)
	local u3 = u1.mount(u1.createElement(u2, {
		text = "crit +1", 
		textColor3 = Color3.fromRGB(253, 166, 91)
	}), p1);
	return function()
		u1.unmount(u3);
	end;
end;
