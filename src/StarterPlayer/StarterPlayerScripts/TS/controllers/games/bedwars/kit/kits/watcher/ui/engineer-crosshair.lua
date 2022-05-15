
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.Component:extend("EngineerCrosshair");
function v3.init(p1)

end;
local l__BedwarsImageId__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
function v3.render(p2)
	return v2.createElement("ImageLabel", {
		BackgroundTransparency = 1, 
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5), 
		Size = UDim2.fromScale(0.08, 0.08), 
		Image = l__BedwarsImageId__1.TURRET_CROSSHAIR
	}, { v2.createElement("UIAspectRatioConstraint") });
end;
return {
	EngineerCrosshairWrapper = function()
		return v2.createElement("ScreenGui", {
			ResetOnSpawn = false, 
			IgnoreGuiInset = true
		}, { v2.createElement(v3) });
	end, 
	EngineerCrosshair = v3
};

