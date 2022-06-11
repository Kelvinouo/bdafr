-- Script Hash: 4b9f42cdc7b9642c9518ca053eab4bd4490d68cba5daabe91c68d68d65a0e2b9ec9f33a2dc6de4ad7aae34d942b53526
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.Component:extend("LeaderboardPositionComponent");
function v3.init(p1, p2)
	p1.rankRef = v2.createRef();
	local l__NewLeaderboardPos__4 = p1.props.NewLeaderboardPos;
	local l__PreviousLeaderboardPos__5 = p1.props.PreviousLeaderboardPos;
	local v6 = l__NewLeaderboardPos__4;
	if v6 == 0 or v6 ~= v6 or not v6 then
		v6 = 0;
	end;
	local v7 = l__PreviousLeaderboardPos__5;
	if v7 == 0 or v7 ~= v7 or not v7 then
		v7 = 0;
	end;
	p1.changeDiff = math.abs(v6 - v7);
	local v8 = false;
	if l__NewLeaderboardPos__4 ~= nil then
		v8 = false;
		if l__PreviousLeaderboardPos__5 ~= nil then
			v8 = p1.changeDiff ~= 0;
		end;
	end;
	p1.shouldDisplayChange = v8;
end;
local l__NumberSpinner__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).NumberSpinner;
function v3.didMount(p3)
	if not p3.shouldDisplayChange then
		return nil;
	end;
	local v9 = p3.rankRef:getValue();
	local v10 = l__NumberSpinner__1.fromGuiObject(v9);
	v10.Commas = true;
	v10.Decimals = 0;
	v10.Duration = 0;
	v10.Prefix = "";
	v10.Value = p3.props.PreviousLeaderboardPos;
	local l__NewLeaderboardPos__2 = p3.props.NewLeaderboardPos;
	v1.Promise.delay(1):andThen(function()
		v10.Duration = 1.5;
		v10.Value = l__NewLeaderboardPos__2;
	end);
	v9.Visible = false;
end;
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local function u4(p4)
	return string.gsub(string.reverse((string.gsub(string.reverse(p4), "%d%d%d", "%1,"))), "^,", "");
end;
function v3.render(p5)
	local v11 = {
		BorderSizePixel = 0, 
		BackgroundColor3 = l__Theme__3.backgroundSuccess, 
		BackgroundTransparency = 0
	};
	local l__Native__12 = p5.props.Native;
	if l__Native__12 then
		for v13, v14 in pairs(l__Native__12) do
			v11[v13] = v14;
		end;
	end;
	return v2.createFragment({
		PostgameLeaderboardSection = v2.createElement("Frame", v11, { v2.createElement("UIAspectRatioConstraint", {
				AspectRatio = 7.408163265306122, 
				DominantAxis = Enum.DominantAxis.Height
			}), v2.createElement("UICorner", {
				CornerRadius = UDim.new(0.1, 0)
			}), v2.createElement("Frame", {
				Position = UDim2.fromScale(0.05, 0.15), 
				Size = UDim2.fromScale(0, 0.4), 
				BackgroundTransparency = 1, 
				AutomaticSize = Enum.AutomaticSize.X
			}, { v2.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal, 
					HorizontalAlignment = Enum.HorizontalAlignment.Left, 
					SortOrder = Enum.SortOrder.LayoutOrder, 
					Padding = UDim.new(0, 4)
				}), v2.createElement("TextLabel", {
					Text = "<b>Rank</b>", 
					RichText = true, 
					Size = UDim2.fromScale(0, 1), 
					AutomaticSize = Enum.AutomaticSize.X, 
					BackgroundTransparency = 1, 
					Font = Enum.Font.RobotoMono, 
					TextColor3 = Color3.new(1, 1, 1), 
					TextScaled = true
				}), v2.createElement("TextLabel", {
					Text = "<b>" .. tostring(p5.props.NewLeaderboardPos) .. "</b>", 
					RichText = true, 
					Size = UDim2.fromScale(0, 1), 
					AutomaticSize = Enum.AutomaticSize.X, 
					BackgroundTransparency = 1, 
					Font = Enum.Font.RobotoMono, 
					TextColor3 = Color3.new(1, 1, 1), 
					TextScaled = true, 
					TextSize = 12, 
					[v2.Ref] = p5.rankRef
				}) }), v2.createElement("TextLabel", {
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
			}), v2.createElement("TextLabel", {
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
			}) })
	});
end;
return {
	LeaderboardPositionComponent = v3
};
