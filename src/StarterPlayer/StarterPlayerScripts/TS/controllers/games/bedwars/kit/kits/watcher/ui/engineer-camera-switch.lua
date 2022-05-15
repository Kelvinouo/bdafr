
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v4 = v2.Component:extend("EngineerCameraSwitch");
local l__Maid__1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).Maid;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "flipper").src);
local l__SoundManager__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v4.init(p1, p2)
	p1.maid = l__Maid__1.new();
	p1.sizeMotor = u2.GroupMotor.new({
		x = 65, 
		y = 50
	});
	local v5, v6 = v2.createBinding({
		x = 65, 
		y = 50
	});
	p1.size = v5;
	p1.setSize = v6;
	p1.sizeMotor:onStep(p1.setSize);
	function p1.activatedFunc()
		p1.props.clicked();
		p1.sizeMotor:setGoal({
			x = u2.Spring.new(85, {
				frequency = 4, 
				dampingRatio = 1
			}), 
			y = u2.Spring.new(70, {
				frequency = 4, 
				dampingRatio = 1
			})
		});
		l__SoundManager__3:playSound(l__GameSound__4.UI_CLICK);
		task.delay(0.1, function()
			p1.sizeMotor:setGoal({
				x = u2.Spring.new(65, {
					frequency = 4, 
					dampingRatio = 1
				}), 
				y = u2.Spring.new(50, {
					frequency = 4, 
					dampingRatio = 1
				})
			});
		end);
	end;
end;
local l__Theme__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
function v4.render(p3)
	local v7 = {
		AnchorPoint = p3.props.anchorPoint, 
		Position = p3.props.position, 
		Size = p3.size:map(function(p4)
			return UDim2.fromOffset(p4.x, p4.y);
		end), 
		BorderSizePixel = 0, 
		BackgroundColor3 = l__Theme__5.backgroundPrimary
	};
	local v8 = { v2.createElement("UICorner", {
			CornerRadius = UDim.new(0, 8)
		}) };
	local v9 = #v8;
	v8[v9 + 1] = v2.createElement("ImageButton", {
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5) + p3.props.iconShift, 
		Size = UDim2.fromScale(0.6, 0.6), 
		BackgroundTransparency = 1, 
		Image = p3.props.imageId, 
		ImageColor3 = Color3.fromRGB(255, 255, 255), 
		ScaleType = "Fit", 
		[v2.Event.MouseButton1Click] = p3.activatedFunc
	});
	v8[v9 + 2] = v2.createElement("TextLabel", {
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Size = UDim2.new(0.4, 0, 0.4, 0), 
		Position = UDim2.fromScale(0.5, 0.5) + p3.props.textShift, 
		BackgroundTransparency = 1, 
		Text = "(" .. p3.props.inputDisplay .. ")", 
		TextScaled = true, 
		Font = "SourceSansBold", 
		TextColor3 = l__Theme__5.textPrimary
	});
	return v2.createElement("Frame", v7, v8);
end;
local l__HttpService__6 = v3.HttpService;
local l__ContextActionService__7 = v3.ContextActionService;
function v4.didMount(p5)
	local v10 = l__HttpService__6:GenerateGUID(false);
	l__ContextActionService__7:BindAction("switch-camera-" .. v10, function(p6, p7, p8)
		if p7 == Enum.UserInputState.End then
			p5.activatedFunc();
		end;
	end, false, unpack(p5.props.inputTypes));
	p5.maid:GiveTask(function()
		l__ContextActionService__7:UnbindAction("switch-camera-" .. v10);
	end);
end;
function v4.willUnmount(p9)
	p9.maid:DoCleaning();
end;
return {
	EngineerCameraSwitch = v4
};

