-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("HotbarPartyButton");
local l__Maid__1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).Maid;
function v4.init(p1)
	p1.bgRef = v3.createRef();
	p1.hoverMaid = l__Maid__1.new();
end;
local l__Theme__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__TweenService__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__SoundManager__4 = v2.SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ColorUtil__6 = v2.ColorUtil;
local l__Empty__7 = v2.Empty;
function v4.render(p2)
	local v5 = {
		Size = UDim2.fromScale(0.3, 0.5), 
		BackgroundColor3 = l__Theme__2.backgroundPrimary, 
		BorderSizePixel = 0, 
		LayoutOrder = p2.props.LayoutOrder
	};
	v5[v3.Event.MouseEnter] = function(p3)
		p2.hoverMaid:DoCleaning();
		local v6 = l__TweenService__3:Create(p2.bgRef:getValue(), TweenInfo.new(0.12), {
			BackgroundTransparency = 0.9
		});
		v6:Play();
		p2.hoverMaid:GiveTask(function()
			v6:Cancel();
		end);
	end;
	v5[v3.Event.MouseLeave] = function(p4)
		p2.hoverMaid:DoCleaning();
		local v7 = l__TweenService__3:Create(p2.bgRef:getValue(), TweenInfo.new(0.12), {
			BackgroundTransparency = 1
		});
		v7:Play();
		p2.hoverMaid:GiveTask(function()
			v7:Cancel();
		end);
	end;
	v5[v3.Event.MouseButton1Click] = function()
		l__SoundManager__4:playSound(l__GameSound__5.UI_OPEN);
		p2.props.OnClick();
	end;
	v5.AutoButtonColor = false;
	return v3.createElement("ImageButton", v5, { v3.createElement("UIAspectRatioConstraint", {
			AspectRatio = 4.469387755102041
		}), v3.createElement("UICorner", {
			CornerRadius = UDim.new(0.1, 0)
		}), v3.createElement("Frame", {
			[v3.Ref] = p2.bgRef, 
			Size = UDim2.fromScale(1, 1), 
			BackgroundColor3 = l__ColorUtil__6.WHITE, 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0
		}, { v3.createElement("UICorner", {
				CornerRadius = UDim.new(0.05, 0)
			}) }), v3.createElement(l__Empty__7, {
			Size = UDim2.fromScale(1, 1)
		}, { v3.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				VerticalAlignment = "Center"
			}), v3.createElement(l__Empty__7, {
				Size = UDim2.fromScale(0.5, 0), 
				SizeConstraint = "RelativeYY"
			}), v3.createElement("ImageLabel", {
				Size = UDim2.fromScale(0.6, 0.6), 
				SizeConstraint = "RelativeYY", 
				Image = p2.props.Image, 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0
			}), v3.createElement("TextLabel", {
				Text = p2.props.Text, 
				Size = UDim2.fromScale(3.1693877551020404, 0.55), 
				SizeConstraint = "RelativeYY", 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				Font = "Roboto", 
				TextColor3 = l__ColorUtil__6.WHITE, 
				RichText = true, 
				TextScaled = true
			}), v3.createElement(l__Empty__7, {
				Size = UDim2.fromScale(0.2, 0), 
				SizeConstraint = "RelativeYY"
			}) }) });
end;
function v4.willUnmount(p5)
	p5.hoverMaid:DoCleaning();
end;
return {
	HotbarPartyButton = v4
};
