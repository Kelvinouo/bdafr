-- Script Hash: cadd7fd75852e28e40d3198dd307873568270f140673d4e43247b9e1b1c74d9fce9ed2a38cb039a98d3d5d1c31c35a87
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
return {
	IngredientBox = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local v3 = { u1.createElement("UIAspectRatioConstraint", {
				AspectRatio = 1
			}), u1.createElement("UIStroke", {
				Color = l__ColorUtil__2.WHITE, 
				Thickness = 2
			}), u1.createElement("UICorner", {
				CornerRadius = UDim.new(0.1, 0)
			}) };
		local v4 = false;
		if p1.Image ~= nil then
			v4 = u1.createElement("ImageLabel", {
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromScale(0.5, 0.5), 
				Image = p1.Image, 
				Size = UDim2.fromScale(0.8, 0.8), 
				BackgroundTransparency = 1
			});
		end;
		if v4 then
			v3[#v3 + 1] = v4;
		end;
		local v5 = false;
		if p1.Amount ~= nil then
			v5 = u1.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0.2), 
				SizeConstraint = "RelativeYY", 
				AnchorPoint = Vector2.new(1, 1), 
				Position = UDim2.fromScale(0.9, 0.95), 
				Text = "<b>" .. tostring(p1.Amount) .. "</b>", 
				TextColor3 = l__ColorUtil__2.WHITE, 
				TextXAlignment = "Right", 
				TextScaled = true, 
				RichText = true, 
				BackgroundTransparency = 1
			});
		end;
		if v5 then
			v3[#v3 + 1] = v5;
		end;
		return u1.createFragment({
			IngredientBox = u1.createElement("Frame", {
				Size = UDim2.fromScale(0.3, 1), 
				BackgroundTransparency = 1
			}, v3)
		});
	end)
};
