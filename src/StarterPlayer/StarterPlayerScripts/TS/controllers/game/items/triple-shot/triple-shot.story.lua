
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__TripleShotProgressBar__2 = v1.import(script, script.Parent, "triple-shot-progress-bar").TripleShotProgressBar;
return function(p1)
	local u3 = u1.mount(u1.createElement(l__TripleShotProgressBar__2, {
		chargeTime = 3, 
		title = "Triple Shot"
	}), p1, "ChargeTripleShot");
	return function()
		u1.unmount(u3);
	end;
end;

