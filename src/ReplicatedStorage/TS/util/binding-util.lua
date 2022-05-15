
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return {
	BindingFromMotor = function(p1)
		local v2, v3 = u1.createBinding(p1:getValue());
		p1:onStep(v3);
		return v2;
	end
};

