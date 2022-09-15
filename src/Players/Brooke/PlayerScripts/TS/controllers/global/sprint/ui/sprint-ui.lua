-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v4 = v2.Component:extend("SprintUI");
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__Players__2 = v3.Players;
function v4.init(p1, p2)
	p1.maid = u1.new();
	local v5 = false;
	if l__Players__2.LocalPlayer then
		v5 = l__Players__2.LocalPlayer:GetAttribute("Sprinting") == true;
	end;
	p1:setState({
		sprinting = v5
	});
end;
function v4.didMount(p3)
	if l__Players__2.LocalPlayer then
		p3.maid:GiveTask(l__Players__2.LocalPlayer:GetAttributeChangedSignal("Sprinting"):Connect(function()
			p3:setState({
				sprinting = l__Players__2.LocalPlayer:GetAttribute("Sprinting") == true
			});
		end));
	end;
end;
function v4.willUnmount(p4)
	p4.maid:DoCleaning();
end;
local l__DeviceUtil__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).DeviceUtil;
local l__BedwarsImageId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__TweenService__5 = v3.TweenService;
function v4.render(p5)
	local v6 = UDim2.fromScale(0.15, 0.15);
	if not l__DeviceUtil__3.isSmallScreen() then
		v6 = UDim2.fromScale(0.11, 0.11);
	end;
	local v7 = {};
	if p5.state.sprinting then
		local v8 = l__BedwarsImageId__4.SPRINT_ON_MOBILE;
	else
		v8 = l__BedwarsImageId__4.SPRINT_OFF_MOBILE;
	end;
	v7.Image = v8;
	v7.Size = v6;
	v7.AnchorPoint = Vector2.new(0.5, 0.5);
	if l__DeviceUtil__3.isSmallScreen() then
		local v9 = UDim2.fromScale(0.95, 0.3);
	else
		v9 = UDim2.fromScale(0.95, 0.42);
	end;
	v7.Position = v9;
	v7.BackgroundTransparency = 1;
	v7.BorderSizePixel = 0;
	v7[v2.Event.MouseButton1Click] = function()
		local l__OnClick__10 = p5.props.OnClick;
		if l__OnClick__10 ~= nil then
			l__OnClick__10();
		end;
	end;
	v7[v2.Event.TouchTap] = function(p6)
		l__TweenService__5:Create(p6, TweenInfo.new(0.06), {
			ImageTransparency = 0.5
		}):Play();
		wait(0.06);
		l__TweenService__5:Create(p6, TweenInfo.new(0.06), {
			ImageTransparency = 0
		}):Play();
	end;
	return v2.createElement("ImageButton", v7, { v2.createElement("UIAspectRatioConstraint", {
			AspectRatio = 1, 
			DominantAxis = "Height"
		}) });
end;
return {
	SprintUI = v4
};
