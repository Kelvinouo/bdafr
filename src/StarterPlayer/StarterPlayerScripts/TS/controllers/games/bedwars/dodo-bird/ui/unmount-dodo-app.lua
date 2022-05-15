
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.Component:extend("UnmountDodoApp");
local l__Maid__1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).Maid;
function v3.init(p1)
	p1.maid = l__Maid__1.new();
end;
local l__Theme__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__UIUtil__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).UIUtil;
function v3.render(p2)
	local v4 = {
		Size = l__Theme__2.actionBarButtonSize, 
		Position = l__UIUtil__3:getActionBarPosition(), 
		AnchorPoint = Vector2.new(0.5, 1), 
		BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
		BackgroundTransparency = 0.6, 
		BorderSizePixel = 0
	};
	v4[v2.Event.Activated] = function()
		p2.props.unmountCallback();
	end;
	return v2.createElement("ImageButton", v4, { v2.createElement("UIAspectRatioConstraint", {
			AspectRatio = 4.675675675675675
		}), v2.createElement("TextLabel", {
			Size = UDim2.fromScale(0.8, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			Text = "<b>Dismount (" .. p2.props.interactionKey.Name .. ")</b>", 
			Font = "Roboto", 
			RichText = true, 
			TextScaled = true, 
			TextColor3 = Color3.fromRGB(255, 255, 255)
		}) });
end;
local l__UserInputService__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).UserInputService;
function v3.didMount(p3)
	p3.maid:GiveTask(l__UserInputService__4.InputEnded:Connect(function(p4, p5)
		if p4.KeyCode == p3.props.interactionKey and not p5 then
			p3.props.unmountCallback();
		end;
	end));
end;
function v3.willUnmount(p6)
	p6.maid:DoCleaning();
end;
return {
	UnmountDodoApp = v3
};

