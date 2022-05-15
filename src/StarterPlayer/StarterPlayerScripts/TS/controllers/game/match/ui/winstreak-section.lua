
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Flamework__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__SlideIn__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SlideIn;
local function u4(p1)
	return string.gsub(string.reverse((string.gsub(string.reverse(p1), "%d%d%d", "%1,"))), "^,", "");
end;
return v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p2, p3)
	local v2 = p2.store.Game.myTeam;
	if v2 ~= nil then
		v2 = v2.id;
	end;
	local v3 = v2 == p2.WinningTeamId;
	if not v3 then
		return u1.createFragment();
	end;
	local l__queueType__4 = p2.store.Game.queueType;
	local v5 = nil;
	if l__queueType__4 then
		local v6 = l__Flamework__2.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(l__queueType__4);
		if v6 ~= nil then
			v6 = v6.title;
		end;
		v5 = v6;
	end;
	return u1.createElement(l__SlideIn__3, {}, { u1.createElement("Frame", {
			Size = p2.Size, 
			Position = p2.Position, 
			AnchorPoint = Vector2.new(0.5, 0.75), 
			BorderSizePixel = 0, 
			BackgroundColor3 = Color3.fromRGB(216, 133, 10)
		}, { u1.createElement("UIAspectRatioConstraint", {
				AspectRatio = 7.408163265306122, 
				DominantAxis = Enum.DominantAxis.Height
			}), u1.createElement("UICorner", {
				CornerRadius = UDim.new(0.1, 0)
			}), u1.createElement("UIPadding", {
				PaddingBottom = UDim.new(0.05, 0), 
				PaddingLeft = UDim.new(0.05, 0), 
				PaddingRight = UDim.new(0.05, 0), 
				PaddingTop = UDim.new(0.05, 0)
			}), u1.createElement("TextLabel", {
				Position = UDim2.fromScale(0, 0.15), 
				Text = "<b>Win Streak</b>", 
				RichText = true, 
				TextXAlignment = Enum.TextXAlignment.Left, 
				Size = UDim2.fromScale(0.5, 0.4), 
				BackgroundTransparency = 1, 
				Font = Enum.Font.RobotoMono, 
				TextColor3 = Color3.new(1, 1, 1), 
				TextScaled = true
			}), u1.createElement("TextLabel", {
				AnchorPoint = Vector2.new(0, 1), 
				Position = UDim2.fromScale(0, 0.85), 
				Text = "<b>" .. tostring(v5) .. "</b>", 
				RichText = true, 
				TextXAlignment = Enum.TextXAlignment.Left, 
				Size = UDim2.fromScale(0.5, 0.3), 
				BackgroundTransparency = 1, 
				Font = Enum.Font.RobotoMono, 
				TextColor3 = Color3.new(1, 1, 1), 
				TextScaled = true
			}), u1.createElement("Frame", {
				Position = UDim2.fromScale(1, 0.5), 
				AnchorPoint = Vector2.new(1, 0.5), 
				Size = UDim2.fromScale(0, 0.8), 
				BackgroundTransparency = 1, 
				AutomaticSize = Enum.AutomaticSize.X
			}, { u1.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal, 
					HorizontalAlignment = Enum.HorizontalAlignment.Right, 
					VerticalAlignment = Enum.VerticalAlignment.Center, 
					SortOrder = Enum.SortOrder.LayoutOrder, 
					Padding = UDim.new(0, 10)
				}), u1.createElement("ImageLabel", {
					Image = "rbxassetid://7101217258", 
					Size = UDim2.fromScale(0.5, 0.5), 
					SizeConstraint = "RelativeYY", 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0
				}), u1.createElement("TextLabel", {
					Text = "<b>" .. u4(tostring((function()
						if not l__queueType__4 then
							return 0;
						end;
						local v7 = p2.store.Leaderboard.queues[l__queueType__4];
						if v7 ~= nil then
							v7 = v7.currentWinStreak;
						end;
						if v7 == nil then
							return 0;
						end;
						if not v3 then
							return 0;
						end;
						return v7 + 1;
					end)())) .. "</b>", 
					RichText = true, 
					Size = UDim2.fromScale(0, 0.4), 
					AutomaticSize = Enum.AutomaticSize.X, 
					BackgroundTransparency = 1, 
					Font = Enum.Font.RobotoMono, 
					TextColor3 = Color3.new(1, 1, 1), 
					TextScaled = true
				}) }) }) });
end);

