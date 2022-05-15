
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__TweenService__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__ColorUtil__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
return {
	TripleShotProgressBar = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local u4 = u1.createRef();
		local u5 = u1.createRef();
		p2.useEffect(function()
			l__TweenService__2:Create(u4:getValue(), TweenInfo.new(0.12), {
				Size = UDim2.fromScale(0.18, 0.1)
			}):Play();
			l__TweenService__2:Create(u5:getValue(), TweenInfo.new(p1.chargeTime, Enum.EasingStyle.Linear), {
				Size = UDim2.fromScale(1, 1)
			}):Play();
		end, {});
		return u1.createFragment({ u1.createElement("Frame", {
				[u1.Ref] = u4, 
				Size = UDim2.fromScale(0, 0), 
				AnchorPoint = Vector2.new(0.5, 1), 
				Position = UDim2.fromScale(0.5, 0.7), 
				BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
				BackgroundTransparency = 0.7, 
				BorderSizePixel = 0
			}, { u1.createElement("UIAspectRatioConstraint", {
					AspectRatio = 10.95890410958904, 
					DominantAxis = "Height"
				}), u1.createElement("Frame", {
					[u1.Ref] = u5, 
					Size = UDim2.fromScale(0, 1), 
					BorderSizePixel = 0
				}, { u1.createElement("UIGradient", {
						Color = ColorSequence.new(Color3.fromRGB(112, 219, 255), l__ColorUtil__3.darken(Color3.fromRGB(112, 219, 255), 0.93)), 
						Rotation = 90
					}) }) }), u1.createElement("TextLabel", {
				Text = p1.title, 
				Size = UDim2.fromScale(0.13, 0.07), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				Font = "LuckiestGuy", 
				Position = UDim2.fromScale(0.5, 0.71), 
				AnchorPoint = Vector2.new(0.5, 0), 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				TextScaled = true
			}) });
	end)
};

