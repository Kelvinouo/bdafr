-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.Component:extend("WindWalkerStatus");
function v3.init(p1, p2)
	p1.stackRef = v2.createRef();
	p1.timerRef = v2.createRef();
	p1:setState({
		stack = 0, 
		time = 0
	});
end;
function v3.render(p3)
	return v2.createFragment({
		WindWalkerEffect = v2.createElement("Frame", {
			SizeConstraint = Enum.SizeConstraint.RelativeYY, 
			Size = UDim2.fromScale(1.5, 1.5), 
			BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
			BackgroundTransparency = 0.3, 
			BorderSizePixel = 0
		}, {
			EffectImage = v2.createElement("ImageLabel", {
				Size = UDim2.fromScale(0.8, 0.8), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 1, 
				Image = "rbxassetid://9871779816", 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromScale(0.5, 0.5)
			}), 
			EffectStack = v2.createElement("TextLabel", {
				[v2.Ref] = p3.stackRef, 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromScale(0.8, 0.8), 
				Text = tostring(p3.state.stack), 
				Font = Enum.Font.Roboto, 
				TextSize = 24, 
				BackgroundTransparency = 1, 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				TextStrokeColor3 = Color3.fromRGB(0, 0, 0), 
				TextStrokeTransparency = 0
			}), 
			EffectTimer = v2.createElement("TextLabel", {
				[v2.Ref] = p3.timerRef, 
				Visible = p3.state.stack > 0, 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromScale(0.5, 1), 
				Text = p3:formattedTime(p3.state.time), 
				Font = Enum.Font.Roboto, 
				TextSize = 24, 
				BackgroundTransparency = 1, 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				TextStrokeColor3 = Color3.fromRGB(0, 0, 0), 
				TextStrokeTransparency = 0
			}, { v2.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 30)
				}) }),
			v2.createElement("UICorner", {
				CornerRadius = UDim.new(0.1, 0)
			}), (v2.createElement("UIStroke", {
				Color = Color3.fromRGB(255, 255, 255)
			}))
		})
	});
end;
local l__ClientSyncEvents__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__ORB_DECAY_SECONDS__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "wind-walker", "wind-walker-util").WindWalkerUtil.ORB_DECAY_SECONDS;
function v3.didMount(p4)
	l__ClientSyncEvents__1.WindWalkerOrbUpdate:connect(function(p5)
		local v4 = {
			stack = p5.orbCount
		};
		if p5.orbCount > 0 then
			local v5 = l__ORB_DECAY_SECONDS__2;
		else
			v5 = 0;
		end;
		v4.time = v5;
		p4:setState(v4);
	end);
	p4:startTimer();
end;
local l__RunService__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).RunService;
function v3.startTimer(p6)
	local u4 = 0;
	l__RunService__3.Heartbeat:Connect(function(p7)
		u4 = u4 + p7;
		if u4 >= 1 then
			u4 = 0;
			if p6.state.time > 0 then
				p6:setState({
					time = p6.state.time - 1
				});
			end;
		end;
	end);
end;
function v3.formattedTime(p8, p9)
	if not (p9 >= 60) then
		if p9 < 10 then
			return "0:0" .. tostring(p9);
		else
			return "0:" .. tostring(p9);
		end;
	end;
	local v6 = math.abs(60 - p9);
	if v6 < 10 then
		return "1:0" .. tostring(v6);
	end;
	return "1:" .. tostring(v6);
end;
return {
	WindWalkerStatus = v3
};
