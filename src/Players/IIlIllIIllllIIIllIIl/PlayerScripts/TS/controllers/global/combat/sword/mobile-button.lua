-- Script Hash: 44c6bd36433239a22ff2487f41d83165516b0ad09928b5e35c016e2003cfc88b75e14dd1957df4f25a444734463f60e8
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.Component:extend("MobileButton");
function v3.init(p1)

end;
local l__UIUtil__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).UIUtil;
local l__TweenService__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
function v3.render(p2)
	local v4 = {
		Image = "rbxassetid://6862310392", 
		Size = UDim2.fromScale(0.15, 0.15), 
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = l__UIUtil__1:getActionMobileButtonPosition(), 
		BackgroundTransparency = 1, 
		BorderSizePixel = 0
	};
	v4[v2.Event.MouseButton1Click] = function()
		local l__OnClick__5 = p2.props.OnClick;
		if l__OnClick__5 ~= nil then
			l__OnClick__5();
		end;
	end;
	v4[v2.Event.TouchTap] = function(p3)
		l__TweenService__2:Create(p3, TweenInfo.new(0.06), {
			ImageTransparency = 0.5
		}):Play();
		wait(0.06);
		l__TweenService__2:Create(p3, TweenInfo.new(0.06), {
			ImageTransparency = 0
		}):Play();
	end;
	return v2.createElement("ImageButton", v4, { v2.createElement("UIAspectRatioConstraint", {
			AspectRatio = 1, 
			DominantAxis = "Height"
		}) });
end;
return nil;
