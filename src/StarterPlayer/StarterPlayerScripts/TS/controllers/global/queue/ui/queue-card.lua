-- Script Hash: 36d690c94275910554319194d2d21f5de23d5e66ad19c5fbcdb54d1a8596577a0ca20f47ccaf1aae8ac92ec1db9cff42
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("QueueCard");
local l__Maid__1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).Maid;
function v4.init(p1, p2)
	p1.wrapperRef = v3.createRef();
	p1.alive = true;
	p1.leaveButtonHoverMaid = l__Maid__1.new();
	p1.matchFoundTime = -1;
	p1.timeStarted = tick();
	p1:setState({
		timer = p1:getTimer()
	});
end;
local l__QueueState__2 = v1.import(script, v1.getModule(script, "@easy-games", "lobby").out).QueueState;
local l__StringUtil__3 = v2.StringUtil;
function v4.getTimer(p3)
	if p3.props.QueueState == l__QueueState__2.MATCH_FOUND then
		local v5 = p3.matchFoundTime - p3.timeStarted;
	else
		v5 = math.max(tick() - p3.timeStarted, 0);
	end;
	return l__StringUtil__3.formatCountdownTime(v5);
end;
local l__TweenService__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__DeviceUtil__5 = v2.DeviceUtil;
local l__SoundManager__6 = v2.SoundManager;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v4.didMount(p4)
	p4.timeStarted = tick();
	local v6 = {};
	if l__DeviceUtil__5.isSmallScreen() then
		local v7 = 0.09;
	else
		v7 = 0.065;
	end;
	v6.Size = UDim2.new(0.4, 0, v7, 0);
	l__TweenService__4:Create(p4.wrapperRef:getValue(), TweenInfo.new(0.12), v6):Play();
	v1.Promise.defer(function()
		while { wait(0.5) } and p4.alive do
			p4:setState({
				timer = p4:getTimer()
			});		
		end;
	end);
	l__SoundManager__6:playSound(l__GameSound__7.QUEUE_JOIN);
end;
local l__Theme__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ColorUtil__9 = v2.ColorUtil;
function v4.willUpdate(p5, p6)
	if p6.QueueState == l__QueueState__2.MATCH_FOUND and p5.props.QueueState ~= l__QueueState__2.MATCH_FOUND then
		p5.matchFoundTime = tick();
		local v8 = {
			BackgroundColor3 = l__Theme__8.backgroundSuccess
		};
		if l__DeviceUtil__5.isSmallScreen() then
			local v9 = 0.12;
		else
			v9 = 0.08;
		end;
		v8.Size = UDim2.fromScale(0.4, v9);
		l__TweenService__4:Create(p5.wrapperRef:getValue(), TweenInfo.new(0.2), v8):Play();
		return;
	end;
	if p5.props.QueueState == l__QueueState__2.MATCH_FOUND and p6.QueueState ~= l__QueueState__2.MATCH_FOUND then
		local v10 = {
			BackgroundColor3 = l__ColorUtil__9.hexColor(6580135)
		};
		if l__DeviceUtil__5.isSmallScreen() then
			local v11 = 0.09;
		else
			v11 = 0.065;
		end;
		v10.Size = UDim2.fromScale(0.4, v11);
		l__TweenService__4:Create(p5.wrapperRef:getValue(), TweenInfo.new(0.2), v10):Play();
	end;
end;
function v4.willUnmount(p7)
	p7.leaveButtonHoverMaid:DoCleaning();
	p7.alive = false;
end;
local l__ImageId__10 = v2.ImageId;
local l__Flamework__11 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
function v4.render(p8)
	local v12 = {
		[v3.Ref] = p8.wrapperRef, 
		Size = UDim2.fromScale(0.4, 0), 
		Position = UDim2.fromScale(0.5, 0.01), 
		AnchorPoint = Vector2.new(0.5, 0), 
		BackgroundColor3 = l__ColorUtil__9.hexColor(6580135), 
		BorderSizePixel = 0
	};
	local v13 = { v3.createElement("UICorner", {
			CornerRadius = UDim.new(0, 5)
		}), v3.createElement("UIAspectRatioConstraint", {
			AspectRatio = 7.372093023255814, 
			DominantAxis = "Height"
		}), v3.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Center"
		}), v3.createElement("Frame", {
			Size = UDim2.fromScale(0.3, 0), 
			SizeConstraint = "RelativeYY", 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0
		}), v3.createElement("ImageLabel", {
			Size = UDim2.fromScale(0.7, 0.7), 
			SizeConstraint = "RelativeYY", 
			BorderSizePixel = 0, 
			BackgroundTransparency = 1, 
			Image = l__ImageId__10.SATELITE
		}) };
	local v14 = #v13;
	local v15 = { v3.createElement("UIPadding", {
			PaddingLeft = UDim.new(0.06, 0), 
			PaddingTop = UDim.new(0.08, 0), 
			PaddingBottom = UDim.new(0.08, 0)
		}), v3.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			VerticalAlignment = "Center"
		}) };
	local v16 = false;
	if p8.props.QueueState == l__QueueState__2.MATCH_FOUND then
		v16 = v3.createElement("TextLabel", {
			Text = "Teleporting to match", 
			TextColor3 = Color3.fromRGB(255, 255, 255), 
			Font = "Roboto", 
			RichText = true, 
			TextScaled = true, 
			Size = UDim2.fromScale(1, 0.6), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			TextXAlignment = "Left"
		});
	end;
	if v16 then
		v15[#v15 + 1] = v16;
	end;
	local v17 = true;
	if p8.props.QueueState ~= l__QueueState__2.JOINING_QUEUE then
		v17 = false;
		if p8.props.QueueState == l__QueueState__2.IN_QUEUE then
			v17 = v3.createElement("TextLabel", {
				Text = "Searching for match", 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				Font = "Roboto", 
				RichText = true, 
				TextScaled = true, 
				Size = UDim2.fromScale(1, 0.6), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				TextXAlignment = "Left"
			});
		end;
	end;
	if type(v17) == "table" then
		v15[#v15 + 1] = v17;
	end;
	v15[#v15 + 1] = v3.createElement("TextLabel", {
		Text = "<b>" .. l__Flamework__11.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(p8.props.QueueData.queueType).title .. "</b>", 
		TextColor3 = Color3.fromRGB(255, 255, 255), 
		Font = "Roboto", 
		RichText = true, 
		TextScaled = true, 
		Size = UDim2.fromScale(1, 0.4), 
		BackgroundTransparency = 1, 
		BorderSizePixel = 0, 
		TextXAlignment = "Left"
	});
	v13[v14 + 1] = v3.createElement("Frame", {
		Size = UDim2.fromScale(4.172093023255814, 0.8), 
		SizeConstraint = "RelativeYY", 
		BackgroundTransparency = 1, 
		BorderSizePixel = 0
	}, v15);
	v13[v14 + 2] = v3.createElement("Frame", {
		Size = UDim2.fromScale(1.4, 0.8), 
		SizeConstraint = "RelativeYY", 
		BackgroundTransparency = 1, 
		BorderSizePixel = 0
	}, { v3.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			VerticalAlignment = "Center", 
			HorizontalAlignment = "Center"
		}), v3.createElement("UIPadding", {
			PaddingRight = UDim.new(0.1, 0)
		}), v3.createElement("TextLabel", {
			Text = p8.state.timer, 
			TextColor3 = Color3.fromRGB(255, 255, 255), 
			Font = "RobotoMono", 
			RichText = true, 
			TextScaled = true, 
			Size = UDim2.fromScale(1, 0.6), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			TextXAlignment = "Left"
		}, { v3.createElement("UIPadding", {
				PaddingRight = UDim.new(0.2, 0)
			}) }) });
	local v18 = {
		Size = UDim2.fromScale(0.5, 0.5), 
		SizeConstraint = "RelativeYY", 
		Image = l__ImageId__10.WINDOW_CLOSE, 
		BackgroundTransparency = 1, 
		BorderSizePixel = 0
	};
	v18[v3.Event.MouseButton1Click] = function()
		l__SoundManager__6:playSound(l__GameSound__7.UI_CLICK);
		p8.props.OnLeaveQueue();
	end;
	v18[v3.Event.MouseEnter] = function(p9)
		p8.leaveButtonHoverMaid:DoCleaning();
		local v19 = l__TweenService__4:Create(p9, TweenInfo.new(0.12), {
			ImageTransparency = 0.4
		});
		v19:Play();
		p8.leaveButtonHoverMaid:GiveTask(function()
			v19:Cancel();
		end);
	end;
	v18[v3.Event.MouseLeave] = function(p10)
		p8.leaveButtonHoverMaid:DoCleaning();
		local v20 = l__TweenService__4:Create(p10, TweenInfo.new(0.12), {
			ImageTransparency = 0
		});
		v20:Play();
		p8.leaveButtonHoverMaid:GiveTask(function()
			p8.leaveButtonHoverMaid:GiveTask(function()
				v20:Cancel();
			end);
		end);
	end;
	v13[v14 + 3] = v3.createElement("ImageButton", v18);
	v13[v14 + 4] = v3.createElement("Frame", {
		Size = UDim2.fromScale(0.3, 0), 
		SizeConstraint = "RelativeYY", 
		BorderSizePixel = 0, 
		BackgroundTransparency = 1
	});
	return v3.createElement("Frame", v12, v13);
end;
return {
	QueueCard = v4
};
