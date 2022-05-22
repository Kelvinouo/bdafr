-- Script Hash: 5bb85e24699573ef3ef59dfc651166fed9a8d137036ab0ec0782e995d7aa122e3e4a547109a2fda0deefceb271447785
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__DasherProgressBar__2 = v1.import(script, script.Parent, "dasher-progress-bar").DasherProgressBar;
return function(p1)
	local u3 = u1.mount(u1.createElement(l__DasherProgressBar__2, {
		chargeTime = 3
	}), p1, "DasherCharge");
	return function()
		u1.unmount(u3);
	end;
end;
