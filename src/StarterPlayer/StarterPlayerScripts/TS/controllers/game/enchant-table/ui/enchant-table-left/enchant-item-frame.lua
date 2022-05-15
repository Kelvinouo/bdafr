
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__EnchantElementMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-meta").EnchantElementMeta;
local l__Theme__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
return {
	EnchantItemFrame = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
		local v2, v3 = p2.useState(false);
		local v4 = l__EnchantElementMeta__1[p1.Enchant];
		local v5 = {
			Size = UDim2.fromScale(1, 1), 
			BackgroundColor3 = l__Theme__2.backgroundPrimary, 
			BorderSizePixel = 0
		};
		v5[u3.Event.MouseEnter] = function()
			v3(true);
		end;
		v5[u3.Event.MouseLeave] = function()
			v3(false);
		end;
		local v6 = { u3.createElement("UIStroke", {
				Color = l__ColorUtil__4.brighten(l__Theme__2.backgroundPrimary, 0.3), 
				Thickness = 2
			}), u3.createElement("UICorner", {
				CornerRadius = UDim.new(0, 6)
			}), u3.createElement("UIAspectRatioConstraint", {
				AspectRatio = 1
			}), v4 and u3.createElement("ImageLabel", {
				Size = UDim2.fromScale(0.8, 0.8), 
				Position = UDim2.fromScale(0.5, 0.5), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				ScaleType = "Fit", 
				Image = v4.image, 
				BackgroundTransparency = 1
			}) };
		local v7 = v2 and u3.createElement("Frame", {
			Size = UDim2.new(1.4, 0, 0.3, 0), 
			AnchorPoint = Vector2.new(0.5, 0), 
			Position = UDim2.new(0.5, 0, 1.15, 0), 
			BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
			BackgroundTransparency = 0.4, 
			ZIndex = 100
		}, { u3.createElement("TextLabel", {
				Size = UDim2.new(0.8, 0, 0.8, 0), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.new(0.5, 0, 0.5, 0), 
				TextXAlignment = "Center", 
				TextYAlignment = "Top", 
				TextSize = 12, 
				BorderSizePixel = 0, 
				Font = "SourceSansBold", 
				Text = v4.name, 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				BackgroundTransparency = 1, 
				ZIndex = 100
			}) });
		if v7 then
			v6[#v6 + 1] = v7;
		end;
		return u3.createElement("Frame", v5, v6);
	end)
};

