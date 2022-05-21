-- Script Hash: 67f0d9c36ab47a8b4e27d99f08af1f1c027008cbe98459e5683d3ef0770e51db390e1508619d7fe8db3dc5c15dad9a32
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
