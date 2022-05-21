-- Script Hash: 6246c5774d48617b150268f6c3c09a0fe06594c65b293b77366f2e754352d64a7034c07b30e83cc908b792642f474328
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__FlamethrowerComponent__2 = v1.import(script, script.Parent, "flamethrower-component").FlamethrowerComponent;
return function(p1)
	local u3 = u1.mount(u1.createElement("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5), 
		Size = UDim2.fromScale(0.8, 0.8), 
		BackgroundTransparency = 1
	}, { u1.createElement("UIAspectRatioConstraint", {
			AspectRatio = 1.7735849056603774
		}), u1.createElement(l__FlamethrowerComponent__2, {
			tool = nil
		}) }), p1);
	return function()
		return u1.unmount(u3);
	end;
end;
