-- Script Hash: dd9bdb8c52e1b4e86f1a031a77386f7bcdcb10cef024043f489efd7b0806311412df7295f0b8bcec4c05b455b7932038
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.Component:extend("EngineerCameraExit");
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "flipper").src);
local l__SoundManager__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v3.init(p1, p2)
	p1.maid = u1.new();
	p1.sizeMotor = u2.GroupMotor.new({
		x = 120, 
		y = 50
	});
	local v4, v5 = v2.createBinding({
		x = 120, 
		y = 50
	});
	p1.size = v4;
	p1.setSize = v5;
	p1.sizeMotor:onStep(p1.setSize);
	function p1.activatedFunc()
		p1.props.activated();
		p1.sizeMotor:setGoal({
			x = u2.Spring.new(140, {
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
				x = u2.Spring.new(120, {
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
function v3.render(p3)
	return v2.createElement("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5), 
		Size = p3.size:map(function(p4)
			return UDim2.fromOffset(p4.x, p4.y);
		end), 
		BorderSizePixel = 0, 
		BackgroundColor3 = l__Theme__5.backgroundPrimary
	}, { v2.createElement("UICorner", {
			CornerRadius = UDim.new(0, 8)
		}), v2.createElement("TextButton", {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Size = UDim2.new(1, 0, 0.4, 0), 
			Position = UDim2.fromScale(0.5, 0.5), 
			BackgroundTransparency = 1, 
			Text = "<font color=\"rgb(255, 255, 255)\">Exit</font> (" .. p3.props.inputDisplay .. ")", 
			RichText = true, 
			TextScaled = true, 
			Font = "SourceSansBold", 
			TextColor3 = l__Theme__5.textPrimary, 
			[v2.Event.MouseButton1Click] = p3.activatedFunc
		}) });
end;
local l__ContextActionService__6 = v1.import(script, v1.getModule(script, "@rbxts", "services")).ContextActionService;
function v3.didMount(p5)
	l__ContextActionService__6:BindAction("engineer-camera-exit", function(p6, p7, p8)
		if p7 == Enum.UserInputState.End then
			p5.activatedFunc();
		end;
	end, false, unpack(p5.props.inputTypes));
	p5.maid:GiveTask(function()
		l__ContextActionService__6:UnbindAction("engineer-camera-exit");
	end);
end;
function v3.willUnmount(p9)
	p9.maid:DoCleaning();
end;
return {
	EngineerCameraExit = v3
};
