-- Script Hash: 46efc5261061f9a2cdfc79807faeedfe10319078bb350440e663ad83a6fce011764e413003a772f0cd04088230bb71ee
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
