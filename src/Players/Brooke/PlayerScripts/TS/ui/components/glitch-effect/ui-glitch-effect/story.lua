-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__UIGlitchEffect__2 = v1.import(script, script.Parent, "ui-glitch-effect").UIGlitchEffect;
return function(p1)
	local u3 = u1.mount(u1.createElement("ScreenGui", {}, { u1.createElement(l__UIGlitchEffect__2, {}, {
			DomWAsHere = u1.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				HorizontalAlignment = "Center", 
				VerticalAlignment = "Center"
			}),
			u1.createElement("ImageLabel", {
				Size = UDim2.fromScale(0.3, 0.3), 
				Image = "rbxassetid://10086864148", 
				BackgroundTransparency = 1
			}), u1.createElement("TextLabel", {
				Size = UDim2.fromScale(0.3, 0.3), 
				Text = "BYE", 
				TextScaled = true, 
				BackgroundTransparency = 1
			})
		}) }), p1);
	return function()
		return u1.unmount(u3);
	end;
end;
