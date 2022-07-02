-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Flamework__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
return v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
	local v2 = p1.store.Game.myTeam;
	if v2 ~= nil then
		v2 = v2.id;
	end;
	local v3 = v2 == p1.WinningTeamId;
	if not v3 then
		return u1.createFragment();
	end;
	local l__queueType__4 = p1.store.Game.queueType;
	local v5 = nil;
	if l__queueType__4 then
		local v6 = l__Flamework__2.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(l__queueType__4);
		if v6 ~= nil then
			v6 = v6.title;
		end;
		v5 = v6;
	end;
	local v7 = {};
	local v8 = {};
	local v9 = {};
	local v10 = {};
	if l__queueType__4 then
		local v11 = p1.store.Leaderboard.queues[l__queueType__4];
		if v11 ~= nil then
			v11 = v11.currentWinStreak;
		end;
		if v11 ~= nil then
			if v3 then
				local v12 = v11 + 1;
			else
				v12 = 0;
			end;
		else
			v12 = 0;
		end;
	else
		v12 = 0;
	end;
	v10.Text = "<b>" .. string.gsub(string.reverse((string.gsub(string.reverse((tostring(v12))), "%d%d%d", "%1,"))), "^,", "") .. "</b>";
	v10.RichText = true;
	v10.Size = UDim2.fromScale(0, 0.4);
	v10.AutomaticSize = Enum.AutomaticSize.X;
	v10.BackgroundTransparency = 1;
	v10.Font = Enum.Font.RobotoMono;
	v10.TextColor3 = Color3.new(1, 1, 1);
	v10.TextScaled = true;
	v9[1] = u1.createElement("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal, 
		HorizontalAlignment = Enum.HorizontalAlignment.Right, 
		VerticalAlignment = Enum.VerticalAlignment.Center, 
		SortOrder = Enum.SortOrder.LayoutOrder, 
		Padding = UDim.new(0, 10)
	});
	v9[2] = u1.createElement("ImageLabel", {
		Image = "rbxassetid://7101217258", 
		Size = UDim2.fromScale(0.5, 0.5), 
		SizeConstraint = "RelativeYY", 
		BackgroundTransparency = 1, 
		BorderSizePixel = 0
	});
	v9[3] = u1.createElement("TextLabel", v10);
	v8[1] = u1.createElement("UIAspectRatioConstraint", {
		AspectRatio = 7.408163265306122, 
		DominantAxis = Enum.DominantAxis.Height
	});
	v8[2] = u1.createElement("UICorner", {
		CornerRadius = UDim.new(0.1, 0)
	});
	v8[3] = u1.createElement("UIPadding", {
		PaddingBottom = UDim.new(0.05, 0), 
		PaddingLeft = UDim.new(0.05, 0), 
		PaddingRight = UDim.new(0.05, 0), 
		PaddingTop = UDim.new(0.05, 0)
	});
	v8[4] = u1.createElement("TextLabel", {
		Position = UDim2.fromScale(0, 0.15), 
		Text = "<b>Win Streak</b>", 
		RichText = true, 
		TextXAlignment = Enum.TextXAlignment.Left, 
		Size = UDim2.fromScale(0.5, 0.4), 
		BackgroundTransparency = 1, 
		Font = Enum.Font.RobotoMono, 
		TextColor3 = Color3.new(1, 1, 1), 
		TextScaled = true
	});
	v8[5] = u1.createElement("TextLabel", {
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
	});
	v8[6] = u1.createElement("Frame", {
		Position = UDim2.fromScale(1, 0.5), 
		AnchorPoint = Vector2.new(1, 0.5), 
		Size = UDim2.fromScale(0, 0.8), 
		BackgroundTransparency = 1, 
		AutomaticSize = Enum.AutomaticSize.X
	}, v9);
	v7.PostgameWinstreakSection = u1.createElement("Frame", {
		Size = p1.Size, 
		Position = p1.Position, 
		AnchorPoint = p1.AnchorPoint or Vector2.new(0, 1), 
		BorderSizePixel = 0, 
		BackgroundColor3 = Color3.fromRGB(216, 133, 10)
	}, v8);
	return u1.createFragment(v7);
end);
