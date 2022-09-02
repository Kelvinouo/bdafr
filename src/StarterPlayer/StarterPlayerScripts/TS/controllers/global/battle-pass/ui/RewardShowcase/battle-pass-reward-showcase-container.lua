-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__RunService__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).RunService;
local l__BattlePassUtils__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local l__Theme__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ColorUtil__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local l__BattlePassRewardShowcase__7 = v1.import(script, script.Parent, "battle-pass-reward-showcase").BattlePassRewardShowcase;
local l__BattlePassRewardInfoCard__8 = v1.import(script, script.Parent, "battle-pass-reward-info-card").BattlePassRewardInfoCard;
return {
	BattlePassRewardShowcaseContainer = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local u9 = u1.createRef();
		p2.useEffect(function()
			local v3 = u2.new();
			local v4 = u9:getValue();
			if v4 then
				v3:GiveTask(l__RunService__3.Heartbeat:Connect(function(p3)
					v4.Rotation = (v4.Rotation + 45 * p3) % 360;
				end));
			end;
			return function()
				v3:DoCleaning();
			end;
		end, {});
		local v5 = l__BattlePassUtils__4.getRewardThemeColor(p1.Reward) or l__Theme__5.backgroundPrimary;
		if v5 == l__Theme__5.backgroundPrimary or v5 == l__Theme__5.backgroundTertiary then
			local v6 = ColorSequence.new({ ColorSequenceKeypoint.new(0, v5), ColorSequenceKeypoint.new(1, l__ColorUtil__6.brighten(v5, 0.2)) });
		else
			v6 = ColorSequence.new({ ColorSequenceKeypoint.new(0, l__ColorUtil__6.darken(v5, 0.5)), ColorSequenceKeypoint.new(1, l__ColorUtil__6.brighten(v5, 0.1)) });
		end;
		return u1.createElement("Frame", {
			Size = UDim2.new(0.32, -10, 1, 0), 
			BackgroundColor3 = l__ColorUtil__6.WHITE, 
			BorderSizePixel = 0
		}, { u1.createElement("UICorner", {
				CornerRadius = UDim.new(0, 10)
			}), u1.createElement("UIStroke", {
				Thickness = 2, 
				Color = l__ColorUtil__6.brighten(v5, 0.25)
			}, { u1.createElement("UIGradient", {
					Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.7, 0), NumberSequenceKeypoint.new(1, 1) }), 
					[u1.Ref] = u9
				}) }), u1.createElement("UIGradient", {
				Rotation = 45, 
				Color = v6
			}), u1.createElement(l__BattlePassRewardShowcase__7, {
				Reward = p1.Reward, 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromScale(0.5, 0.4), 
				Size = UDim2.new(0.8, 0, 0.8, 0), 
				LayoutOrder = 2
			}), u1.createElement(l__BattlePassRewardInfoCard__8, {
				Reward = p1.Reward, 
				BattlePass = p1.BattlePass, 
				AnchorPoint = Vector2.new(0, 1), 
				Position = UDim2.fromScale(0, 1), 
				Size = UDim2.new(1, 0, 0.3, 0), 
				LayoutOrder = 3
			}) });
	end)
};
