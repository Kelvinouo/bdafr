-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__useSpring__1 = v1.import(script, v1.getModule(script, "@rbxts", "roact-flipper").src).useSpring;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "flipper").src);
local l__GetTarmacAsset__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers").GetTarmacAsset;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return {
	Indicator = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u4)(function(p1, p2)
		local v2 = p2.useValue(4);
		local v3, v4 = l__useSpring__1(p2, 1);
		p2.useEffect(function()
			v4:onComplete(function()
				if v4:getValue() == 0 then
					v4:setGoal(u2.Spring.new(1, {
						frequency = v2.value, 
						dampingRatio = 0.75
					}));
				end;
			end);
			local u5 = p1.activatedSignal:Connect(function(p3)
				v2.value = p3;
				v4:setGoal(u2.Spring.new(0, {
					frequency = p3, 
					dampingRatio = 0.75
				}));
			end);
			return function()
				u5:Disconnect();
			end;
		end);
		local v5 = l__GetTarmacAsset__3("Indicator");
		return u4.createElement("ImageLabel", {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Size = UDim2.fromScale(0.05, 0.05), 
			BackgroundTransparency = 1, 
			Position = p1.position, 
			Rotation = p1.rotation:map(function(p4)
				return p4 + 90;
			end), 
			ImageTransparency = v3, 
			Image = v5.Image, 
			ImageColor3 = Color3.fromRGB(255, 255, 255), 
			ImageRectOffset = v5.ImageRectOffset, 
			ImageRectSize = v5.ImageRectSize
		}, { u4.createElement("UIAspectRatioConstraint", {
				AspectRatio = 1
			}) });
	end)
};
