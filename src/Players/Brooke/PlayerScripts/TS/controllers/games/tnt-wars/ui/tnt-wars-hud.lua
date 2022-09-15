-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.Component:extend("TNTWarsHud");
function v3.init(p1)
	p1.hudRef = v2.createRef();
end;
local u1 = UDim2.fromScale(0.1, -2);
local l__TNTWarsHpBar__2 = v1.import(script, script.Parent, "tnt-wars-hp-bar").TNTWarsHpBar;
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__TNTWarsLogo__4 = v1.import(script, script.Parent, "tnt-wars-logo").TNTWarsLogo;
local l__TNTWarsBlockCounter__5 = v1.import(script, script.Parent, "tnt-wars-block-counter").TNTWarsBlockCounter;
function v3.render(p2)
	return v2.createFragment({
		TNTWarsHud = v2.createElement("ScreenGui", {
			ResetOnSpawn = false
		}, {
			HudContainer = v2.createElement("Frame", {
				[v2.Ref] = p2.hudRef, 
				Size = UDim2.fromScale(0.65, 0.4), 
				Position = u1, 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0
			}, { v2.createElement("UIPadding", {
					PaddingLeft = UDim.new(0.1, 0), 
					PaddingRight = UDim.new(0.1, 0)
				}), v2.createElement(l__TNTWarsHpBar__2, {
					cores = p2.props.friendlyCores, 
					containerPosition = UDim2.fromScale(0.2, 0.2), 
					barAnchorPoint = Vector2.new(0, 0), 
					barColor = l__Theme__3.mcGreen, 
					teamLabel = "FRIENDLY", 
					teamLabelPos = UDim2.fromScale(0.4, -0.085)
				}), v2.createElement(l__TNTWarsLogo__4), v2.createElement(l__TNTWarsBlockCounter__5), v2.createElement(l__TNTWarsHpBar__2, {
					cores = p2.props.enemyCores, 
					containerPosition = UDim2.fromScale(0.8, 0.2), 
					barAnchorPoint = Vector2.new(1, 0), 
					barColor = l__Theme__3.mcRed, 
					teamLabel = "ENEMY", 
					teamLabelPos = UDim2.fromScale(0.075, -0.085)
				}) })
		})
	});
end;
local l__TweenService__6 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local u7 = TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut);
local u8 = UDim2.fromScale(0.175, 0.2);
function v3.didMount(p3)
	local v4 = p3.hudRef:getValue();
	if not v4 then
		return nil;
	end;
	l__TweenService__6:Create(v4, u7, {
		Position = u8
	}):Play();
end;
return {
	TNTWarsHud = v3
};
