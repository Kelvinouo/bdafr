-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__useSpring__1 = v1.import(script, v1.getModule(script, "@rbxts", "roact-spring").src).useSpring;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return {
	EnemyHealthbar = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local u3 = p2.useMemo(function()
			return p1.health / p1.maxHealth;
		end, { p1.health, p1.maxHealth });
		local v2 = p2.useMemo(function()
			return 1 / u3;
		end, { u3 });
		local v3 = l__useSpring__1(p2, {
			config = {
				tension = 440, 
				friction = 26, 
				mass = 0.6
			}, 
			to = {
				size1 = UDim2.fromScale(u3, 1), 
				size2 = UDim2.fromScale(v2, 1)
			}
		}, { u3, v2 });
		return u2.createElement("Frame", {
			Size = UDim2.fromScale(1, 1), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			BackgroundTransparency = 0.7, 
			BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		}, { u2.createElement("UIAspectRatioConstraint", {
				AspectRatio = 7.138613861386139
			}), u2.createElement("UIStroke", {
				Thickness = 4, 
				Color = Color3.fromRGB(255, 255, 255)
			}), u2.createElement("UICorner", {
				CornerRadius = UDim.new(1, 0)
			}), u2.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(150, 150)
			}), u2.createElement("Frame", {
				ClipsDescendants = true, 
				Size = v3.size1, 
				AnchorPoint = Vector2.new(0, 0.5), 
				Position = UDim2.fromScale(0, 0.5), 
				BackgroundTransparency = 1
			}, { u2.createElement("Frame", {
					AnchorPoint = Vector2.new(0, 0.5), 
					Size = v3.size2, 
					Position = UDim2.fromScale(0, 0.5), 
					BackgroundColor3 = Color3.fromRGB(238, 114, 0)
				}, { u2.createElement("UICorner", {
						CornerRadius = UDim.new(1, 0)
					}) }) }), u2.createElement("TextLabel", {
				Size = UDim2.fromScale(0.8, 0.8), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromScale(0.5, 0.5), 
				TextScaled = true, 
				RichText = true, 
				Text = "<b>" .. tostring(p1.health) .. "/" .. tostring(p1.maxHealth) .. "</b>", 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				BackgroundTransparency = 1, 
				Font = "RobotoCondensed", 
				ZIndex = 2
			}) });
	end)
};
