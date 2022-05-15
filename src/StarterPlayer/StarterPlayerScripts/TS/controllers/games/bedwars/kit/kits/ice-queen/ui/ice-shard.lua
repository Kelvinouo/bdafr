
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.Component:extend("IceShard");
function v3.init(p1)
	p1.imageRef = v2.createRef();
	p1.gradientRef = v2.createRef();
end;
function v3.render(p2)
	local v4 = {};
	local v5 = {
		[v2.Ref] = p2.imageRef, 
		Size = UDim2.new(1, 0, 1, 0), 
		BackgroundTransparency = 1, 
		Image = p2.props.shard.Image, 
		ImageRectSize = p2.props.shard.ImageRectSize, 
		ImageRectOffset = p2.props.shard.ImageRectOffset
	};
	v5.Visible = p2.props.currentBar:map(function(p3)
		return p2.props.barNumber <= p3 - 1;
	end);
	v4[p2.props.barNumber] = v2.createElement("ImageLabel", v5, { v2.createElement("UIGradient", {
			Color = ColorSequence.new(Color3.fromRGB(5, 167, 226), Color3.fromRGB(84, 237, 253)), 
			Offset = Vector2.new(0, 0.1), 
			Rotation = 90
		}) });
	return v2.createFragment(v4);
end;
local l__TweenService__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
function v3.didUpdate(p4)
	if p4.props.currentBar:getValue() >= 4 then
		task.delay(0.2, function()
			local v6 = p4.imageRef:getValue();
			local v7 = p4.gradientRef:getValue();
			if v6 and v7 then
				l__TweenService__1:Create(v6, TweenInfo.new(0.12), {
					ImageTransparency = 1
				}):Play();
				l__TweenService__1:Create(v7, TweenInfo.new(0.12), {
					ImageTransparency = 1
				}):Play();
			end;
		end);
	end;
end;
return {
	IceShard = v3
};

