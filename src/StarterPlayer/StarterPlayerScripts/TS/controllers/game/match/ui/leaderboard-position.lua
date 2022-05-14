-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("LeaderboardPositionComponent");
function v4.init(p1, p2)
	p1.rankRef = v3.createRef();
	local l__NewLeaderboardPos__5 = p1.props.NewLeaderboardPos;
	local l__PreviousLeaderboardPos__6 = p1.props.PreviousLeaderboardPos;
	local v7 = l__NewLeaderboardPos__5;
	if v7 == 0 or v7 ~= v7 or not v7 then
		v7 = 0;
	end;
	local v8 = l__PreviousLeaderboardPos__6;
	if v8 == 0 or v8 ~= v8 or not v8 then
		v8 = 0;
	end;
	p1.changeDiff = math.abs(v7 - v8);
	local v9 = false;
	if l__NewLeaderboardPos__5 ~= nil then
		v9 = false;
		if l__PreviousLeaderboardPos__6 ~= nil then
			v9 = p1.changeDiff ~= 0;
		end;
	end;
	p1.shouldDisplayChange = v9;
end;
local l__NumberSpinner__1 = v2.NumberSpinner;
function v4.didMount(p3)
	if not p3.shouldDisplayChange then
		return nil;
	end;
	local v10 = p3.rankRef:getValue();
	local v11 = l__NumberSpinner__1.fromGuiObject(v10);
	v11.Commas = true;
	v11.Decimals = 0;
	v11.Duration = 0;
	v11.Prefix = "";
	v11.Value = p3.props.PreviousLeaderboardPos;
	local l__NewLeaderboardPos__2 = p3.props.NewLeaderboardPos;
	v1.Promise.delay(1):andThen(function()
		v11.Duration = 1.5;
		v11.Value = l__NewLeaderboardPos__2;
	end);
	v10.Visible = false;
end;
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local function u4(p4)
	return string.gsub(string.reverse((string.gsub(string.reverse(p4), "%d%d%d", "%1,"))), "^,", "");
end;
local l__SlideIn__5 = v2.SlideIn;
function v4.render(p5)
	local v12 = {};
	local v13 = {
		BorderSizePixel = 0, 
		BackgroundColor3 = l__Theme__3.backgroundSuccess, 
		BackgroundTransparency = 0
	};
	local l__Native__14 = p5.props.Native;
	if l__Native__14 then
		for v15, v16 in pairs(l__Native__14) do
			v13[v15] = v16;
		end;
	end;
	v12[#v12 + 1] = v3.createElement("Frame", v13, { v3.createElement("UIAspectRatioConstraint", {
			AspectRatio = 7.408163265306122, 
			DominantAxis = Enum.DominantAxis.Height
		}), v3.createElement("UICorner", {
			CornerRadius = UDim.new(0.1, 0)
		}), v3.createElement("Frame", {
			Position = UDim2.fromScale(0.05, 0.15), 
			Size = UDim2.fromScale(0, 0.4), 
			BackgroundTransparency = 1, 
			AutomaticSize = Enum.AutomaticSize.X
		}, { v3.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 4)
			}), v3.createElement("TextLabel", {
				Text = "<b>Rank</b>", 
				RichText = true, 
				Size = UDim2.fromScale(0, 1), 
				AutomaticSize = Enum.AutomaticSize.X, 
				BackgroundTransparency = 1, 
				Font = Enum.Font.RobotoMono, 
				TextColor3 = Color3.new(1, 1, 1), 
				TextScaled = true
			}), v3.createElement("TextLabel", {
				Text = "<b>" .. tostring(p5.props.NewLeaderboardPos) .. "</b>", 
				RichText = true, 
				Size = UDim2.fromScale(0, 1), 
				AutomaticSize = Enum.AutomaticSize.X, 
				BackgroundTransparency = 1, 
				Font = Enum.Font.RobotoMono, 
				TextColor3 = Color3.new(1, 1, 1), 
				TextScaled = true, 
				TextSize = 12, 
				[v3.Ref] = p5.rankRef
			}) }), v3.createElement("TextLabel", {
			AnchorPoint = Vector2.new(0, 1), 
			Position = UDim2.fromScale(0.05, 0.85), 
			Text = "<b>MONTHLY WINS</b>", 
			RichText = true, 
			TextXAlignment = Enum.TextXAlignment.Left, 
			Size = UDim2.fromScale(0.5, 0.3), 
			BackgroundTransparency = 1, 
			Font = Enum.Font.RobotoMono, 
			TextColor3 = Color3.new(1, 1, 1), 
			TextScaled = true
		}), v3.createElement("TextLabel", {
			AnchorPoint = Vector2.new(1, 0.5), 
			Position = UDim2.fromScale(0.95, 0.5), 
			Text = "<b>+ " .. u4(tostring(p5.changeDiff)) .. "</b>", 
			RichText = true, 
			TextXAlignment = Enum.TextXAlignment.Right, 
			Size = UDim2.fromScale(0.5, 0.4), 
			BackgroundTransparency = 1, 
			Font = Enum.Font.RobotoMono, 
			TextColor3 = Color3.new(1, 1, 1), 
			TextScaled = true
		}) });
	return v3.createElement(l__SlideIn__5, {}, v12);
end;
return {
	LeaderboardPositionComponent = v4
};
